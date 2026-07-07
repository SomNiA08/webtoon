# Style Bible — 《리:메타 (RE:META)》 EP01 스타일 바이블 + 일관성 규약

- 작성: art-director (비주얼팀 리더 / SSOT)
- 일자: 2026-07-06
- 입력: `_workspace/02_story/characters.md` §1·§8 (반별 색·외형 토큰) · `_workspace/02_story/world.md` §7 (시각 톤·잔상 UI·티어) · `_workspace/03_episode/ep01_script_final.md` (EP01 장소·컷) · `_workspace/01_research/trend-brief.md` (담백·고증 톤)
- 방법론: `webtoon-panel-breakdown` 작업 B (B-1 8섹션 / B-3 일관성 토큰 / B-5 LOC / B-6 말풍선)
- 소비자: **panel-director**(샷리스트) · **prompt-smith**(프롬프트 조립 SSOT) · **panel-artist-a/b/c**(렌더) · **letterer**(말풍선 베이크) · **ref-sheet-artist**(레퍼런스) · **episode-compositor**(조립)

> **이 문서는 비주얼팀 단일 진실원천(SSOT)이다.** 모든 프롬프트 = `[글로벌 스타일 토큰]` + `[씬 LOC 토큰]` + `[등장 캐릭터 토큰(character-sheets.md)]` + `[패널 고유 묘사]` + `[말풍선 베이크 명세]` + `[부정 프롬프트]` 순으로 조립한다.
> **in-image 베이크 하네스**: 말풍선·한글 대사는 이미지에 함께 그린다. 따라서 `no text`를 쓰지 않고, §7 말풍선 규약 + §8 부정 프롬프트로 통제한다. **레퍼런스 시트만 예외**(텍스트 없음).

---

## 1. 작화 스타일

**한 줄 무드:** *담백·현실적 한국 청춘 드라마 웹툰 + 차갑고 정밀한 e스포츠 디지털 질감.* 과장된 소년만화 발광·속도선 남발을 지양하고, **화면광(모니터 백라이트)·RGB·홀로 UI**가 감정 조명 역할을 한다(trend-brief: 가비지타임형 납득되는 성장 / world §7-A).

| 항목 | 규격 (codex-image 주입 토큰) |
|---|---|
| **선화** | clean semi-thin inked lineart, confident tapering linework, minimal hatching, no rough sketchy strokes |
| **채색** | soft cel-shading with subtle gradient rendering, semi-realistic anime proportions (not chibi, heads ~7.5 head-tall for adults) |
| **명암** | cinematic directional lighting, screen-glow key light (monitor backlight as primary emotion light), soft ambient occlusion, restrained bloom |
| **질감** | crisp digital finish, subtle film grain on dark scenes, matte skin, fabric texture on worn uniforms |
| **디테일 수준** | mid-high: 얼굴·손·장비(헤드셋/키보드/모니터)는 고밀도, 원경 군중·배경은 단순화 |
| **참조 무드** | "Korean webtoon, semi-realistic e-sports drama, grounded cinematic lighting, no exaggerated shounen glow" |

- **글로벌 스타일 토큰 (모든 패널 프롬프트 앞머리에 고정 주입 — B-3):**
  `semi-realistic Korean webtoon style, clean inked lineart, soft cel-shading, cinematic screen-glow lighting, muted cool e-sports palette, vertical webtoon panel, high detail on faces and gaming gear`

---

## 2. 색감 / 팔레트

**핵심 원리 — 색온도 서사(world §7-A):** 밑바닥·억압 = **차가운 청록·회철**, 정점·각성 = **뜨거운 앰버·화이트 발광**. 유건의 상승과 잔상 붕괴를 색온도로 번역한다. EP01은 시종 저채도 청록 지배 → 마지막 P57에서 **청록→앰버 반전**이 유일한 온난 폭발.

### 2-A. 메인 팔레트 (HEX)

