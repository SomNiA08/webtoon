# EP01 Shotlist — 《리:메타 (RE:META)》 1화 패널 샷리스트 (57패널)

- 작성: panel-director (비주얼팀 콘티/연출)
- 일자: 2026-07-06
- 입력: `_workspace/03_episode/ep01_script_final.md`(P01~P57) · `ep01_beatsheet.md`(B1~B17) · `_workspace/04_visual/style-bible.md`(LOC/화면비/색온도 SSOT) · `character-sheets.md`(identity_tag·불변 토큰)
- 방법론: `webtoon-panel-breakdown` 작업 A(A-1 분해 / A-2 50패널 보장 / A-3 항목 형식) · `references/composition-grammar.md`(size·camera·composition 어휘)
- 소비자: **prompt-smith**(codex 프롬프트 조립·A/B/C 분배) · **letterer**(dialogue_ref → 말풍선 베이크) · **panel-artist-a/b/c**(렌더) · **episode-compositor**(세로 조립)

> **패널 매핑:** 대본 P01~P57 = panel_001~panel_057 **1:1 연속(추가·삭제·이동 없음).** 총 **57패널 (50+ 기준 +7 여유).**
> **화면비 프리셋(style-bible §4):** STD 4:3 / TALL 3:4 / WIDE 16:9 / CINE 21:9 / FULL 9:16 / INSERT 1:1. `size`(체감시간)와 병기.

---

## 0. 장소 목록 (scene_id ↔ LOC_* ↔ 배경 — 배경 연속성 SSOT)

| scene_id | LOC_* | 한 줄 배경 | 패널 | 시간/조명 |
|---|---|---|---|---|
| **S1** | LOC_CROWN_ARENA | 크라운 월드파이널 아레나(붕괴) | panel_001~013 | 무대 역광·저명도, 후반 핏빛 침입 |
| **(브릿지)** | LOC_VOID_BLACKOUT | 암전→여명 전환(장소 없음) | panel_014~015 | 풀블랙+미세노이즈→하단 옅은 빛 |
| **S2** | LOC_DORM_ROOM | 7년 전 좁은 기숙사 방(거울) | panel_016~021 | 이른 아침 차가운 청백광 |
| **S3** | LOC_ACADEMY_EXT | 아카데미 입학 게이트·외경 | panel_022~024 | 낮 균일 흐린 자연광 |
| **S4** | LOC_BASEMENT_STAIR | 지하 계단·복도(하강) | panel_025 | 깜빡이는 형광등 청백 |
| **S5** | LOC_COLDBENCH | 콜드 벤치 지하 연습실【주무대】 | panel_026~030, 032~047 | 회철·청록 지배, 모니터 백라이트 업라이팅 |
| **S5·문틀** | LOC_COLDBENCH(문틀 너머 LOC_BASEMENT_STAIR 원경) | 콜드 벤치 문가+복도 원경 | panel_031 | 문틈 백라이트+복도 원경 |
| **S6** | LOC_KAISER_ROOM | 윤태오 개인 방(밤·암실) | panel_048~054 | 밤, 태블릿 단일광 |
| **(오버레이)** | LOC_GAME_ARKLIGHT | 인게임 《아크라이트》 화면(오버레이/인서트) | panel_003~006, 013(부분), 034, 036, 039, 049(대조) | 시안-틸 HUD `#27E0D0` |
| **(교차컷)** | 유건 위치 불특정(어딘가) | 정체 노출 반응 컷 | panel_055~057 | 저명도→앰버 발화 |

> panel_055~057은 윤태오 방(S6) 클리프행어와 **교차편집**되는 유건 반응 컷. 장소를 특정하지 않고 인물 클로즈업+잔상으로 처리(배경 최소화 → 배경 급변 논란 회피).

---

## 1. SSOT 앵커 범례 (prompt-smith·letterer 필수 준수)

- **★오더 미니맵 SSOT** — panel_003 = panel_036 = panel_044 = panel_049 **완전 동일 형태·리듬**(3라인 RAIL/SPINE/SURGE 진입 화살표: 서지 셋 → 타이탄 버림). LOC_GAME_ARKLIGHT §오더 미니맵 앵커 고정. 반전 공정성 = 변형 금지.
- **★오더 대사 SSOT** — 〔대사/인용〕 **"서지 셋. 타이탄 버려."** = panel_003 = panel_036 = panel_049 **자구까지 동일 베이크.** (panel_049는 따옴표 인용.)
- **★손 클로즈업 대구 SSOT** — 동일 앵글·크롭(오른손 ECU/INSERT): panel_008(떨림)↔panel_017(안 떨림·선명)↔panel_028(재떨림·변주)↔panel_056(과거/현재 오버랩). style-bible §5-5.
- **상태색(색온도 서사, style-bible §2):** 평상/억압 = 청록·회철 저채도 / 잔상 유효 = 시안-틸 `#27E0D0` 선명 / 어긋남·붕괴 = 글리치 레드 `#E23B3B` / 사이다 임팩트 = 화이트 플래시 / **각성 발화 = 앰버 `#F5A623`(panel_057 유일 온난 폭발)**.
- **잔상 오버레이 = 유건 시점 전용**(style-bible §7-B). 타 캐릭터 시점 패널 금지.
- **무대사 컷(말풍선 0):** panel_011·014·015·025·029·035·047·052·053·055 + 손 인서트(008·017·021·028). prompt-smith `no speech bubble, no text` 명시 가능.
- **대사 무게중심 대형 단독:** panel_054·056·057.
- **딜러 미등장·정체 은닉:** 딜러 얼굴 렌더 금지. 적대 시각 = 고형준 원경(panel_031)까지.

---

## ① 콜드오픈 — 「크라운」결승 붕괴 (panel_001~016) · B1~B4

> **리듬 설계:** 와이드 스펙터클(001) → 미디엄 몰입(003~004) → **위화감 급습부터 클로즈업 연타 가속**(005~008) → 매장의 정적·고립(009~011) → 회귀 트리거 글리치·최대 여백(012~015) → 각성 눈뜸(016). 정점 비트 B2(005~008)를 와이드→ECU 점층으로 벌린다.

--- SCENE BREAK · S1 / LOC_CROWN_ARENA (오버레이: LOC_GAME_ARKLIGHT) ---

### panel_001
- scene_id: S1 / location: LOC_CROWN_ARENA
- beat: B1 (결승 매치포인트 · 스펙터클 압도)
- size: full-bleed / CINE 21:9
- camera: low-angle, extreme-long shot (worm-eye 기미)
- composition: 중앙 원경에 ORACLE 부스(뒤통수 실루엣), 상단 대형 LED, 하단 관중 폰라이트 은하. 역광 실루엣·렌즈 플레어
- subject: YUGEON(ORACLE, **뒤통수 실루엣만·정면 얼굴 금지**), 관중 군중(원경 단순화)
- emotion: 압도적 긴장·운명 직전
- motion/direction: 시선 상단 LED→중앙 부스→하단 관중, 위→아래 스크롤 유도
- dialogue_ref: 〔시스템〕(대형 LED) "THE CROWN · WORLD FINAL · 매치포인트" / 〔시스템〕(중계 자막) "딱 한 세트. 한 세트만 따면 됩니다."
- state_color: 흑막 + 청/적 팀 스포트라이트 + 폰라이트 은하 (고대비 저명도)
- fx/note: backlight, lens flare. 회차 오프닝 = 큰 컷으로 스크롤 체류↑. 정체 은닉 규약(정면 얼굴 노출 금지)

### panel_002
- scene_id: S1 / location: LOC_CROWN_ARENA (스코어보드 인서트)
- beat: B1 (초읽기)
- size: insert / INSERT 1:1
- camera: eye-level, extreme-close-up (스코어보드 UI)
- composition: 중앙 배치 스코어·초읽기 타이머, 팀보이스 인디케이터 점등
- subject: (UI only — 스코어보드·인디케이터)
- emotion: 압박·카운트다운 긴장
- motion/direction: 숫자→인디케이터로 시선 낙하
- dialogue_ref: 〔시스템〕(중계 해설) "이대로면… 세계 챔피언이 바뀝니다." / 〔시스템〕(팀보이스) "● ORACLE — 콜 개시"
- state_color: 시안-틸 HUD `#27E0D0` on 흑막
- fx/note: insert로 리듬 가속. ● ORACLE 인디케이터 = 다음 컷 오더 개시 브릿지

