# ep01_shotlist — EP01 샷리스트 (본편 52 + 엔드카드 2 = **54패널**)

**확정 일자: 2026-07-12** · panel-director
입력: `03_episode/ep01_script_final.md`(**주 입력** · §0-3 보강 3종 · §7 인계 9항) · `03_episode/ep01_beatsheet.md`(T값·scene) · `04_visual/style-bible.md`(**LOC_\* 7종 · 화면비 · 선폭 위계 · SSOT 명세**) · `04_visual/character-sheets.md`(identity_tag) · `02_story/twist-plan.md`(★SSOT 쌍 · P37 물증) · `02_story/tension-curve.md`(긴 여백 2개)
소비자: **prompt-smith**(장소 토큰 주입 + A/B/C 분배) · **letterer**(dialogue_ref) · **episode-compositor**(gap) · panel-validator · quality-reviewer

> ⛔ **이 문서는 대사를 바꾸지 않는다.** 베이크 텍스트 정본은 `ep01_script_final.md` §1~§5다.
> ⛔ **letterer가 동시에 `ep01_lettering.md`를 쓴다 — 이 문서는 그 파일을 침범하지 않는다.**
> 이 문서가 확정하는 것: **scene_id · location · 샷 사이즈 · 카메라 · 구도 · 감정 · T값 · gap · ★SSOT · A/B/C 그룹.**

---

# §0. 장소 목록 (scene_id ↔ location ↔ 배경 한 줄) — **배경 연속성 SSOT**

> ⛔ **같은 scene_id = 같은 장소·시간대·실내외.** 장소가 바뀌는 곳에만 `--- SCENE BREAK ---`.
> LOC_\* 토큰은 **style-bible §6의 문자열을 한 글자도 바꾸지 않고** prompt-smith가 주입한다.

| scene_id | location | 패널 | 배경 한 줄 |
|---|---|---|---|
| **SC01** | **LOC_BOOTH** | P1~P3 | 경기 종료 직후의 방음 부스. 문이 닫혀 함성이 없다. 모니터 발광만 |
| **SC02** | **LOC_BACKSTAGE** | P4·P5 · P8~P10 | 탈락자의 통로. 초록 유도등 · 깜빡이는 형광등 · 접이식 의자 |
| ★ **SC02F** | **LOC_BOOTH** *(경기 잔상 인서트)* | P6·P7 | **SC02 안에 낀 회상 컷 2장.** 배경이 통로에서 부스로 튀므로 **별도 scene_id**로 분리했다 |
| **SC03** | **LOC_PRACTICE** | P11~P14 | 아카데미 연습실. 5연석 팀 열 ↔ 벽쪽 1인석. 주광색 형광등 |
| **SC04** | **LOC_CORRIDOR** | P15~P18 | 밤의 아카데미 복도. 문틈 빛이 바닥에 긴 사각형. **빈 명패** |
| **SC05** | **LOC_PRACTICE** | P19~P27 | 같은 연습실(막2). RAKU의 1인석 · 청록 포스트잇 · 바퀴 자국 |
| **SC06** | **LOC_PCBANG** | P28 | 심야 PC방. RGB 무지개 · 완전한 밤 창 · 오더 노트 |
| **SC07** | **LOC_STAGE** | P29 | 대회장 무대. 과노출 · 닫히는 방음문 |
| **SC08** | **LOC_BOOTH** | P30~P34 | 같은 부스(패배 ②). 안쪽 컷 중심 |
| **SC09** | **LOC_DESK** | P35~P37 · **P39~P47** | 관제/분석 데스크. 소등 · 모니터 벽 6대 · 빈 의자 |
| ★ **SC09B** | **LOC_BOOTH** *(풀블리드 컷백)* | **P38** | **SC09 안에 낀 컷백 1장.** 렌더 공간이 LOC_BOOTH이므로 **별도 scene_id**. ★SSOT |
| **SC10** | **LOC_CORRIDOR** | P48 | SC04와 **같은 문 · 같은 빛**. 이번엔 지나치지 않는다 |
| **SC11** | **LOC_DESK** | P49~P52 | 같은 데스크(착지). 두 사람 + **끝까지 비는 세 번째 의자** |
| **SC-EC** | **비-공간** | P53·P54 | 엔드카드. 이야기 밖. 캐릭터 0 · 배경 0 · `[[TBD]]` |

### ★ scene_id 분리 3건에 대한 판정 (prompt-smith 필독)

**SC02F**(P6·P7) · **SC09B**(P38)는 상류 문서에서 각각 SC02·SC09로 표기됐으나, **배경 장소가 다르다**.
"같은 scene_id = 같은 장소" 규약을 지키려면 **반드시 분리**해야 한다 — 합쳐 두면 prompt-smith가 통로 배경에 부스 대사꼬리를 그리거나, 데스크 배경에 P2 구도를 그리는 사고가 난다.
서사상으로는 여전히 SC02·SC09의 일부다(회상·컷백). **SCENE BREAK로 감싸되, 앞뒤 gap은 장면 전환용으로 늘리지 않는다**(P38 전후만 예외 — §1-2).

---

# §1. 리듬 규약 (episode-compositor 직결)

## 1-1. gap 척도

| 표기 | 의미 | 쓰임 |
|---|---|---|
| `0.6×` | 기본의 0.6배 — **빠른 시간** | 대사 합 · 연쇄 동작 · 흘려야 하는 컷(P26) |
| `0.8×` | 약간 빠름 | 대화 진행 |
| **`1.0×`** | **기본 gap** | 표준 서사 |
| `1.3×` | 숨 한 박자 | 질문이 답 없이 남는 곳 · 정적 |
| `1.5×` | **per-panel 최대치** | **P37↓ · P38↓ 단 두 곳** (컷백 인지용) |
| ▮▮▮ **여백 ①** | **뷰어 화면 높이 × 1.5~2.0** | **P34 ↓ 단 1회** |
| ▮▮ **여백 ②** | **뷰어 화면 높이 × 1.0~1.2** | **P49 ↓ 단 1회** (①보다 **반드시 짧게**) |

⛔ **제3의 화면-높이 여백 금지.** 2개가 죽는다(tension-curve §3).
⛔ **여백은 패널이 아니다** — 검은 이미지·빈 이미지를 렌더하지 마라. 뷰어 배경색 그대로.

## 1-2. ★ P52 ↓ gap = **1.0× 기본** (⛔ 늘리지 마라 — 자주 틀리는 곳)

P52 뒤에 큰 여백을 두면 **이중 분리**가 된다(엔드카드의 시각적 분리가 이미 그 일을 한다).
독자가 *"끝났다"*고 확정하고 **엔드카드를 안 본다** = CTA 실패. (tension-curve §3 여백② 판정)

## 1-3. 화면비 배분 (style-bible §4)

| 코드 | 규격 | 패널 수 | 어디에 |
|:-:|---|:-:|---|
| **A** | 세로 2:3 · **1024×1536** | **34 (63%)** | 인물 컷 · 대사 컷 · 표준 |
| **B** | 가로 3:2 · **1536×1024** | **13 (24%)** | 설정샷 · 공간/좌석 확립 · **모니터 정면**(P22·P37) · 엔드카드 |
| **C** | 정방 1:1 · **1024×1024** | **7 (13%)** | 손·소품 클로즈업 (P7·P14·P19·P28·P30·P34·P43) |

**하드 룰 준수**: **P2 = A · P38 = A**(동일 코드) ✅ / **P37 = B** ✅ / **P22 = B** ✅ / **P50 = A**(3행 조판 말풍선 면적 확보) ✅

## 1-4. 클로즈업 연속 금지 검사

CU/ECU 계열이 **3연속 이상인 구간 0건.** 최장 2연속(P16 MCU → P17 CU / P42 MS → P43 ECU → P44 MS로 즉시 해제).
size 동일값 3연속 이상 **0건** — `insert → medium → large` 변주로 호흡을 만든다.

## 1-5. 무대사 4연속(P33~P36)은 **승인된 예외**

script_final §0-2-⑤b. ⛔ **대사 추가·REGEN 대상 아님.** 네 패널 전부 상류 하드 룰로 무대사가 고정돼 있다.
연출로 방어: **P33(정적) → P34(full-bleed 훅) → 여백① → P35(large 재점화 T7) → P36(물증 직전 미끼)** — 각 패널이 물리 사건을 하나씩 갖는다.

---

# §2. ★SSOT 앵커 4종 (**ACCEPT-FLAG 통과 불가** — 기준 만족까지 재렌더 또는 에스컬레이션)

| 앵커 | 패널 | 검증 축 |
|---|---|---|
| ★★★ **P2 ↔ P38 쌍** | panel_002 · panel_038 | **동일 구도 문자열** · 상이 3축뿐 · **추가 요소 0** · 화면비 동일(A) |
| ★★★ **P37 물증** | panel_037 | 2단 파형 띠 · 스크러버 관통 · **문자·숫자 0** · **B-1 · B-2 이행** |
| ★★★ **P39 반전 자구** | panel_039 | 한글 렌더 정확 · **HOO 무대사**(대사 있으면 자동 FAIL) |
| ★★ **P52 클리프행어** | panel_052 | 무대사 · 빈 의자 · 낡은 헤드셋 · 켜진 화면 3종 잔류 |

## ★ LOCKED_COMPOSITION_P2_P38 (⛔ **두 패널에 이 문자열을 똑같이 넣어라 — 한 글자도 바꾸지 마라**)

```
LOCKED_COMPOSITION_P2_P38:
camera outside the booth glass looking through it at HANJI inside; HANJI's eye level; three-quarter
view turned slightly right of frontal; bust shot (chest up), standard lens, no distortion; HANJI
placed slightly LEFT of center, gaze directed toward frame RIGHT (toward his monitor); identical
scale, shoulder line at the same height; boom mic in front of his beak at the same angle; identical
background: same fingerprint smudge pattern on the glass, same egg-crate acoustic foam panels behind
him, same monitor glow position; HIS BEAK IS OPEN - he is mid-speech
```

**차이는 정확히 3가지뿐 · 추가 요소 0**

| # | **P2** (막1 · 오독) | **P38** (막3 · 재측정) |
|:-:|---|---|
| 1 · 유리 반사광 | 무대 조명이 유리에 번져 **얼굴 절반을 지운다.** ★ **입이 반사광에 잠긴다** | **반사가 걷혔다.** 유리가 맑다. **입이 보인다** |
| 2 · 초점 | **유리 표면**(반사·지문). HANJI는 반쯤 소프트 | **붐마이크와 입.** 유리가 소프트 |
| 3 · 색온도·조도 | 무대 조명의 **차가운 청백** + 과노출 | LOC_DESK **모니터광(teal/navy)** · 저조도 · **채도 유지** |

⛔ **P38에 추가되는 것: 아무것도 없다.** 말풍선 0 · 꼬리 0 · 자막 0 · 화살표 0 · 효과선 0 · 베젤 0 · 스캔라인 0 · 글리치 0.

## ⛔ P34는 P2와 **다른 앵글**이다 (사고 예방 조항)

같은 구도가 **3번** 나오면 재사용 컷의 효과가 희석된다(E4는 **2회 대조**에서만 작동).
**P34 = 부스 안쪽 · 헤드셋을 벗는 손 ECU · 얼굴은 프레임 밖 · 화면비 C.**
★ **P2 구도로 돌아오는 컷은 이 회차에 P38 단 하나뿐이다.**

## §0-3 보강 3종 — 이행 위치 (script_final panel-director 필수 항목)

| # | 패널 | 이행 |
|:-:|:-:|---|
| **B-1** | **panel_037** | HANJI의 **청록 붐마이크(목에 건 헤드셋)를 같은 프레임 근경에.** 화면(파형)과 붐마이크가 **한 컷 안**. ⛔ **화면 안 추가 요소 0 — 순수 구도** |
| **B-2** | **panel_037** | HANJI의 **시선 이동(아래 띠 → 위 띠)을 반드시 그린다.** 대비는 HANJI가 완성한다 |
| **B-3** | **panel_036** | HOO가 고르는 **두 파일 썸네일 = P1·P34 구도의 축소 재현.** 작고 흐리게 · **문자 0** · 하이라이트 0 · 커서/휠 위치로만 지시 |

---

# §3. 표 읽는 법

- `size` = 세로 스크롤 점유(체류 시간): `insert` / `small` / `medium` / `large` / `full-bleed`
- `ratio` = style-bible §4 코드 (A 2:3 / B 3:2 / C 1:1)
- `T` = tension-curve 확정 긴장(1~10)
- `gap` = **패널 아래** 간격 (§1-1 척도)
- `group` = prompt-smith A/B/C 렌더 분배 힌트 (**A 18 · B 18 · C 18 — 균등**)
- `dialogue_ref` = 베이크될 대사. **자구 정본은 script_final** — letterer가 말풍선 위치·조판을 잡는다