| 역할 | 색 | HEX | 용도 |
|---|---|---|---|
| 베이스 냉각 | 회철 그레이 | `#3A4048` | 콜드 벤치·유건 유니폼·밑바닥 무드 |
| 억압 청록 | 바랜 틸 | `#2E6B6B` | 콜드 벤치 트림·형광등 잔광·소외 냉기 |
| 예지 시안 | 잔상 시안-틸 | `#27E0D0` | 잔상 홀로그램(유효 상태)·시스템 UI |
| 각성 앰버 | 호박빛 | `#F5A623` | 각성·결의·정점(P57 발화) |
| 위협 레드 | 글리치 핏빛 | `#E23B3B` | desync 붕괴·딜러 포인트광·경고 |
| 기득권 네이비 | 딥 네이비 | `#1B2A4A` | 1군 크라운 룸 유니폼 |
| 기득권 골드 | 골드 | `#C9A24B` | 1군 트림·권력·티어 상위 |
| 잉크 블랙 | 딥 블랙 | `#0B0D10` | 딜러·암전·최대 여백 |
| 페이퍼 화이트 | 오프화이트 | `#F2F4F5` | 말풍선·하이라이트·홀로 상위티어 |

### 2-B. 장면별 무드 팔레트

| 장면 상태 | 팔레트 방향 | 채도/명도 |
|---|---|---|
| 콜드오픈 결승 붕괴 (P01~13) | 흑막 + 팀 스포트라이트(청/적) + 관중 폰라이트 은하, 후반 핏빛 침입 | 고대비, 저명도 |
| 회귀 직후 기숙사 (P16~21) | 차가운 아침 청백광 + 옅은 웜 하이라이트 | 중명도, 저채도 |
| 콜드 벤치 (P26~47) | 회철·청록 지배, 깜빡이는 형광등 청백, 중고 모니터 백라이트 | 저채도, 저~중명도 |
| 사이다 정점 (P39) | 청록 유지 + 순간 화이트 임팩트 플래시 | 국소 고대비 |
| 클리프행어 (P48~55) | 암실 + 태블릿 단일광 + 실루엣 | 최저명도, 고대비 |
| 각성 선언 (P56~57) | 청록 잔상 위 앰버 발화, 색온도 반전 | 뜨거운 국소 채도 폭발 |

---

## 3. 분위기 / 톤

한 문단: *억눌린 냉기의 지하에서 시작하는 서늘한 청춘 서바이벌.* 대사·표정·판단이 긴장을 만들고(정적 화면을 대사로 역전 — trend-brief §차별점2), 감정은 폭발하기보다 **눈빛·손·모니터 불빛으로 새어나온다.** 유건은 무표정 아래 26세의 눈을 감추고, 그 격차가 화면 전체의 서스펜스다.

- **조명 성향:** rim light(모니터 백라이트로 인물 실루엣 분리), low-key(지하·클리프행어), 얼굴 하단 화면광 업라이팅(게이머 특유), 결정컷은 스포트라이트 고립.
- **카메라 성향:** 관찰자적 미디엄·오버숄더 위주, 결정·반전 컷만 익스트림 클로즈업. 손·헤드셋·키보드 인서트를 감정 매개로 반복.
- **금지 톤:** 발광 이펙트 남발, 화사한 파스텔, 만화적 과장 땀방울·핏대(경미한 상징만 허용). 로맨스판타지식 반짝임 금지(누아르·드라마 톤 — trend-brief 회피 레드오션).

---

## 4. 화면비 / 캔버스

세로 스크롤 웹툰 기준. codex-image 렌더는 아래 종횡비 프리셋에서 고른다(패널 폭은 조립 시 동일 폭 정렬 — episode-compositor).

| 프리셋 | 종횡비 | codex 사이즈 가이드 | 용도 |
|---|---|---|---|
| **STD** 표준 | 4:3 (가로 약간 넓음) | 1024×768 | 대화·리액션 기본 |
| **TALL** 세로컷 | 3:4 | 896×1152 | 인물 전신·하강·긴장 |
| **WIDE** 와이드 | 16:9 | 1280×720 | 아레나·연습실 establishing |
| **CINE** 시네마 | 21:9 (레터박스) | 1344×576 | 결승 와이드·정점 임팩트 |
| **FULL** 풀블리드 | 9:16 | 720×1280 | 최대 세로 여백·반전 단독컷(P52·P54·P56·P57) |
| **INSERT** 인서트 | 1:1 | 768×768 | 손·소품·티어 배지·채팅 클로즈업 |

