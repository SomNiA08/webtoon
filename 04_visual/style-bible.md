# style-bible — EP01 스타일 바이블 (이스포츠 진로 홍보툰)

**확정 일자: 2026-07-12** · art-director
입력: `04_visual/refs/INDEX.md` + **레퍼런스 시트 3종 실물 열람**(HOO/Hanji/Raku_ref.png) · `02_story/world.md`(§4 LOC 후보 · §7 금기) · `02_story/concept.md`(§5 톤) · `02_story/twist-plan.md`(§1-3 물증 · §1-4 SSOT 쌍 · §4-4 청록 서명) · `03_episode/ep01_script_final.md`(§0-3 보강 3종 · §7 인계)
소비자: **prompt-smith**(전 패널 프롬프트 주입) · **panel-director**(샷리스트) · **letterer**(베이크 명세) · **panel-validator**(C1~C6 판정 기준) · episode-compositor

> **이 문서는 캐릭터 외형을 정의하지 않는다.** 외형 정본은 `04_visual/refs/INDEX.md` + 렌더 완료된 레퍼런스 시트 3장이다.
> 이 문서가 정의하는 것은 **그 캐릭터들이 놓일 화면**이다: 화풍 · 색 · 공간 · 말풍선 · 금지.
> ⛔ **레퍼런스 시트는 재렌더하지 않는다.** ref-sheet-artist 호출 없음.

---

# §1. 작화 스타일 (레퍼런스 시트 3장에서 실물 도출)

## 1-1. 캐릭터 레이어 — 세 시트의 공통 화풍

세 시트를 실제로 열어 대조한 결과, 화풍은 **단일 언어**로 수렴한다. 아래는 관찰치이지 취향이 아니다.

| 축 | 관찰된 것 | 프롬프트 토큰 |
|---|---|---|
| **선** | **굵고 균일하게 선명한 검은 아웃라인.** 외곽선이 내부선보다 뚜렷이 굵다(2단 선폭). 흔들림·해칭·거친 붓결 **0** | `bold clean black ink outline, heavier weight on silhouette than interior lines, no hatching` |
| **채색** | **깔끔한 셀 채색 + 아주 부드러운 1단 그라데이션.** 배·볼·이어컵에 얕은 소프트 셰이딩. 텍스처 브러시 없음 | `clean cel shading with one soft gradient pass, smooth flat fills, no texture brush` |
| **등신** | **2~3등신 치비.** 머리가 몸통만큼 크다. 팔다리는 짧고 뭉툭 — **손가락 관절 묘사 0**(HANJI=짧은 물갈퀴 팔 / HOO=날개손 / RAKU=뭉툭한 앞발) | `2-3 head-tall chibi proportions, oversized round head, short stubby limbs, mitten paws` |
| **눈** | **큰 원형 눈 + 큰 하이라이트 1개 + 작은 반짝임 1~2개.** 홍채에 아래로 갈수록 밝아지는 그라데이션. 검은 동공 | `large round eyes, one big specular highlight plus small sparkles, gradient iris` |
| **털/깃** | **가장자리에만 톱니 실루엣**(HANJI 흰 가슴털 · HOO 깃 · RAKU 볼털). 내부는 매끈 | `jagged fluffy silhouette edges only, smooth interior` |
| **명암** | **아래턱·팔 밑에만 얕은 앰비언트 오클루전.** 강한 그림자·드라마틱 명암 **0** | `soft ambient occlusion under chin and limbs only` |

⛔ **시트에는 있으나 패널에서는 금지되는 것 2가지** (이게 가장 흔한 오염원이다):
1. **인물을 두른 흰 스티커 테두리**(sticker rim) — 시트의 도감 표현이다. **패널에서는 0.** `no white sticker outline, no die-cut border`
2. **순백 배경 · 다각도 나열 레이아웃** — 레퍼런스를 `-i`로 첨부하면 모델이 시트 구성을 통째로 베낀다. **매 프롬프트 negative에 고정**: `no reference sheet layout, no turnaround, no multiple views, no white studio background, no character lineup`

## 1-2. 배경 레이어 — **극단적 현실주의** (이 작품의 승부처)

> **캐릭터만 동물이다. 그들이 앉는 의자·만지는 키보드·들어가는 방은 전부 진짜다.**
> 근거: 실증연구상 의인화 캐릭터는 브랜드 전환에 불리하다 — **배경 리얼리즘이 유일한 상쇄책**이다(concept §9-4).