### panel_003 · ★오더 미니맵 SSOT 1차 / 카드A① / W2 잔상 심기
- scene_id: S1 / location: LOC_GAME_ARKLIGHT (ORACLE POV 오버레이)
- beat: B1 (오더 개시)
- size: large / STD 4:3 (오버헤드 미니맵)
- camera: top-down (오버헤드 미니맵 시점), pov
- composition: **미니맵 위 3라인(RAIL/SPINE/SURGE) 진입 화살표가 특정 형태·리듬(서지 셋→타이탄 버림)으로 그려짐.** 중앙 RUSTFIELD·TITAN 마커. 청록 잔상 선명 동기화 오버레이
- subject: YUGEON(ORACLE 시점 — 화면·잔상만, 얼굴 없음)
- emotion: 절대적 확신
- motion/direction: 미니맵 화살표 궤적을 눈으로 훑도록(형태 각인)
- dialogue_ref: 〔대사〕 "서지 셋. 타이탄 버려." ★자구 SSOT
- state_color: **잔상 유효 = 시안-틸 `#27E0D0` 선명·안정**
- fx/note: **★SSOT 앵커 — panel_036/044/049와 완전 동일 형태·리듬·앵글로 렌더(변형 금지).** *이 오더 시퀀스 = 반전 공정성 근거.*

### panel_004
- scene_id: S1 / location: LOC_CROWN_ARENA
- beat: B1 (명령형 오더 쏟아짐 · 몰입 정점)
- size: medium / STD 4:3
- camera: eye-level, medium shot (옆얼굴 프로파일)
- composition: 프레임 우측 옆얼굴+헤드셋, 좌측 전경에 키보드 위 정밀한 손가락
- subject: YUGEON(ORACLE, 옆얼굴 실루엣 톤·정면 회피), 헤드셋
- emotion: 몰입·통제
- motion/direction: 손가락→옆얼굴 시선 유도
- dialogue_ref: 〔대사〕 "스파인 열려. 3초 안에." / 〔대사〕 "지금."
- state_color: 청/적 스포트라이트 rim light
- fx/note: 콜 명령형 톤(짧고 정확). 손+헤드셋 = 감정 매개 반복 모티프

### panel_005 · W2 잔상 어긋남 시작
- scene_id: S1 / location: LOC_GAME_ARKLIGHT (ORACLE POV 오버레이)
- beat: B2 (완벽한 진입이 어긋난다 · 위화감 급습)
- size: small / INSERT 1:1
- camera: eye-level, extreme-close-up (아바타 클로즈)
- composition: 아군 아바타 하나가 콜과 **다르게** 움직임. 잔상(예고)과 현실 아바타가 처음 어긋남
- subject: YUGEON(생각), 아군 아바타, 잔상 UI
- emotion: 위화감·불신 급습
- motion/direction: 잔상선과 실제 이동선이 갈라지는 방향 대비
- dialogue_ref: 〔생각〕 "……어디 가."
- state_color: **어긋남 = 시안-틸 잔상이 레드로 분열(double-image), 재기어링 노이즈** `#E23B3B` 침입 시작
- fx/note: 붕괴의 첫 균열. small로 끊어 다음 폭발(006) 대비

### panel_006
- scene_id: S1 / location: LOC_GAME_ARKLIGHT (경기 화면)
- beat: B2 (팀 코어 붕괴 · 스코어 뒤집힘)
- size: full-bleed / CINE 21:9
- camera: eye-level, extreme-close-up → 화면 파열
- composition: 화면 중앙 코어 붕괴, 스코어보드가 조작 결과로 뒤집힘. 화면 파열 방사
- subject: (경기 화면 — 붕괴 이펙트)
- emotion: 충격·붕괴
- motion/direction: 중앙 파열이 화면 밖으로 방사(체류 정점)
- dialogue_ref: 〔시스템〕(중계) "어? 어어—?!" / 〔효과음〕 "콰직—"
- state_color: **글리치 레드 `#E23B3B` 폭발** on 청록
- fx/note: impact-flash, 화면 파열. full-bleed 단독 = 붕괴 임팩트

### panel_007
- scene_id: S1 / location: LOC_CROWN_ARENA
- beat: B2 (믿을 수 없는 눈 · 경악)
- size: large / TALL 3:4
- camera: eye-level, extreme-close-up (눈)
- composition: 눈만 화면 가득, 동공 확장. **정면 눈만 — 얼굴 전체 정체 노출 회피 크롭**
- subject: YUGEON(ORACLE, 눈 ECU)
- emotion: 경악·불신
- motion/direction: 동공 확장에 시선 고정(정지)
- dialogue_ref: 〔생각〕 "…왜."
- state_color: 홍채에 레드 글리치 반사 잔광
- fx/note: ECU 정지컷. 다음 손 떨림(008)으로 하강

### panel_008 · ★손 클로즈업 대구 SSOT 앵커 1/4 · 트라우마① 심기
- scene_id: S1 / location: LOC_CROWN_ARENA (손 인서트)
- beat: B3 (손 떨림 · 무력·공포)
- size: insert / INSERT 1:1
- camera: eye-level (top-down 기미), extreme-close-up (오른손)
- composition: 마우스 위 **오른손 ECU.** 미세 진동 모션 블러 + 청록 잔상 흐트러짐. 손등 옅은 흉터 노출
- subject: YUGEON(ORACLE 오른손만)
- emotion: 무력·공포(억눌림)
- motion/direction: 진동 블러 = 정지 속 미세 떨림
- dialogue_ref: 〔효과음〕 "드르르……" (말풍선 대사 없음)
- state_color: 청록 잔상 흐트러짐 + 회철 그림자
- fx/note: **★SSOT 앵커 — panel_017/028/056과 동일 앵글·크롭·크롭비. 손 흉터 위치 고정(오른손등).** 트라우마 매개 첫 심기

### panel_009
- scene_id: S1 / location: LOC_CROWN_ARENA (중계석)
- beat: B3 (중계 절규)
- size: medium / STD 4:3
- camera: eye-level, medium shot
- composition: 중계석 실루엣, 카메라 탈리등 적색 점등. 해설 벌떡
- subject: (중계·해설 실루엣 — 얼굴 특정 안 함)
- emotion: 혼란·경악
- motion/direction: 탈리등 적색→해설 실루엣
- dialogue_ref: 〔시스템〕(해설) "이게… 이게 무슨 일이죠?" / 〔시스템〕(해설) "방금… 스코어가… 뒤집혔습니다."
- state_color: 적색 탈리등 포인트광
- fx/note: 여론/방송 레이어 = 대사 패널로 긴장 번역

### panel_010
- scene_id: S1 / location: LOC_CROWN_ARENA
- beat: B3 (관중 야유 · 무음 매장)
- size: large / WIDE 16:9
- camera: high-angle, long shot → 인물 고립
- composition: 관중석 야유(입만 벌어짐)이나 **무음 처리(효과음 없음·정적).** 대형 스크린에 「조작」 자막 스치듯. 하단 중앙 유건 뒷모습 고립
- subject: YUGEON(ORACLE 뒷모습), 관중(원경)
- emotion: 매장의 냉기·고립
- motion/direction: 관중 소용돌이→중앙 고립된 뒷모습으로 수렴
- dialogue_ref: 〔시스템〕(대형 스크린, 스치듯) "…「조작」…"
- state_color: 청록 냉기 + 스크린 반사, 무음의 정적 톤
- fx/note: negative space로 고립 강조. 무음 = 여백 연출