---
---

# §4. 막 1 · 실격 (panel_001 ~ panel_018)

### panel_001
- **scene_id: SC01 / location: LOC_BOOTH**
- cast: `HANJI` (+ 팀원 뒤통수 — **얼굴 0 · 실루엣**)
- beat: B01 (경기 종료 · 패배 ①) · **T: 6**
- size: **large** / ratio: **B** (3:2 · 부스 공간 확립 설정샷)
- camera: `eye-level`, `medium-long shot` — 부스 **안쪽**에서
- composition: 좌우로 늘어선 팀원 뒤통수 실루엣 **사이**로 HANJI가 우측 1/3 라인. 닫힌 방음문이 프레임 우측 끝을 막는다(**함성 없음의 시각적 근거**). 모니터 발광이 유일 광원. **패배 표시 화면은 급한 각도로 잘려 판독 불가**
- subject: HANJI — 아직 헤드셋을 **쓴 채**
- emotion: 정지. 소리가 끊긴 얼굴 (⛔ 울먹임 0)
- motion: 시선 좌→우, 프레임 우측 방음문으로 리딩 → 아래 패널로
- dialogue_ref: **무대사**
- fx/note: ⛔ **판독 가능 숫자 0** · ⛔ 효과선 0 · **S(소리 단절) 클리프** · ★ **이 구도가 panel_036의 썸네일 ①로 축소 재현된다**
- gap: **1.3×** / group: **A**

### panel_002
- **scene_id: SC01 / location: LOC_BOOTH** (유리 **바깥** 카메라)
- cast: `HANJI`
- beat: B01 (F1 ①심기) · **T: 4** (재독 ★10)
- size: **large** / ratio: **A** (⛔ **하드 룰 — P38과 동일 코드**)
- camera: **`LOCKED_COMPOSITION_P2_P38` 문자열 그대로** (부스 유리 밖 · 눈높이 · 우측 3/4 · bust · 표준 화각)
- composition: **`LOCKED_COMPOSITION_P2_P38` 문자열 그대로.** 여기에 **P2측 상이 3축만** 얹는다 — ① 무대 조명이 유리에 **반사광으로 번져 얼굴 절반을 지운다. 그의 입이 반사광에 잠긴다** ② 초점 = **유리 표면**(반사·지문), HANJI는 반쯤 소프트 ③ **차가운 청백 + 과노출 하이라이트**
- subject: HANJI — **부리는 벌어져 있다(말하는 중)**
- emotion: 읽히지 않음 (반사광이 표정을 지운다)
- motion: 시선은 프레임 **오른쪽**(모니터 방향)
- dialogue_ref: **말풍선 꼬리 1~2개만 — 내용 판독 0** (몸체가 반사광에 잠긴다) · ⛔ **꼬리 안에 글자를 그리지 마라**
- fx/note: ★★★ **SSOT (P38 쌍) · ACCEPT-FLAG 통과 불가** · ⛔ **추가 요소 0**
- gap: **1.0×** / group: **B**

### panel_003
- **scene_id: SC01 / location: LOC_BOOTH**
- cast: `HANJI`
- beat: B01 (Q1 개설) · **T: 5**
- size: **medium** / ratio: **A**
- camera: `over-the-shoulder` (HANJI 어깨 너머), `medium shot`
- composition: 프레임 하단 1/3 = HANJI의 뒤통수·헤드셋(반쯤 내려간 상태), 상단 2/3 = **꺼진 듯 발광만 남은 모니터.** 화면에는 아무것도 판독되지 않는다. 상단 네거티브 스페이스 = **생각 말풍선 자리**
- subject: HANJI — 헤드셋을 반쯤 내리고 화면을 본다
- emotion: 공백. 대답을 기다리는 얼굴 (⛔ 슬픔 아님)
- motion: 시선 정면 고정 → 답이 오지 않는다
- dialogue_ref: **HANJI 생각 말풍선 1** — **"나는 왜 아직도 여기 있지?"** (15자) · ⛔ **나레이션 박스 아님 — 구름형 생각 풍선**
- fx/note: **Q1 개설 → panel_051에서 닫힌다** (수미상관 회로 개설점)
- gap: **1.3×** (질문이 답 없이 남는다) / group: **C**

--- SCENE BREAK --- *(LOC_BOOTH → LOC_BACKSTAGE)*

### panel_004
- **scene_id: SC02 / location: LOC_BACKSTAGE**
- cast: `HANJI`
- beat: B02 (숨 고르기 ①) · **T: 4**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `long shot` — 인물은 작게
- composition: 세로로 긴 통로가 프레임 위에서 아래로 소실점을 향해 흐른다(**리딩 라인**). HANJI는 중앙보다 아래·작게. **초록 유도등이 유일한 색.** 깜빡이는 형광등 1개. 벽 너머 함성은 **먹먹하게 보이지 않는다**(소리는 구도로만)
- subject: HANJI — **이름표 없는 명찰 목걸이**
- emotion: 소진. 걷는 뒷모습
- motion: 위→아래 소실점 방향, 스크롤 흐름과 일치
- dialogue_ref: **무대사** · ⛔ **SFX 문자 0**
- fx/note: **TM-3(세계가 대신 말린다)** · ⛔ **명찰에 글자 0**
- gap: **1.0×** / group: **A**

### panel_005
- **scene_id: SC02 / location: LOC_BACKSTAGE**
- cast: `HANJI`
- beat: B02 (A1 통념 선언) · **T: 5**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — 정면
- composition: 통로는 **비어 있다**(청자 0 — ⛔ **새 캐릭터 금지**). HANJI 정면, 눈은 아래. 좌우 네거티브 스페이스가 넓다 = 혼잣말의 고립. 말풍선 2개는 좌우로 나눠 배치해 시선이 아래로 흐르게
- subject: HANJI
- emotion: ★ **참는 얼굴 · 진심** — ⛔ **어리석게 그리지 마라. 아름다워야 뒤집힐 때 아프다**
- motion: 시선 하강 → 다음 패널(잔상)로
- dialogue_ref: **HANJI 대사 ①** *"…괜찮아. 다음엔 되겠지."* (14자) / **대사 ②** *"프로만 되면, 다 없던 일이 되는데."* (20자) — **혼잣말**
- fx/note: **A1 심기** · ⛔ 청자 0
- gap: **0.8×** / group: **B**

--- SCENE BREAK --- *(잔상 인서트 진입: LOC_BACKSTAGE → **LOC_BOOTH**)*

> ⚠️ **panel_006~007은 경기 잔상(회상)이다.** 배경이 LOC_BOOTH로 튄다 — **scene_id를 SC02F로 분리**했다.
> ⛔ **여기서 P2의 앵글을 재사용하지 마라** — 같은 구도가 3번 나오면 P38이 죽는다. **다른 카메라로 유리 밖을 잡는다.**

### panel_006
- **scene_id: SC02F / location: LOC_BOOTH** *(경기 잔상)*
- cast: `HANJI` (잔상)
- beat: B02 (F1 ②변주) · **T: 4** (재독 ★9)
- size: **medium** / ratio: **A**
- camera: `high-angle`(살짝 부감), `medium-long shot` — 유리 너머 · 반사광 (⛔ **P2의 눈높이 3/4 bust 아님**)
- composition: 유리 반사광이 화면 대각선으로 번진다. HANJI는 프레임 **하단**에 작게, 등/측면. **말풍선 꼬리가 여러 개** 프레임 **상단**에 걸린다 — 몸체는 전부 반사광에 잠겨 형체만. 꼬리의 개수가 "말이 많다"를 만든다
- subject: HANJI (잔상) — 경기 중
- emotion: 읽히지 않음
- motion: 꼬리들이 위쪽으로 흩어져 시선을 위로 끌었다가, 반사광의 대각선이 아래로 되돌린다
- dialogue_ref: **꼬리 여러 개 — 내용 판독 0** · ⛔ **꼬리 안에 글자 0**
- fx/note: **F1 ②변주** · ★ **안 읽히는 말풍선 = 읽고 싶은 말풍선**(O 미끼)
- gap: **0.6×** / group: **C**

### panel_007
- **scene_id: SC02F / location: LOC_BOOTH** *(경기 잔상)*
- cast: `HANJI` (잔상)
- beat: B02 (F1 ②변주 · 미니맵 예고) · **T: 5** (재독 ★9)
- size: **insert** / ratio: **C** (1:1)
- camera: `extreme-close-up` — 손끝 + 미니맵
- composition: **짧은 물갈퀴 팔**이 화면 좌하에서 뻗어 나와 우상단 **미니맵**을 가리킨다(⛔ **날개 묘사 금지**). 미니맵 = **일반화된 5v5 MOBA · 판독 가능 숫자 0.** 프레임 가장자리에 꼬리 여러 개가 걸린다
- subject: HANJI의 손끝 + 화면 미니맵
- emotion: — (동작만)
- motion: 손끝 → 미니맵으로 시선 유도 (좌하 → 우상)
- dialogue_ref: **꼬리 여러 개 — 내용 판독 0**
- fx/note: ★ **미니맵 = panel_037 핑 마커의 시각적 예고** · ★ **panel_047(화면을 가리키는 짧은 팔)의 대구** · ⛔ 효과선 0
- gap: **1.0×** / group: **A**

--- SCENE BREAK --- *(잔상 이탈: LOC_BOOTH → **LOC_BACKSTAGE** · SC02 복귀)*

### panel_008
- **scene_id: SC02 / location: LOC_BACKSTAGE**
- cast: `HANJI`
- beat: B03 (자기 진단의 개시 · 관문 2) · **T: 6** (재독 ★9)
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — **측면 트래킹**(걷는 그를 옆에서 따라간다)
- composition: 얼굴 **절반은 어둠**(깜빡이는 형광등의 위상). 걷는 방향 = 프레임 좌→우. 진행 방향 앞쪽에 여백을 남겨 말풍선을 앉힌다
- subject: HANJI — 걸으면서, 아무에게도 아닌 것처럼
- emotion: 자책. ⛔ **자랑·해설 0**
- motion: 좌→우 이동, 다음 패널로 계속 걷는다 (180도 규칙 유지)
- dialogue_ref: **HANJI 대사** *"제가… 좀 모자랐던 것 같아요."* (17자)
- fx/note: ★ **관문 2 — 독자가 판단의 지분을 산다.** ⛔ **HANJI가 자기 오더를 자랑하면 회차가 무너진다**
- gap: **0.8×** / group: **B**

### panel_009
- **scene_id: SC02 / location: LOC_BACKSTAGE**
- cast: `HANJI`
- beat: B03 (★★ 자백 = 미스디렉션의 심장) · **T: 4**
- size: **medium** / ratio: **A**
- camera: `low-angle`(무릎 아래), `medium-long shot` — 걷는 발 트래킹
- composition: **얼굴은 프레임 위로 잘린다.** 프레임 = 걷는 발 + 스쳐 지나가는 **빈 접이식 의자**(우측). 말풍선은 프레임 **상단**에서 내려온다(화자의 얼굴 없이) — ★ **얼굴 없이 떨어지는 말이 이 문장을 '사실'로 만든다**
- subject: HANJI의 발 · 지나쳐 가는 접이식 의자
- emotion: — (⛔ **힘주지 마라. 흘려라**)
- motion: 좌→우 계속. **의자를 지나친다. 앉지 않는다**
- dialogue_ref: **HANJI 대사 ①** *"…말만 많았고."* (8자) / **대사 ②** *"그, 캐리를 했어야 하는데…"* (15자)
- fx/note: ★★ **F1 ②′ 자백** · ★ **panel_049(앉는다)의 대구** · ⛔ **자랑·해설 0** · ★ **낮은 T가 이 문장을 사실로 만든다**
- gap: **1.3×** / group: **C**

### panel_010
- **scene_id: SC02 / location: LOC_BACKSTAGE**
- cast: `HANJI`
- beat: B03 (통로 끝) · **T: 5**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `long shot` — 등 뒤에서
- composition: **실루엣.** 프레임 상단 = 문을 미는 HANJI의 검은 실루엣, 그 너머 초록 유도등의 빛. 등 뒤(프레임 아래쪽)로 함성이 완전히 끊긴다 — **소리의 부재를 어둠의 깊이로 그린다**
- subject: HANJI (실루엣)
- emotion: — (실루엣, 표정 0)
- motion: 앞(위)으로 나간다 → 다음 씬으로 리딩
- dialogue_ref: **무대사**
- fx/note: **V(시선 유도)** · ⛔ **속도선 0**
- gap: **1.0×** / group: **A**

--- SCENE BREAK --- *(LOC_BACKSTAGE → LOC_PRACTICE)*