- **여백 = 시간(B/why-first).** 반전·충격·정적 컷(P11·P14·P25·P52·P53·P55)은 FULL/TALL + 넓은 상하 여백으로 스크롤 체류를 늘린다.
- **결정 대사 컷(P54·P56·P57)** = FULL 단독, 말풍선 대형·단독 배치, 주변 요소 최소.

---

## 5. 일관성 토큰 규약 (글로벌)

1. **조립 공식(prompt-smith 필수 준수):** `글로벌 스타일 토큰(§1)` → `씬 LOC 토큰(§6)` → `등장 캐릭터 identity_tag + 불변 토큰(character-sheets.md)` → `패널 고유(구도·표정·행동)` → `말풍선 베이크(§7)` → `부정 프롬프트(§8)`.
2. **불변 vs 가변:** 캐릭터 불변 외형(머리·눈·체형·식별표식)은 character-sheets의 토큰을 **자구 그대로 복붙**. 표정·의상·조명만 패널별 교체.
3. **반 유니폼 색코드 = 계층 SSOT (characters §1):** 아래 표 고정. 승급 전까지 절대 불변.

| 반 | identity | 베이스 | 트림/포인트 | 상태 질감 | 티어 배지 |
|---|---|---|---|---|---|
| 1군 크라운 룸 | CROWNROOM | deep navy `#1B2A4A` | gold piping + white inner | premium glossy, new | 상위 홀로 골드 |
| 2군 메인 스테이지 | (미등장) | charcoal grey | crimson red trim | tidy | — |
| 3군 그라인더 | (미등장) | dark olive | bronze trim | slightly worn | — |
| **4군 콜드 벤치** | **COLDBENCH** | dull iron-grey `#3A4048` | **faded teal `#2E6B6B` trim** | worn, faded, stretched cuffs | **slag dull iron badge** |

- 콜드 벤치 5인 공통 하의: slim charcoal training pants. 공통 상의: stand-collar zip track jacket, academy hex emblem on left chest (아크라이트 로고), callsign on back.
- **유건 낙차 신호:** 콜드 벤치 회철 + 최하위 슬래그 배지(탁한 회철). 진짜 격은 잔상 UI로만 노출.
- **코치/총감독:** 반 컬러 없음 — 한상혁=무채색 색바랜 구형 코치 트랙탑 / 고형준=정장(유니폼 아님, 권력의 외부성).

4. **잔상(Afterimage) 시각 규격 — 유건 전용 (world §1-D·§7-C):** 아래 §7-B 오버레이 규약 참조.
5. **손 떨림 트라우마 컷 규격:** 오른손 클로즈업 + 미세 진동 모션 블러 + 청록 잔상 흐트러짐. **동일 프레이밍**으로 P08(떨림)↔P17(안 떨림·선명)↔P28(재떨림)↔P56(과거/현재 오버랩) 대구. prompt-smith는 이 4컷을 같은 앵글·크롭으로.

---

## 6. 장소 고정 토큰 (LOC_*) — 배경 연속성

> panel-director의 `scene_id`/`location`과 1:1 대응. 같은 씬의 모든 패널에 **동일 LOC 토큰 주입** → 씬 내 배경 급변 방지. 시간대 변주는 토큰 내 명시.

### EP01 장소 목록 표

| scene_id(예상) | LOC_* | 한 줄 배경 | EP01 패널 |
|---|---|---|---|
| S1 | LOC_CROWN_ARENA | 크라운 월드파이널 아레나(붕괴) | P01~13 |
| S2 | LOC_DORM_ROOM | 7년 전 좁은 기숙사 방(거울 포함) | P16~21 |
| S3 | LOC_ACADEMY_EXT | 아카데미 입학 게이트·외경 | P22~24 |
| S4 | LOC_BASEMENT_STAIR | 지하로 내려가는 계단·복도 | P25, P31 |
| S5 | LOC_COLDBENCH | 콜드 벤치 지하 연습실(주무대) | P26~30, P32~47 |
| S6 | LOC_KAISER_ROOM | 윤태오 개인 방(밤) | P48~54 |
| — | LOC_GAME_ARKLIGHT | 인게임 《아크라이트》 화면(오버레이/인서트) | P03~06, P34, P36, P39, P49 |
| (series) | LOC_CROWNROOM_PRACTICE | 1군 크라운 룸 연습실(EP01 미등장, 자산 확보) | — |