### panel_011
- scene_id: S1 / location: LOC_CROWN_ARENA
- beat: B3 (스포트라이트 소등 · 절망 하강) · **무대사**
- size: full-bleed / FULL 9:16
- camera: high-angle (부감), long shot
- composition: 헤드셋 못 벗은 채 굳은 ORACLE. 스포트라이트가 그만 남기고 하나씩 꺼진다. 넓은 상하 여백
- subject: YUGEON(ORACLE, 고립·왜소)
- emotion: 절망
- motion/direction: 꺼지는 조명 = 어둠이 위→아래로 잠식
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 스포트라이트 잔광 1점 → 잉크블랙 잠식
- fx/note: **무대사·최대여백.** 부감 고립. 스크롤 체류 극대

### panel_012 · W1 심기(원인 언급 0)
- scene_id: S1 / location: LOC_CROWN_ARENA
- beat: B4 (이질적 감각 · 회귀 트리거)
- size: medium / TALL 3:4
- camera: dutch-angle, medium-close
- composition: 세계가 이질적으로 일그러짐. 소리가 빨려 사라지는 왜곡
- subject: YUGEON(ORACLE, 왜곡 속)
- emotion: 미스터리·이물감
- motion/direction: 화면 중앙으로 왜곡이 수축(빨려듦)
- dialogue_ref: 〔생각〕 "소리가… 빨려 들어간다."
- state_color: 색수차·왜곡, 채도 이탈
- fx/note: dutch-angle 불안. W1(왜 회귀했나) 원인 언급 0 — 위화감만

### panel_013 · W2 잔상 존재 / 카드C①(붕괴 이펙트로 위장) · **무대사**
- scene_id: S1 / location: LOC_CROWN_ARENA + LOC_GAME_ARKLIGHT(잔상)
- beat: B4 (잔상 산조각→역재생 글리치)
- size: full-bleed / FULL 9:16 (긴 세로)
- camera: eye-level, 긴 세로 글리치 컷
- composition: 청록 잔상이 산산조각 → **역재생(시간이 거꾸로 감기는 글리치).** 파편이 화면 중앙으로 빨려 들어감. 긴 세로 낙하
- subject: YUGEON(ORACLE), 잔상 UI
- emotion: 불길·미스터리
- motion/direction: 파편 역류 = 위·아래 양방향 수렴(시간 역행 암시)
- dialogue_ref: 〔효과음〕 "지지직—" (대사 없음)
- state_color: **완전 붕괴 = 파편화 + 레드 글리치 + time-reversal rewind** `#E23B3B`
- fx/note: **카드C① 무심 노출("붕괴 이펙트"로 위장).** 긴 세로 = 체류 최대

--- SCENE BREAK · (브릿지) LOC_VOID_BLACKOUT · 암전→여명 ---

### panel_014 · **무대사**
- scene_id: (브릿지) / location: LOC_VOID_BLACKOUT
- beat: B4 (암전 · 숨 멈춤)
- size: full-bleed / FULL 9:16
- camera: — (풀블랙)
- composition: 화면 전체 검정 + 미세 노이즈. **최대 세로 여백**
- subject: (암전)
- emotion: 정적·숨 멈춤
- motion/direction: 무(無) — 스크롤만 흐름
- dialogue_ref: (없음 — 무대사)
- state_color: 잉크블랙 `#0B0D10` + 미세 그레인
- fx/note: **최대여백 암전 = 시간 경과/장면 전환.** 다음 청각 전환(015) 셋업

### panel_015
- scene_id: (브릿지) / location: LOC_VOID_BLACKOUT
- beat: B4 (청각 전환 · 여명 스밈)
- size: large / FULL 9:16
- camera: —
- composition: 검정 속 하단에 옅은 빛. 멀리 아침 새소리·알람이 스며듦
- subject: (암전→여명)
- emotion: 전환 예감
- motion/direction: 하단 옅은 빛이 위로 번짐(각성 예고)
- dialogue_ref: 〔효과음〕(멀리, 옅게) "삐— 삐— 삐—"
- state_color: 잉크블랙 → 하단 청백 여명 스밈
- fx/note: 청각 브릿지. 다음 눈뜸(016)으로 각성

--- SCENE BREAK · S2 / LOC_DORM_ROOM · 이른 아침 ---

### panel_016
- scene_id: S2 / location: LOC_DORM_ROOM
- beat: B4 (각성 · 눈뜸)
- size: large / TALL 3:4
- camera: eye-level, extreme-close-up (눈)
- composition: 감긴 눈꺼풀 안쪽으로 빛 → 눈이 번쩍 뜨인다. 눈 ECU
- subject: YUGEON(눈 ECU, 젊은 얼굴/노장의 눈)
- emotion: 각성·혼란
- motion/direction: 감긴→뜬 눈, 시선이 정면으로 꽂힘
- dialogue_ref: 〔생각〕 "이 소리……"
- state_color: 차가운 아침 청백광 반사
- fx/note: 콜드오픈 ECU(007 경악의 눈)와 대구되는 각성의 눈

---

## ② 회귀 + 입학 + 콜드 벤치 배치 (panel_017~031) · B5~B9

> **리듬 설계:** 저지대·서스펜스 구간. 정적 컷·간결 통과(과설명 금지). "독자만 회귀를 안다"는 정보 우위로 지탱. 손 대구(017)·거울(019)·"돌아왔어"(020)는 클로즈업으로 절제. 콜드 벤치 하강(025)은 세로컷 억압.

### panel_017 · ★손 클로즈업 대구 SSOT 앵커 2/4 · 카드C② · **무대사(손 인서트)**
- scene_id: S2 / location: LOC_DORM_ROOM (손 인서트)
- beat: B5 (굳지 않은 손 · 대구 회수)
- size: insert / INSERT 1:1
- camera: eye-level, extreme-close-up (오른손)
- composition: 벌떡 일어나 **오른손을 눈앞에 든다.** 떨리지 않음. 젊고 매끈·리셋된 손. **panel_008과 동일 앵글·크롭.** 청록 잔상 없음(선명)
- subject: YUGEON(오른손만, 손등 흉터는 아직 옅음/리셋)
- emotion: 혼란·경이
- motion/direction: 정지·선명(008의 떨림과 대비)
- dialogue_ref: 〔생각〕 "…안 떨려." (짧은 독백 — 손 위 소형 생각풍선)
- state_color: 청백 아침광, **잔상 없음(선명)** — 008의 흐트러짐과 대비
- fx/note: **★SSOT 대구 앵커 2/4. 008(떨림)↔017(안 떨림) 동일 프레이밍으로 대비.** 카드C 변주②

### panel_018
- scene_id: S2 / location: LOC_DORM_ROOM
- beat: B5 (7년 전 방 · 정적 낙차)
- size: medium / WIDE 16:9
- camera: eye-level, long shot (establishing)
- composition: 좁은 기숙사 방 정경. 벽 달력 「입학 첫날」, 창밖 아침. 낡은 가구
- subject: YUGEON(침대 위), 방 establishing
- emotion: 이물감·정적
- motion/direction: 달력→창밖으로 시선(시간 좌표 확인)
- dialogue_ref: 〔생각〕 "이 방……."
- state_color: 청백 아침광 + 옅은 웜 하이라이트
- fx/note: establishing으로 공간·시간(7년 전) 확립

### panel_019
- scene_id: S2 / location: LOC_DORM_ROOM (거울)
- beat: B5 (거울 · 이물감)
- size: medium / STD 4:3
- camera: eye-level, medium-close (거울 프레임 인 프레임)
- composition: 벽 거울 앞. 프레임 인 프레임으로 26세의 눈빛을 한 19세 얼굴. 짙은 다크서클
- subject: YUGEON(거울 속 얼굴 — 젊은 외형/노장의 눈)
- emotion: 이물감·자기 응시
- motion/direction: 거울 테두리가 얼굴을 가둠(감시/자각)
- dialogue_ref: 〔생각〕 "이 얼굴."
- state_color: 청백 저채도
- fx/note: frame-in-frame. 정체(회귀)를 시각으로 절제 암시