| 축 | 규정 |
|---|---|
| **정밀도** | 실제 이스포츠 현장 수준의 **고밀도 묘사**: 케이블 타이로 묶인 선다발, 모니터암 관절, 팜레스트 손자국, 방음폼 에그크레이트, 청테이프 자국, 바닥 매트 스크래치 |
| **투시** | **정확한 1~2점 투시.** 캐릭터가 치비라고 배경까지 왜곡하지 마라. 배경에 치비 변형 **0** |
| **터치** | **정밀 채색 배경**(painted, semi-realistic). ⛔ 사진 합성·3D 렌더 룩 금지 — 캐릭터와 한 화면에서 붕괴한다 |
| ★ **선폭 위계** | **캐릭터 = 가장 굵은 선 / 근경 소품 = 중간 / 배경 건축 = 가장 가는 선(또는 선 없이 채색만).** 이 위계가 **치비 인물이 사실적 방에 파묻히지 않게** 하는 유일한 장치다 |
| ★ **스케일 규약** | 세계는 **이 몸들을 위해 지어져 있다.** 게이밍 체어 등받이는 캐릭터 머리 위로 올라오고, 키보드·마우스는 그들 손에 맞는다. ⛔ 인간 크기 방에 캐릭터를 축소해 끼워 넣지 마라. ⛔ 소품을 만화적으로 뭉개지도 마라 — **실물 디자인 · 실물 디테일 · 캐릭터 기준 비례** |

**전 패널 공통 스타일 토큰(프롬프트 프리픽스 — prompt-smith 그대로 사용)**
```
STYLE: korean webtoon panel, chibi animal characters (2-3 heads tall) drawn with bold clean black
outlines and crisp cel shading with one soft gradient pass, large round eyes with bright highlights;
set inside a HIGHLY DETAILED SEMI-REALISTIC PAINTED ENVIRONMENT with accurate perspective, real
esports hardware and correct architecture; background line weight is finer than the characters so the
characters read clearly; furniture and peripherals are scaled to the chibi bodies; bright saturated
colors, low illumination where specified but never desaturated; no fantasy elements
```

---

# §2. 색감 · 조도

## 2-1. 1급 규칙 — **조도만 낮추고 채도는 살린다**

> concept §5 핵심 낙차 = **귀여운 작화 × 무거운 대사.** 어두워지는 것은 **대사와 눈빛**이지 **색이 아니다.**
> ⛔ **작화를 어둡게 만들지 마라.** LOC_DESK가 "어둡다"는 것은 **조도(illumination)**이지 **채도(saturation)**가 아니다.
> 프롬프트 표현: `low illumination, high saturation, colors stay bright and clean` — 절대 `dark, desaturated, muted, gloomy, grim` 금지.

## 2-2. 팔레트 (레퍼런스 시트 실측 + 서사 요구)

| 계열 | 색 | 어디에 |
|---|---|---|
| **캐릭터 고유색** | HANJI 네이비블랙+백색+주황부리 / HOO 크림+브라운+네이비+금색 / RAKU 그레이+검정마스크+빨강 | 불변 (§character-sheets) |
| ★ **HANJI 청록 (서명색)** | **`#2FB3A8`** — 물증 전용 잉크 | **P37 파형·핑 마커** · **F4 포스트잇**(P12·P21~22·P28·P43) |
| **HANJI 헤드셋** | 레퍼런스 실물 = **더 밝은 시안-청록**(`#4FC3F7`계) | 헤드셋만. 시트가 정본 — 바꾸지 마라 |
| **모니터광** | 청록-네이비 (`#1E2A44` 홈 ↔ `#2FB3A8` 발광) | LOC_DESK · LOC_BOOTH 내부 |
| **무대광** | 차가운 청백 과노출 + LED 보드 블루 잔광 | LOC_STAGE · LOC_BOOTH 유리 반사 |
| **형광등** | 주광색 뉴트럴 화이트 (그림자 옅음) | LOC_PRACTICE |
| **비상등** | 초록 유도등 (`#3BAA5C`) | LOC_BACKSTAGE |
| **RGB** | 무지개 키보드 발광 (저채도로 죽이지 말 것) | LOC_PCBANG |

### ★ 청록 서명 규약 (twist-plan §4-4 승계 — **panel-validator C1 승격 항목**)

> **이 회차의 모든 물증은 하나의 색으로 서명된다.** 독자는 논리 이전에 **색으로 안다: "저건 HANJI다."**
> **헤드셋(밝은 시안-청록) ↔ 서명 잉크(`#2FB3A8`)는 같은 색상 계열(cyan-teal family)이다.** 눈이 자동으로 잇는다.
> 이 분리는 의도다: **캐릭터 색은 레퍼런스가 정본**이고, **물증 색은 twist-plan이 정본**이다. 둘을 억지로 같은 헥스로 통일하지 마라 — 시트가 이긴다.

⛔ **서명 오염 금지**: **RAKU(빨강/초록)·HOO(네이비/금색/주황)의 소지품·소품에 청록을 쓰지 마라.**
청록이 아무 데나 있으면 서명이 무의미해진다. 프롬프트 negative 고정: `no teal or cyan accents on RAKU's or HOO's props`