### LOC 토큰 정의

**LOC_CROWN_ARENA** — 크라운 월드파이널 무대
- token: `massive e-sports world-final arena, dark void backdrop, twin team spotlights (cyan and crimson), giant LED scoreboard, ocean of audience phone-lights like a galaxy, stage backlight and lens flare, glossy player booths`
- 조명/시간: 무대 역광·저명도 스펙터클. 붕괴 후반(P10~13) 핏빛 침입 + 무음 정적 + 디지털 글리치.
- 비고: 유건은 뒤통수 실루엣 위주(P01·P10·P11), 정면 얼굴 노출 최소.

**LOC_DORM_ROOM** — 회귀 후 기숙사 방
- token: `cramped old Korean dormitory room, single bed, small desk, wall calendar marked entrance day, morning cold blue light through window, worn furniture, small mirror on wall`
- 조명/시간: 이른 아침 차가운 청백광 + 옅은 웜 하이라이트. 거울 컷(P19)은 같은 방 내 소품.

**LOC_ACADEMY_EXT** — 아카데미 외경/게이트
- token: `modern e-sports academy exterior gate, large signage "TERRA e-SPORTS ACADEMY", glass-and-steel facade, crowd of hopeful new students, bright overcast daylight`
- 조명/시간: 낮 균일광. 유건만 무표정 고립 대비.

**LOC_BASEMENT_STAIR** — 지하 계단·복도
- token: `dim underground concrete stairwell and corridor, flickering fluorescent tubes, exposed ceiling pipes, condensation on walls, damp cold air, worn signage`
- 조명/시간: 깜빡이는 형광등 청백, 하강 세로컷. P31 복도 원경에 정장 실루엣(고형준) 배치 가능.

**LOC_COLDBENCH** — 콜드 벤치 지하 연습실 【주무대】
- token: `basement e-sports practice room "THE COLD BENCH", mismatched secondhand PCs, aging monitors with dull backlight, cheap gaming chairs, tangled cables, flickering fluorescent light, exposed pipes, cramped and cold, faded teal accents`
- 조명/시간: 회철·청록 지배, 모니터 백라이트가 인물 얼굴 하단 업라이팅. 낡은 팻말 `THE COLD BENCH`.
- 좌석 배치 연속성: 유건 자리(모니터 2대 셋업) 고정. 스크림 씬(P32~47) 내내 동일 공간.

**LOC_KAISER_ROOM** — 윤태오 개인 방 (밤)
- token: `tidy premium personal gaming room at night, single tablet glow as only light, dark ambient, curved monitor off, minimalist shelves, cold navy-tinted shadows`
- 조명/시간: 밤·암실, 태블릿 단일광. 클리프행어 저명도·실루엣 강조.

**LOC_GAME_ARKLIGHT** — 인게임 화면 (오버레이/인서트)
- token: `stylized 5v5 MOBA-style game screen "ARKLIGHT", top-down tactical minimap with three lanes (RAIL / SPINE / SURGE) and central RUSTFIELD zone, neutral objective TITAN marker, clean cool-blue e-sports HUD, team-voice indicators, cyber-tactical UI`
- **★오더 미니맵 SSOT (script §★):** "서지 셋. 타이탄 버려." 오더 시퀀스 = 3라인 진입 화살표가 **특정 형태·리듬**(서지 셋 → 타이탄 버림). P03=P36=P44=P49 **완전 동일 형태·리듬**으로 재현(반전 공정성). prompt-smith는 이 미니맵 구도를 4컷 동일 앵커로 고정.
- UI 톤: 차갑고 실무적인 e스포츠 대시보드(과한 판타지 발광 자제). HUD 색 = 시안-틸 `#27E0D0` 계열.