### panel_020 · 독자 정보 우위 확립 / 카드C 서스펜스 점화
- scene_id: S2 / location: LOC_DORM_ROOM
- beat: B6 ("…돌아왔어" · 조용한 긴장)
- size: large / STD 4:3
- camera: eye-level, close-up (눈)
- composition: 눈이 천천히 상황을 계산. **절제 — 회귀를 직접 설명 안 함.** 눈 CU
- subject: YUGEON(눈 CU, 계산하는 노장의 눈)
- emotion: 조용한 긴장·계산
- motion/direction: 눈동자 미세 이동(상황 스캔)
- dialogue_ref: 〔생각〕 "…돌아왔어."
- state_color: 청백 저채도, 홍채에 냉정
- fx/note: **절제 규율 — 플래시백 남발 금지.** 독자만 회귀 인지 = 서스펜스 엔진

### panel_021 · **무대사(손 인서트)**
- scene_id: S2 / location: LOC_DORM_ROOM (손+헤드셋 인서트)
- beat: B6 (헤드셋 집음 · 트라우마 잔재)
- size: insert / INSERT 1:1
- camera: eye-level, close-up (손+헤드셋)
- composition: 책상 위 낡은 검정 헤드셋을 집는 손. 손끝이 잠깐 멈칫
- subject: YUGEON(손+낡은 검정 헤드셋)
- emotion: 서늘·주저
- motion/direction: 손이 헤드셋으로 뻗다 멈칫(정지 비트)
- dialogue_ref: (없음 — 무대사 인서트)
- state_color: 청백 + 헤드셋 매트 블랙
- fx/note: 헤드셋 = 반복 모티프(004·047과 연결). 트라우마 잔재 절제

--- SCENE BREAK · S3 / LOC_ACADEMY_EXT · 낮 ---

### panel_022
- scene_id: S3 / location: LOC_ACADEMY_EXT
- beat: B7 (아카데미 입학 · 소외)
- size: large / WIDE 16:9
- camera: eye-level, long shot (establishing)
- composition: 입학 게이트 외경, 「TERRA e-SPORTS ACADEMY」 현판. 신입들 활기 속 유건 홀로 무표정
- subject: YUGEON(무표정 고립), 신입 A·신입들(군중 원경)
- emotion: 소외·이물감
- motion/direction: 군중 흐름 속 정지한 유건으로 시선 수렴
- dialogue_ref: 〔시스템〕(현판) "TERRA e-SPORTS ACADEMY" / 신입 A 〔대사〕 "야 봤어? 나 1군 노린다."
- state_color: 낮 균일광, 유건만 저채도 대비
- fx/note: establishing. 군중 활기 vs 유건 냉정 대비

### panel_023 · 성장 UI(과설명 금지)
- scene_id: S3 / location: LOC_ACADEMY_EXT (티어 배지 UI 인서트)
- beat: B7 (슬래그 티어 · 낙차 즉물화)
- size: insert / INSERT 1:1
- camera: eye-level, extreme-close-up (UI 오버레이)
- composition: 시스템창 스타일 오버레이 — 탁한 회철 슬래그 배지. 중앙 배치
- subject: (UI 인서트), YUGEON(계정)
- emotion: 낙차·즉물
- motion/direction: 배지로 시선 집중
- dialogue_ref: 〔시스템〕(티어 배지) "TIER: SLAG" / 〔시스템〕 "─ 최하위 ─"
- state_color: 탁한 회철 배지 `#3A4048` + 시안 테두리
- fx/note: style-bible §7-C 배지 규격. 과설명 금지(배지 한 컷)

### panel_024
- scene_id: S3 / location: LOC_ACADEMY_EXT (반 배정 명단)
- beat: B7 (콜드 벤치 배정 · 냉대)
- size: medium / STD 4:3
- camera: eye-level, close-up (명단) → 반응
- composition: 반 배정 명단 클로즈, 유건 이름이 **콜드 벤치(4군)** 칸. 주변 학생 흘깃·비웃음
- subject: YUGEON, 학생 B·C(원경 흘깃)
- emotion: 냉대·비웃음
- motion/direction: 명단 이름→주변 비웃는 얼굴로 시선 이동
- dialogue_ref: 학생 B 〔대사〕 "쟤 어디 반이래?" / 학생 C 〔대사〕 "…콜드 벤치. 곧 잘릴 애들."
- state_color: 낮 균일광, 냉기 톤
- fx/note: 대사 핑퐁(B→C) 자연 흐름. 낙차 확립

--- SCENE BREAK · S4 / LOC_BASEMENT_STAIR · 하강 ---

### panel_025 · **무대사**
- scene_id: S4 / location: LOC_BASEMENT_STAIR
- beat: B7 (지하 하강 · 억압)
- size: large / FULL 9:16 (하강 세로컷)
- camera: high-angle, long shot
- composition: 지하 계단·복도. 깜빡이는 형광등, 노출 배관, 결로. 습한 냉기. 유건이 아래로 내려감
- subject: YUGEON(하강, 왜소)
- emotion: 억압·하강
- motion/direction: 계단이 위→아래로 시선을 끌어내림(하강 리딩라인)
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 형광등 청백 깜빡임 + 회철 냉기
- fx/note: 세로컷 하강 = 밑바닥으로의 낙차 즉물화. 무대사 여백

--- SCENE BREAK · S5 / LOC_COLDBENCH 【주무대】 ---

### panel_026
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B7 (콜드 벤치 문 · "곧 잘릴 곳" 냉기)
- size: medium / STD 4:3
- camera: eye-level, medium shot
- composition: 콜드 벤치 지하 연습실 문. 낡은 팻말 「THE COLD BENCH」. 안에서 새어나오는 중고 모니터 백라이트
- subject: YUGEON(문 앞), 팻말
- emotion: 밑바닥의 냉기
- motion/direction: 팻말→문틈 백라이트로 시선(진입 예고)
- dialogue_ref: 〔시스템〕(낡은 팻말) "THE COLD BENCH" / 〔생각〕 "…여기가 밑바닥이군."
- state_color: 회철 + 문틈 청록 백라이트
- fx/note: 주무대 진입 establishing 예열

### panel_027
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B8 (세계급 눈으로 방 스캔 · 냉정한 판단)
- size: medium / WIDE 16:9
- camera: pov (눈 POV 스윕), medium-long
- composition: 자리에 앉아 방 전체 배치·장비 상태를 순식간에 스캔. 중고 PC·엉킨 케이블·낡은 모니터
- subject: YUGEON(POV), 연습실 내부 establishing
- emotion: 냉정한 판단
- motion/direction: 좌→우 방 스윕(POV 파노라마)
- dialogue_ref: 〔생각〕 "장비도, 사람도— 바닥이야."
- state_color: 회철·청록 지배, 모니터 백라이트 업라이팅
- fx/note: POV로 주무대 공간 확립. 세계 챔피언의 눈 = 정보 우위

### panel_028 · ★손 클로즈업 대구 SSOT 앵커 3/4 · 트라우마②("컨디션" 미스디렉션)
- scene_id: S5 / location: LOC_COLDBENCH (손 인서트)
- beat: B8 (손 재떨림 · 불안 반등)
- size: insert / INSERT 1:1
- camera: eye-level, extreme-close-up (오른손) — **panel_008/017 동일 앵글**
- composition: 마우스에 손을 올리는 순간 **오른손이 다시 미세하게 떤다.** 결승 잔상(P08) 1컷 오버랩. 청록 흐트러짐
- subject: YUGEON(오른손 + 결승 잔상 오버랩)
- emotion: 불안 반등(억눌림)
- motion/direction: 진동 블러 재현(008 반복)
- dialogue_ref: 〔효과음〕 "드르……" / 〔생각〕 "……컨디션 탓이야."
- state_color: 청록 흐트러짐 + 회철, 잔상 플래시 1컷
- fx/note: **★SSOT 대구 앵커 3/4(변주). 008 동일 프레이밍.** "컨디션" = 트라우마 미스디렉션

### panel_029 · **무대사**
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B8 (주먹 쥐어 떨림 억누름 · 억눌린 의지)
- size: medium / STD 4:3
- camera: eye-level, close-up (주먹+눈 투컷 구성)
- composition: 상단 주먹 클로즈(떨림을 눌러 삼킴), 하단 눈(흔들리지 않음). 투컷 병치
- subject: YUGEON(주먹+눈)
- emotion: 억눌린 의지
- motion/direction: 주먹→눈으로 시선 하강(결의 확인)
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 회철 저채도, 눈만 서늘한 예광
- fx/note: 무대사. 손 떨림(028)→의지(029) 대비로 need 아크 예열