## 2-3. 조도의 위계 (world §6-1 — 공간 이동 = 감정 이동)

```
[빛]   LOC_STAGE      과노출 · 콘트라스트 최대   ← 보이지만 못 본다
[유리] LOC_BOOTH      반사광 · 중간 조도         ← HANJI가 서 있는 곳
[어둠] LOC_DESK       모니터광만 · 저조도/고채도 ← 가장 빠른 물 · 반전의 무대
```
**위로 갈수록 보이고, 아래로 갈수록 본다.** 조도 설계로 이 위계가 읽혀야 한다.

---

# §3. 분위기 (톤)

| 축 | 규정 |
|---|---|
| **장르** | 현실 직시형 진로 드라마. 1회 완결 드라마형 |
| **감정 타깃** | **사이다 아님. 안도.** *"이 어른은 나에게 헛바람을 넣지 않는다."* |
| **핵심 낙차** | **귀여운 작화 × 무거운 대사.** 화면은 밝고 선명, **눈빛과 대사만 무겁다** |
| **연기** | 과장 리액션 금지. **표정 변화는 작게** — 눈만 내려간다(P27) / 얼굴이 아주 잠깐 멈춘다(P39) / 아주 짧게 웃는다(P52) |
| **효과** | ⛔ **효과선·집중선·점층·글리치·스캔라인 남용 금지.** 이 작품의 긴장은 **정지와 침묵**에서 나온다. 특히 P28·P30·P34·P38에 효과선 0 |
| **군중** | ⛔ **관중·조연의 얼굴을 그리지 마라** — 실루엣 · 뒤통수 · 포커스 아웃 · 프레임 밖. **새 캐릭터 0** |

---

# §4. 화면비 · 해상도

**세로 스크롤 뷰어 기준. 모든 패널은 좌우 풀블리드**(패널 테두리선·흰 여백 없음 — 간격은 뷰어 `gap`이 만든다).

| 코드 | 화면비 | 해상도 | 용도 |
|:-:|---|---|---|
| **A (기본)** | **세로 2:3** | **1024 × 1536** | 인물 컷 · 대사 컷 · 표준. **전체의 ~70%** |
| **B (와이드)** | **가로 3:2** | **1536 × 1024** | 설정샷 · 공간 확립 · 화면(모니터) 정면 · 좌석 배치 |
| **C (정방)** | **1:1** | **1024 × 1024** | 손 클로즈업 · 소품 클로즈업 (P28·P30·P34·P43) |

### ⛔ 화면비 하드 룰
- ★ **P2 와 P38 은 반드시 같은 코드(A · 1024×1536).** 화면비가 다르면 재사용 컷이 성립하지 않는다.
- **P37**(물증 화면) = **B**. 두 파형 띠의 **길이 차**가 읽히려면 가로가 길어야 한다.
- **P22**(만 17세 화면) = **B**. 한글이 판독 가능해야 하는 유일한 화면 텍스트다.
- **P50** = **A 또는 B**, 단 **31자 3행 조판**이 들어갈 저밀도 컷 — **말풍선 면적을 아끼지 마라**.
- **여백(P34↓ · P49↓)은 패널이 아니다.** 검은 이미지·빈 이미지를 렌더하지 마라 — **episode-compositor의 `gap` 값**으로 처리한다.

---

# §5. 일관성 규약

## 5-0. 3대 앵커 (모든 프롬프트가 지켜야 하는 것)

| # | 앵커 | 집행 |
|:-:|---|---|
| **1** | **캐릭터 = 레퍼런스 시트** | 등장 캐릭터의 `refs/{IDTAG}_ref.png`를 **`codex exec -i`로 첨부**한다. 토큰만으로는 일관성이 안 잡힌다(EP01 실측: 첨부 조건화가 프롬프트에 없던 원화 디테일까지 전이시켰다) |
| **2** | **장소 = LOC_* 토큰** | 씬의 LOC 토큰 문자열을 **한 글자도 바꾸지 말고** 프롬프트에 붙여넣는다. 같은 장소는 매번 같은 문자열이다 |
| **3** | **1차 식별자 = 헤드셋 색** | HOO=네이비 / HANJI=시안청록 / RAKU=빨강. **섞이면 캐릭터가 무너진다** — 매 프롬프트에 색을 명시 |

## 5-1. 불변 / 가변의 분리

- **불변**(절대 안 바뀜): 종·체형·머리색/털색·눈 색·헤드셋 색·식별 표식·기본 의상. → character-sheets의 `불변 토큰`
- **가변**(패널마다 바뀜): 표정 · 포즈 · 카메라 · 조명 · **헤드셋 착용 상태**(착용/목에 걸침/벗음)
- ⛔ **가변을 불변 토큰에 섞지 마라.** 표정·포즈가 토큰에 들어가면 일관성이 무너진다.