### panel_011
- **scene_id: SC03 / location: LOC_PRACTICE**
- cast: `HANJI`
- beat: B04 (공간 전환 · **독자가 처음 '아카데미'를 인지한다**) · **T: 4**
- size: **large** / ratio: **B** (3:2 · 공간 확립)
- camera: `pov`(문 안쪽 시점), `long shot`
- composition: **조도 급상승** — 주광색 형광등, 그림자가 옅다. **5연석 팀 열(정면)** 과 **벽쪽 1인석**이 한 프레임에. 기계식 키보드·모니터암·케이블 타이 다발·손자국 팜레스트가 **고밀도로** 묘사된다(배경 리얼리즘의 첫 시위 — 선폭은 캐릭터보다 가늘게). HANJI는 프레임 하단 근경에 실루엣으로 작게
- subject: 연습실 전경
- emotion: — (공간이 주인공)
- motion: 문 → 방 안쪽으로 원근이 끌어당긴다
- dialogue_ref: **무대사** (키보드 소리의 층 = **구도로만**) · ⛔ **SFX 문자 0**
- fx/note: ★ **이 인지가 panel_016 배신의 조건이다** · ⛔ **간판·로고·현수막 0**
- gap: **1.0×** / group: **B**

### panel_012
- **scene_id: SC03 / location: LOC_PRACTICE**
- cast: `HANJI` · `RAKU`(등) · (밖) 수강생 A·B — **얼굴 0**
- beat: B04 (F4 ①심기 · R5 시각화) · **T: 5**
- size: **medium** / ratio: **B** (좌석 배치 확립)
- camera: `eye-level`, `long shot` — 와이드
- composition: **원근 대비** — 프레임 좌측에 **5연석 팀 열**(사람 많음·밝음), 우측 벽쪽에 **1인석**(RAKU의 **등** 하나). 두 좌석군이 한 프레임에 들어와 **거리**가 읽힌다. RAKU 모니터 **테두리를 따라 청록 포스트잇 여러 장** — ⛔ **초점 밖 · 클로즈업 0 · 프레임을 무의미하게 통과**
- subject: 두 좌석군의 대비 · RAKU의 등
- emotion: — (⛔ **강조 금지**)
- motion: 시선 좌(팀 열) → 우(1인석)
- dialogue_ref: **(밖) 수강생 A** *"아 그거 아니라니까."* (11자) / **(밖) 수강생 B** *"야, 이거 봐봐."* (9자) — **프레임 가장자리에서 잘린 말풍선 · 꼬리는 프레임 밖으로 · 얼굴 0** · ⛔ **의미 있는 정보 0**
- fx/note: **F4 ①심기**(청록 포스트잇) · **R5 시각화** · ⛔ **새 캐릭터 0**
- gap: **0.8×** / group: **C**

### panel_013
- **scene_id: SC03 / location: LOC_PRACTICE**
- cast: `HANJI` · `RAKU`(등)
- beat: B04 (F4 ①심기 · 통과) · **T: 4** (재독 ★10)
- size: **small** / ratio: **A**
- camera: `eye-level`, `medium shot` — **트래킹**(카메라가 그 자리를 지나쳐 계속 간다)
- composition: **청록 포스트잇이 프레임 가장자리로 밀려 나가 끝에서 잘린다.** 초점은 통로 안쪽(포스트잇이 아니라). **정지 0 · 초점 0**
- subject: 스쳐 지나가는 포스트잇 (⛔ **주체가 아니다**)
- emotion: —
- motion: 카메라 좌→우 이동 (관성 유지 = 독자가 "봤지만 안 봤다")
- dialogue_ref: **무대사**
- fx/note: ⚠️ ⛔ **T를 올리지 마라 — 강조하면 소반전(TW-2)이 샌다** · ⛔ 효과선·초점·정지 0
- gap: **0.6×** / group: **A**

### panel_014
- **scene_id: SC03 / location: LOC_PRACTICE**
- cast: `HANJI`
- beat: B04 (F3 물리적 씨앗) · **T: 5** (재독 ★9)
- size: **insert** / ratio: **C** (1:1)
- camera: `high-angle`, `extreme-close-up` — 발 + 바닥
- composition: 고무 매트 위 **의자 바퀴 자국** — ★ **셀 수 없는 누적 흔적**(⛔ **세지 마라. 세는 순간 숫자가 된다**). **방향은 아직 읽히지 않는다**(카메라가 자국의 방향축과 어긋난 각도로 잡는다 — panel_043에서야 방향이 드러난다). HANJI의 주황 물갈퀴 발이 그 위를 **밟고 지나간다**
- subject: 바퀴 자국 + 밟고 지나가는 발
- emotion: —
- motion: 발이 위→아래로 통과
- dialogue_ref: **무대사**
- fx/note: **F3 물리적 씨앗** · ⛔ **강조·초점·효과선 0** · ★ **panel_043에서 방향이 물증이 된다**
- gap: **1.0×** / group: **B**

--- SCENE BREAK --- *(LOC_PRACTICE → LOC_CORRIDOR)*

### panel_015
- **scene_id: SC04 / location: LOC_CORRIDOR**
- cast: `HANJI` · **`HOO`(첫 등장)**
- beat: B05 (G 정보 격차 · F2 심기) · **T: 5**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot`
- composition: HANJI가 근경(프레임 하단 2/3)에서 복도로 나온다. **그의 등 뒤 배경에 HOO가 이미 서 있다** — 후경, 살짝 소프트하지만 **검은 원형 안경 반사 · 네이비 헤드셋 · 낡은 이어패드(닳아 벗겨짐)·눌린 헤드밴드**가 **판독 가능할 만큼**. **HANJI는 모른다**(시선 반대 방향)
- subject: HANJI(앞·모름) ↔ HOO(뒤·이미 거기 있음)
- emotion: HANJI = 소진 / HOO = **잔잔한 응시**(읽고 있는 얼굴)
- motion: 독자의 시선이 HANJI를 지나 뒤의 HOO에 **걸린다** = 격차 발생
- dialogue_ref: **무대사**
- fx/note: **G(정보 격차) — 독자만 안다** · **F2 심기**(낡은 헤드셋 — **소품 디테일 · 클로즈업 아님 · 노출 예산 ≤1컷**) · ⛔ **테이프 패치 금지**(RAKU의 표식) · ⛔ **1패널만** — 늘리면 개그
- gap: **0.8×** / group: **C**

### panel_016
- **scene_id: SC04 / location: LOC_CORRIDOR**
- cast: `HANJI` · `HOO`
- beat: B05 (★★ HOO 첫 발화 = 말리는 질문 · **막1 정점 · T1**) · **T: 7**
- size: **large** / ratio: **A**
- camera: `eye-level`, `medium-close` — HOO
- composition: HOO가 프레임 우측 2/3를 차지한다. **온도 0의 얼굴** — 위로도 비난도 아닌, **재고 있는** 얼굴. 안경 렌즈에 복도 빛이 얇게. HANJI는 프레임 좌측 가장자리에서 **반쯤 돌아본다**(뒤통수 3/4). 좌측 여백 = 말풍선 자리
- subject: HOO
- emotion: ★ **읽고 있는 얼굴**(판단 보류). ⛔ **응원·미소 0 — HOO가 응원하면 이 웹툰은 그 순간 강의다**
- motion: HOO의 시선이 HANJI를 향해 좌로 — 그 선이 말풍선을 끌고 온다
- dialogue_ref: **HOO 대사(의문)** *"그거, 몇 번째야?"* (10자) · ⛔⛔ **평서문이면 자동 FAIL**
- fx/note: ★★ **T1 톤의 배신** · **Q2 개설** · ★ **panel_005의 *"다음엔"*을 정확히 친다**
- gap: **1.0×** / group: **A**

### panel_017
- **scene_id: SC04 / location: LOC_CORRIDOR**
- cast: `HANJI` · `HOO`(프레임 밖)
- beat: B05 (R 리액션 지연 · **학부모 앵커**) · **T: 6**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `close-up` — HANJI
- composition: HANJI CU. **입이 열렸다 닫힌다**(P8~P9에서 연습한 말을 삼킨다). HOO는 **프레임 밖** — 말풍선만 프레임 우측에서 들어온다(꼬리가 프레임 밖을 향한다). ★ 프레임 **좌하 구석**에 **열린 문 너머 어두운 방과 의자들**이 들어온다(**W-2 프레임 진입** — ⛔ 초점 0 · 언급 0)
- subject: HANJI (삼키는 얼굴)
- emotion: **참는 얼굴** — ⛔ 슬픈 얼굴 아님
- motion: 입 열림 → 닫힘. 시선이 아래로
- dialogue_ref: **HOO 대사(의문)** *"도피 아니고?"* (7자) / **HANJI — 무대사**(입이 열렸다 닫힌다)
- fx/note: **Q3 개설** · **W-2 프레임 진입 시작** · ⛔ **부모를 화면에 등장시키지 마라** · ⛔ **겨냥할 질문은 "성공하나요?"가 아니라 "이게 도피인가?"**
- gap: **1.0×** / group: **B**

### panel_018
- **scene_id: SC04 / location: LOC_CORRIDOR**
- cast: `HANJI` · `HOO`
- beat: B05 (★ 3단 상승 **1단: 지나친다** · W-2 개설) · **T: 6**
- size: **medium** / ratio: **A**
- camera: `high-angle`, `long shot` — 복도
- composition: **리딩 라인 = 문틈의 빛이 바닥에 그리는 긴 사각형**(프레임을 대각으로 가로지른다). HOO는 답을 듣지 않고 어두운 방으로 들어간다 — 문틈 사이로 **의자 3개**가 보인다(⛔ **언급 0 · 클로즈업 0**). ★ **HANJI는 그 빛을 밟지 않고 지나간다** — 발이 빛의 사각형 **바깥**으로 비켜 간다(⛔ 이 회피를 강조하지 마라. 그냥 비켜 갈 뿐)
- subject: 바닥의 빛 사각형 · 그것을 비켜 가는 HANJI · 닫히는 문
- emotion: — (행동만)
- motion: 시선: 빛의 사각형 → 문 안 의자 3개 → 지나가는 발
- dialogue_ref: **무대사**
- fx/note: ★ **panel_048의 대구 — 같은 문 · 같은 빛 · 다른 행동** · **W-2 개설** · ⛔ **벽의 명패는 비어 있다**(글자 0) · **질문 2개(Q2·Q3)가 답 없이 남는다**
- gap: **1.3×** (막1 종료) / group: **C**

---
---

# §5. 막 2 · 입을 닫다 (panel_019 ~ panel_034)

--- SCENE BREAK --- *(LOC_CORRIDOR → LOC_PRACTICE · 막2)*

### panel_019
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `HANJI` · `RAKU`
- beat: B06 (F3 물리적 형태 ①) · **T: 5**
- size: **insert** / ratio: **C** (1:1)
- camera: `low-angle`, `extreme-close-up` — 의자 바퀴 + 바닥
- composition: 굴러오는 게이밍 체어 **바퀴**가 프레임을 채운다. 바퀴가 지나온 자리에 **바퀴 자국이 겹쳐 쌓인다**(panel_014의 그 자국). 프레임 상단 가장자리에 RAKU의 **손을 터는 동작**이 살짝 걸린다(강박적 반복 — 손이 곧 정체성)
- subject: 의자 바퀴 · 바닥 자국
- emotion: — (톤이 밝아진다: 조도 상승)
- motion: 바퀴가 좌→우로 굴러온다 = **RAKU의 1인석 → HANJI의 5연석 방향** (⛔ 이 방향을 강조하지 마라. panel_043에서 회수한다)
- dialogue_ref: **무대사** (⛔ SFX 문자 0)
- fx/note: **F3 물리적 형태 ①** · **W-5 심기 개시** · ★ **일방통행의 첫 획** — ⛔ **강조 0**
- gap: **0.6×** / group: **A**

### panel_020
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `RAKU` · `HANJI`
- beat: B06 (F3 ① · **M3 오독 심기**) · **T: 4** (재독 ★10)
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — 평범한 투샷
- composition: **아주 평범한 선후배 투샷.** RAKU가 좌, HANJI가 우. 둘 다 화면을 본다. ⛔ **강조 0 · 여백 0 · 클로즈업 0 · 효과선 0** — 이 컷은 **눈에 띄면 안 된다**
- subject: RAKU(묻는다) · HANJI(듣는다)
- emotion: 무심하게. **훈훈하게** (독자가 *"둘이 친하구나"*로 읽어야 한다)
- motion: RAKU의 시선 → 화면
- dialogue_ref: **RAKU 대사** *"이거 어떻게 봐?"* (9자)
- fx/note: **F3 ①** · **M3 오독 심기(우정)** · ⚠️ **막2 최저 T — 강조하면 소반전이 샌다**
- gap: **0.8×** / group: **B**

### panel_021
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `RAKU` · `HANJI`
- beat: B06 (A1 증폭 · F4 ②변주) · **T: 6**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium-close` — RAKU 정면
- composition: RAKU 정면 MCU. **턱을 든 자신감**(표정 디폴트). 그의 뒤 모니터 **테두리를 따라 청록 포스트잇**이 늘어서 있다 — ⛔ **여전히 초점 밖.** 그의 **백지 사원증**이 목에 걸려 있다(⛔ **글자·로고 0**)
- subject: RAKU
- emotion: ★ **진심. 아름답게.** ⛔ **냉소·희화화 0 — 어리석게 그리면 낙차가 죽는다**
- motion: 시선 정면 → 살짝 위 (자신의 미래를 보는 각도)
- dialogue_ref: **RAKU 대사 ①** *"난 프로 될 거야."* (10자) / **대사 ②** *"이거 하나 하려고 여태 안 잤어."* (18자)
- fx/note: **A1 증폭 · W-5 심기** · **F4 ②변주**(포스트잇 · 초점 밖)
- gap: **0.8×** / group: **C**