### panel_030 · 후속 씨앗(동료 3인 — EP01 현재 로스터)
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B9 (콜드 벤치 동료 소개 · 톱니 골)
- size: medium / STD 4:3 (인물 소개 3분할)
- camera: eye-level, medium shot (3분할)
- composition: 3분할 스침 소개 — 좌 정하루(완장·다정), 중 배태산(팔짱·이글), 우 남도경(노트북 뒤 무심)
- subject: YUGEON, HARU, TAESAN, DOGYEONG (*소예 미등장 — EP04 영입*)
- emotion: 이완(톱니 골)
- motion/direction: 좌→우 인물 순차 소개
- dialogue_ref: HARU 〔대사〕 "새로 왔어요? 밥은 먹었고?" / TAESAN 〔대사〕 "…또 지하로 굴러온 놈이네." / DOGYEONG 〔대사〕 "……."
- state_color: 회철·청록, 각 인물 톤 유지
- fx/note: **연속성 — 호명·소개는 태산·하루·도경 3인만(소예 금지).** 후속 회차 씨앗

--- SCENE BREAK · S5·문틀 / LOC_COLDBENCH(문틀 너머 LOC_BASEMENT_STAIR 원경) ---

### panel_031 · 씨앗: 한상혁(W4)·고형준
- scene_id: S5·문틀 / location: LOC_COLDBENCH (문틀 프레임 너머 복도 원경 = LOC_BASEMENT_STAIR)
- beat: B9 (한상혁 스침 · 손 복선 / 고형준 원경)
- size: medium / STD 4:3
- camera: eye-level, medium shot (frame-in-frame 문틀)
- composition: 문틈으로 코치 트랙탑 한상혁이 커피컵 들고 스침. **오른손 관절 보호대(망가진 손) 한 컷.** 뒤쪽 복도 원경에 정장 실루엣 고형준
- subject: SANGHYUK(문가), HYUNGJUN(복도 원경 실루엣·**클로즈업/대사 금지**), YUGEON
- emotion: 씨앗·불길 조짐(절제)
- motion/direction: 한상혁 스침(좌→우) + 뒤 복도 원경 고형준으로 깊이
- dialogue_ref: SANGHYUK 〔대사〕(지나가며, 툭) "콜드 벤치는 코치도 안 와. 알지?"
- state_color: 문틈 백라이트 + 복도 형광 청백
- fx/note: **한상혁 관절 보호대(오른손) = 유건 손떨림의 미래 예고(W4 은닉·따뜻한 멘토만).** 고형준 원경 = EP01 적대 시각 한계. 딜러 미등장

---

## ③ 상승 — 힘숨찐(1할만 흘림) (panel_032~047) · B10~B13

> **리듬 설계:** 사이다 상승 톱니(4→6→7→6→7). 고구마 셋업(033)→잔상 예지(034)→각성 전조(035)→오더 SSOT 재현(036)→명령 쏟아짐(037~038)→**사이다 1차 정점(039)**→허세 위장(040)→여론 술렁(041~043)→윤태오 감지(044~047). 작은 사이다 비트로 고구마 방치 방어.

--- SCENE BREAK · S5 / LOC_COLDBENCH (스크림) ---

### panel_032
- scene_id: S5 / location: LOC_COLDBENCH (오버레이: LOC_GAME_ARKLIGHT 세팅 화면)
- beat: B10 (첫 스크림 세팅 · 불리)
- size: medium / WIDE 16:9
- camera: eye-level, medium-long → 화면
- composition: 첫 비공식 스크림 5v5 큐. 상대는 상위반. 화면상 콜드 벤치 불리 셋업
- subject: YUGEON, 콜드벤치 동료(HARU·TAESAN·DOGYEONG), 상대(화면)
- emotion: 불리·긴장
- motion/direction: 세팅 와이드→화면 큐로 시선
- dialogue_ref: HARU 〔대사〕 "상대, 상위반이에요." / HARU 〔대사〕 "그냥 평가용이니까 편하게—"
- state_color: 회철·청록, 모니터 백라이트
- fx/note: 사이다 상승 셋업. 하루 2말풍선 분할(베이크 축약)

### panel_033 · 고구마 셋업
- scene_id: S5 / location: LOC_COLDBENCH (오버레이: LOC_GAME_ARKLIGHT 난전)
- beat: B10 (태산 돌진 짤림 · 고구마)
- size: medium / STD 4:3
- camera: eye-level, medium shot (난전)
- composition: 태산이 앞만 보고 돌진 → 짤린다. 동료들 우왕좌왕. 난전
- subject: TAESAN(돌진), 콜드벤치 동료
- emotion: 답답(고구마)
- motion/direction: 태산 전진선이 홀로 튀어나감(고립)
- dialogue_ref: TAESAN 〔외침〕 "붙어! 내가 연다!" / DOGYEONG 〔대사〕 "…아, 혼자 들어가지 마세요. 짤려요."
- state_color: 회철·청록 + 난전 잔광
- fx/note: 고구마 셋업 → 다음 잔상 예지(034)로 사이다 반등 준비

### panel_034 · W2 예지 노출 / 카드B 힘숨찐 근거
- scene_id: S5 / location: LOC_GAME_ARKLIGHT (유건 POV 오버레이)
- beat: B10 (잔상 예지 첫 노출)
- size: large / STD 4:3
- camera: pov, medium (청록 잔상 오버레이)
- composition: 유건 시점 — 상대의 **다음 무브가 청록 홀로그램으로 미리** 비친다(서지 라인 갱킹 예고). 유효=선명 동기화
- subject: YUGEON(POV), 잔상 UI, 상대 예지상
- emotion: 서스펜스(독자·주인공만 앎)
- motion/direction: 잔상 예고선이 갱킹 지점을 가리킴
- dialogue_ref: 〔생각〕 "…저기서 온다."
- state_color: **잔상 유효 = 시안-틸 `#27E0D0` 선명·안정**
- fx/note: W2 예지 장치 노출. 카드B(힘숨찐 근거). 잔상 = 유건 시점 전용

### panel_035 · **무대사**
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B10 (눈 각성 전조 · 계산 완료)
- size: medium / STD 4:3
- camera: eye-level, close-up (눈)
- composition: 나른하던 눈이 순간 날카로워짐. 계산 완료. 눈 CU
- subject: YUGEON(눈 CU — 디폴트→sharpen)
- emotion: 각성 전조
- motion/direction: 눈매가 조여지는 정지컷
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 모니터 백라이트 언더광, 홍채 예광
- fx/note: 무대사. 콜 잡기 직전 스위치. 다음 오더 SSOT(036)로

### panel_036 · ★오더 미니맵 SSOT 2차 / 카드A②("무명이 어쩌다"로 위장)
- scene_id: S5 / location: LOC_GAME_ARKLIGHT (유건 POV 오버레이)
- beat: B11 (첫 콜 · 오더 재현)
- size: large / STD 4:3 (오버헤드 미니맵)
- camera: top-down (오버헤드 미니맵), pov
- composition: 유건이 처음으로 콜을 잡는다. **미니맵 위 panel_003과 완전히 동일한 형태·리듬**(서지 셋→타이탄 버림)의 오더
- subject: YUGEON(POV — 화면·잔상), 미니맵 UI
- emotion: 확신
- motion/direction: 003과 동일한 화살표 궤적(형태 각인 재현)
- dialogue_ref: 〔대사〕 "서지 셋. 타이탄 버려." ★자구 SSOT(003과 동일)
- state_color: 시안-틸 `#27E0D0` 선명
- fx/note: **★SSOT 앵커 2차 — panel_003과 완전 동일 형태·리듬·앵글·대사 자구.** 반전 재독 매칭 근거