## 5-2. ★ SSOT 앵커 4종 (**ACCEPT-FLAG 통과 불가** — 기준 만족까지 재렌더 또는 에스컬레이션)

**P2 ↔ P38 쌍** · **P37**(물증) · **P39**(반전 자구 한글 렌더) · **P52**(클리프행어 컷)

---

## 5-A. ★★★ P37 물증 화면 — 시각 명세 (prompt-smith는 이대로 그린다)

> **제약 3중 동시 충족**: ⓐ 숫자 노출 0 ⓑ 한눈에 대조가 읽힐 것 ⓒ 대사 0으로 명제가 증명될 것.
> **이 화면은 문자 0으로 성립하도록 설계됐다.** 비언어 축 4개(파형·핑·길이·색)만으로 명제가 증명된다.
> 이것은 미학이 아니라 **프로덕션 판단**이다: **반전 패널의 성패를 렌더러의 한글 조판 능력에 걸지 않는다.**

### 확정 형태 — 좌측 정렬 2단 파형 띠 (stacked waveform strips, left-aligned)

```
 ┌──────────────────────────────────────────────────────────┐
 │ ▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌▌ │ ← 위 띠: 청록 · 빽빽 · 오른쪽 끝까지
 │  ▲  ▲   ▲  ▲    ▲  ▲   ▲   ▲  ▲   ▲  ▲   ▲   ▲   ▲   ▲   │    핑 마커가 계속 찍힌다
 │                                                          │
 │ ─────▁────────────▁──────┤                               │ ← 아래 띠: 거의 평평 · 절반에서 끊긴다
 │                          ┤                               │    핑 마커 거의 없음
 └──────────────────────────────────────────────────────────┘
        ▲ 스크러버(재생 헤드) — 두 띠를 동시에 관통한다. HOO의 손이 뒤로 끈다
```

| 축 | 명세 |
|---|---|
| **배치** | 두 띠를 **위아래로, 같은 시작점(왼쪽) 정렬.** 좌측 정렬이라야 **길이 차이**가 한눈에 읽힌다 |
| **밀도(그의 입)** | 위 = **빽빽한 세로 획이 줄 전체를 채운다** / 아래 = **거의 평평한 직선 + 짧은 돌기 2~3개** |
| ★ **길이(버틴 시간)** | 위 = **화면 오른쪽 끝까지** / 아래 = **절반 남짓에서 끊긴다.** ← **이것이 명제의 증명이다** |
| **핑 마커** | 위 띠 아래로 **작은 삼각형 마커가 계속** / 아래 띠엔 **거의 없다** |
| **색** | 파형·핑 = **청록 `#2FB3A8`** / 빈 띠 = 어두운 네이비 홈(groove)만 |
| ★ **스크러버** | 재생 헤드가 **두 띠를 동시에 관통**(링크된 타임라인). **필수** — 없으면 "같은 자로 쟀는데 길이가 다르다"가 안 읽힌다 |

### 화면 안 ⛔ 절대 금지
`시간 눈금 · 타임스탬프 · 카운터 · KDA · 승률 · 어떤 숫자도` / `판독 가능한 한글·영문 라벨·파일명·역할 라벨` / `화살표 · 하이라이트 박스 · 강조 원 · 비교 자막`
→ 눈금이 필요하면 **숫자 라벨 없는 짧은 틱 마크**만.

### 필수 구도 보강 3종 (script_final §0-3 — **화면 안에 요소를 추가하지 않고** 명료성을 닫는다)

| # | 지시 |
|:-:|---|
| **B-1** | ★★★ **HANJI의 청록 붐마이크를 같은 프레임 근경에.** P34에서 벗은 헤드셋을 **목에 건 채**로 두고, 카메라가 **파형 화면과 그의 붐마이크를 한 컷 안에** 잡는다. → 독자의 눈이 **두 개의 청록**을 잇는다: *"저 파형 = 이 마이크에서 나온 것."* **순수 구도 — 화면 안 추가 요소 0** |
| **B-2** | ★★★ **HANJI의 시선 이동을 그린다: 아래 띠(HOO가 친 곳) → 위 띠.** 대비는 **HANJI가 완성한다.** 안 그리면 대비가 독자에게만 있고 인물에게는 없다 |
| **B-3** | ★★ **P36**: HOO가 고르는 **두 파일 썸네일이 P1·P34의 구도를 축소 재현**한다. 문자 0 · 파일명 판독 불가 · 하이라이트 0 · 작고 흐리게 |

---

## 5-B. ★★★ P2 ↔ P38 재사용 컷 쌍 — 시각 명세

