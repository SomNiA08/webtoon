# Webtoon Harness — 프로젝트 규약

웹툰 한 회차를 트렌드 조사 → 시나리오 → 레퍼런스 선행 렌더 → 50+ 패널 병렬 렌더 → 검증 루프 → 세로 스크롤 뷰어까지 자동 제작하는 하네스. 진입점은 `webtoon-orchestrator` 스킬.

## 산출물 레이아웃 (저장소 루트 기준 — `_workspace/` 아님)

```
00_input/  01_research/  02_story/  03_episode/  04_visual/  05_panels/  06_assembly/  RELEASE/
_render_jobs/   # 패널당 1개 프롬프트 .txt (렌더 드라이버 입력)
_render_logs/   # codex 세션 로그 (감사 추적)
```

새 기획으로 갈아엎을 때는 위 디렉토리들을 `_archive/{timestamp}/`로 이동 후 새로 시작한다.

## 렌더 드라이버 (공식)

- `python _split_prompts.py 04_visual/ep{NN}_prompts.md _render_jobs/panels` — 프롬프트 분할
- `bash _render.sh _render_jobs/panels 05_panels/ep{NN}` — 5장 동시 배치 렌더(codex 전역 동시 세션 ≤5), 기존 PNG SKIP이라 재실행 = 누락분만 렌더
- `bash _resume.sh <jobsdir> <outdir> <목표수> [HH:MM]` — 쿼터 리셋 대기 후 무인 반복 렌더
- `bash _verify_release.sh {NN}` — 릴리스 게이트(패널 수·손상·md5 중복·매니페스트 정합·RELEASE 사본). **exit 0이 아니면 사인오프 금지**

## 품질 게이트 (EP01 실사고에서 도출 — 생략 금지)

1. **검증 매니페스트**: panel-validator는 판정 완료 시 `(cd 05_panels/ep{NN} && md5sum *.png > ../../04_visual/ep{NN}_manifest.md5)`를 남긴다. showrunner는 매니페스트 게이트 통과 없이 사인오프하지 않는다.
2. **재렌더 원자 규약**: QA 이후라도 패널을 1장이라도 재렌더하면 "6축 전체 재검증 → validation/qa 리포트 갱신 → 매니페스트 재생성 → RELEASE 재복사"를 한 묶음으로 완주한다. (EP01: QA 후 무검증 재렌더된 P49에서 태오 흑발 C1 위반이 릴리스로 유출)
3. **★SSOT 앵커 패널은 ACCEPT-FLAG 통과 불가**: 반전 자구/미니맵/손 클로즈업 대구/클리프행어 컷의 C1·C3 결함은 예산을 이유로 스킵하지 말고 기준 만족까지 재렌더하거나 사용자에게 에스컬레이션한다.
4. **재렌더본은 새 결함을 만든다**: 고치려던 결함만 확인하지 말고 6축 전부 다시 본다. (EP01 P32: 하루 외형 수정 → 도경 안경 소실)

## 실행 환경

- 팀 실행: `TeamCreate`/`TeamDelete`가 없는 환경에서는 Agent 도구 팬아웃으로 폴백(오케스트레이터 스킬 참조).
- 에이전트 모델: 세션 모델 상속(frontmatter에 model 고정 금지). 필요 시 호출부에서 오버라이드.
- 스크립트는 저장소 루트를 자기 위치에서 유도(`$(dirname "$0")`)하므로 절대경로 하드코딩 금지. codex 생성물 위치는 `$HOME/.codex/generated_images`(`CODEX_GEN_DIR`로 오버라이드 가능).
- md5 명령: Windows(git-bash)/Linux는 `md5sum`, macOS는 `md5 -r`.
- `04_visual/refs/`(캐릭터 레퍼런스 시트)는 시리즈 일관성 SSOT — git 추적 예외로 보존하며, 후속 회차에서 재렌더하지 않고 재사용한다.

## 하네스 진화 이력

- **2026-07-07** — EP01 검수 후 대규모 개선: ① 경로 규약을 `_workspace/` → 저장소 루트로 통일(스킬/에이전트 전체), Phase 0 후속 작업 판별을 `02_story/concept.md` 기준으로 수정 ② 렌더 스크립트 이식성 확보(절대경로 하드코딩 제거, 인자화) ③ md5 검증 매니페스트 + `_verify_release.sh` 릴리스 게이트 신설 ④ 재렌더 원자 규약·★SSOT 앵커 FLAG 금지 정책 추가(P32/P49 무검증 유출 사고 재발 방지) ⑤ TeamCreate 부재 시 Agent 팬아웃 폴백 명시 ⑥ 에이전트 `model: opus` 하드코딩 제거(세션 상속) ⑦ refs/ git 추적 예외.