### panel_022
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: — (모니터)
- beat: B07 (**TM-1 점화**) · **T: 5**
- size: **medium** / ratio: **B** (⛔ **하드 룰 — 한글 판독 가능해야 하는 유일한 화면**)
- camera: `eye-level`, `medium shot` — **모니터 정면 flat-on**(왜곡 0)
- composition: 참가 자격 안내 화면이 프레임을 채운다. 화면 중앙에 **굵은 한글 카드**: **"만 17세 이상"**. ★ **이 회차 유일한 판독 가능 숫자.** 그 외 화면의 모든 문자·숫자·UI는 **블러 / 급한 각도 / 과노출로 판독 불가**. 화면 테두리에 청록 포스트잇이 초점 밖으로 걸린다
- subject: 모니터 화면
- emotion: — (⛔ 인물 0)
- motion: 정면 고정 — 독자가 **읽는다**
- dialogue_ref: **화면 텍스트** — **"만 17세 이상"** (8자) · **말풍선 0** (말풍선이 아니라 모니터 UI 카드 안의 굵은 고딕 한글)
- fx/note: ★ **panel-validator: 이 패널만 숫자 허용** · ⛔ **다른 숫자·영문 0**
- gap: **0.6×** / group: **A**

### panel_023
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `RAKU` · `HOO` · `HANJI`
- beat: B07 (★★ **TM-1 = 만료 시계** · G 정보 격차) · **T: 7**
- size: **large** / ratio: **B** (원근 대비 투샷)
- camera: `eye-level`, `medium shot` — 한 프레임 2인
- composition: ★ **원근 대비.** 프레임 좌측 근경 = **RAKU(밝음 · 형광등 아래 · 기쁨)**. 프레임 우측 후경 = **HOO(어둠 · 복도 그늘 · 무표정)**. 둘 사이에 초점 심도가 갈라진다. **HOO의 시선은 RAKU가 아니라 화면에 있다.** HANJI는 프레임 가장자리
- subject: RAKU(기쁨) ↔ HOO(무표정)
- emotion: RAKU = **기쁨·단정**(시작선을 통과했다) / HOO = **무표정 · 아무 말도 하지 않는다**
- motion: RAKU의 시선 → 화면 / HOO의 시선 → **같은 화면**. 두 시선이 같은 곳에서 만나는데 **읽는 것이 다르다**
- dialogue_ref: **RAKU 대사(기쁨·단정)** *"…나 이제 되네."* (9자) / **HOO — 무대사**
- fx/note: ★★ **만료 시계 — 독자와 HOO에게만 들린다** · ⛔ **RAKU가 자기 시간을 걱정하는 대사 0 — 아이러니는 무료다** · ⛔ **HOO는 만 17세를 말하지 않는다** · **Q4 개설**
- gap: **1.0×** / group: **B**

### panel_024
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `RAKU` · `HOO`
- beat: B08 (★★ **S7 적의 논거 선점**) · **T: 7**
- size: **medium** / ratio: **A**
- camera: `low-angle` — RAKU가 HOO를 **올려다본다** (⛔ **앵글만 도전적. 얼굴은 악의 0**)
- composition: 앙각. 프레임 하단에서 RAKU가 올려다보고, 상단에 HOO가 **움직이지 않고** 서 있다. HOO의 안경에 형광등이 반사돼 눈이 반쯤 가린다(판단 유보의 시각화). 말풍선 2개는 상승 대각선으로 배치 — 도전이 위로 올라간다
- subject: RAKU (도전) · HOO (부동)
- emotion: RAKU = 자신만만 + 불신 / HOO = 무반응
- motion: 시선 아래→위 (도전) → 다음 패널에서 되돌아온다
- dialogue_ref: **RAKU 대사 ①** *"근데 이런 학원, 돈만 버리는 거 아니야?"* (23자) / **대사 ②** *"여기 다녀서 프로 된 사람 있어?"* (18자) — **반말 확정**
- fx/note: ★★ **이 대사가 웹툰 안에 없으면, 그 대사는 댓글창에 달린다** · **Q5 개설** · ⛔ **"근데"를 지우지 마라**
- gap: **0.8×** / group: **C**

### panel_025
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `HOO` · `RAKU`
- beat: B08 (되묻기 · **V3 하드 룰**) · **T: 6**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `close-up` — HOO
- composition: HOO CU. **판단을 보류한 눈.** ⛔ **아카데미를 변호하는 몸짓 0**(팔짱·손짓·미소 전부 0 — 그는 **움직이지 않는다**). 배경은 얕은 심도로 날린다. 짧은 정적 = 여백이 아니라 **표정의 정지**로 만든다
- subject: HOO
- emotion: 온도 0. **되돌린다**
- motion: 시선이 RAKU를 정면으로 받는다 (앞 패널의 앙각을 **평행으로 되돌린다** — 도전이 무력화된다)
- dialogue_ref: **HOO 대사(의문 · 되묻기)** *"그럼 넌 왜 왔는데?"* (11자)
- fx/note: ★★ ⛔ **삭제 = V3 자동 FAIL**(2/6 = 33.3%) · ⛔ **아카데미 변호 0 · 실적 0 · 약속 0** · **Q5는 열린 채 panel_050까지 간다**
- gap: **1.3×** (짧은 정적) / group: **A**

### panel_026
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `RAKU` · `HANJI`
- beat: B09 (★★★ **중간점 TW-3 · F3 ②** — 회차의 인과가 여기서 꺾인다) · **T: 5** (재독 ★10)
- size: **medium** / ratio: **B** (와이드 — RAKU의 등이 무게중심)
- camera: `eye-level`, `medium shot` — **RAKU를 따라간다**
- composition: ★★★ **화면의 무게중심 = HANJI의 얼굴이 아니라 RAKU의 등.** RAKU는 **이미 몸을 돌리고 있다**(의자를 밀며 자기 1인석으로). 근경 대형 = RAKU의 등·줄무늬 꼬리. 후경 소형 = HANJI(작게, 초점 얕게). ⛔ **HANJI 클로즈업 금지 · 리액션 컷 0 · 효과선 0 · 여백 0**
- subject: RAKU의 **등**
- emotion: RAKU = 무심 / HANJI = (후경이라 표정이 거의 안 읽힌다 — **그게 설계다**)
- motion: RAKU가 프레임 우측으로 빠져 나간다. 세 번째 말풍선은 **그 등 뒤에 흘려진다**
- dialogue_ref: ⚠️ **한 패널 3말풍선 — 상류 하드 룰(twist-plan §3-2)이 "단정은 F3②와 같은 컷"을 요구한다. 쪼개면 단정이 독립 사건이 되어 반전이 샌다. ⛔ 분할 금지**
  - **RAKU ①** *"이거 어떻게 봐?"* (9자) — 프레임 좌·보통 크기
  - **HANJI ②** *"아, 그건 시야부터 봐야 돼."* (16자) — 중앙·보통 크기 (무심코 새어 나오는 **오더 목소리**)
  - **RAKU ③** *"형은 말이 너무 많아. 그냥 캐리하면 돼."* (23자) — ★ **패널 가장자리 · 작게** (RAKU는 이미 등을 보이고 있다)
- fx/note: ★★★ **강도 3/10 — 흘려라** · ⛔ **강조하면 반전이 미리 새고, 지우면 panel_039의 인과가 안 잡힌다** · ★ *"시야"* = **panel_047의 대구** · ★ **재독 시 가장 잔인한 문장**
- gap: **0.6×** (흘려 보낸다) / group: **B**