> **prompt-smith: 아래 A절 토큰 문자열을 두 프롬프트에 그대로 복사한다.** panel-validator: **쌍 대조 검증.**

### A. 반드시 동일 (구도 SSOT — 복붙할 문자열)

```
LOCKED_COMPOSITION_P2_P38:
camera outside the booth glass looking through it at HANJI inside; HANJI's eye level; three-quarter
view turned slightly right of frontal; bust shot (chest up), standard lens, no distortion; HANJI
placed slightly LEFT of center, gaze directed toward frame RIGHT (toward his monitor); identical
scale, shoulder line at the same height; boom mic in front of his beak at the same angle; identical
background: same fingerprint smudge pattern on the glass, same egg-crate acoustic foam panels behind
him, same monitor glow position; HIS BEAK IS OPEN - he is mid-speech
```
★ **입은 두 컷 모두 벌어져 있다(말하는 중).** ← **이 쌍의 핵심.** 그는 P2에서도 P38에서도 **똑같이 말하고 있다.**

### B. 정확히 3가지만 다르다

| # | **P2** (막1 · 오독) | **P38** (막3 · 재측정) |
|:-:|---|---|
| **1. 유리 반사광** | 무대 조명이 유리에 **반사광으로 번져 얼굴의 절반을 지운다.** ★ **그의 입이 반사광에 잠긴다** | **반사가 걷혔다.** 유리가 맑다. **얼굴 전체가, 특히 입이 보인다** |
| **2. 초점(심도)** | 초점이 **유리 표면**(반사·지문). HANJI는 반쯤 소프트 | 초점이 **붐마이크와 입**. 유리가 소프트 |
| **3. 색온도·조도** | 무대 조명의 **차가운 청백** + 과노출 하이라이트 | LOC_DESK의 **모니터광 톤(teal/navy)** · 저조도 · **채도 유지** |

### C. ★ P38에 추가되는 것: **아무것도 없다**

⛔ **말풍선 0 · 꼬리 0 · 화살표 0 · 자막 0 · 강조선 0 · 효과선 0 · 모니터 베젤 0 · 스캔라인 0 · 글리치 0.**
- **베젤 금지 사유**: P38이 "모니터 안 영상"처럼 보이면 **재사용 컷이 죽는다.** 두 이미지가 **같은 종류의 이미지**여야 독자가 비교한다 → **풀블리드 영화적 컷백**으로 그린다.
- **말풍선 금지 사유**: P2는 **꼬리만**(내용은 유리에 가림). **P38에는 말풍선이 아예 없다.** ★ **소음(꼬리)이 사라지고 입이 남는다 — 소음이 발화가 된다.**

> **아무것도 추가되지 않았다. 원래 거기 있었다. 가리고 있던 것이 치워졌을 뿐이다.**
> **P38에 뭘 하나라도 더하는 순간 그것은 설명이 되고, 이 반전은 덜어냄으로만 성립한다.**

### E. ⛔ **P34를 P2와 같은 앵글로 그리지 마라**
같은 구도가 **3번** 나오면 P38의 충격이 희석된다(재사용은 **2회 대조**에서만 작동).
**P34 = 부스 안쪽 · 헤드셋을 벗는 손 클로즈업 · 얼굴은 프레임 밖.**
**"P2와 같은 구도로 돌아오는 컷은 이 회차에 단 하나, P38뿐이다."**

---

# §6. 장소 고정 토큰 (LOC_*) — **7종 확정**

> **prompt-smith: 아래 문자열을 씬의 LOC에 맞춰 프롬프트에 그대로 붙여넣는다. 한 글자도 바꾸지 마라.**
> 같은 장소는 매번 **같은 문자열** → 한 씬 도중 배경이 급변(도로→실내 등)하지 않는다.
> 공통 벽: **기관명·로고·간판·현수막·수강료표 0** / **실존 게임 UI·챔피언·로고 0 → 일반화된 5v5 MOBA** / **판독 가능 숫자 0**(P22 예외).

## LOC_PRACTICE — 아카데미 연습실 (RAKU의 공간 · 밝다)
```
LOC_PRACTICE: bright evenly-lit academy practice room, cool neutral fluorescent ceiling panels,
shallow soft shadows, white blinds half-closed on one window wall, one straight 5-seat team row of
desks facing forward plus one isolated single desk against the side wall, black mesh gaming chairs,
mechanical keyboards, monitor arms, cable-tied cable bundles under the desks, worn palm rests with
hand marks, drink cans, a blank whiteboard showing only an empty grid, rubber floor mat scuffed with
rolling-chair wheel tracks, plain unmarked walls, no signage, no logos
```
**고정 소품(연속성 앵커)**: 5연석 팀 열(정면) · **벽쪽 1인석 = RAKU 자리** · 바닥 매트의 **바퀴 자국** · **청록 포스트잇**(RAKU 모니터 테두리) · 빈 화이트보드
★ **바퀴 자국은 세지 마라**(세는 순간 숫자가 된다). **방향이 증거다: RAKU 1인석 → HANJI 5연석 방향으로만. 반대 방향 자국은 없다.**