**LOC_CROWNROOM_PRACTICE** — 1군 연습실 (EP01 미등장·자산)
- token: `premium 1st-team practice room, deep navy and gold decor, uniform premium lighting, curved monitors with RGB, glass and chrome surfaces, prestige atmosphere`

---

## 7. 말풍선 시각 규약 (in-image 베이크) + 잔상/UI 규격

### 7-A. 말풍선 종류별 스타일 (letterer·prompt-smith 공통)

> 대본 표기 〔대사〕〔생각〕〔외침〕〔시스템〕〔효과음〕에 1:1 대응. **한글 레터링 톤:** 굵은 둥근 고딕(bold rounded Korean gothic), 고대비(검은 글자/흰 풍선), 충분히 큰 크기, 얼굴·핵심 작화 회피. 말풍선당 짧게(어절 최소) — 긴 대사는 분할.

| 종류 | 대본표기 | 시각 스타일 (베이크 토큰) | 색 |
|---|---|---|---|
| 대사 | 〔대사〕 | white rounded speech bubble, thin black outline, pointed tail to speaker, bold Korean gothic black text | 흰 풍선/검은 글자 |
| 생각 | 〔생각〕 | soft cloud/dashed-outline thought bubble, no tail, slightly grey text | 흰-회 풍선/회흑 글자 |
| 외침 | 〔외침〕 | spiky jagged burst bubble, thick heavy bold Korean text, slight size-up | 흰 풍선/검은 굵은 글자 |
| 시스템/UI/채팅/중계 | 〔시스템〕 | rectangular digital HUD box, monospace-flavored Korean gothic, cyan-teal `#27E0D0` glow border, semi-transparent dark fill | 반투명 흑청/시안 글자 |
| 효과음 | 〔효과음〕 | integrated hand-drawn Korean onomatopoeia, no bubble, styled into art | 상황색 |

- **채팅 스택(P42):** 소형 시스템 말풍선 3개 세로 스택, 반투명, 얇은 시안 테두리.
- **중계 자막·해설(P01·P02·P09):** 방송 그래픽 톤 사각 박스 하단/상단.
- **티어 배지 오버레이(P23):** `TIER: SLAG` — 아래 7-C 배지 규격 사용(말풍선 아님, UI 인서트).
- **무대사 컷(P11·P14·P25·P29·P35·P47·P52·P53·P55):** 말풍선 0. prompt-smith 프롬프트에 `no speech bubble, no text` 명시 가능(이 컷 한정).
- **대사 무게중심(P54·P56·P57):** 대형 단독 말풍선, 주변 요소 최소.

### 7-B. 잔상(Afterimage) 예지 오버레이 규격 【유건 전용·world §1-D】

유건 시점 패널에만 겹치는 **반투명 청록(시안-틸) 홀로그램** 오버레이. 독자에게 회귀 지식을 눈으로 보여주는 핵심 모티프.

| 상태 | 시각 (베이크 토큰) | 등장 패널 |
|---|---|---|
| **유효(동기화)** | `semi-transparent cyan-teal holographic afterimage overlay, ghost preview of enemy next move, crisp and stable, perfectly aligned with reality` | P03(선명), P34(예지 노출) |
| **어긋남 시작** | `cyan-teal afterimage glitching, splitting into red double-image, jagged tearing, red static noise` | P05(첫 어긋남) |
| **완전 붕괴** | `afterimage shattering into fragments, red glitch, time-reversal rewind glitch, particles sucked inward` | P13(역재생 붕괴) |
| **미세 흔들림(무언의 시인)** | `cyan-teal afterimage subtly trembling, faint destabilization, no dialogue` | P55 |
| **앰버 발화(각성)** | `cyan-teal afterimage overtaken by amber ignition, color-temperature flip cyan→amber, eyes glowing amber` | P57 |

- 규칙: 잔상은 **유건 시점에서만**. 다른 캐릭터 시점 패널엔 넣지 않는다.
- 손 떨림 컷과 결합 시(P08·P28·P56): 손 클로즈업 + 청록 잔상 흐트러짐.