### panel_027
- **scene_id: SC05 / location: LOC_PRACTICE**
- cast: `HANJI`
- beat: B09 (R 리액션 지연) · **T: 6** (재독 ★9)
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot`
- composition: HANJI가 그냥 서 있다. **RAKU는 이미 프레임 밖.** 그가 있던 자리에 **빈 공간**만 남는다(네거티브 스페이스). ★ **표정 변화 최소 — 눈만 한 번 내려간다. 그 외 0**
- subject: HANJI
- emotion: ★ **참는 얼굴** — ⛔ **슬픈 얼굴 금지 · 눈물 0 · 그림자 강조 0** · ⚠️ **표면 T가 7 이상으로 느껴지면 반전이 샌다**
- motion: 눈만 아래로 한 번
- dialogue_ref: **무대사**
- fx/note: **강도 2/10** · ⛔ 효과선·집중선 0
- gap: **1.3×** / group: **C**

--- SCENE BREAK --- *(LOC_PRACTICE → LOC_PCBANG · 시간 경과: 밤)*

### panel_028
- **scene_id: SC06 / location: LOC_PCBANG**
- cast: `HANJI`
- beat: B09 (★★ **회차 최저점 = 최대 연료 · F1′ ①심기**) · **T: 4** (재독 ★10)
- size: **large** / ratio: **C** (1:1 · 손 클로즈업)
- camera: `high-angle`, `extreme-close-up` — 손 + 오더 노트
- composition: 프레임을 채우는 **오더 노트를 덮는 손**(짧은 물갈퀴). 노트 표지의 **손때**가 고밀도로 묘사된다. 노트에서 **청록 포스트잇 한 장이 삐져나와 있다**(★ **F4 ②′ 씨앗 — 색의 연결고리**). 배경 = RGB 무지개 발광이 흐릿하게, **창밖은 완전한 밤**(⛔ **도시 불빛 0**). 컵라면·물자국
- subject: 덮는 손 · 오더 노트 · 삐져나온 청록 포스트잇
- emotion: — (⛔ **결심 대사 0 · 결심 표정 0**. 그냥 **덮는다**)
- motion: 손이 위→아래로 덮는다 (스크롤 방향과 일치 = 닫힘의 감각)
- dialogue_ref: **무대사**
- fx/note: ★★ **강도 7/10** · ⛔ **노트 안의 글씨를 보여주지 마라 — 그건 panel_037의 몫이다** · ⛔ **효과선·점층 0** · **FLAG: panel_043과 손 클로즈업 대구**(같은 색 포스트잇, 다른 책상)
- gap: **1.3×** / group: **A**

--- SCENE BREAK --- *(LOC_PCBANG → LOC_STAGE)*

### panel_029
- **scene_id: SC07 / location: LOC_STAGE**
- cast: `HANJI` · (밖) 캐스터 — **얼굴 0**
- beat: B10 (**TM-2 점화** · S 소리 단절) · **T: 6**
- size: **medium** / ratio: **B** (닫히는 문의 가로 슬릿)
- camera: `eye-level`, `medium shot` — 닫히는 방음문의 **슬릿**
- composition: 프레임을 가로로 가르는 **좁아지는 빛의 슬릿**(닫히는 부스 문). 슬릿 **바깥** = 과노출된 무대·조명 리그·관중은 **검은 실루엣과 흩어진 폰 불빛뿐**(⛔ **얼굴 0**). 슬릿 **안쪽** = 모니터 빛만. ★ **캐스터의 외침 말풍선이 문(프레임)에 물리적으로 잘린다** — 말풍선 몸체의 절반이 닫히는 문에 먹힌다
- subject: 닫히는 문 · 잘리는 말풍선
- emotion: — (⛔ **왜 마지막인지 설명하지 마라**)
- motion: 문이 좌우에서 중앙으로 닫힌다 → 빛이 사라진다 → 다음 패널은 완전히 부스 안
- dialogue_ref: **(밖) 캐스터 — 외침 말풍선(뾰족 폭발형) · 문에 잘린다** — *"…자, 이제 정말 마지막—"* (14자) · ★ ***"마지막"*이라는 단어가 물리적으로 잘려야 한다**
- fx/note: **TM-2 점화** · **R4 집행** · ⛔ **나레이션 0** · ⛔ **스코어보드 숫자 판독 불가**
- gap: **0.8×** / group: **B**

--- SCENE BREAK --- *(LOC_STAGE → LOC_BOOTH)*

### panel_030
- **scene_id: SC08 / location: LOC_BOOTH**
- cast: `HANJI`
- beat: B10 (★★ **T3의 실제 트리거 · 빈 띠의 원인**) · **T: 5** (재독 ★10)
- size: **medium** / ratio: **C** (1:1 · 손 클로즈업)
- camera: `eye-level`, `extreme-close-up` — 손 + 붐마이크
- composition: 프레임 중앙에 **시안-청록 헤드셋의 붐마이크**, 그것을 **밀어 올리는 손**(짧은 물갈퀴). 물리적 행동 **1개.** 배경은 모니터 발광에 날아간다. ⛔ **효과선·점층·집중선 0 — 그냥 한 동작**
- subject: 밀어 올려지는 붐마이크
- emotion: — (독자는 **'집중'**으로 읽는다. **재독하면 자살 행위다**)
- motion: 마이크가 아래→위로 올라간다 (⛔ 이 상승을 강조하지 마라)
- dialogue_ref: **무대사**
- fx/note: ★★ **이 컷이 기억에 남아야 panel_037의 아래 띠가 *"그가 뺀 것"*으로 읽힌다** · ⛔ **효과선 0**
- gap: **1.0×** / group: **C**

### panel_031
- **scene_id: SC08 / location: LOC_BOOTH**
- cast: `HANJI` · (밖) 팀원 A·B — **얼굴 0**
- beat: B10 (★★ **F1′ ②변주 = 레터링 반전**) · **T: 6** (재독 9)
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — **부스 안쪽**(⛔ 유리 밖 아님)
- composition: 부스 **안**. HANJI 측면/뒤통수. 화면 가장자리에 미니맵. ★★★ **여기가 이 회차 레터링의 심장이다**: **부스 안쪽 컷이므로 대사가 읽혀야 한다 — 그런데 HANJI의 말풍선이 없다.** 팀원 말풍선 2개만 프레임 가장자리에서 잘린 채 떠 있다. **그 공백이 물증이다**
- subject: HANJI(말풍선 없음) · 팀원 말풍선 2개
- emotion: — (집중한 옆얼굴로 보인다)
- motion: 팀원 말풍선이 프레임 밖에서 들어오고, HANJI 쪽에서는 **아무것도 나가지 않는다**
- dialogue_ref: **(밖) 팀원 A** *"왼쪽 비었어."* (7자) / **(밖) 팀원 B** *"야, 들어가?"* (7자) / **HANJI — 말풍선 0**
- fx/note: ★★ ⛔ **그 공백을 효과음·강조·여백으로 가리키지 마라. 그냥 비어 있어야 한다** · ⚠️ **독자는 이 차이를 의식하지 못해야 한다** · ⛔ **HANJI 말풍선을 하나라도 넣으면 반전의 절반이 죽는다. 팀원 말풍선을 지워도 죽는다** · ★ *"비었어"* ↔ panel_037 *"비었지?"* — **자구 변경 금지**
- gap: **0.8×** / group: **A**

### panel_032
- **scene_id: SC08 / location: LOC_BOOTH**
- cast: `HANJI` · (밖) 팀원 — **얼굴 0**
- beat: B11 (★ **막2 1차 정점 · 최강 마이크로 클리프**) · **T: 8**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium-close` — 손 우선
- composition: **HANJI의 손만 빨라진다**(근경·초점). **얼굴은 화면 발광에 지워진다**(과노출 · 표정 판독 0). 팀원 말풍선 1개가 프레임 상단에서 들어오고 — **아래로 나가는 말풍선은 없다**
- subject: 빨라지는 손 · 지워진 얼굴
- emotion: 판독 불가 (⛔ **표정을 보여주지 마라 — 답이 없다는 사실만 남아야 한다**)
- motion: 질문이 위에서 들어오고 → **답이 아래로 나가지 않는다** = 스크롤이 빈 채로 다음으로 간다
- dialogue_ref: **(밖) 팀원** *"…형? 콜 안 해?"* (10자) / **HANJI — 무대사** (**답이 오지 않는다**)
- fx/note: ★ **유일한 대사가 질문이고 답이 오지 않는다 = 최강 마이크로 클리프** · ⛔ 효과선 0
- gap: **1.0×** / group: **B**

### panel_033
- **scene_id: SC08 / location: LOC_BOOTH**
- cast: `HANJI`
- beat: B11 (숨 고르기 ④ · 정점 직전 이완) · **T: 6**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — 정적 컷
- composition: 부스 안. HANJI 혼자. **손만 빨라진다.** ★ **팀 보이스도 조용하다 — 이제 팀원 말풍선조차 없다.** 프레임 어디에도 말풍선이 없다(⛔ **그 부재를 강조하지 마라**). **아무도 그를 부르지 않는다**
- subject: HANJI (혼자)
- emotion: — (⛔ **각성 금지 — 짧게 되는 듯하다가 꺾인다**)
- motion: 정지에 가까운 컷. 손만 미세하게
- dialogue_ref: **무대사**
- fx/note: ⛔ **효과선·집중선·각성 연출 0** · ★ 8→6→8 톱니가 panel_034를 밀어 올린다
- gap: **1.0×** / group: **C**

### panel_034
- **scene_id: SC08 / location: LOC_BOOTH**
- cast: `HANJI`
- beat: B11 (★★★ **돌아갈 수 없는 문 T3 · 훅 최대치**) · **T: 8** (재독 ★10)
- size: **full-bleed** / ratio: **C** (1:1)
- camera: ⛔⛔ **P2와 다른 앵글** — `high-angle`, `extreme-close-up` · **부스 안쪽**
- composition: ★ **부스 안쪽 · 헤드셋을 벗는 손 클로즈업 · 얼굴은 프레임 밖.** 시안-청록 헤드셋이 머리에서 들려 나오는 순간, 짧은 물갈퀴 손이 헤드밴드를 잡고 있다. 뒤로 에그크레이트 방음폼이 얕은 심도로. **더 빨리, 더 크게 졌다** — 패배 표시는 여전히 **각도로 잘려 판독 불가**
- subject: 헤드셋을 벗는 손
- emotion: — (**얼굴이 없다 = 감정을 주지 않는다**)
- motion: 헤드셋이 위로 들려 나온다 → 그리고 **아무것도 없는 여백**으로 스크롤이 떨어진다
- dialogue_ref: **무대사**
- fx/note: ★★★ ⛔ **P2 구도 재사용 금지 — 같은 구도로 돌아오는 컷은 이 회차에 panel_038 단 하나뿐** · ⛔ **효과선·점층 0** · **M2 = A3 확정** · ★ **이 구도가 panel_036의 썸네일 ②로 축소 재현된다**
- gap: ▮▮▮ **긴 여백 ① = 뷰어 화면 높이 × 1.5~2.0** (패널폭 800px 기준 ≈ 1200~1600px) · ⛔ **검은 화면·나레이션·효과선 금지. 뷰어 배경색 그대로**
- group: **A**

---
---

# §6. 막 3 · 재측정 (panel_035 ~ panel_046) ★★★ 이 회차의 심장

--- SCENE BREAK --- *(▮▮▮ 긴 여백 ① · LOC_BOOTH → LOC_DESK)*

> ⛔ **직군명(전력분석관·옵저버·리그 PD)은 panel_039 이전에 화면·대사·배경 UI 어디에도 0.**
> ⛔ **조도만 낮추고 채도는 살린다** — `low illumination, high saturation`. 작화를 어둡게 만들지 마라.

### panel_035
- **scene_id: SC09 / location: LOC_DESK**
- cast: `HANJI` (· `HOO` 등)
- beat: B12 (★ 3단 상승 **2단: 들어간다** · R6 회수) · **T: 7** ⚠️ **여백 ① 직후 재점화 컷 — T 7 미만이면 여백이 이탈 구간이 된다**
- size: **large** / ratio: **A**
- camera: `pov`(문턱 시점), `long shot` — **프레임 인 프레임**(문틀)
- composition: 문틀이 프레임을 감싼다. 방은 **소등 — 모니터 벽 6대만 발광**(유일 광원). 근경 좌측에 **조명 스위치로 뻗었다가 내리는 손**(★ **R6 회수 — 어둠은 화면을 더 잘 보이게 한다**). 후경에 HOO의 등, 그 앞의 발광하는 모니터 벽. ★ 프레임 **우하 구석에 빈 의자**(⛔ **초점 0 · 언급 0 · 클로즈업 0**)
- subject: 문턱의 HANJI · 발광하는 모니터 벽 · 빈 의자
- emotion: — (⛔ 결심 0)
- motion: 손이 스위치로 올라갔다가 **내려온다** → 시선이 모니터 벽으로 끌려간다(**V 미끼: 뭐가 떠 있길래?**)
- dialogue_ref: **무대사**
- fx/note: **W-2 재노출**(⛔ 언급 0) · ⛔ **작화를 어둡게 만들지 마라 — 조도만 낮추고 채도 유지** · ⛔ **상담실 아님. 그가 이미 일하고 있던 방이다**
- gap: **1.0×** / group: **B**

### panel_036
- **scene_id: SC09 / location: LOC_DESK**
- cast: `HOO` · `HANJI`
- beat: B12 (W-3 심기 · ★★ **B-3 필수**) · **T: 9**
- size: **medium** / ratio: **B** (화면 + 손 · 파일 대열이 가로로)
- camera: `over-the-shoulder` (HANJI 시점), `medium shot` — HOO의 **손 + 화면**
- composition: HANJI의 어깨 너머로 HOO의 손과 리플레이 폴더 화면. **파일 썸네일이 가로 대열로 늘어서 있다** — ⛔ **파일명 판독 불가**(각도·흐림·문자 0)
  - ★★ **§0-3 B-3 필수**: HOO가 고르는 **두 파일의 썸네일 = panel_001(패배①) 구도와 panel_034(패배②) 구도의 축소 재현.** ⚠️ **작고 흐리게 · 문자 0 · 선택 하이라이트 0** — 지시는 **커서/휠 위치로만**
  - **W-3**: 같은 대열에 **오래된 VOD 썸네일**이 있다. **휠이 그 위에서 한 박자 멈췄다가 지나간다. 열지 않는다.** ⛔ **초점 0 — 묻혀야 한다**
- subject: HOO의 손 · 파일 썸네일 대열
- emotion: — (HOO의 얼굴은 프레임에 없다)
- motion: 휠이 위→아래로 스크롤 → 한 박자 정지 → 지나감 → **두 파일을 고른다**
- dialogue_ref: **무대사** · ⛔ **화면 문자 0**
- fx/note: ★★ **B-3 이행 패널** — *"저 두 개 = 방금 내가 본 그 두 경기"*가 **문자 0으로 지정된다**(설명이 아니라 **지시**) · **W-3 심기 · ⛔ 회수 금지(EP02 시드)**
- gap: **0.8×** / group: **C**

### panel_037
- **scene_id: SC09 / location: LOC_DESK**
- cast: `HOO` · `HANJI`
- beat: B13 (★★★ **물증 · TW-1 트리거 · T선 1차 정점**) · **T: 10**
- size: **full-bleed** / ratio: **B** (⛔ **하드 룰 — 두 띠의 길이 차가 읽히려면 가로가 길어야 한다**)
- camera: `eye-level`, 화면 **정면** + **근경에 HANJI의 붐마이크** (⛔ **한 컷 안에 둘 다**)
- composition: ★★★ **SSOT — 아래 3개가 한 프레임에 동시에 들어와야 한다**
  1. **화면(파형 2단 띠)** — 프레임의 대부분:
     - **위 띠(패배①)**: 청록 `#2FB3A8` · **빽빽한 세로 획이 줄 전체를 채운다** · **화면 오른쪽 끝까지 간다** · 아래로 **작은 삼각형 핑 마커가 계속** 찍힌다
     - **아래 띠(패배②)**: **거의 평평한 직선** + 짧은 돌기 2~3개뿐 · **절반 남짓에서 끊긴다** · 핑 마커 **거의 없음** · 빈 부분은 **어두운 네이비 홈(groove)만**
     - **두 띠는 같은 시작점(왼쪽)으로 정렬** — 좌측 정렬이라야 **길이 차**가 한눈에 읽힌다
     - ★ **스크러버(재생 헤드)가 두 띠를 동시에 관통한다**(링크된 타임라인 · **필수**). HOO의 한 손이 그것을 **뒤로 끈다**
  2. **HOO의 손끝이 아래 띠(빈 띠)를 톡 친다** (그가 묻는 곳 = **덜 중요해 보이는 쪽**)
  3. ★★★ **§0-3 B-1 필수 — HANJI의 청록 붐마이크가 같은 프레임 근경에.** 그는 panel_034에서 벗은 헤드셋을 **목에 건 채**다. 근경(프레임 우측 하단 또는 좌측 하단)에 그 **시안-청록 붐마이크**가 화면과 **한 컷 안에** 들어온다. → 독자의 눈이 **두 개의 청록**을 잇는다: *"저 파형 = 이 마이크에서 나온 것."* ⛔ **화면 안에 추가되는 요소 0 — 순수 구도다**