## LOC_STAGE — 대회장 무대 ("하늘" = 실격의 자리 · 과노출)
```
LOC_STAGE: esports arena stage, harsh overhead spotlight rig, blown-out bright stage floor against a
pitch-black auditorium, blue LED board glow washing the stage edge, gaffer-taped cable runs across the
stage floor, dry-ice haze in the light beams, the audience rendered ONLY as dark silhouettes and
scattered phone lights with no faces, the big scoreboard screen turned to a steep angle and
overexposed so that nothing on it is legible
```
⛔ **스코어보드·랭킹 보드 숫자는 판독 불가**(블러/각도/과노출). **대비로만 말한다**: 랭킹 상단 밝음 ↔ 하단 텅 빔.

## LOC_BOOTH — 경기 부스 ("물 ⓐ") ★ SSOT 공간
```
LOC_BOOTH: soundproofed competition booth standing on the arena stage, egg-crate acoustic foam panels
on the wall behind the player, a thick glass partition with visible fingerprint smudges, stage lights
smeared across that glass as broad reflections like a water surface, the interior lit ONLY by monitor
glow, boom-mic headset, a generic 5v5 MOBA minimap at the screen edge, closed booth door
```
**고정 소품**: 에그크레이트 방음폼 패턴 · **유리 지문 위치**(P2/P38 동일) · 붐마이크 · 모니터 발광 위치
**연출 규칙**: 부스 **바깥** 컷 = HANJI 대사는 **꼬리만, 내용은 유리에 가린다** / 부스 **안쪽** 컷에서만 대사가 읽힌다.

## LOC_DESK — 관제/분석 데스크 ("물 ⓑ" + HOO의 밤) ★★ 반전의 무대 · 최우선 SSOT
```
LOC_DESK: dark analyst control desk room, ceiling lights OFF, a wall of six monitors is the only light
source, faces lit from below in teal and navy, a replay timeline with a scrubber bar, an enlarged
generic 5v5 MOBA minimap, voice-log waveform strips, layers of post-it notes along the monitor bezels,
one visibly worn old headset resting on the desk, two occupied chairs and ONE EMPTY CHAIR in the
corner of the frame, a cold coffee cup, warm dark room but the colors stay bright and saturated
```
**고정 소품**: 모니터 6대 벽 · 스크러버 달린 리플레이 타임라인 · 보이스 로그 파형 · 포스트잇 층 · **낡은 헤드셋 하나**(F2 — 심되 회수 금지) · **빈 의자 하나**(W-2 — **언급 0 · 클로즈업 0 · 늘 프레임 구석에**)
⛔ **조도만 낮추고 채도는 살린다.** `low illumination, high saturation` — `dark/gloomy/desaturated` 금지.
**의자 배치 확정**: HOO 자리 · **HANJI가 앉는 두 번째 의자**(P49) · **끝까지 비는 세 번째 의자**(P52).

## LOC_BACKSTAGE — 대기실 · 무대 뒤 복도 (탈락자의 통로)
```
LOC_BACKSTAGE: backstage corridor behind an arena, a green emergency exit sign, one flickering
fluorescent tube, exposed pipe truss overhead, gaffer-taped cables along the floor, stacked folding
chairs, blank lanyard name tags with no writing, damp carpet, bare concrete and plain walls, no
signage, no text anywhere
```
**고정 소품**: 초록 유도등 · 깜빡이는 형광등 1개 · 접이식 의자 · **이름표 없는 명찰**

## LOC_PCBANG — 심야 PC방 (HANJI의 사적 시간)
```
LOC_PCBANG: late-night korean pc bang, rows of desks with rainbow RGB keyboard glow, dim indirect
ceiling light, plastic-wrapped keyboards, torn palm rests, a blank seat plate with no number, an
instant noodle cup and disposable chopsticks, ring-shaped water stains on the desk, a pitch-black
window with no city lights outside, carpeted floor
```
**고정 소품**: RGB 무지개 발광 · 컵라면 · **완전한 밤 창** · **HANJI의 오더 노트**(P28 — 표지에 손때, **청록 포스트잇 한 장이 삐져나온다**)
⛔ **노트 안의 글씨를 보여주지 마라**(P37 물증의 몫이다).

