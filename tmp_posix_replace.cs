using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Text;
using Microsoft.Win32.SafeHandles;

internal static class PosixReplace
{
    private const uint DELETE = 0x00010000;
    private const uint SYNCHRONIZE = 0x00100000;
    private const uint FILE_SHARE_READ = 0x1;
    private const uint FILE_SHARE_WRITE = 0x2;
    private const uint FILE_SHARE_DELETE = 0x4;
    private const uint OPEN_EXISTING = 3;
    private const int FileRenameInfoEx = 22;
    private const uint FILE_RENAME_FLAG_REPLACE_IF_EXISTS = 0x1;
    private const uint FILE_RENAME_FLAG_POSIX_SEMANTICS = 0x2;
    private const uint FILE_RENAME_FLAG_IGNORE_READONLY_ATTRIBUTE = 0x40;

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern SafeFileHandle CreateFileW(
        string fileName,
        uint desiredAccess,
        uint shareMode,
        IntPtr securityAttributes,
        uint creationDisposition,
        uint flagsAndAttributes,
        IntPtr templateFile);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static extern bool SetFileInformationByHandle(
        SafeFileHandle file,
        int fileInformationClass,
        IntPtr fileInformation,
        uint bufferSize);

    public static int Main(string[] args)
    {
        if (args.Length != 2)
        {
            Console.Error.WriteLine("Usage: PosixReplace <source> <destination>");
            return 2;
        }

        byte[] destinationBytes = Encoding.Unicode.GetBytes(args[1]);
        int rootOffset = IntPtr.Size == 8 ? 8 : 4;
        int lengthOffset = IntPtr.Size == 8 ? 16 : 8;
        int nameOffset = IntPtr.Size == 8 ? 20 : 12;
        // Reserve an explicit UTF-16 terminator as well as FileNameLength. Some
        // Windows builds inspect the trailing terminator on FileRenameInfoEx.
        int bufferLength = nameOffset + destinationBytes.Length + 2;
        IntPtr buffer = Marshal.AllocHGlobal(bufferLength);

        try
        {
            for (int i = 0; i < bufferLength; i++) Marshal.WriteByte(buffer, i, 0);
            Marshal.WriteInt32(buffer, 0, unchecked((int)(
                FILE_RENAME_FLAG_REPLACE_IF_EXISTS |
                FILE_RENAME_FLAG_POSIX_SEMANTICS |
                FILE_RENAME_FLAG_IGNORE_READONLY_ATTRIBUTE)));
            Marshal.WriteIntPtr(buffer, rootOffset, IntPtr.Zero);
            Marshal.WriteInt32(buffer, lengthOffset, destinationBytes.Length);
            Marshal.Copy(destinationBytes, 0, IntPtr.Add(buffer, nameOffset), destinationBytes.Length);

            using (SafeFileHandle source = CreateFileW(
                args[0],
                DELETE | SYNCHRONIZE,
                FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
                IntPtr.Zero,
                OPEN_EXISTING,
                0,
                IntPtr.Zero))
            {
                if (source.IsInvalid) throw new Win32Exception(Marshal.GetLastWin32Error());
                if (!SetFileInformationByHandle(source, FileRenameInfoEx, buffer, (uint)bufferLength))
                    throw new Win32Exception(Marshal.GetLastWin32Error());
            }

            return 0;
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.Message);
            return 1;
        }
        finally
        {
            Marshal.FreeHGlobal(buffer);
        }
    }
}