- subject: 2단 파형 띠 · HOO의 두 손(손끝 + 스크러버) · **HANJI의 청록 붐마이크(근경)**
- emotion: HOO = 온도 0 · **HANJI = ★★★ B-2 필수 — 시선 이동(아래 띠 → 위 띠)을 반드시 그린다.** 눈동자/고개의 방향이 **아래에서 위로** 움직인 것이 읽혀야 한다. **대비는 HANJI가 완성한다**
- motion: HOO의 손끝(아래 띠) → **HANJI의 시선이 아래 띠에서 위 띠로 올라간다** → 독자의 눈이 그 시선을 따라가며 **스스로 대조를 수행한다**
- dialogue_ref: **HOO 대사(의문)** *"여긴 왜 비었지?"* (9자) · 꼬리는 **아래 띠를 친 손끝 쪽**으로 / **HANJI — 무대사**
- fx/note: ★★★ **SSOT · ACCEPT-FLAG 통과 불가** · ⛔⛔ **화면 안 문자·숫자·시간눈금·타임스탬프·카운터·역할 라벨·파일명·화살표·하이라이트 박스·강조 원·비교 자막 전부 0.** 눈금이 필요하면 **숫자 라벨 없는 짧은 틱 마크**만 · ⛔ **청록 오염 금지**(HOO·RAKU 소품에 청록 0) · ★ **이 화면은 문자 0으로 성립하도록 설계됐다 — 반전의 성패를 한글 조판에 걸지 않는다**
- gap: **1.5×** (컷백 인지용 · **화면 단위 여백 아님**) / group: **A**

--- SCENE BREAK --- *(컷백 인서트: LOC_DESK → **LOC_BOOTH** · 풀블리드)*

### panel_038
- **scene_id: SC09B / location: LOC_BOOTH** *(풀블리드 컷백)*
- cast: `HANJI`
- beat: B13 (★★★ **재사용 컷 = 침묵 컷 · E4 위로 스크롤**) · **T: 9**
- size: **full-bleed** / ratio: **A** (⛔ **하드 룰 — panel_002와 동일 코드. 화면비가 다르면 재사용 컷이 성립하지 않는다**)
- camera: **`LOCKED_COMPOSITION_P2_P38` 문자열 그대로** (panel_002와 **동일 문자열**)
- composition: **`LOCKED_COMPOSITION_P2_P38` 문자열 그대로.** 여기에 **P38측 상이 3축만** 얹는다 — ① **유리 반사가 걷혔다. 유리가 맑다. 얼굴 전체가, 특히 입이 보인다** ② 초점 = **붐마이크와 입**, 유리가 소프트 ③ **LOC_DESK의 모니터광 톤(teal/navy) · 저조도 · 채도 유지**
- subject: HANJI — **부리는 벌어져 있다(말하는 중)** ← **이 쌍의 핵심**
- emotion: (P2와 **같은 얼굴**. 달라진 것은 **보이느냐**뿐)
- motion: 없음. **정지.** 독자가 **위로 스크롤한다**(이 회차에서 유일하게 허용된 스크롤 정지)
- dialogue_ref: **말풍선 0 · 꼬리 0** ★ **소음(꼬리)이 사라지고 입이 남는다 — 소음이 발화가 된다**
- fx/note: ★★★ **SSOT · ACCEPT-FLAG 통과 불가** · ⛔⛔ **P38에 추가되는 것은 아무것도 없다**: 말풍선 0 · 꼬리 0 · 자막 0 · 화살표 0 · 하이라이트 0 · 강조선 0 · 효과선 0 · **모니터 베젤 0**(베젤이 있으면 "모니터 안 영상"이 되어 재사용 컷이 죽는다) · 스캔라인 0 · 글리치 0 · ★ ***아무것도 추가되지 않았다. 원래 거기 있었다. 가리고 있던 것이 치워졌을 뿐이다***
- gap: **1.5×** (컷백 인지용) / group: **B**

--- SCENE BREAK --- *(컷백 이탈: LOC_BOOTH → **LOC_DESK** · SC09 복귀)*

### panel_039
- **scene_id: SC09 / location: LOC_DESK**
- cast: `HANJI` · `HOO`
- beat: B13 (★★★ **통념 교체 · T선 최고점 = 회차 정점**) · **T: 10**
- size: **large** / ratio: **A**
- camera: `eye-level`, `close-up` — HANJI 정면
- composition: HANJI 정면 CU. **화면 발광이 얼굴을 아래에서 위로 비춘다**(teal/navy). 프레임 우측 가장자리에 **HOO의 옆얼굴**이 얕은 초점으로 걸린다 — **표정이 읽힐 만큼만**(⛔ HOO에게 프레임을 내주지 마라. 주인공은 HANJI다). 말풍선 2개는 좌측 세로로 쌓아 시선을 아래로 흐르게
- subject: HANJI (자기 입으로 명제를 말한다)
- emotion: HANJI = **뜨겁다. 수용의 소리.** ⛔ **말끝을 흐리지 않는다** / HOO = ★ **읽던 얼굴이 아주 잠깐 멈춘다. 웃지 않는다**
- motion: HANJI의 시선이 화면(우측)에서 정면으로 돌아온다 = 발견이 **그의 것**이 된다
- dialogue_ref: **HANJI 대사 ①** *"…저, 없었던 게 아니었네요."* (16자) / **대사 ②** *"저 여기, 계속 있었어요."* (14자) / **HOO — 무대사**
- fx/note: ★★★ **SSOT(반전 자구 한글 렌더)** · ⛔⛔ **P39에서 HOO가 대사하면 자동 FAIL** · ★ **panel_003 ↔ panel_039 수미상관 회로 점화** · **Q6 닫힘 → 같은 패널에서 Q9(층2) 개설** · ⛔ **직군명 0**(여기서부터 대사 안에서만 허용)
- gap: **1.3×** / group: **C**

### panel_040
- **scene_id: SC09 / location: LOC_DESK**
- cast: `RAKU` · `HANJI` · `HOO`
- beat: B14 (Q7 개설 · 새 위협 도입) · **T: 7**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — 문가의 RAKU
- composition: **프레임 인 프레임** — 문틀 안에 RAKU가 서 있다(역광 실루엣 + 빨간 헤드셋·초록 눈만 색으로 살아난다). 그의 시선이 화면의 두 띠를 **훑고 그냥 지나간다**. HANJI·HOO는 근경에 등/측면으로
- subject: RAKU (본다. 그러나 읽지 않는다)
- emotion: 나른·무표정 (⛔ **감탄사 0 · 놀람 0**)
- motion: 시선이 화면을 **가로질러 흘러간다** — 멈추지 않는다
- dialogue_ref: **무대사**
- fx/note: **Q7 개설** · ★ **정점 직후 하강 = 정상. 새 위협 도입으로 붕괴 방지**
- gap: **0.8×** / group: **A**

### panel_041
- **scene_id: SC09 / location: LOC_DESK**
- cast: `RAKU` · `HANJI` · `HOO`
- beat: B14 (★★ **S4 정면 반박 — 텐션 붕괴 방지의 유일한 장치**) · **T: 8**
- size: **large** / ratio: **A**
- camera: `eye-level`, `medium-close` — RAKU 정면
- composition: **중앙 배치.** RAKU 정면 MCU — **단정문의 얼굴**(눈썹 내리고 굳은 눈). HANJI는 프레임 가장자리에 소프트하게 밀려난다. 모니터광이 RAKU를 아래에서 비춘다
- subject: RAKU
- emotion: ★ **짧고, 아프고, 틀리지 않았다.** ⛔ **악의 아님 · 비웃음 0**
- motion: 정면 고정 — 반박이 독자 정면으로 온다
- dialogue_ref: **RAKU 대사** *"그건 진 사람의 변명이잖아."* (15자)
- fx/note: ★★ ⛔ **필수 배치. 그를 설득하지 마라 — 만장일치 = 자동 FAIL** · **Q7 닫힘 → 같은 패널에서 Q8 개설**
- gap: **1.0×** / group: **B**

### panel_042
- **scene_id: SC09 / location: LOC_DESK**
- cast: `RAKU`
- beat: B15 (F4 ③회수 시작) · **T: 7**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — **카메라가 손을 따라간다**
- composition: RAKU가 반박을 강화하려고 **손등으로 자기 데스크를 툭 친다.** 프레임의 리딩 라인이 그의 팔 → 손등 → **데스크 표면**으로 내려간다. ★ **그가 가리킨 바로 그 자리**에 청록 포스트잇이 (아직 초점 밖으로) 놓여 있다
- subject: RAKU · 그의 손등 · 데스크
- emotion: 자신만만 (⛔ 본인은 모른다)
- motion: **팔 → 손등 → 데스크 → (다음 패널로) 포스트잇** = 시선이 아래로 이어진다
- dialogue_ref: **RAKU 대사** *"난 내 손으로 여기까지 왔어."* (16자)
- fx/note: ★ **그가 가리킨 바로 그 자리에 증거가 있다. 본인은 모른다**
- gap: **0.6×** (panel_043으로 즉시 붙는다 — 리딩 라인이 끊기면 안 된다) / group: **C**

### panel_043
- **scene_id: SC09 / location: LOC_DESK**
- cast: — (손 · 소품)
- beat: B15 (★★ **소반전 TW-2 · T선 2차 정점**) · **T: 9**
- size: **large** / ratio: **C** (1:1 · 소품 클로즈업)
- camera: `extreme-close-up` → **팬 다운** → `high-angle` 바닥
- composition: **한 컷 안 2단 수직 흐름**
  - **상단**: RAKU의 손 옆 — **청록 포스트잇 클로즈업**(감도·시야·상대 성향 메모). ⛔ **글씨를 판독 가능하게 그리지 마라** — 작은 흘림·각도·판독 불가에 가깝게(**깨진 글자 아티팩트 리스크 0**). ★ **색이 서명이다**(`#2FB3A8`)
  - **하단**(팬 다운 끝): **바닥의 바퀴 자국**이 프레임에 들어온다 — ★ **셀 수 없는 누적 흔적**(⛔ **세지 마라**). ★★ **방향이 물증이다**: 자국은 **RAKU의 벽쪽 1인석 → HANJI의 5연석 방향으로만** 나 있고, **반대 방향 자국은 없다**
- subject: 청록 포스트잇 · 일방통행 바퀴 자국
- emotion: — (무대사. 물증만)
- motion: 위→아래 팬(스크롤과 일치) — 포스트잇에서 바닥으로
- dialogue_ref: **무대사**
- fx/note: ★★ **F4 회수 + F3 회수(일방통행)** · ★ ***일방통행이 물증이다. 그가 늘 왔다. 형은 한 번도 안 갔다*** · **FLAG: panel_028과 손 클로즈업 대구**(같은 색 포스트잇, 다른 책상) · ⛔ **청록 오염 금지 — 이 포스트잇이 청록인 이유는 그것이 RAKU의 것이 아니라 HANJI가 써준 것이기 때문이다**
- gap: **1.0×** / group: **A**

### panel_044
- **scene_id: SC09 / location: LOC_DESK**
- cast: `RAKU` · `HANJI`
- beat: B15 (★★ **R1의 마지막 칼**) · **T: 8**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — 투샷
- composition: **RAKU(움직임 · 무심) ↔ HANJI(정지)** 대비. RAKU는 시선을 포스트잇으로 따라갔다가 **아무렇지도 않게** 다시 화면으로 돌아간다. HANJI는 **움직이지 않는다.** 두 사람 사이에 물리적 정적이 벌어진다
- subject: RAKU(폭로) · HANJI(무대사)
- emotion: RAKU = ★ **아무렇지도 않게** — **사실을 인정하면서 의미를 부정한다**(⛔ 충격 0 · 수긍 0) / HANJI = ★★ **놀람이 아니라 못 알아보는 얼굴. 자기 글씨를 남의 것처럼 본다**
- motion: RAKU의 시선 = 포스트잇 → 화면(빠르게 지나간다) / HANJI의 시선 = 포스트잇에 **붙박인다**
- dialogue_ref: **RAKU 대사 ①** *"…이거? 형이 써준 거."* (13자) / **대사 ②** *"그거랑 이거랑 무슨 상관인데."* (16자) / **HANJI — 무대사**
- fx/note: ★★ ⛔ **감동 컷 0 · 눈물 0 · *"내가 이걸…"* 류 자각 대사 0. 독자가 채운다** · ★ **RAKU 수긍 0**
- gap: **1.3×** / group: **B**