## LOC_CORRIDOR — 아카데미 복도 · 문 (착지 컷)
```
LOC_CORRIDOR: dim academy corridor at night, a door with a frosted glass insert, light spilling
through the door gap and drawing a long bright rectangle across the floor, an automatic door closer
arm, a BLANK empty wall plaque with no text, linoleum floor, no signage, no logos
```
**고정 소품**: **문틈 빛이 바닥에 그리는 긴 사각형** · **빈 명패**(`[[TBD: 아카데미 정보]]` — **글자 0**)
★ **대구 규약**: P18 = HANJI가 **빛을 밟지 않고 지나간다** / P48 = **빛 앞에 선다.** 같은 문 · 같은 빛 · 다른 행동.

---

# §7. 말풍선 시각 규약 (**in-image 베이크** — 이미지에 함께 그린다)

> ⛔ **"이미지 내 텍스트 금지"는 이 하네스의 규약이 아니다.** 말풍선과 한글 대사는 **작화에 함께 생성**된다.
> 대신 아래 규약 + negative(`no english text, no gibberish`)로 품질을 잡는다.

## 7-1. 종류별 시각 스타일

| 종류 | 시각 | 이 회차 사용처 |
|---|---|---|
| **대사** | **흰 둥근 말풍선 + 굵은 검은 테두리**(캐릭터 아웃라인과 같은 굵기) + **화자 입을 향한 삼각 꼬리** | 대부분 |
| **생각** | **흰 구름형 풍선 + 작은 원 3개가 꼬리** | **P3 단 하나**(*"나는 왜 아직도 여기 있지?"*) — ⛔ 나레이션 박스 아님 |
| **외침** | **뾰족 폭발형 흰 풍선 + 굵은 테두리** | **P29** 캐스터(*"…자, 이제 정말 마지막—"*) — ★ **문(프레임)에 물리적으로 잘린다** |
| **화면 밖 목소리** | **프레임 가장자리에서 잘린 말풍선, 꼬리는 프레임 밖을 향한다.** 화자 얼굴 0 | P12(수강생) · P31·P32(팀원) · P29(캐스터) — **새 캐릭터 아님** |
| ★ **꼬리만** | **말풍선 몸체가 유리 반사광에 잠겨 형체만 흐릿하고, 꼬리만 선명하다. 안에 글자 0** | **P2 · P6 · P7** (F1 심기) |
| **화면 텍스트** | 모니터 UI 카드 안의 **굵은 한글**. 말풍선 아님 | **P22** *"만 17세 이상"* — **이 회차 유일한 판독 가능 숫자** |
| ⛔ **계약자/시스템창** | **없음** — 이 작품에 시스템 창·상태창은 존재하지 않는다(판타지 0) | — |

## 7-2. 한글 레터링 톤

- **굵은 고딕 산세리프 · 검정 · 고대비 · 가로쓰기.** 세로쓰기 금지. 손글씨체 금지.
- **1행 ≤ 12자 권장 · 2~3행 조판.** 말풍선 여백을 아끼지 마라(글자가 테두리에 닿으면 깨진다).
- **평균 13.9자 / 최대 31자**(P50②). ★ **P50② = 3행 조판 필수**: `근데 네가 뭘 / 할 수 있는지는, / 여기서 알아볼 수 있어.` **말풍선을 크게.**
- ⚠️ **P50①을 절대 생략·축약하지 마라.** ①(*"프로가 될지는 나도 몰라."*)이 없으면 ②가 **약속**이 된다.
- **감정 강세**는 글자 크기·굵기로만. 색 글자·그라데이션 글자 금지.

## 7-3. ★★ 레터링 반전 (이 회차 레터링의 심장 — letterer 직결)

| 구간 | 규약 | 독자가 읽는 것 |
|---|---|---|
| **막1 · 부스 바깥**(P2·P6·P7) | **꼬리만.** 내용은 유리에 가려 **판독 0** | *"지면서 말이 많네"* = **흠** (오독) |
| **막2 · 부스 안쪽**(P31~P33) | ★ **안쪽 컷인데 HANJI의 말풍선이 없다.** 팀원 말풍선만 두어 개 | *"집중하는 중"* (오독 강화) |
| **막3 · P38** | ★★★ **말풍선 0 · 꼬리 0.** 입만 남는다 | *"이 사람, 계속 말하고 있었다"* |

> **막1 = "밖이라 안 읽힌다." ↔ 막2 = "안인데 읽을 게 없다."**
> ⚠️ **독자는 이 차이를 의식하지 못해야 한다 — 그게 정확한 설계다.**
> ⛔ **그 공백을 효과음·강조·여백으로 가리키지 마라. 그냥 비어 있어야 한다.**
> ⛔ HANJI 말풍선을 하나라도 넣으면 반전의 절반이 죽는다. **팀원 말풍선까지 지우면** 부재가 인지되지 않아 **역시 죽는다.**