### panel_037 · 말투: 콜 잡으면 명령형 쏟아짐
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B11 (명령형 오더 · 급변 톤)
- size: medium / STD 4:3
- camera: eye-level, medium shot (옆얼굴+헤드셋)
- composition: 급변한 톤. 짧고 정확한 명령형. 옆얼굴+헤드셋 미디엄 (콜드오픈 P04 콜 모드와 대구)
- subject: YUGEON(콜 모드 — eyes sharpen), 콜드벤치
- emotion: 급변·통제(commander)
- motion/direction: 옆얼굴 발화 방향으로 대사 흐름
- dialogue_ref: 〔대사〕 "태산 밴가드, 앞. 하루 시야 잡아." / 〔대사〕 "도경, 스파인 막아. 3초 뒤 열려."
- state_color: 모니터 백라이트 rim
- fx/note: **연속성 — 호명 = 태산·하루·도경(현재 로스터). 소예 금지.** 무심→명령형 시그니처 급변

### panel_038
- scene_id: S5 / location: LOC_COLDBENCH (오버레이: LOC_GAME_ARKLIGHT)
- beat: B11 (동료 얼떨결 콜대로 이동 · 긴박)
- size: small / STD 4:3
- camera: eye-level, medium shot
- composition: 반신반의하던 태산·동료가 얼떨결에 콜대로 움직인다. 아바타 이동
- subject: TAESAN, 콜드벤치, 아바타(화면)
- emotion: 긴박·반신반의
- motion/direction: 아바타 이동선이 콜 지점으로 수렴
- dialogue_ref: TAESAN 〔대사〕 "…어? 어어, 야 이거—"
- state_color: 청록 + 긴박 잔광
- fx/note: small로 리듬 가속 → 다음 폭발(039) 대비

### panel_039 · 사이다 1차 정점
- scene_id: S5 / location: LOC_GAME_ARKLIGHT (경기 화면)
- beat: B11 (콜 적중 · 판 뒤집힘)
- size: full-bleed / CINE 21:9
- camera: eye-level, extreme-close-up → 화면 폭발
- composition: 상대 갱킹이 정확히 그 지점에서 무너지고 판이 뒤집힘. 화면 폭발
- subject: (경기 화면 — 임팩트)
- emotion: 사이다 1차 정점
- motion/direction: 중앙 폭발이 밖으로 방사(체류)
- dialogue_ref: 〔효과음〕 "콰앙—!" / DOGYEONG 〔대사〕 "…맞혔어요. 정확히 거기서."
- state_color: **청록 유지 + 순간 화이트 임팩트 플래시** (국소 고대비)
- fx/note: impact-flash. full-bleed 사이다 정점. 도경 존댓말+정확 어법(교정 반영)

### panel_040 · 미스디렉션: 카드B "찍었다" 허세(이중 의미)
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B11 (허세 위장 · 능청)
- size: medium / STD 4:3 (리액션 컷 연쇄)
- camera: eye-level, medium-close (투샷 리액션)
- composition: 태산 경악 리액션 + 유건 시치미. 능청
- subject: TAESAN(경악), YUGEON(무심 능청)
- emotion: 능청(서브텍스트=실은 앎)
- motion/direction: 태산→유건 시선(추궁), 유건은 흘림
- dialogue_ref: TAESAN 〔외침〕 "야! 너 뭐야?! 어떻게 안 거야?!" / YUGEON 〔대사〕 "…찍었어."
- state_color: 회철·청록
- fx/note: **미스디렉션 — "찍었어" 이중 의미(실은 안다).** 카드B 허세 라벨

### panel_041
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B12 (하루·도경 반응 · 술렁)
- size: small / STD 4:3 (투컷)
- camera: eye-level, medium-close (투컷)
- composition: 상단 하루 눈 동그랗게 / 하단 도경이 노트북에서 고개 듦. 투컷 병치
- subject: HARU(놀람), DOGYEONG(노트북에서 고개 듦)
- emotion: 술렁·의심 발아
- motion/direction: 하루→도경으로 시선 하강
- dialogue_ref: HARU 〔대사〕 "……우연이라기엔." / DOGYEONG 〔대사〕(고개 듦) "…우연 아니에요."
- state_color: 회철·청록, 도경 안경 렌즈 반사
- fx/note: 대사 핑퐁 자연 흐름. 도경 의심 예열

### panel_042 · 여론 레이어(정체 노출 위협 예열)
- scene_id: S5 / location: LOC_COLDBENCH (채팅 UI 오버레이)
- beat: B12 (관전 채팅 · 여론 증폭)
- size: insert / INSERT 1:1
- camera: eye-level, insert (채팅 스택)
- composition: 화면에 관전 채팅 로그가 흐름. **소형 시스템 말풍선 3개 세로 스택**(반투명·얇은 시안 테두리)
- subject: (채팅 UI only)
- emotion: 여론 증폭·위협 예열
- motion/direction: 채팅 3줄이 위→아래 스크롤
- dialogue_ref: 〔시스템〕(채팅) "꼴찌반 신인이?" / 〔시스템〕 "저거 우연 아니냐 ㅋㅋ" / 〔시스템〕 "쟤 뭐야?"
- state_color: 반투명 흑청 + 시안 `#27E0D0` 테두리
- fx/note: style-bible §7-A 채팅 스택. 정체 노출 위협 예열

### panel_043 · 씨앗: 도경 데이터 의심(EP03 예열)
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B12 (도경 통계 촉 · 미심)
- size: medium / STD 4:3
- camera: eye-level, medium-close (노트북 뒤 관찰)
- composition: 도경이 스코어보드/전적 화면을 유심히. 노트북 뒤 관찰. 통계쟁이의 촉
- subject: DOGYEONG(narrowed analytic stare over laptop)
- emotion: 미심·분석
- motion/direction: 도경 시선→화면 통계로
- dialogue_ref: DOGYEONG 〔생각〕 "…이 콜, 승률 12%짜린데."
- state_color: 회철·청록, 안경 렌즈에 통계 반사
- fx/note: 씨앗(도경 데이터 의심 = EP03 서브플롯 예열)

### panel_044 · ★오더 미니맵 SSOT 3차(관전) / 카드A②′(윤태오 목격)
- scene_id: S5 / location: LOC_COLDBENCH (오버레이: LOC_GAME_ARKLIGHT 리플레이 화면)
- beat: B13 (윤태오 오더 목격 · 멈칫)
- size: medium / STD 4:3
- camera: eye-level, medium shot → 화면
- composition: 지나던 윤태오가 콜드 벤치 스크림 리플레이의 그 오더 형태를 본다. 발이 멈춘다. **리플레이 화면 = panel_003/036 동일 오더 형태**
- subject: TAEO(멈칫), YUGEON(원경), 리플레이 미니맵(003/036 형태)
- emotion: 위화감·인지 점화
- motion/direction: 윤태오 걸음 정지 + 화면 미니맵으로 시선 꽂힘
- dialogue_ref: TAEO 〔생각〕 "…응?"
- state_color: 회철·청록 + 화면 시안 미니맵
- fx/note: **★SSOT 앵커 3차(관전자 시점) — 003/036 동일 형태 리플레이.** 잔상 오버레이는 유건 전용이므로 여기 미니맵은 리플레이 UI로만(윤태오 시점, 잔상 없음)

### panel_045 · 카드A 2차 노출(윤태오 감지)
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B13 (윤태오 눈 가늘어짐 · 위협 점화)
- size: medium / STD 4:3
- camera: eye-level, close-up (눈)
- composition: 윤태오의 눈이 가늘어진다. 눈 CU. 위협 점화
- subject: TAEO(눈 CU — narrowed, ORACLE 화제 톤 진지)
- emotion: 위협 점화·기억 추적
- motion/direction: 눈매 조임(정지)
- dialogue_ref: TAEO 〔생각〕 "이 오더… 어디서 봤지?"
- state_color: 회철·청록, 회청 눈(colored lens) 예광
- fx/note: 카드A 2차 노출. 윤태오 감지 = 클리프행어 예열

### panel_046
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B13 (윤태오 응시 · 서스펜스 조임)
- size: medium / STD 4:3
- camera: over-the-shoulder (윤태오 어깨 너머 유건), medium
- composition: 윤태오가 유건의 뒤통수를 응시. 유건은 아직 못 알아챔(무심). OTS 투샷
- subject: TAEO(전경 어깨), YUGEON(후경 뒤통수·무심)
- emotion: 서스펜스 조임
- motion/direction: 윤태오 시선선이 유건 뒤통수로 꽂힘
- dialogue_ref: TAEO 〔생각〕 "…설마."
- state_color: 회철·청록
- fx/note: OTS 긴장. *"…설마"(046)와 "…이럴 리가"(051) 자구 구분 — 감지 vs 확신 임박*