### panel_045
- **scene_id: SC09 / location: LOC_DESK**
- cast: `HOO` · `HANJI`
- beat: B16 (**S5 대가 명시** · HOO의 **세 번째 찬물**) · **T: 6**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium-close` — HOO
- composition: HOO MCU. 모니터광이 안경 렌즈에 얇게. ⛔ **약속의 냄새 0**(⛔ 미소 0 · 손짓 0 · 몸을 기울이지 않는다). HANJI는 프레임 하단 가장자리 — **입이 열리지 않는다.** HANJI 쪽 여백을 비워 **답이 없다는 것**을 공간으로 그린다
- subject: HOO (묻는다) · HANJI (답하지 못한다)
- emotion: HOO = 온도 0 / HANJI = **답하지 못한다. 그리고 그게 정직하다**
- motion: HOO의 질문이 HANJI 쪽으로 → **돌아오는 것이 없다**
- dialogue_ref: **HOO 대사(의문)** *"그 자리, 몇 개나 있을 것 같아?"* (19자) / **HANJI — 무대사 / 짧은 침묵**
- fx/note: ★ **HOO의 세 번째 찬물**(panel_016 · panel_037 · panel_045 — 수미상관 삼각) · ⛔ **대안을 위로로 팔지 마라 — 여기서 T를 유지하면 광고 문구가 된다** · **W-4 개설 · ⛔ 끝까지 답하지 않는다** · ✅ *"몇 개나"* = **화면에 뜨지 않는 의문사**(수치 노출 0)
- gap: **1.3×** (짧은 침묵) / group: **C**

### panel_046
- **scene_id: SC09 / location: LOC_DESK**
- cast: `RAKU` · `HANJI`
- beat: B16 (★★★ **막3 종결 스파이크 · F3 ③ 회수**) · **T: 8** · **E: 9**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot` — **일상적인 컷**
- composition: ⛔ **아무것도 특별하지 않게 그린다.** RAKU는 **이미 화면 쪽으로 몸을 돌렸다**(반박한 얼굴 그대로, 손은 벌써 마우스에). 평범한 투샷. ⛔ **효과선 0 · 클로즈업 0 · 여백 0 · 강조 0** — ★ **본인은 모른다. HANJI도 모른다. 독자만 안다**
- subject: RAKU (반박한 바로 그 입으로, 습관처럼 또 묻는다)
- emotion: 무심 (⛔ **부드러워지지 마라 — 수긍 0**)
- motion: 그의 몸은 화면으로, 그의 입은 HANJI에게 — **입장(반박)과 습관(진실)이 같은 컷에서 충돌한다**
- dialogue_ref: **RAKU 대사** *"…야. 근데 이거 어떻게 봐?"* (15자)
- fx/note: ★★★ **F3 ③ 회수** · **W-5 = 반박한 채 닫힌다(EP02 엔진)** · ★ **RAKU가 부정한 명제를, RAKU의 몸이 증명한다** · ★ **E선이 T선을 추월하기 시작하는 지점**
- gap: **1.0×** / group: **A**

---
---

# §7. 막 4 · 앉는다 (panel_047 ~ panel_052) · CTA 착지

> ⛔ **교훈 요약 0 · 명제 재언급 0 · 격언 0 · 결심 대사 0 · 독자 호명 0.**
> ⛔ **T선을 마지막에 올리지 마라** — 상승은 panel_049 단 1회(+2)만.

### panel_047
- **scene_id: SC09 / location: LOC_DESK**
- cast: `HANJI` · `RAKU`
- beat: B17 (**L1 — 명제를 대사가 아니라 행동으로 증명한다**) · **T: 6** · **E: 8**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `medium shot`
- composition: ★ **화면을 가리키는 HANJI의 짧은 팔**(⛔ **날개 금지 — 짧은 물갈퀴**) — **panel_007의 대구**(그때는 잔상 속 미니맵, 지금은 눈앞의 화면). RAKU의 **등**이 프레임 우측을 나간다 — **답만 챙겨서**. 그의 얼굴은 이미 프레임에 없다
- subject: 가리키는 HANJI의 팔 · 나가는 RAKU의 등
- emotion: HANJI = **아무렇지도 않게**(습관처럼) — ⛔ **뿌듯함 0 · 자각 0** / RAKU = (등만 — 고맙다는 말도, 수긍도 없다)
- motion: HANJI의 팔이 좌→우 화면을 가리킨다 / RAKU가 우측으로 나간다
- dialogue_ref: **HANJI 대사** *"여기서 빠져. 시야 없어."* (14자) — ★ **오더 목소리 · 짧다 · 정확하다 · 명령형** / **RAKU — 무대사**(답만 챙겨서 나간다)
- fx/note: ★ ⛔⛔ **panel-validator·quality-reviewer: 이 명령형을 V4 위반으로 REGEN하지 마라** — V4는 **HOO 전용 규칙**이고, HANJI의 오더 목소리는 **정의상 명령형**이다(§0-1-⑤) · ★ *"시야"* = **panel_026의 대구** — ***그가 껐던 그 능력을, 지금 습관처럼 쓴다*** · ⛔ **RAKU를 수긍시키지 마라**(W-5 유지)
- gap: **1.3×** / group: **B**

--- SCENE BREAK --- *(LOC_DESK → LOC_CORRIDOR)*

### panel_048
- **scene_id: SC10 / location: LOC_CORRIDOR**
- cast: `HANJI`
- beat: B17 (**L3 문 열기** · panel_018의 대구) · **T: 5** · **E: 8**
- size: **medium** / ratio: **A**
- camera: `eye-level`, `long shot` — **panel_018과 같은 복도, 같은 빛**(⛔ 앵글은 눈높이로 낮춘다 — P18의 부감과 다르게)
- composition: **문틈으로 새어 나온 빛이 바닥에 긴 사각형을 그린다**(panel_018과 **동일 소품·동일 빛**). ★ **이번엔 지나치지 않는다 — HANJI가 그 빛 앞에 선다.** 발끝이 빛의 경계에 닿아 있다. ⛔ **벽의 명패는 비어 있다**(기관명·로고·수치 0 · **글자 0**)
- subject: 바닥의 빛 사각형 · 그 앞에 선 HANJI
- emotion: — (⛔ **결심 표정 0.** 그냥 선다)
- motion: 걷던 관성이 **멈춘다** — 세로 스크롤에서 정지가 읽힌다
- dialogue_ref: **무대사**
- fx/note: ★ **panel_018의 대구 — 같은 문 · 같은 빛 · 다른 행동** · ⛔ **명패에 아무것도 쓰지 마라**(`[[TBD: 아카데미 정보]]` 구간)
- gap: **1.0×** / group: **C**

--- SCENE BREAK --- *(LOC_CORRIDOR → LOC_DESK)*

### panel_049
- **scene_id: SC11 / location: LOC_DESK**
- cast: `HANJI` · `HOO`
- beat: B18 (★★★ **L2 작은 행동 · 3단 상승 3단: 앉는다**) · **T: 7** (착지 구간 **유일한 반등 +2**) · **E: 9**
- size: **large** / ratio: **B** (뒤에서 본 두 사람 + 빈 의자 — 가로)
- camera: `eye-level`, `medium-long shot` — **뒤에서**
- composition: 뒤에서 본 두 사람. **HOO 자리 · 그 옆 두 번째 의자에 HANJI가 스스로 앉아 있다.** 그의 화면에 **자기 패배 VOD**가 다시 켜져 있다(⛔ **화면 내용은 판독 불가 — 파형/미니맵 실루엣만**). ★ 프레임 **우측 구석에 세 번째 의자가 비어 있다**(⛔ **초점 0 · 클로즈업 0 · 언급 0**). HOO의 **낡은 헤드셋**이 데스크에 놓여 있다(F2 — 배경 소품으로만)
- subject: 앉은 두 사람 · 켜진 화면 · 빈 세 번째 의자
- emotion: — (⛔ **결심 대사 0 · 결심 표정 0 — 행동 컷이 증거다**)
- motion: 없음. **앉아 있다.** 그리고 스크롤이 **여백으로 떨어진다**
- dialogue_ref: **무대사**
- fx/note: ★★★ **panel_009(앉지 않는다)의 대구** · **R2 — 되감기는 위로를 주지 않는다. 이 세계에서 가장 어려운 행동이다** · **Q3(도피인가) 행동으로 닫힘 — ⛔ 대사로 닫지 마라** · **W-2 재노출**(언급 0)
- gap: ▮▮ **긴 여백 ② = 뷰어 화면 높이 × 1.0~1.2** (≈800~1000px) · ⚠️ **①보다 반드시 짧게** · ⚠️ **여백 뒤 panel_050이 즉시 대사**
- group: **A**

### panel_050
- **scene_id: SC11 / location: LOC_DESK**
- cast: `HOO` · `HANJI`
- beat: B19 (**L4 초대 대사 · 여백 뒤에 오는 첫 말**) · **T: 6** · **C: 8**
- size: **large** / ratio: **A** (⛔ **31자 3행 조판이 들어갈 저밀도 컷 — 말풍선 면적을 아끼지 마라**)
- camera: `eye-level`, `medium shot` — HOO **측면**
- composition: ★ **저밀도 컷 — 지면을 말풍선에 내준다.** HOO는 프레임 **하단 1/3**에 측면으로. 화면 발광이 그의 옆얼굴을 아래에서 비춘다. **상단 2/3 = 네거티브 스페이스 = 말풍선 2개의 자리.** ⛔ **약속의 냄새 0**(그는 HANJI를 보지도 않는다 — 시선은 자기 화면에)
- subject: HOO (측면) · 화면 발광
- emotion: 온도 0. ⛔ **미소 0 · 격려 0**
- motion: 말풍선 ① → ② 세로로 쌓여 시선이 아래로
- dialogue_ref:
  - **HOO 대사 ①(평서)** *"프로가 될지는 나도 몰라."* (14자) — ⛔⛔ **생략·축약 절대 금지. ①이 없으면 ②가 약속이 된다**
  - **HOO 대사 ②(평서)** *"근데 네가 뭘 할 수 있는지는, 여기서 알아볼 수 있어."* (**31자** — 회차 최장) — ⚠️ **3행 조판 필수**: `근데 네가 뭘 / 할 수 있는지는, / 여기서 알아볼 수 있어.` · **말풍선을 크게** · **panel-validator C3 중점 검사 대상**
- fx/note: ★ **Q5(이 학원은 진짜인가) = "약속하지 않음"으로 닫힌다 — 이것이 이 회차가 파는 유일한 것** · ⛔ **독자 호명 0 · 직군 목록 0** · ★ **C선 급등 — *"뭘 할 수 있는지"*의 내용을 주지 않기 때문**
- gap: **1.0×** / group: **B**

### panel_051
- **scene_id: SC11 / location: LOC_DESK**
- cast: `HANJI` · `HOO`
- beat: B19 (**L5 수미상관 · 회차의 마지막 대사 · E선 최고점**) · **T: 5** · **E: 10**
- size: **large** / ratio: **A**
- camera: `eye-level`, `close-up` — HANJI 얼굴
- composition: HANJI CU. 모니터광이 아래에서 얼굴을 비춘다(teal/navy · **조도만 낮고 채도는 살아 있다**). HOO는 프레임 밖 또는 가장자리 소프트. ⛔ **눈물 0 · 미소 0**
- subject: HANJI
- emotion: ★ **차갑다.** **말끝을 흐리지 않는다.** 명제의 확정(⛔ **격언체 0 · 감동 0**)
- motion: 시선 정면 고정 → 아래 패널로 조용히 내려간다
- dialogue_ref: **HANJI 대사 ①** *"…저, 엉뚱한 걸 재고 있었어요."* (18자) / **대사 ②** *"그것뿐이에요."* (7자)
- fx/note: ★★★ **Q1 닫힘**(panel_003 ↔ panel_039 ↔ panel_051 수미상관 회로 폐쇄) · ⛔ **답하는 것은 명제(통념 교체)이지 진로 선택이 아니다** — *"전력분석관이 될게요"* 류 = **기획 붕괴** · ⛔ ***"이제 알 것 같아요"*** 류 **메타 설명 0**
- gap: **1.3×** / group: **C**