### 7-C. 게임 UI / 티어 배지 규격 (world §3-C·§7-C)

- **티어 배지:** 금속 질감 배지. 낮음→높음: **Slag(탁한 회철) → Copper → Brass → Chrome → Titanium → Mythril → Plasma → Nova → Singularity(백색+홀로그램)**. 승급 시 crack→re-forge 이펙트. EP01 유건 = `TIER: SLAG` 탁한 회철 배지(INSERT 1:1, P23).
- **MMR/시스템창:** 헌터물 시스템창 문법 + 차갑고 실무적 e스포츠 대시보드 톤. `#27E0D0` 시안 글로우, 반투명 다크 필. 과한 판타지 발광 금지.
- **《아크라이트》 인게임 톤:** LOC_GAME_ARKLIGHT 참조. 저작권 안전 완전 가상 종목 — 실존 게임 UI 모방 금지.

---

## 8. 금지 / 주의 + 부정 프롬프트

### 8-A. 표준 부정 프롬프트 (모든 패널 공통 주입)

```
no watermark, no signature, no English text, no gibberish text, no garbled text,
no misspelled Korean, no random background scene change, no location jump within a scene,
no exaggerated shounen glow, no chibi proportions, no extra fingers, no distorted hands,
no off-model face, no inconsistent hair color, no lowres, no jpeg artifacts
```

> **주의:** in-image 베이크이므로 `no text`(전면 금지)는 **쓰지 않는다** — 말풍선·한글 대사·시스템 UI는 그려야 한다. 위 부정문은 *깨진/영문/오타* 텍스트만 배제한다.
> **예외 — 레퍼런스 시트:** ref-sheet-artist는 `no text, no labels, no speech bubble` 사용(깨끗한 외형 도감).

### 8-B. 금지 사항

1. **화풍 일탈 금지** — §1 semi-realistic 셀셰이딩 이탈(사실주의 사진체·과장 카툰체) 금지.
2. **배경/장소 급변 금지** — 같은 scene_id 안에서 LOC 토큰 외 배경 등장 금지(도로→실내 등). §6 준수.
3. **반 유니폼 색 오염 금지** — 콜드 벤치는 반드시 회철+청록, 1군은 네이비+골드. 혼용 금지.
4. **딜러(THE DEALER) 얼굴 렌더 절대 금지** — EP01 W3 은닉. 실루엣·역광·장갑 낀 손·붉은 포인트광·글리치만. (EP01 실제 등장은 고형준 원경 P31까지, 딜러는 미등장이나 규약 고정.)
5. **잔상 오버레이 오용 금지** — 유건 시점 외 패널에 청록 잔상 넣지 않음.
6. **회귀·정체 직접 노출 금지** — P20 등 절제 컷은 시각적으로도 과잉 설명(플래시백 남발) 금지.
7. **오더 미니맵 형태 변형 금지** — P03=P36=P44=P49 SSOT 동일 형태(반전 공정성).

---

## 9. 하류 팀 핸드오프

- **panel-director:** §6 LOC 목록·scene_id를 샷리스트에 그대로. 무대사 컷 리스트(§7-A)·손 대구 4컷 동일 프레이밍·오더 미니맵 SSOT 반영.
- **prompt-smith:** §5 조립 공식으로 모든 프롬프트 합성. 글로벌 토큰(§1)·LOC(§6)·캐릭터 토큰(character-sheets)·말풍선 베이크(§7)·부정 프롬프트(§8) 주입. 오더 미니맵·손 컷·잔상 상태 앵커 고정.
- **letterer:** §7-A 종류별 말풍선 스타일·한글 톤(굵은 둥근 고딕·고대비·짧게). 대사 무게중심 3컷 대형 단독.
- **ref-sheet-artist:** character-sheets §레퍼런스 사양 + §8-A 예외(텍스트 없음)로 다각도/표정 시트 선(先)렌더.
- **episode-compositor:** §4 동일 폭 정렬·여백=시간 리듬. 반전 컷 상하 여백 확대.