### panel_047 · **무대사**
- scene_id: S5 / location: LOC_COLDBENCH
- beat: B13 (시선 엇갈림 · 불안 전조)
- size: medium / STD 4:3
- camera: eye-level, medium shot (엇갈리는 투샷)
- composition: 유건이 헤드셋을 벗으며 일어선다. 그 순간 윤태오와 시선이 스칠 듯 엇갈린다
- subject: YUGEON(헤드셋 벗음·일어섬), TAEO(엇갈리는 시선)
- emotion: 불안 전조
- motion/direction: 두 인물 동선이 스칠 듯 교차(엇갈림)
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 회철·청록
- fx/note: 무대사. 헤드셋 모티프(004·021·037 연결). ③막→④막 불안 브릿지

---

## ④ 클리프행어 — 정체 인지 + 2차 훅 (panel_048~057) · B14~B17

> **리듬 설계:** 대조 몽타주(049)→서스펜스 최고조(050~051)→**최대 여백 침묵 박자(052~053)**→**정체 반전 대사 단독 대형(054)**→유건 반응 시인 컷(055)→**시점 반전 오버랩(056)**→**앰버 발화 2차 훅(057).** 결제 압력 MAX = 결정 대사 컷 + 시점 반전 이중 정점.

--- SCENE BREAK · S6 / LOC_KAISER_ROOM · 밤 ---

### panel_048 · 공정성 근거: 윤태오=ORACLE 신도
- scene_id: S6 / location: LOC_KAISER_ROOM
- beat: B14 (밤 · ORACLE 아카이브 · 집착)
- size: medium / STD 4:3
- camera: eye-level, medium shot (방+화면 발광)
- composition: 밤. 자기 방에서 태블릿을 켬. 저장해둔 **前 챔피언 ORACLE VOD·콜 패턴 아카이브**(광신도 자료). 화면 발광이 얼굴 하단 업라이팅
- subject: TAEO(집착·진지), 태블릿 아카이브 화면
- emotion: 집착·진지
- motion/direction: 얼굴→태블릿 화면으로 시선
- dialogue_ref: TAEO 〔생각〕 "…기분 탓일 리가 없어."
- state_color: 밤 암실 + 태블릿 단일광, 네이비 그림자
- fx/note: **공정성 근거 — 윤태오=ORACLE 신도(대조 능력 확보).** 저명도 진입

### panel_049 · ★오더 미니맵 SSOT 4차(대조) / 카드A③ 회수 · ★자구 인용
- scene_id: S6 / location: LOC_KAISER_ROOM (오버레이: LOC_GAME_ARKLIGHT 좌우 분할 대조)
- beat: B14 (콜 오더 대조 · 확신 임박)
- size: large / STD 4:3 (좌우 분할 대조 몽타주)
- camera: eye-level, insert 분할 화면
- composition: 화면 분할 — 좌: ORACLE 전설적 오더(panel_003 형태) / 우: 오늘 콜드 벤치 무명의 오더(panel_036 형태). **두 미니맵이 완전히 겹친다**
- subject: TAEO, 대조 몽타주 UI(003 형태 ↔ 036 형태)
- emotion: 확신 임박
- motion/direction: 좌우 미니맵이 중앙에서 겹쳐짐(대조→일치)
- dialogue_ref: TAEO 〔대사〕 "서지 셋. 타이탄 버려." (★따옴표 인용 = 003/036 자구 동일) / TAEO 〔대사〕 "…이건 그 사람 손버릇이야."
- state_color: 태블릿 시안 미니맵 대조광
- fx/note: **★SSOT 앵커 4차 — 003/036과 동일 형태가 완전히 겹침. 자구까지 인용.** 미스디렉션 해제·카드A 회수 직전

### panel_050 · 회수: 카드A(부계정 흔적)
- scene_id: S6 / location: LOC_KAISER_ROOM (로그 화면 클로즈)
- beat: B14 (부계정 흔적 · 정보 공개 직전)
- size: medium / STD 4:3
- camera: eye-level, close-up (로그 화면)
- composition: 유건의 스크림 계정 로그를 뒤짐. **부계정 로그인 흔적/닉네임 잔재 한 컷.** 로그 화면 클로즈
- subject: TAEO(손·시선), 로그 UI(리셋 흔적)
- emotion: 서스펜스 최고조
- motion/direction: 로그 라인을 훑는 시선
- dialogue_ref: TAEO 〔생각〕 "이 계정… 리셋 흔적이 있어."
- state_color: 태블릿 시안 로그광
- fx/note: 카드A 회수(부계정 흔적 = 정보 공개 직전 컷)

### panel_051
- scene_id: S6 / location: LOC_KAISER_ROOM
- beat: B14 (손 멈춤·동공 확장 · 경악 빌드업)
- size: medium / STD 4:3 (손+눈 투컷)
- camera: eye-level, close-up (손+눈 투컷)
- composition: 상단 손이 태블릿 위에서 멈춤 / 하단 눈 동공 확장. 투컷
- subject: TAEO(손+눈)
- emotion: 경악 빌드업(확신 임박)
- motion/direction: 손 정지→눈 확장으로 시선 하강
- dialogue_ref: TAEO 〔대사〕 "…이럴 리가."
- state_color: 태블릿 단일광, 동공에 확신 반사
- fx/note: *"…이럴 리가"(046 "…설마"와 자구 구분 — 확신 임박의 다른 박자)*

### panel_052 · **무대사**
- scene_id: S6 / location: LOC_KAISER_ROOM
- beat: B15 (최대 여백 · 침묵 박자)
- size: full-bleed / FULL 9:16
- camera: eye-level, extreme-long (암실)
- composition: 어두운 방, 태블릿 불빛만. **최대 세로 여백.** 침묵의 박자
- subject: (여백/정적 — 태블릿 광점만)
- emotion: 숨 멈춤·침묵
- motion/direction: 빈 세로 공간을 스크롤로 통과
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 최저명도 잉크블랙 + 태블릿 1점광
- fx/note: **최대여백 = 반전 직전 "쿵" 셋업.** 스크롤 체류 극대

### panel_053 · **무대사**
- scene_id: S6 / location: LOC_KAISER_ROOM
- beat: B15 (실루엣 고개 듦 · 정적 조임)
- size: large / FULL 9:16
- camera: low-angle, long shot (로우 실루엣)
- composition: 여백 하단, 윤태오의 실루엣이 천천히 고개를 든다
- subject: TAEO(실루엣·역광)
- emotion: 정적 조임
- motion/direction: 하단 실루엣이 위로 고개 듦(시선 상승 유도 후 054 폭발)
- dialogue_ref: (없음 — 무대사 컷)
- state_color: 역광 실루엣 + 태블릿 백라이트
- fx/note: silhouette. 반전 대사(054) 직전 마지막 정적

### panel_054 · ★반전 회수: 카드A · 1차 클리프행어 【대사 무게중심】
- scene_id: S6 / location: LOC_KAISER_ROOM
- beat: B16 ("…그 계정, 너였어?" · 정체 반전)
- size: full-bleed / FULL 9:16 (단독 대형)
- camera: eye-level, extreme-close-up (얼굴)
- composition: 윤태오 얼굴 익스트림 클로즈업. 눈에 확신과 전율. **대사만 있는 단독 컷 · 다른 요소 최소 · 말풍선 크게·단독 배치**
- subject: TAEO(ECU — eyes wide with certainty and thrill)
- emotion: 확신·전율(정체 반전)
- motion/direction: 눈에 시선 고정(정지·충격)
- dialogue_ref: TAEO 〔대사〕 "…그 계정, 너였어?" 【대사 무게중심 — 대형 단독 말풍선】
- state_color: 태블릿 단일광 얼굴 업라이팅, 눈 하이라이트
- fx/note: **★반전 회수 카드A(정체) · 1차 클리프행어.** FULL 단독·상하 여백 확대(episode-compositor)