### panel_052
- **scene_id: SC11 / location: LOC_DESK**
- cast: `HANJI` · `HOO`
- beat: B20 (★★★ **C선 최고점 = 클리프행어 등가물**) · **T: 4** · **E: 9** · **C: 10**
- size: **full-bleed** / ratio: **B** (넓게, 뒤에서)
- camera: `high-angle`(살짝 부감), `long shot` — **뒤에서, 넓게**
- composition: 어두운 데스크. **켜진 화면**(모니터 벽이 유일 광원 · **조도 낮고 채도 살아 있다**). **앉은 두 사람**의 뒷모습(HANJI의 정수리 깃털 · HOO의 귀깃으로 실루엣 구분). ★ **비어 있는 세 번째 의자**가 프레임 우측에(⛔ **초점·강조 0 — 그냥 거기 있다**). 데스크 위 **낡은 헤드셋**(F2). ★ **HOO가 아주 짧게 웃는다** — 옆얼굴 3/4, 안경 너머로 **아주 작게**(⛔ **크게 웃기면 이 회차가 광고가 된다**)
- subject: 두 사람의 등 · 빈 세 번째 의자 · 켜진 화면 · 낡은 헤드셋
- emotion: ★ **가라앉는다.** 승리도 결심도 감동도 아니다 — **안도**
- motion: 없음. **정지.** 설명되지 않은 것 3개가 프레임에 남는다
- dialogue_ref: **무대사** · ⛔⛔ **P52에 대사가 있으면 자동 FAIL**(C선 정점은 무대사로만 성립)
- fx/note: ★★ **SSOT(클리프행어 컷)** · **설명되지 않은 채 남는 것 3개**: **F2 낡은 헤드셋** · **W-2 빈 의자** · **켜진 화면(층2)** · ★ **HOO의 짧은 웃음 = 그가 받는 유일한 보상. ⛔ 대사로 설명 금지**
- gap: **1.0×** ⚠️ ⛔ **늘리지 마라 — 엔드카드의 시각적 분리가 이미 분리선이다. 이중 분리 = 독자가 "끝났다"고 확정하고 엔드카드를 안 본다**(§1-2)
- group: **A**

---
---

# §8. 엔드카드 (panel_053 ~ panel_054) — 이야기 밖

--- SCENE BREAK --- *(LOC_DESK → **비-공간** · 엔드카드)*

> ⛔ **아카데미 명칭·로고·커리큘럼·강사진·실적·취업률·수강료·연락처·모집 일정 창작 절대 금지.**
> ⛔ **캐릭터 0 · 대사 0 · 독자 호명 0.** ★ **분리선이 곧 신뢰선이다.**

### panel_053 (EC1)
- **scene_id: SC-EC / location: 비-공간** (⛔ LOC_\* 토큰 주입 **금지** — 이야기 공간이 아니다)
- cast: — (⛔ **캐릭터 0**)
- beat: 엔드카드 ① — 기관 소개 카드
- size: **medium** / ratio: **B** (3:2 · 본편 주력 A와 **시각적으로 명확히 다른** 형태)
- camera: `flat-on` — 카메라 개념 없음(그래픽 카드)
- composition: **본편과 명확히 분리되는 카드 면.** 테두리 있음 · 배경 톤 전환 · 작화 0. 중앙에 정보 슬롯 **1개**(비어 있다)
- subject: 카드
- emotion: —
- dialogue_ref: **카드 텍스트** — **`[[TBD: 아카데미 정보 — 기관 소개]]`** · ⛔ **정보를 지어내지 마라. 사용자 확인 전까지 TBD 유지**
- fx/note: ⛔ **명칭·로고·커리큘럼·실적·수치 창작 0** · **panel_052와 시각적으로 명확히 분리**
- gap: **1.0×** / group: **B**

### panel_054 (EC2)
- **scene_id: SC-EC / location: 비-공간**
- cast: — (⛔ **캐릭터 0**)
- beat: 엔드카드 ② — 문의 경로 카드
- size: **medium** / ratio: **B**
- camera: `flat-on`
- composition: EC1과 **같은 카드 포맷**(연속된 카드 2장으로 읽혀야 한다). 정보 슬롯 1개(비어 있다)
- subject: 카드
- emotion: —
- dialogue_ref: **카드 텍스트** — **`[[TBD: 아카데미 정보 — 문의 경로]]`**
- fx/note: ⛔ **연락처·모집 일정·취업률 창작 0** · ⛔ ***"신청하세요"* 류 독자 호명 0**
- gap: — (마지막 패널) / group: **C**

---
---

# §9. 자가검증

## 9-1. 패널 수

| 구간 | 패널 | 수 |
|---|---|:-:|
| 막1 실격 | panel_001~018 | 18 |
| 막2 입을 닫다 | panel_019~034 | 16 |
| 막3 재측정 | panel_035~046 | 12 |
| 막4 앉는다 | panel_047~052 | 6 |
| 엔드카드 | panel_053~054 | 2 |
| **총계** | | **★ 54** |

✅ **하네스 규약 50+ 충족** · **번호 panel_001부터 3자리 연속** · **패널 삽입/삭제 0**

## 9-2. 하드 룰 대조 (오케스트레이터 지시 8항)

| # | 지시 | 이행 | 판정 |
|:-:|---|---|:-:|
| 1 | **P2·P38 동일 구도** — `LOCKED_COMPOSITION_P2_P38` 문자열 동일 · 차이 3축 · **추가 0** | §2에 문자열 1회 정본 게시 + panel_002·panel_038 camera/composition에서 **동일 문자열 참조**. 화면비 둘 다 **A** | ✅ |
| 2 | **P34 ≠ P2 앵글** | panel_034 = `high-angle` ECU · **부스 안쪽** · **손 클로즈업** · **얼굴 프레임 밖** · ratio **C**(P2는 A) — 4축 전부 다르다. 추가로 **panel_006(잔상)도 P2 앵글 회피**(부감 MLS) 명시 | ✅ |
| 3 | **P37 물증** — 2단 파형 · 스크러버 관통 · **문자 0** + **B-1**(청록 붐마이크 근경) + **B-2**(시선 아래→위) | panel_037 composition에 3요소 동시 프레임 명세 · emotion 항에 B-2 명시 · fx에 문자 금지 전수 | ✅ |
| 4 | **P36 B-3** — 두 썸네일 = P1·P34 구도 축소 재현 | panel_036에 명시 + **panel_001·panel_034 fx에 "이 구도가 썸네일로 축소 재현된다" 역참조** | ✅ |
| 5 | **긴 여백 2개** | panel_034 gap = 화면×1.5~2.0 / panel_049 gap = 화면×1.0~1.2 · **그 외 화면-단위 여백 0건**(최대 1.5× 기본) · ⚠️ **panel_052 gap = 1.0× 고정**(이중 분리 방지) | ✅ |
| 6 | **세로 스크롤 리듬** | CU/ECU 3연속 **0건** · size 동일값 3연속 **0건** · ratio A 34 / B 13 / C 7 변주 | ✅ |
| 7 | **은유 금지 · 숫자/영문 금지** | 물·바다·하늘·눈밭·숲·둥지 **0** · 날개 **0**(짧은 물갈퀴만 — panel_007·panel_047) · **판독 가능 숫자 = panel_022 1건뿐** · 판독 가능 영문 **0**(명패·사원증·명찰·파일명 전부 백지/판독 불가) | ✅ |
| 8 | **엔드카드 `[[TBD]]`** | panel_053·054 — 정보 창작 **0** · 캐릭터 **0** · 대사 **0** | ✅ |

## 9-3. 배경 연속성 (같은 scene_id = 같은 장소)

| 검사 | 결과 |
|---|---|
| 한 scene_id 안에서 location이 바뀌는 구간 | **0건** — 배경이 튀는 3곳(P6·P7 잔상 / P38 컷백)은 **별도 scene_id(SC02F · SC09B)로 분리**하고 SCENE BREAK로 감쌌다 |
| SCENE BREAK 수 | **13개** (LOC 전환 11 + 잔상 진입/이탈 2 — 컷백 진입/이탈 포함) |
| LOC_\* 토큰 | style-bible §6의 **7종만 사용**. 신규 장소 요청 **0건** (엔드카드는 비-공간 — LOC 주입 금지) |

## 9-4. dialogue_ref · 무대사 원장

| 항목 | 실측 | 대조 |
|---|:-:|---|
| **말풍선 보유 패널** | **29** | script_final §6-5와 일치 ✅ |
| **무대사 패널**(본편) | **23** | 일치 ✅ |
| **베이크 텍스트 요소** | **말풍선 38 + 화면 텍스트 1(P22) = 39** | 일치 ✅ |
| **한 패널 3말풍선** | **1건 — panel_026** | ⚠️ **상류 하드 룰(twist-plan §3-2)이 요구.** ⛔ 분할 금지 — 사유를 dialogue_ref에 명기 |
| **무대사 4연속** | **panel_033~036** | ⚠️ **승인된 예외**(script_final §0-2-⑤b) — ⛔ **대사 추가·REGEN 금지** |
| **HOO 대사** | panel_016·017·025·037·045·050(×2) = **7말풍선** | V3 = 2/7 = 28.6% ✅ |

## 9-5. A/B/C 그룹 분배

| 그룹 | 패널 | 수 |
|:-:|---|:-:|
| **A** | 001·004·007·010·013·016·019·022·025·028·031·034·037·040·043·046·049·052 | **18** |
| **B** | 002·005·008·011·014·017·020·023·026·029·032·035·038·041·044·047·050·053 | **18** |
| **C** | 003·006·009·012·015·018·021·024·027·030·033·036·039·042·045·048·051·054 | **18** |

✅ **완전 균등(18/18/18).** REGEN 웨이브 시 그룹 간 부하가 고르다.

---

# §10. 하류 인계

| 팀 | 반드시 가져갈 것 |
|---|---|
| **prompt-smith** ★ | **§0 장소 표 · 13개 SCENE BREAK** — scene_id별 **LOC_\* 토큰을 한 글자도 바꾸지 말고** 주입. ★ **SC02F(P6·P7) = LOC_BOOTH · SC09B(P38) = LOC_BOOTH** — SC02/SC09 토큰을 잘못 주입하면 배경 사고 · **§2 `LOCKED_COMPOSITION_P2_P38` 문자열을 panel_002·panel_038 두 프롬프트에 동일 복사** · **§1-3 화면비 코드**(P2/P38=A · P37/P22=B · P28/P30/P34/P43=C) · **§9-5 A/B/C 균등 분배(18/18/18)** · **B-1/B-2/B-3 3종은 프롬프트 본문에 박아라** |
| **letterer** | **dialogue_ref는 각 패널 항목에 전부 기재됨** · ★ **panel_026 = 3말풍선(분할 금지 · ③은 가장자리·작게)** · ★ **panel_050② = 31자 3행 조판 · 말풍선 크게 · ①생략 절대 금지** · ★ **panel_002/006/007 = 꼬리만(글자 0)** · ★ **panel_031~033 = HANJI 말풍선 0(팀원 말풍선은 유지)** · ★ **panel_038 = 말풍선 0 · 꼬리 0** · **panel_029 = 외침 말풍선이 문에 물리적으로 잘린다** · ⛔ **자구 대구 3종 "다양화" 금지** |
| **episode-compositor** | **§1-1 gap 척도** · **여백 ① = panel_034↓ 화면×1.5~2.0 / 여백 ② = panel_049↓ 화면×1.0~1.2** · ⚠️ **§1-2 panel_052↓ gap = 1.0× 고정**(늘리면 엔드카드 미도달) · **panel_037↓·panel_038↓ = 1.5×**(컷백 인지용, 화면 단위 아님) · ⛔ **제3의 큰 여백 금지** |
| **panel-validator** | **§2 ★SSOT 4종은 ACCEPT-FLAG 통과 불가** · **panel_002 ↔ panel_038 쌍 대조** · **panel_037 문자·숫자 0** · **panel_022만 숫자 허용** · **panel_028 ↔ panel_043 손·포스트잇 색 대구(FLAG)** · **청록 오염 검사**(HOO·RAKU 소품) · ⛔ **panel_047 HANJI 명령형을 V4 위반으로 REGEN하지 마라** · ⛔ **panel_033~036 무대사 4연속을 FAIL 판정하지 마라** |
| **art-director** | **신규 LOC_\* 요청 0건** — style-bible §6의 7종으로 54패널 전부 커버됐다. 엔드카드(SC-EC)만 **비-공간**으로 LOC 미주입 |

---

*작성: panel-director · 2026-07-12 · 파일 기반 통신(SendMessage 미사용)*
*총 54패널 · 패널 삽입/삭제 0 · 자구 변경 0 · SCENE BREAK 13 · A/B/C 18/18/18 · ★SSOT 4종 명시*
*script_final §0-3 보강 3종(B-1·B-2·B-3) 전부 샷리스트 본문에 박음 · §7 인계 9항 전부 이행*