## 7-4. 자구 변경 금지 (letterer가 "다양화"하면 회로가 끊긴다)
- P31 *"왼쪽 비었어."* ↔ P37 *"여긴 왜 비었지?"* — **같은 동사 반복이 자산이다**
- P26② *"시야"* ↔ P47 *"시야"*
- P3 *"여기 있지?"* ↔ P39 *"여기, 계속 있었어요."* ↔ P51

---

# §8. 금지 목록 (위반 = panel-validator REGEN)

## 8-1. 리얼리즘 벽 (1급)
1. ⛔ **판타지 0**: 마법 · 시스템 창 · 이세계 · 게임 속 진입 · 초능력 · 미래 기술.
2. ⛔ **동물 능력의 초현실적 사용 0**: HANJI는 **헤엄치지도 날지도 않는다.** HOO는 **날지 않는다.** RAKU는 **나무를 타지 않는다.**
3. ⛔ ★ **화면에 물·바다·하늘·눈밭·숲·둥지를 그리지 마라.** 종=주제 은유는 **어둠 · 방음 · 좌석 · 시선 방향**으로만 회수한다. **물 이미지가 화면에 나오는 순간 은유가 설명이 되고 죽는다.**
4. ⛔ **HANJI에게 펼친 깃털 날개를 그리지 마라.** 팔은 **짧은 물갈퀴**다 — 화면을 가리키는 손짓만(P7·P47).

## 8-2. 사실 벽 (실존 기관 홍보물)
5. ⛔ **아카데미 고유물 0**: 명칭 · 로고 · 간판 · 현수막 · 수강료표 · 커리큘럼 보드 · 강사 명패 · 실적 배너 · 협약사 로고 · 연락처 → **무지 벽면 / 빈 명패.**
6. ⛔ **판독 가능한 숫자 0** (스코어보드·랭킹·타임스탬프·카운터·좌석번호 포함). **유일 예외: P22 "만 17세 이상".**
7. ⛔ **실존 상용 게임의 UI·챔피언·로고 복제 0** → **일반화된 5v5 MOBA**의 미니맵·스코어보드·리플레이 타임라인으로 추상화.
8. ⛔ **판독 가능한 영문 0.** ★ 원화의 깨진 영문 아티팩트(*"Aanjil"*, *"Hanjo"*)가 패널에 전이되면 **즉시 REGEN**. RAKU의 사원증·명찰·좌석판·파일명은 **전부 백지 또는 판독 불가**.

## 8-3. 톤 벽
9. ⛔ **작화를 어둡게 만들지 마라.** 저조도 ≠ 저채도.
10. ⛔ **관중·조연의 얼굴 0** — 실루엣 · 뒤통수 · 포커스 아웃. **새 캐릭터 0.**
11. ⛔ **나레이션 박스 0.**
12. ⛔ **효과선·집중선·글리치·스캔라인 남용 0.** 특히 P28·P30·P34·P38.

## 8-4. 렌더 오염 (레퍼런스 첨부의 부작용)
13. ⛔ **흰 스티커 테두리 · 순백 배경 · 다각도 나열 레이아웃 0** — 레퍼런스 시트의 도감 표현이 패널로 새는 것을 막아라.
14. ⛔ **청록 오염 0** — RAKU(빨강/초록)·HOO(네이비/금색/주황) 소품에 청록 금지.
15. ⛔ **테이프 패치는 RAKU의 표식이다** — HOO의 낡은 헤드셋에 테이프를 붙이지 마라(HOO의 낡음 = **닳은 이어패드 + 눌린 헤드밴드**).

## 8-5. ★ 공통 negative 프롬프트 (prompt-smith — 전 패널 서픽스 고정)
```
NEGATIVE: no watermark, no signature, no artist logo, no brand marks, no english text, no latin
letters, no gibberish text, no garbled text, no misspelled korean, no random letters on props, no
legible numbers, no digital clock, no timestamps, no scoreboard digits, no real-game UI, no
copyrighted champions, no existing game logos, no fantasy, no magic, no system window, no status
window, no water, no ocean, no sky, no snow field, no forest, no nest, no spread feathered wings, no
flying, no glasses on HANJI, no teal or cyan accents on RAKU's or HOO's props, no tape patch on HOO's
headset, no white sticker outline, no die-cut border, no reference sheet layout, no turnaround, no
multiple views, no character lineup, no white studio background, no photograph, no photobash, no 3d
render, no realistic animal anatomy, no dark desaturated grim palette, no crowd faces, no narration box
```

---

*작성: art-director · 2026-07-12 · 파일 기반 통신(SendMessage 미사용)*
*레퍼런스 시트 3장 실물 열람 후 화풍 도출 · 캐릭터 외형 재정의 0 · ref-sheet-artist 미호출(재렌더 금지 준수)*