--- SCENE BREAK · (교차컷) 유건 위치 불특정 — 배경 최소화 ---

### panel_055 · 충격 증폭: 잔상 반응 컷 · **무대사**
- scene_id: (교차컷) / location: 유건 위치 불특정 (배경 최소·인물+잔상만)
- beat: B16 (유건 무언의 시인)
- size: large / TALL 3:4
- camera: eye-level, close-up
- composition: 컷 전환 — 유건(어딘가). 청록 잔상이 **미세하게 흔들린다**(들켰다는 무언의 시인). 표정 무심하나 눈만 서늘. 배경 어둡게 최소화
- subject: YUGEON(무심·눈만 서늘), 잔상 UI(미세 흔들림)
- emotion: 무언의 시인(서늘)
- motion/direction: 잔상 미세 진동(정지 속 흔들림)
- dialogue_ref: (없음 — 무대사·잔상만으로 시인)
- state_color: **잔상 미세 흔들림 = 시안-틸 faint destabilization** (아직 앰버 아님)
- fx/note: **잔상 반응 컷 — 대사 없이 잔상만으로 시인.** 유건 시점 = 잔상 허용. 배경 최소화로 장소 급변 논란 회피

### panel_056 · ★반전 회수: 카드C(시점 반전) / ★손 대구 최종 회수 4/4 【대사 무게중심】
- scene_id: (교차컷) / location: 유건 위치 불특정 + 결승 인서트 재편집(LOC_CROWN_ARENA 회상 오버랩)
- beat: B17 (결승=미래 재맥락 · 시점 반전)
- size: full-bleed / FULL 9:16 (단독 대형)
- camera: extreme-close-up (손 오버랩)
- composition: 콜드오픈(P06~P08)의 붕괴·손 떨림 장면이 1컷 재편집으로 삽입 → 그 위에 **panel_017의 굳지 않은 손**이 겹쳐진다. 과거(떨림)/현재(선명) 손 오버랩. **panel_008/017 동일 프레이밍 최종 회수**
- subject: YUGEON(현재 손 = 017 프레이밍) + 결승 붕괴/떨림 손(008) 인서트 오버랩
- emotion: 시점 반전 확정(과거=미래)
- motion/direction: 과거 손(흐림·떨림)→현재 손(선명) 오버랩 전환
- dialogue_ref: 〔생각〕 "그 파멸은…" / 〔생각〕 "…아직 오지 않은 미래였어." 【대사 무게중심 — 대형 단독】
- state_color: 결승 인서트 = 레드 글리치 잔상 / 현재 손 = 청록 선명(대비)
- fx/note: **★반전 회수 카드C(시점 반전) · 손 대구 SSOT 최종 회수 4/4(008 떨림↔017 선명↔056 오버랩).** FULL 단독·여백 확대

### panel_057 · ★2차 훅: 카드C 선언(desync 점화 씨앗) 【대사 무게중심】
- scene_id: (교차컷) / location: 유건 위치 불특정 (눈 ECU·배경 최소)
- beat: B17 ("이번엔… 이긴다" · 결의 정점 · 색온도 반전)
- size: full-bleed / FULL 9:16 (단독 대형)
- camera: eye-level, extreme-close-up (눈)
- composition: 눈이 청록 잔상 흔들림 위로 **앰버(호박빛)로 발화.** 눈 ECU. **색온도 반전(청록→앰버).** 말풍선 크게·단독 배치
- subject: YUGEON(눈 ECU — eyes ignite amber, resolute)
- emotion: 결의 정점
- motion/direction: 잔상 흔들림 위로 앰버가 번짐(발화)
- dialogue_ref: 〔생각〕 "이번엔……" / 〔생각〕 "…이긴다." 【대사 무게중심 — 대형 단독】
- state_color: **★앰버 발화 `#F5A623` — EP01 유일 온난 폭발(청록→앰버 색온도 반전).** style-bible §7-B 앰버 발화 규격
- fx/note: **★2차 훅 카드C 선언 = desync 엔진 점화 씨앗(G3 과신 개입·EP04 회수).** 회차 마지막 컷 = 상승 예고. FULL 단독·여백 확대

---

## panel-director → 하류 팀 인계 요약

### prompt-smith 인계
- **SCENE BREAK·scene_id·LOC 목록(§0):** 씬 단위 LOC 토큰 동일 주입. LOC_GAME_ARKLIGHT는 오버레이/인서트(부모 씬 배경 위에).
- **★오더 미니맵 SSOT:** panel_003 = panel_036 = panel_044(리플레이) = panel_049(대조) **완전 동일 형태·리듬·앵글**(LOC_GAME_ARKLIGHT §오더 미니맵 앵커). 변형 금지.
- **★손 클로즈업 SSOT:** panel_008·017·028·056 **동일 앵글·크롭**(오른손 ECU/INSERT, 손등 흉터 위치 고정).
- **잔상 상태 앵커:** 유효(003·034·036)=시안 선명 / 어긋남(005)=레드 분열 / 붕괴(006·013)=파편+레드 / 흔들림(055)=미세 / 앰버 발화(057). **잔상 = 유건 시점 전용**(044는 리플레이 UI로 잔상 없음).
- **A/B/C 분배 힌트:** 씬 경계(SCENE BREAK) 기준 균등 분배 권장. S1 콜드오픈(13컷) / S2~S5 저지대+주무대(31컷) / S6+교차컷 클리프행어(10컷). 주무대 S5(주간 다수)는 A/B/C 고르게.
- **정체 은닉:** panel_001·004·010·011 유건 정면 얼굴 금지(뒤통수/옆얼굴/실루엣). 딜러 얼굴 렌더 금지. 고형준(031) 원경 실루엣만.

### letterer 인계 (dialogue_ref 위치 = 이 샷리스트)
- **대사 무게중심 대형 단독:** panel_054·056·057 — 대형 단독 말풍선, 주변 요소 최소.
- **무대사 컷(말풍선 0):** panel_011·014·015·025·029·035·047·052·053·055 + 손/UI 인서트(008·017·021·028).
- **채팅 스택:** panel_042 소형 시스템 말풍선 3개 세로 스택.
- **★오더 자구 SSOT:** panel_003·036·049 〔대사/인용〕 **"서지 셋. 타이탄 버려."** 자구 동일 베이크(049 따옴표).
- **말풍선 종류:** 〔대사〕흰 둥근 / 〔생각〕점선 구름 / 〔외침〕뾰족 폭발 / 〔시스템〕사각 HUD 시안 / 〔효과음〕작화 통합. 한글 굵은 둥근 고딕·고대비·짧게.

### episode-compositor 인계
- **여백=시간:** 무대사·반전 컷(011·014·025·052·053·054·056·057)은 상하 여백 확대·동일 폭 정렬.
- **긴장 곡선:** 이중 정점(054 카드A / 056~057 카드C) 앞뒤 여백으로 "쿵" 리듬.

---

## 자가검증 체크리스트 (webtoon-panel-breakdown 작업 A)

- [x] 패널 수 **57개(50+ 충족)**, panel_001~057 연속 3자리
- [x] 긴장 고조/반전 구간 잘게 분해(B2 005~008 / B16~17 054~057 클로즈업 점층)
- [x] 모든 패널 scene_id/location(LOC_*) 기재, 같은 씬 동일 LOC(배경 연속성) — 브릿지/오버레이/교차컷 명시
- [x] 대사 패널마다 dialogue_ref + 인접 패널 대사 흐름 자연(030·037·041·046→051 등)
- [x] 각 패널 size/camera/composition/emotion/motion/fx 명시 + 화면비 프리셋 병기
- [x] SSOT 앵커 표식(오더 미니맵 003=036=044=049 / 손 008↔017↔028↔056 / 오더 자구 003=036=049)
- [x] 상태색 명시(평상 청록·회철 / 잔상 시안 / 붕괴 레드 / P57 앰버 발화)
- [x] 무대사 컷·대사 무게중심·정체 은닉·딜러 금지 규약 반영
- [x] 출력 경로 `_workspace/04_visual/ep01_shotlist.md` 정합
