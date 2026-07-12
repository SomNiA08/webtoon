# style-bible — EP01 스타일 바이블 (이스포츠 진로 홍보툰)

**확정 일자: 2026-07-12** · art-director
**개정 v2 (화풍 대전환): 2026-07-12** — 사용자 지시에 의한 배경 화풍 전면 교체
입력: `04_visual/refs/INDEX.md` + **레퍼런스 시트 3종 실물 열람**(HOO/Hanji/Raku_ref.png) · **사용자 제공 목표 룩 3종 실물 열람**(`00_input/characters/Hanji_4.png` · `Hanji_5.png` · `HOO_3.png`) · **렌더된 EP01 패널 3종 실물 열람**(P26·P50·P02 — 실패 진단) · `02_story/world.md`(§4 LOC · §7 금기 · R6) · `02_story/concept.md`(§5 톤) · `02_story/twist-plan.md`(§1-3 물증 · §1-4 SSOT 쌍 · §4-4 청록 서명) · `03_episode/ep01_script_final.md`(§0-3 보강 3종)
소비자: **prompt-smith**(전 패널 프롬프트 주입) · **panel-director**(샷리스트) · **letterer**(베이크 명세) · **panel-validator**(C1~C6 판정 기준) · episode-compositor

> **이 문서는 캐릭터 외형을 정의하지 않는다.** 외형 정본은 `04_visual/refs/INDEX.md` + 렌더 완료된 레퍼런스 시트 3장이다.
> 이 문서가 정의하는 것은 **그 캐릭터들이 놓일 화면**이다: 화풍 · 색 · 공간 · 말풍선 · 금지.
> ⛔ **레퍼런스 시트는 재렌더하지 않는다.** ref-sheet-artist 호출 없음. **캐릭터 외형은 v2에서 한 글자도 바뀌지 않았다.**

---

# §0. ★★★ v2 변경 요약 (prompt-smith 최우선 — 무엇을 갈아끼우는가)

## 0-1. 왜 바뀌었나

사용자가 렌더된 11장을 보고 내린 판정:

> **"캐릭터랑 배경이 너무 따로 노는 것 같아. 캐릭터는 아기자기한 동물인데 배경은 너무 어둡고 현실적입니다."**

**v1의 "배경 극단 리얼리즘" 방침은 실패했다.** 근거였던 실증연구(의인화 = 전환 불리 → 배경 리얼리즘으로 상쇄)는 **가설이었고, 사용자의 눈이 이겼다.** v1을 방어하지 않는다.

**실물 진단**(패널 3장 육안):

| 패널 | 무엇이 잘못됐나 |
|---|---|
| **P26**(연습실) | 차가운 회색 형광등 · 사진 같은 사무실. **배경에 잉크 선이 아예 없어** 라쿤이 사진 위에 붙인 스티커로 보인다 |
| **P02**(부스) | **렌즈 플레어 · 보케 · 매크로 지문** — 실사 사진 앞에 애니 펭귄을 세워 놨다 |
| **P50**(분석실) | **거의 검정** · 사진 질감의 얼룩진 커피컵. 조도를 낮추랬더니 **칙칙해졌다** |

**v1의 진짜 범인 2줄** (둘 다 v2에서 삭제):
1. `배경 건축 = 가장 가는 선(또는 **선 없이 채색만**)` ← **이게 배경을 다른 매체로 만들었다.**
2. `HIGHLY DETAILED SEMI-REALISTIC PAINTED ENVIRONMENT` ← 모델이 이걸 사진으로 해석했다.
3. `low illumination, high saturation`만으로는 부족했다 — **화면 안에 따뜻한 광원을 강제하지 않았다.**

## 0-2. 목표 룩 (사용자 본인의 그림 — 이것이 정본이다)

`Hanji_4.png` · `Hanji_5.png`를 열어 보면: **책상 · 모니터 · 캔 · 스탠드 · 창밖 밤 — "진짜 방"이 다 있다.**
그런데도 캐릭터와 같은 세계에 있다. 이유는 단 하나 —

> ### **사진 같은 어둠이 아니라, 그려진 따뜻함이기 때문이다.**

| 관찰 | 규정으로 |
|---|---|
| 캔·키보드·램프·책장에 **캐릭터와 같은 잉크 선**이 있다 (조금 가늘 뿐) | 배경도 **선이 있다.** 무선(無線) 채색 금지 |
| 소품이 **둥글고 단순**하다. 사진 디테일 0 | 모서리를 굴리고, 디테일을 덜어낸다 |
| **밤인데 따뜻하다.** 남보라 어둠 + 앰버 스탠드 + 청록 모니터광 | **어둠 = 검정이 아니라 짙은 남보라.** 화면 안에 **따뜻한 광원 1개 필수** |
| 캐릭터 가장자리에 **주황 림라이트**가 얹힌다 | 인물과 배경이 **같은 빛을 공유**한다 = 같은 세계 |
| 어두운 방인데 **칙칙하지 않다** — 아늑하다 | `gloomy`가 아니라 `cozy` |

`HOO_3.png`: 배경 소품(모니터·키보드·마우스)이 **단순하고 둥글다.** 이게 소품 문법이다.

## 0-3. ★ prompt-smith 갈아끼우기 표 (문자열 교체 — 이대로 실행)

| # | v1 (삭제) | v2 (대체) |
|:-:|---|---|
| **1** | 전 패널 프리픽스의 `STYLE:` 블록 **전문** | **§1-4의 새 `STYLE:` 블록**으로 통째 교체 |
| **2** | `HIGHLY DETAILED SEMI-REALISTIC PAINTED ENVIRONMENT` · `real esports hardware and correct architecture` · `background line weight is finer than the characters` | **전부 삭제.** 대체 = `the ENVIRONMENT IS DRAWN IN THE SAME CEL-SHADED INK STYLE ...`(§1-4) |
| **3** | (없음) | **★ 신규 토큰 `WARM_NIGHT:`**(§2-4) — **어두운 씬 전 패널에 필수 주입** |
| **4** | (없음) | **★ 신규 토큰 `WARM_DAY:`**(§2-4) — 밝은 씬 전 패널에 주입 |
| **5** | LOC_* 7종 문자열 **전부** | **§6의 새 7종 문자열로 전면 교체** (한 글자도 남기지 마라) |
| **6** | `NEGATIVE:` 블록 | **§8-5의 새 블록으로 교체** (리얼리즘 강제 문구 제거 + 이질감 유발 20여 항목 차단 추가) |
| **7** | `low illumination, high saturation` 단독 사용 | **금지.** 반드시 `WARM_NIGHT` 토큰과 **함께** 쓴다 |

## 0-4. ⛔ v2에서 **바뀌지 않은 것** (건드리면 회차가 깨진다)

- **캐릭터 외형** — `refs/INDEX.md` + 시트 3장이 정본. **v2는 캐릭터를 1픽셀도 안 건드린다.**
- **헤드셋 색 식별자** (HOO=네이비 / HANJI=시안청록 / RAKU=빨강) · **청록 서명 규약**(§2-3)
- **말풍선 시각 규약**(§7) · **레터링 반전 3구간**(§7-3) · **자구 변경 금지**(§7-4)
- **P37 물증 명세**(§5-A — 2단 청록 파형 · 길이 차 · 문자 0)
- **P2↔P38 ★SSOT 구도 잠금**(§5-B — `LOCKED_COMPOSITION` 문자열 **불변**)
- **공간의 기능과 연속성**: **LOC_* 7종은 그대로 존재한다.** 고정 소품(연속성 앵커)도 전부 그대로다.
  부스엔 여전히 **유리 · 방음폼 · 모니터**가 있다. 분석실엔 여전히 **모니터 6대 · 빈 의자 · 낡은 헤드셋**이 있다.
  > ### **바뀌는 건 "그리는 방식"이지 "무엇이 있는가"가 아니다.**
- **밝음↔어둠의 상대적 대비**: 연습실은 밝고 분석실은 어둡다. **이건 이야기 장치다**(world R6 — 어둠은 화면을 더 잘 보이게 한다). **대비는 유지, 어두운 쪽의 톤만 따뜻하게.**
- **판독 가능 숫자/영문 금지 · 물/하늘/눈밭 금지 · 실존 게임 UI 금지 · 관중 얼굴 금지**

## 0-5. 렌더 영향 범위

⚠️ **기존 렌더 11장은 전부 v1 화풍이다 → 전량 재렌더 대상.** 부분 수정으로 수습되지 않는다(화풍 자체가 바뀌었다).
**카나리아 재실행 필수**: 전량 재렌더 전에 대표 5장(밝은 씬 1 · 어두운 씬 1 · 부스 1 · 무대 1 · 2인 이상 1)을 먼저 렌더해 **캐릭터-배경 화풍 통일**을 육안 확인한다.

---

# §1. 작화 스타일

## 1-0. ★★★ 1급 원칙 — **한 화면, 한 손** (v2의 심장)

> ### **화면 안의 모든 것은 같은 사람이 그린 것이다.**
> 캐릭터도, 의자도, 모니터도, 캔도, 벽도 — **같은 잉크 · 같은 셀 채색 · 같은 단순화 · 같은 빛.**
> 배경은 캐릭터가 **서 있는 사진**이 아니라, 캐릭터와 **같은 그림의 일부**다.

**이 원칙의 위반이 v1의 유일하고 치명적인 실패였다. panel-validator: 화풍 불일치 = C2(배경) 결함 → REGEN.**

**"같은 손"의 3가지 검사** (validator가 패널 하나를 볼 때 묻는 것):
1. 배경 소품에 **잉크 선이 보이는가?** (안 보이면 FAIL)
2. 소품의 **모서리가 굴려져 있고 디테일이 덜어져** 있는가? (사진 같으면 FAIL)
3. 캐릭터와 배경이 **같은 빛을 받고 있는가?** (인물만 따로 조명 받으면 FAIL)

## 1-1. 캐릭터 레이어 — 세 시트의 공통 화풍 (**v1 유지 — 변경 0**)

| 축 | 관찰된 것 | 프롬프트 토큰 |
|---|---|---|
| **선** | **굵고 균일하게 선명한 검은 아웃라인.** 외곽선이 내부선보다 뚜렷이 굵다(2단 선폭). 흔들림·해칭·거친 붓결 **0** | `bold clean black ink outline, heavier weight on silhouette than interior lines, no hatching` |
| **채색** | **깔끔한 셀 채색 + 아주 부드러운 1단 그라데이션.** 텍스처 브러시 없음 | `clean cel shading with one soft gradient pass, smooth flat fills, no texture brush` |
| **등신** | **2~3등신 치비.** 팔다리는 짧고 뭉툭 — **손가락 관절 묘사 0** | `2-3 head-tall chibi proportions, oversized round head, short stubby limbs, mitten paws` |
| **눈** | **큰 원형 눈 + 큰 하이라이트 1개 + 작은 반짝임 1~2개.** 그라데이션 홍채 | `large round eyes, one big specular highlight plus small sparkles, gradient iris` |
| **털/깃** | **가장자리에만 톱니 실루엣.** 내부는 매끈 | `jagged fluffy silhouette edges only, smooth interior` |
| **명암** | **아래턱·팔 밑에만 얕은 앰비언트 오클루전.** | `soft ambient occlusion under chin and limbs only` |

⛔ **시트에는 있으나 패널에서는 금지되는 것 2가지** (가장 흔한 오염원):
1. **인물을 두른 흰 스티커 테두리**(sticker rim) — 시트의 도감 표현. **패널에서는 0.** `no white sticker outline, no die-cut border`
2. **순백 배경 · 다각도 나열 레이아웃** — 매 프롬프트 negative에 고정: `no reference sheet layout, no turnaround, no multiple views, no white studio background, no character lineup`

## 1-2. ★★★ 배경 레이어 — **캐릭터와 같은 그림 언어** (v2 전면 교체)

> **v1 §1-2("극단적 현실주의")는 폐기됐다. 아래가 정본이다.**
> **배경은 여전히 "진짜 방"이다** — 책상 · 모니터 · 의자 · 케이블 · 방음폼은 그대로 있다.
> 다만 그것들은 **사진처럼 찍힌 게 아니라, 캐릭터를 그린 그 손이 그린 것**이다.

| 축 | v1 (폐기) | **v2 규정** |
|---|---|---|
| **선** | ~~가장 가는 선 또는 **선 없이 채색만**~~ | ★ **배경 소품·가구에 잉크 아웃라인이 반드시 있다.** 캐릭터보다 **약간 가늘 뿐**, **같은 검은 잉크 · 같은 깔끔한 선질**. 무선 채색 금지 · 해칭 금지 |
| **형태** | ~~고밀도 정밀 묘사~~ | ★ **단순화 + 둥근 형태.** 모서리를 굴린다(rounded corners, softened edges). 소품 하나에 **디테일 3개 이하** — 있는 것을 지우진 말되, **그리는 획을 줄인다** |
| **채색** | ~~정밀 채색(painted, semi-realistic)~~ | ★ **캐릭터와 동일한 셀 채색.** 평평한 색면 + 부드러운 1단 그라데이션 + 소프트 블룸. **질감 브러시·재질 표현 0** |
| **질감** | ~~팜레스트 손자국 · 매트 스크래치 · 청테이프 자국~~ | ⛔ **사진 질감 전면 금지**: 재질 그레인 · 먼지 · 얼룩 · 녹 · 때 · 스크래치 오버레이 · 매크로 지문. **낡음은 "형태"로만 표현**(눌린 이어패드, 뜯긴 팜레스트의 *모양*) |
| **조명** | ~~현실 조명~~ | ⛔ **사진 조명 금지**: 렌즈 플레어 · 보케 원 · 라이트 리크 · 필름 그레인 · 색수차 · HDR. **빛은 그려진다**: 단순한 빛 쐐기 · 부드러운 글로우 · 소프트 블룸 |
| **투시** | 정확한 1~2점 투시 | **유지.** 배경에 치비 왜곡 0. **단순화 ≠ 왜곡** — 형태는 단순하지만 공간은 정확하다 |
| ★ **선폭 위계** | (오해를 낳은 표현) | **캐릭터 = 가장 굵은 선 / 근경 소품 = 중간 / 원경 건축 = 가장 가는 선.** ★ **"가늘다"는 "없다"가 아니다.** 3단계 전부 **선이 있다** |
| ★ **스케일 규약** | (유지) | 세계는 **이 몸들을 위해 지어져 있다.** 게이밍 체어 등받이는 캐릭터 머리 위로, 키보드·마우스는 그들 손에 맞는다. ⛔ 인간 크기 방에 캐릭터를 축소해 끼워 넣지 마라 |

### ★ 소품 문법 (HOO_3.png에서 도출 — prompt-smith 어휘)
`simplified rounded props` · `softened corners` · `chunky shapes` · `clean flat fills` · `visible ink outlines on furniture and objects` · `cozy hand-drawn interior`

## 1-3. "진짜 방"을 유지하는 법 (사실성을 버리는 게 아니다)

⚠️ **오해 금지**: 배경을 **비우거나 유아용으로 만들라는 게 아니다.**
Hanji_4/5를 보라 — 책상 위에 **캔 · 펜 · 종이 · 노트북 · 케이블 · 스탠드 · 선반 · 인형**이 다 있다. **밀도는 높다.**
바뀌는 건 **밀도가 아니라 렌더링 문법**이다.

| 유지한다 | 버린다 |
|---|---|
| 소품의 **종류와 배치**(연속성 앵커) | 소품의 **사진 질감** |
| 공간의 **정확한 투시** | **사진 렌즈 효과**(플레어·보케·DOF 오버레이) |
| **아늑한 어수선함**(케이블·캔·포스트잇) | **더러움·때·그레인** |
| 이스포츠 장비의 **실루엣 식별성**(키보드는 키보드로 보인다) | 장비의 **초정밀 부품 묘사** |

## 1-4. ★★★ 전 패널 공통 스타일 토큰 (프롬프트 프리픽스 — **prompt-smith 그대로 복사**)

```
STYLE: korean webtoon panel, warm cozy lo-fi anime illustration, ONE UNIFIED DRAWING LANGUAGE for
characters AND background - everything in the frame is drawn by the same hand; chibi animal characters
(2-3 heads tall) with bold clean black ink outlines, crisp cel shading with one soft gradient pass,
large round eyes with bright highlights; the ENVIRONMENT IS DRAWN IN THE SAME CEL-SHADED INK STYLE:
simplified rounded props with softened corners, chunky friendly shapes, clean flat color fills, and
VISIBLE INK OUTLINES ON ALL FURNITURE AND OBJECTS (slightly thinner than the character outlines but the
same black ink); accurate perspective, real esports gear kept recognizable but drawn simply; furniture
and peripherals are scaled to the chibi bodies; cozy warm lighting with a warm light source in frame,
indigo and violet shadows instead of black, glowing screens with soft bloom; bright saturated colors,
inviting cozy atmosphere; NO photographic texture, NO material grain, NO photo lighting; no fantasy
elements
```

---

# §2. 색감 · 조도 (v2 전면 개정)

## 2-1. ★★★ 1급 규칙 — **조도는 낮추고, 채도는 살리고, 어둠은 따뜻하게**

v1은 앞의 두 개만 있었다. **세 번째가 없어서 P50이 칙칙해졌다.**

> **어두운 것은 대사와 눈빛이지, 색이 아니다.** (concept §5 핵심 낙차 = 귀여운 작화 × 무거운 대사)
> **그리고 어두움은 검정이 아니다.** 어두운 방의 어둠은 **짙은 남보라(deep indigo/violet)**다.
> **모든 어두운 씬에는 화면 안에 따뜻한 광원이 최소 1개 있다.** (예외: LOC_STAGE — §2-5)

| | 금지 | 대체 |
|---|---|---|
| **어둠의 색** | ⛔ `black`, `pitch-black`, `near-black shadows` | ✅ `deep indigo`, `violet shadows`, `saturated purple darks` |
| **어둠의 감정** | ⛔ `gloomy`, `grim`, `bleak`, `moody`, `gritty`, `oppressive` | ✅ `cozy`, `warm`, `inviting`, `intimate`, `calm` |
| **채도** | ⛔ `desaturated`, `muted`, `washed out`, `cold gray` | ✅ `saturated`, `colors stay bright and clean` |
| **빛의 성질** | ⛔ `photographic lighting`, `realistic low-light`, `harsh contrast` | ✅ `soft glow`, `gentle bloom`, `painted light` |

## 2-2. 팔레트 (레퍼런스 시트 실측 + **사용자 목표 룩 실측**)

| 계열 | 색 | 어디에 |
|---|---|---|
| **캐릭터 고유색** | HANJI 네이비블랙+백색+주황부리 / HOO 크림+브라운+네이비+금색 / RAKU 그레이+검정마스크+빨강 | **불변** (refs 정본) |
| ★ **HANJI 청록 (서명색)** | **`#2FB3A8`** — 물증 전용 잉크 | **P37 파형·핑 마커** · **F4 포스트잇**(P12·P21~22·P28·P43) |
| **HANJI 헤드셋** | 레퍼런스 실물 = **더 밝은 시안-청록**(`#4FC3F7`계) | 헤드셋만. **시트가 정본** |
| ★★ **어둠 (신규)** | **짙은 남보라 `#2E2A4F` ~ `#3A3260`** — ⛔ **검정 금지** | 모든 어두운 씬의 앰비언트 · 그림자 |
| ★★ **그림자 (신규)** | **인디고-보라 `#4A3F6B`** (중성 회색·검정 아님) | 전 패널의 그림자 색 |
| ★★ **따뜻한 키 (신규)** | **앰버 `#FFB870`** / 램프 코어 `#FFD9A0` | **모든 어두운 씬에 1개 이상 필수** — 스탠드 · 웜 LED 스트립 · 화면의 따뜻한 반사 |
| ★★ **캐릭터 림라이트 (신규)** | 따뜻한 주황 `#FFA366` | 어두운 씬에서 **캐릭터 가장자리** — 인물과 배경이 같은 빛을 공유한다는 증거 |
| **모니터광** | 청록-시안 (`#4FC3F7` ~ `#2FB3A8`) — **차가운 키** | LOC_DESK · LOC_BOOTH 내부 |
| **무대광** | 차가운 청백 + LED 보드 블루 (**유일한 차가운 공간** — §2-5) | LOC_STAGE · LOC_BOOTH 유리 반사 |
| **실내등** | ★ **따뜻한 크림 화이트** (v1의 "주광색 뉴트럴 화이트" 폐기 — 이게 P26을 사무실로 만들었다) | LOC_PRACTICE |
| **비상등** | 초록 유도등 (`#3BAA5C`) | LOC_BACKSTAGE |
| **RGB** | 무지개 키보드 발광 (저채도로 죽이지 말 것) | LOC_PCBANG |

### ★ 온도 대비 규약 (v2의 핵심 문법)
> **모든 표면에서 따뜻한 색과 차가운 색이 만난다.**
> 얼굴 한쪽엔 **청록 모니터광**, 반대쪽엔 **앰버 램프광**. 그림자는 **보라**.
> 이 3색 구조가 Hanji_4/5를 "따뜻한 밤"으로 만든 것이다. **밝기 대비가 아니라 색 대비로 깊이를 만든다.**

## 2-3. ★ 청록 서명 규약 (twist-plan §4-4 승계 — **v1 유지 · panel-validator C1 승격 항목**)

> **이 회차의 모든 물증은 하나의 색으로 서명된다.** 독자는 논리 이전에 **색으로 안다: "저건 HANJI다."**
> **헤드셋(밝은 시안-청록) ↔ 서명 잉크(`#2FB3A8`)는 같은 색상 계열이다.** 눈이 자동으로 잇는다.
> 캐릭터 색은 **레퍼런스가 정본**, 물증 색은 **twist-plan이 정본**. 둘을 억지로 같은 헥스로 통일하지 마라.

⛔ **서명 오염 금지**: **RAKU(빨강/초록)·HOO(네이비/금색/주황)의 소지품·소품에 청록을 쓰지 마라.**
negative 고정: `no teal or cyan accents on RAKU's or HOO's props`

⚠️ **v2 주의**: 새로 도입된 **앰버 따뜻한 광원은 서명이 아니다** — 조명이지 소품 색이 아니다. 앰버는 전 공간에 공통이므로 서명을 오염시키지 않는다.

## 2-4. ★★★ 신규 조명 토큰 2종 (**prompt-smith — 씬마다 하나를 반드시 주입**)

### WARM_NIGHT (어두운 씬 전용 — LOC_DESK · LOC_BOOTH 내부 · LOC_PCBANG · LOC_BACKSTAGE · LOC_CORRIDOR)
```
WARM_NIGHT: cozy warm night lighting - the darkness is DEEP INDIGO AND VIOLET, never black; teal-cyan
screen glow as the cool key light, PLUS at least one WARM AMBER LIGHT SOURCE visible in frame (desk
lamp, warm LED strip, or warm bounce off a surface) casting soft orange rim light on the characters and
a warm pool of light on the desktop; shadows are saturated indigo-purple, never neutral gray; warm and
cool colors meet on every surface; soft glow and gentle bloom around lights; colors stay bright and
saturated; low illumination but COZY AND INVITING, absolutely not gloomy or grim
```

### WARM_DAY (밝은 씬 전용 — LOC_PRACTICE)
```
WARM_DAY: warm bright lighting - creamy warm-white ceiling light, soft golden daylight through the
blinds, warm wood and cream surfaces, gentle peach-tinted shadows, airy and clean; high key and
cheerful, absolutely not clinical, not blue-gray, not a cold office
```

## 2-5. 조도의 위계 (world §6-1 — **대비는 유지된다. 이건 이야기 장치다**)

```
[빛]   LOC_PRACTICE   따뜻한 크림 화이트 · 밝다        ← 아이들이 연습하는 곳
[빛]   LOC_STAGE      차가운 청백 · 과노출 · 최대 콘트라스트  ← 보이지만 못 본다  ★유일한 차가운 공간
[유리] LOC_BOOTH      유리 반사 · 중간 조도 · WARM_NIGHT   ← HANJI가 서 있는 곳
[어둠] LOC_DESK       모니터광 + 앰버 램프 · WARM_NIGHT    ← 가장 빠른 물 · 반전의 무대
```
**위로 갈수록 보이고, 아래로 갈수록 본다.** (world R6 — 어둠은 화면을 더 잘 보이게 한다)

### ★ LOC_STAGE만 차가운 이유 (의도된 예외 — 서사가 된다)
**무대는 이 작품에서 유일하게 따뜻한 광원이 없는 공간이다.**
"하늘"(실격의 자리)은 **차갑고 눈부시고 아늑하지 않다.** 반대로 **어두운 방(LOC_DESK)은 따뜻하다.**
> **밝은 곳이 차갑고, 어두운 곳이 따뜻하다** — 이 온도 역전이 회차의 명제를 색으로 말한다.
> ⚠️ 이건 v2가 우연히 얻은 게 아니라 **채택한 설계**다. LOC_STAGE에 앰버를 넣지 마라.

---

# §3. 분위기 (톤)

| 축 | 규정 |
|---|---|
| **장르** | 현실 직시형 진로 드라마. 1회 완결 드라마형 |
| **감정 타깃** | **사이다 아님. 안도.** *"이 어른은 나에게 헛바람을 넣지 않는다."* |
| **핵심 낙차** | **귀여운 작화 × 무거운 대사.** 화면은 밝고 아늑하고 선명, **눈빛과 대사만 무겁다** |
| ★ **온기 (v2 신규)** | **어떤 장면도 독자를 춥게 만들지 않는다.** 화면 안 따뜻한 광원 1개 필수 (**예외: LOC_STAGE**) |
| **연기** | 과장 리액션 금지. **표정 변화는 작게** — 눈만 내려간다(P27) / 얼굴이 아주 잠깐 멈춘다(P39) / 아주 짧게 웃는다(P52) |
| **효과** | ⛔ **효과선·집중선·점층·글리치·스캔라인 남용 금지.** 긴장은 **정지와 침묵**에서 나온다. 특히 P28·P30·P34·P38에 효과선 0 |
| **군중** | ⛔ **관중·조연의 얼굴을 그리지 마라** — 실루엣 · 뒤통수 · 포커스 아웃 · 프레임 밖. **새 캐릭터 0** |

---

# §4. 화면비 · 해상도 (v1 유지 — 변경 0)

**세로 스크롤 뷰어 기준. 모든 패널은 좌우 풀블리드.**

| 코드 | 화면비 | 해상도 | 용도 |
|:-:|---|---|---|
| **A (기본)** | **세로 2:3** | **1024 × 1536** | 인물 컷 · 대사 컷 · 표준. **전체의 ~70%** |
| **B (와이드)** | **가로 3:2** | **1536 × 1024** | 설정샷 · 공간 확립 · 화면 정면 · 좌석 배치 |
| **C (정방)** | **1:1** | **1024 × 1024** | 손 클로즈업 · 소품 클로즈업 (P28·P30·P34·P43) |

### ⛔ 화면비 하드 룰
- ★ **P2 와 P38 은 반드시 같은 코드(A · 1024×1536).**
- **P37**(물증 화면) = **B**. 두 파형 띠의 **길이 차**가 읽히려면 가로가 길어야 한다.
- **P22**(만 17세 화면) = **B**.
- **P50** = **A 또는 B**, **31자 3행 조판**이 들어갈 저밀도 컷 — **말풍선 면적을 아끼지 마라**.
- **여백(P34↓ · P49↓)은 패널이 아니다.** episode-compositor의 `gap` 값으로 처리한다.

---

# §5. 일관성 규약

## 5-0. ★ 4대 앵커 (모든 프롬프트가 지켜야 하는 것)

| # | 앵커 | 집행 |
|:-:|---|---|
| **1** | **캐릭터 = 레퍼런스 시트** | `refs/{IDTAG}_ref.png`를 **`codex exec -i`로 첨부**한다. 토큰만으로는 일관성이 안 잡힌다 |
| **2** | **장소 = LOC_* 토큰** | 씬의 LOC 토큰 문자열을 **한 글자도 바꾸지 말고** 붙여넣는다 |
| **3** | **1차 식별자 = 헤드셋 색** | HOO=네이비 / HANJI=시안청록 / RAKU=빨강. **매 프롬프트에 색을 명시** |
| ★ **4 (v2 신규)** | **한 화면 한 화풍** | `STYLE:` 블록 + `WARM_NIGHT`/`WARM_DAY` 중 하나를 **모든 프롬프트에** 넣는다. **배경이 캐릭터와 다른 매체로 보이면 REGEN**(C2 귀속) |

## 5-1. 불변 / 가변의 분리

- **불변**: 종·체형·머리색/털색·눈 색·헤드셋 색·식별 표식·기본 의상 → character-sheets의 `불변 토큰`
- **가변**: 표정 · 포즈 · 카메라 · 조명 · **헤드셋 착용 상태**
- ⛔ **가변을 불변 토큰에 섞지 마라.**

## 5-2. ★ SSOT 앵커 4종 (**ACCEPT-FLAG 통과 불가** — 기준 만족까지 재렌더 또는 에스컬레이션)

**P2 ↔ P38 쌍** · **P37**(물증) · **P39**(반전 자구 한글 렌더) · **P52**(클리프행어 컷)

---

## 5-A. ★★★ P37 물증 화면 — 시각 명세 (**v1 유지 — 변경 0**)

> **제약 3중 동시 충족**: ⓐ 숫자 노출 0 ⓑ 한눈에 대조가 읽힐 것 ⓒ 대사 0으로 명제가 증명될 것.
> **이 화면은 문자 0으로 성립하도록 설계됐다.** 비언어 축 4개(파형·핑·길이·색)만으로 명제가 증명된다.

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
| **배치** | 두 띠를 **위아래로, 같은 시작점(왼쪽) 정렬** |
| **밀도(그의 입)** | 위 = **빽빽한 세로 획이 줄 전체를 채운다** / 아래 = **거의 평평한 직선 + 짧은 돌기 2~3개** |
| ★ **길이(버틴 시간)** | 위 = **화면 오른쪽 끝까지** / 아래 = **절반 남짓에서 끊긴다** ← **이것이 명제의 증명이다** |
| **핑 마커** | 위 띠 아래로 **작은 삼각형 마커가 계속** / 아래 띠엔 **거의 없다** |
| **색** | 파형·핑 = **청록 `#2FB3A8`** / 빈 띠 = **짙은 남보라 홈(groove)** ★v2: 검정 홈 → 남보라 홈 |
| ★ **스크러버** | 재생 헤드가 **두 띠를 동시에 관통**(링크된 타임라인). **필수** |
| ★ **v2 렌더 문법** | 화면 UI도 **그려진다**: 깔끔한 셀 채색 · 부드러운 글로우 · **스캔라인/글리치/사진 화면질감 0** |

### 화면 안 ⛔ 절대 금지
`시간 눈금 · 타임스탬프 · 카운터 · KDA · 승률 · 어떤 숫자도` / `판독 가능한 한글·영문 라벨·파일명·역할 라벨` / `화살표 · 하이라이트 박스 · 강조 원 · 비교 자막`
→ 눈금이 필요하면 **숫자 라벨 없는 짧은 틱 마크**만.

### 필수 구도 보강 3종 (script_final §0-3)

| # | 지시 |
|:-:|---|
| **B-1** | ★★★ **HANJI의 청록 붐마이크를 같은 프레임 근경에.** P34에서 벗은 헤드셋을 **목에 건 채**로, 카메라가 **파형 화면과 붐마이크를 한 컷 안에** 잡는다. → 독자의 눈이 **두 개의 청록**을 잇는다. **순수 구도 — 화면 안 추가 요소 0** |
| **B-2** | ★★★ **HANJI의 시선 이동을 그린다: 아래 띠 → 위 띠.** 대비는 **HANJI가 완성한다** |
| **B-3** | ★★ **P36**: HOO가 고르는 **두 파일 썸네일이 P1·P34의 구도를 축소 재현**. 문자 0 · 하이라이트 0 · 작고 흐리게 |

---

## 5-B. ★★★ P2 ↔ P38 재사용 컷 쌍 — 시각 명세 (**구도 잠금 v1 유지 · 렌더 문법만 v2**)

> **prompt-smith: 아래 A절 토큰 문자열을 두 프롬프트에 그대로 복사한다.** panel-validator: **쌍 대조 검증.**

### A. 반드시 동일 (구도 SSOT — ⛔ **이 문자열은 v2에서도 한 글자도 바뀌지 않았다**)

```
LOCKED_COMPOSITION_P2_P38:
camera outside the booth glass looking through it at HANJI inside; HANJI's eye level; three-quarter
view turned slightly right of frontal; bust shot (chest up), standard lens, no distortion; HANJI
placed slightly LEFT of center, gaze directed toward frame RIGHT (toward his monitor); identical
scale, shoulder line at the same height; boom mic in front of his beak at the same angle; identical
background: same fingerprint smudge pattern on the glass, same egg-crate acoustic foam panels behind
him, same monitor glow position; HIS BEAK IS OPEN - he is mid-speech
```
★ **입은 두 컷 모두 벌어져 있다(말하는 중).** ← **이 쌍의 핵심.**

> ### ★ v2 렌더 문법 라이더 (구도는 불변 · 그리는 방식만 바뀐다)
> - **유리 지문**: 사진 매크로 지문 **금지**. **손으로 그린 단순한 얼룩 몇 개**(soft translucent smudge shapes) — **위치·패턴은 두 컷 동일**(연속성 앵커 유지).
> - **유리 반사**: 렌즈 플레어·보케 **금지**. **평평한 창백한 빛줄기 형태**(simple flat pale streak shapes).
> - **방음폼**: 에그크레이트 패턴을 **단순한 반복 마름모 셀 채색**으로. 사진 질감 0.

### B. 정확히 3가지만 다르다

| # | **P2** (막1 · 오독) | **P38** (막3 · 재측정) |
|:-:|---|---|
| **1. 유리 반사광** | 무대 조명이 유리에 **반사광으로 번져 얼굴의 절반을 지운다.** ★ **그의 입이 반사광에 잠긴다** | **반사가 걷혔다.** 유리가 맑다. **얼굴 전체가, 특히 입이 보인다** |
| **2. 초점(심도)** | 초점이 **유리 표면**(반사·얼룩). HANJI는 반쯤 소프트 ※ **그려진 소프트 포커스** — 사진 보케 아님 | 초점이 **붐마이크와 입**. 유리가 소프트 |
| **3. 색온도·조도** | 무대 조명의 **차가운 청백** + 과노출 하이라이트. **따뜻한 광원 0** | ★ **WARM_NIGHT.** 모니터광(teal/navy) + **앰버 악센트** · 저조도 · 채도 유지 |

> ### ★★ v2가 이 쌍에 준 선물: **온도 반전**
> **P2는 차갑고(무대의 청백), P38은 따뜻하다(분석실의 앰버).**
> 오독의 컷은 춥고, **재측정의 컷은 따뜻하다.** 색온도는 원래 델타 #3이었으므로 **요소는 하나도 추가되지 않았다** — 같은 축이 더 강해졌을 뿐이다.

### C. ★ P38에 추가되는 것: **아무것도 없다**

⛔ **말풍선 0 · 꼬리 0 · 화살표 0 · 자막 0 · 강조선 0 · 효과선 0 · 모니터 베젤 0 · 스캔라인 0 · 글리치 0.**
- **베젤 금지 사유**: P38이 "모니터 안 영상"처럼 보이면 **재사용 컷이 죽는다** → **풀블리드 영화적 컷백**.
- **말풍선 금지 사유**: P2는 **꼬리만**(내용은 유리에 가림). **P38에는 말풍선이 아예 없다.** ★ **소음(꼬리)이 사라지고 입이 남는다.**

> **아무것도 추가되지 않았다. 원래 거기 있었다. 가리고 있던 것이 치워졌을 뿐이다.**

### E. ⛔ **P34를 P2와 같은 앵글로 그리지 마라**
**P34 = 부스 안쪽 · 헤드셋을 벗는 손 클로즈업 · 얼굴은 프레임 밖.**
**"P2와 같은 구도로 돌아오는 컷은 이 회차에 단 하나, P38뿐이다."**

---

# §6. 장소 고정 토큰 (LOC_*) — **7종 · v2 전면 재작성**

> **prompt-smith: 아래 문자열을 씬의 LOC에 맞춰 프롬프트에 그대로 붙여넣는다. 한 글자도 바꾸지 마라.**
> ⛔ **v1 LOC 문자열은 전부 폐기.** 남겨두면 사진 배경이 다시 나온다.
> ✅ **고정 소품(연속성 앵커)은 v1과 100% 동일하다.** 있는 것은 그대로 있다 — **묘사만 단순·따뜻해졌다.**
> 공통 벽: **기관명·로고·간판·현수막·수강료표 0** / **실존 게임 UI·챔피언·로고 0 → 일반화된 5v5 MOBA** / **판독 가능 숫자 0**(P22 예외).

## LOC_PRACTICE — 아카데미 연습실 (RAKU의 공간 · 밝다) + `WARM_DAY`
```
LOC_PRACTICE: bright cozy academy practice room drawn in warm cel-shaded anime style, creamy warm-white
ceiling lights, soft golden daylight through half-closed blinds on one window wall, gentle peach-tinted
shadows, one straight 5-seat team row of simplified rounded desks facing forward plus one isolated
single desk against the side wall, chunky rounded gaming chairs with soft highlights, simplified
mechanical keyboards with rounded keycaps, rounded monitors, monitor arms, cable bundles drawn as
simple looping shapes under the desks, warm wood desktops, drink cans, a blank whiteboard showing only
an empty grid, floor mat with soft curved wheel-track marks, plain warm cream walls, all furniture and
props have clean black ink outlines, flat cel-shaded fills, no photo texture, no signage, no logos
```
**고정 소품(v1과 동일)**: 5연석 팀 열(정면) · **벽쪽 1인석 = RAKU 자리** · 바닥 매트의 **바퀴 자국** · **청록 포스트잇**(RAKU 모니터 테두리) · 빈 화이트보드
★ **바퀴 자국은 세지 마라**(세는 순간 숫자가 된다). **방향이 증거다: RAKU 1인석 → HANJI 5연석 방향으로만.**
★ **v2 교정**: v1의 `cool neutral fluorescent`가 P26을 사무실로 만들었다 → **크림 웜 화이트 + 골든 블라인드 빛**. **밝기는 그대로, 온도만 바뀐다.**

## LOC_STAGE — 대회장 무대 ("하늘" = 실격의 자리 · **유일한 차가운 공간 · WARM 토큰 없음**)
```
LOC_STAGE: esports arena stage drawn in cel-shaded anime style, harsh overhead spotlights drawn as
simple translucent light wedges, blown-out bright stage floor against a deep indigo-violet auditorium
(not black), cool blue LED board glow washing the stage edge, taped cable runs drawn as simple lines
across the stage floor, soft haze in the light beams painted as flat translucent shapes, the audience
rendered ONLY as flat dark violet silhouettes and scattered phone lights with no faces, the big
scoreboard screen turned to a steep angle and overexposed so nothing on it is legible; clean ink
outlines on stage furniture and booth, flat cel fills, NO lens flare, NO bokeh, NO photo haze
```
⛔ **스코어보드·랭킹 보드 숫자는 판독 불가**(블러/각도/과노출). **대비로만 말한다**: 랭킹 상단 밝음 ↔ 하단 텅 빔.
★ **여기만 앰버가 없다** — 의도된 예외(§2-5). **관중석 어둠도 검정이 아니라 짙은 남보라.**

## LOC_BOOTH — 경기 부스 ("물 ⓐ") ★ SSOT 공간 + `WARM_NIGHT`(내부 컷)
```
LOC_BOOTH: soundproofed competition booth standing on the arena stage, drawn in warm cel-shaded anime
style; egg-crate acoustic foam panels behind the player drawn as a simple repeating diamond pattern
with flat fills; a thick glass partition with a few soft hand-drawn smudge shapes (NOT photographic
fingerprints); stage lights smeared across that glass as broad flat pale streaks like a water surface;
the interior lit by teal-cyan monitor glow with a small warm amber accent light on the desk casting soft
orange rim light on the character; the booth interior darkness is deep indigo, never black; rounded boom-
mic headset, a generic 5v5 MOBA minimap at the screen edge drawn simply, closed booth door; clean ink
outlines on all props, soft bloom, NO lens flare, NO bokeh, NO photo texture
```
**고정 소품(v1과 동일)**: 에그크레이트 방음폼 패턴 · **유리 얼룩 위치**(P2/P38 동일) · 붐마이크 · 모니터 발광 위치
**연출 규칙**: 부스 **바깥** 컷 = HANJI 대사는 **꼬리만, 내용은 유리에 가린다** / 부스 **안쪽** 컷에서만 대사가 읽힌다.

## LOC_DESK — 관제/분석 데스크 ("물 ⓑ" + HOO의 밤) ★★ 반전의 무대 · 최우선 SSOT + `WARM_NIGHT`
```
LOC_DESK: cozy dark analyst room drawn in warm cel-shaded anime style, ceiling lights off; a wall of
six simplified rounded monitors glowing teal and cyan is the cool key light, PLUS one warm amber desk
lamp in frame casting a warm pool of light on the desk and soft orange rim light on the characters; the
darkness is deep indigo and violet, never black; faces lit from below in teal with warm amber on the
opposite edge; a replay timeline with a scrubber bar, an enlarged generic 5v5 MOBA minimap, voice-log
waveform strips, layers of colorful post-it notes along the monitor bezels, one visibly worn old headset
resting on the desk (worn shown by SHAPE - flattened earpads - not by grime), two occupied rounded chairs
and ONE EMPTY CHAIR in the corner of the frame, a paper coffee cup, warm wood desktop, a few scattered
papers and pens; simplified rounded props with clean black ink outlines and flat cel fills; colors stay
bright and saturated; COZY AND WARM, absolutely not gloomy, NO photo texture, NO grime, NO film grain
```
**고정 소품(v1과 동일)**: 모니터 6대 벽 · 스크러버 달린 리플레이 타임라인 · 보이스 로그 파형 · 포스트잇 층 · **낡은 헤드셋 하나**(F2 — 심되 회수 금지) · **빈 의자 하나**(W-2 — **언급 0 · 클로즈업 0 · 늘 프레임 구석에**) · 커피컵
**의자 배치 확정**: HOO 자리 · **HANJI가 앉는 두 번째 의자**(P49) · **끝까지 비는 세 번째 의자**(P52).
★ **v2 교정 3종** (P50이 칙칙해진 원인):
1. v1 `ceiling lights OFF` + 광원 = 모니터뿐 → **거의 검정**. **v2: 앰버 데스크 램프를 프레임에 필수로 넣는다.** (조명은 여전히 꺼져 있다 — 램프는 조명이 아니다. **world R6 위반 아님: 천장등은 꺼진 채, 화면은 여전히 가장 밝다.**)
2. v1 `a cold coffee cup` → 모델이 **얼룩진 사진 컵**을 그렸다. **v2: `a paper coffee cup`** (앵커 유지, 때 제거).
3. v1 `warm dark room` → 모호했다. **v2: 어둠의 색을 헥스급으로 못박는다 — deep indigo/violet, never black.**

## LOC_BACKSTAGE — 대기실 · 무대 뒤 복도 (탈락자의 통로) + `WARM_NIGHT`
```
LOC_BACKSTAGE: backstage corridor behind an arena drawn in warm cel-shaded anime style, a green
emergency exit sign glowing softly, one warm-toned flickering fluorescent tube overhead, simplified pipe
truss drawn as clean rounded tubes, taped cables along the floor as simple lines, stacked rounded folding
chairs, blank lanyard name tags with no writing, plain concrete walls in warm gray-violet, the shadows
are deep indigo not black; clean ink outlines on all props, flat cel fills, soft glow around the lights,
no signage, no text anywhere, NO grime, NO photo texture
```
**고정 소품(v1과 동일)**: 초록 유도등 · 깜빡이는 형광등 1개 · 접이식 의자 · **이름표 없는 명찰**
★ **v2 교정**: v1 `damp carpet`(눅눅한 카펫) 삭제 — 사진 질감·때를 부른다. **쓸쓸함은 빈 의자와 텅 빈 명찰로 표현한다.**

## LOC_PCBANG — 심야 PC방 (HANJI의 사적 시간) + `WARM_NIGHT`
```
LOC_PCBANG: cozy late-night korean pc bang drawn in warm cel-shaded anime style, rows of simplified
rounded desks with rainbow RGB keyboard glow, warm amber indirect ceiling light, plastic-wrapped
keyboards drawn simply, worn palm rests shown by SHAPE not by dirt, a blank seat plate with no number,
an instant noodle cup and disposable chopsticks, ring-shaped water marks drawn as simple thin circles,
a deep indigo night window with soft reflections and NO city lights outside, carpeted floor in warm dark
violet; every prop has a clean black ink outline and flat cel fills; the darkness is indigo not black,
cozy and warm, NO photo texture, NO grime
```
**고정 소품(v1과 동일)**: RGB 무지개 발광 · 컵라면 · **완전한 밤 창(도시 불빛 0)** · **HANJI의 오더 노트**(P28 — 표지에 손때, **청록 포스트잇 한 장이 삐져나온다**)
⛔ **노트 안의 글씨를 보여주지 마라**(P37 물증의 몫이다).
★ **v2 교정**: v1 `pitch-black window` → **짙은 남보라 밤 창 + 부드러운 반사.** 창밖 도시 불빛은 **여전히 0**(앵커 유지).

## LOC_CORRIDOR — 아카데미 복도 · 문 (착지 컷) + `WARM_NIGHT`
```
LOC_CORRIDOR: dim academy corridor at night drawn in warm cel-shaded anime style, a door with a frosted
glass insert, WARM GOLDEN LIGHT spilling through the door gap and drawing a long warm rectangle across
the deep-indigo floor, a simplified automatic door closer arm, a BLANK empty wall plaque with no text,
smooth floor with soft reflections of the warm light, walls in warm violet-gray; the corridor darkness is
deep indigo, never black; clean ink outlines on the door and props, flat cel fills, soft glow around the
light spill, no signage, no logos, NO photo texture
```
**고정 소품(v1과 동일)**: **문틈 빛이 바닥에 그리는 긴 사각형** · **빈 명패**(`[[TBD: 아카데미 정보]]` — **글자 0**)
★ **대구 규약**: P18 = HANJI가 **빛을 밟지 않고 지나간다** / P48 = **빛 앞에 선다.** 같은 문 · 같은 빛 · 다른 행동.
★ **v2 보너스**: 문틈 빛이 **따뜻한 금색**이 되면서 "저 안은 따뜻하다"가 그림으로 말해진다. **P48의 착지가 색으로 강화된다.**

---

# §7. 말풍선 시각 규약 (**in-image 베이크** — v1 유지 · 변경 0)

> ⛔ **"이미지 내 텍스트 금지"는 이 하네스의 규약이 아니다.** 말풍선과 한글 대사는 **작화에 함께 생성**된다.

## 7-1. 종류별 시각 스타일

| 종류 | 시각 | 이 회차 사용처 |
|---|---|---|
| **대사** | **흰 둥근 말풍선 + 굵은 검은 테두리**(캐릭터 아웃라인과 같은 굵기) + **화자 입을 향한 삼각 꼬리** | 대부분 |
| **생각** | **흰 구름형 풍선 + 작은 원 3개가 꼬리** | **P3 단 하나** — ⛔ 나레이션 박스 아님 |
| **외침** | **뾰족 폭발형 흰 풍선 + 굵은 테두리** | **P29** 캐스터 — ★ **문(프레임)에 물리적으로 잘린다** |
| **화면 밖 목소리** | **프레임 가장자리에서 잘린 말풍선, 꼬리는 프레임 밖으로.** 화자 얼굴 0 | P12 · P31·P32 · P29 — **새 캐릭터 아님** |
| ★ **꼬리만** | **말풍선 몸체가 유리 반사광에 잠겨 형체만 흐릿하고, 꼬리만 선명하다. 안에 글자 0** | **P2 · P6 · P7** (F1 심기) |
| **화면 텍스트** | 모니터 UI 카드 안의 **굵은 한글**. 말풍선 아님 | **P22** *"만 17세 이상"* — **이 회차 유일한 판독 가능 숫자** |
| ⛔ **계약자/시스템창** | **없음** — 시스템 창·상태창은 존재하지 않는다(판타지 0) | — |

★ **v2 주의**: 말풍선은 **어두운 씬에서도 흰색**이다. 남보라 배경 위에서 흰 풍선은 더 잘 읽힌다 — 풍선을 어둡게 만들지 마라.

## 7-2. 한글 레터링 톤

- **굵은 고딕 산세리프 · 검정 · 고대비 · 가로쓰기.** 세로쓰기 금지. 손글씨체 금지.
- **1행 ≤ 12자 권장 · 2~3행 조판.** 말풍선 여백을 아끼지 마라.
- **평균 13.9자 / 최대 31자**(P50②). ★ **P50② = 3행 조판 필수**: `근데 네가 뭘 / 할 수 있는지는, / 여기서 알아볼 수 있어.`
- ⚠️ **P50①을 절대 생략·축약하지 마라.** ①(*"프로가 될지는 나도 몰라."*)이 없으면 ②가 **약속**이 된다.
- **감정 강세**는 글자 크기·굵기로만. 색 글자·그라데이션 글자 금지.

## 7-3. ★★ 레터링 반전 (이 회차 레터링의 심장 — letterer 직결 · **변경 0**)

| 구간 | 규약 | 독자가 읽는 것 |
|---|---|---|
| **막1 · 부스 바깥**(P2·P6·P7) | **꼬리만.** 내용은 유리에 가려 **판독 0** | *"지면서 말이 많네"* = **흠** (오독) |
| **막2 · 부스 안쪽**(P31~P33) | ★ **안쪽 컷인데 HANJI의 말풍선이 없다.** 팀원 말풍선만 두어 개 | *"집중하는 중"* (오독 강화) |
| **막3 · P38** | ★★★ **말풍선 0 · 꼬리 0.** 입만 남는다 | *"이 사람, 계속 말하고 있었다"* |

> ⚠️ **독자는 이 차이를 의식하지 못해야 한다 — 그게 정확한 설계다.**
> ⛔ **그 공백을 효과음·강조·여백으로 가리키지 마라. 그냥 비어 있어야 한다.**

## 7-4. 자구 변경 금지
- P31 *"왼쪽 비었어."* ↔ P37 *"여긴 왜 비었지?"*
- P26② *"시야"* ↔ P47 *"시야"*
- P3 *"여기 있지?"* ↔ P39 *"여기, 계속 있었어요."* ↔ P51

---

# §8. 금지 목록 (위반 = panel-validator REGEN)

## 8-0. ★★★ 화풍 벽 (v2 신설 — **1급 · 이 회차 최다 결함원**)

1. ⛔ **캐릭터와 배경이 다른 그림체로 보이면 REGEN**(C2 귀속). 사진/3D/실사 배경에 애니 캐릭터를 얹지 마라.
2. ⛔ **배경 소품에 잉크 선이 없으면 REGEN.** 무선 채색 배경 금지.
3. ⛔ **사진 질감 금지**: 재질 그레인 · 먼지 · 얼룩 · 때 · 녹 · 스크래치 · 매크로 지문.
4. ⛔ **사진 조명 금지**: 렌즈 플레어 · 보케 원 · 라이트 리크 · 필름 그레인 · 색수차.
   ※ **그려진 소프트 포커스는 허용**(P2/P38 델타 #2 — 심도 대비는 유지된다). 금지되는 건 **사진 보케**다.
5. ⛔ **검정 어둠 금지.** 어둠은 **짙은 남보라**다.
6. ⛔ **어두운 씬에 따뜻한 광원이 없으면 REGEN** (**예외: LOC_STAGE 단 하나**).
7. ⛔ **저채도·칙칙·음침 금지.** `gloomy · grim · gritty · desaturated · muted · cold gray` = 전부 REGEN 사유.

## 8-1. 리얼리즘 벽 (v1 유지)
8. ⛔ **판타지 0**: 마법 · 시스템 창 · 이세계 · 게임 속 진입 · 초능력 · 미래 기술.
9. ⛔ **동물 능력의 초현실적 사용 0**: HANJI는 **헤엄치지도 날지도 않는다.** HOO는 **날지 않는다.** RAKU는 **나무를 타지 않는다.**
10. ⛔ ★ **화면에 물·바다·하늘·눈밭·숲·둥지를 그리지 마라.** 은유는 **어둠 · 방음 · 좌석 · 시선 방향**으로만 회수한다.
11. ⛔ **HANJI에게 펼친 깃털 날개를 그리지 마라.** 팔은 **짧은 물갈퀴**다.

## 8-2. 사실 벽 (실존 기관 홍보물 · v1 유지)
12. ⛔ **아카데미 고유물 0**: 명칭 · 로고 · 간판 · 현수막 · 수강료표 · 커리큘럼 보드 · 강사 명패 · 협약사 로고 → **무지 벽면 / 빈 명패.**
13. ⛔ **판독 가능한 숫자 0**. **유일 예외: P22 "만 17세 이상".**
14. ⛔ **실존 상용 게임의 UI·챔피언·로고 복제 0** → **일반화된 5v5 MOBA**로 추상화.
15. ⛔ **판독 가능한 영문 0.** ★ 원화의 깨진 영문 아티팩트(*"Aanjil"*, *"Hanjo"*)가 패널에 전이되면 **즉시 REGEN**.

## 8-3. 톤 벽
16. ⛔ **관중·조연의 얼굴 0** — 실루엣 · 뒤통수 · 포커스 아웃. **새 캐릭터 0.**
17. ⛔ **나레이션 박스 0.**
18. ⛔ **효과선·집중선·글리치·스캔라인 남용 0.** 특히 P28·P30·P34·P38.

## 8-4. 렌더 오염 (레퍼런스 첨부의 부작용)
19. ⛔ **흰 스티커 테두리 · 순백 배경 · 다각도 나열 레이아웃 0.**
20. ⛔ **청록 오염 0** — RAKU·HOO 소품에 청록 금지. (※ **앰버 조명은 서명이 아니다** — 오염 아님)
21. ⛔ **테이프 패치는 RAKU의 표식이다** — HOO의 낡은 헤드셋에 테이프를 붙이지 마라(HOO의 낡음 = **눌린 이어패드 + 눌린 헤드밴드**, **때가 아니라 형태**).

## 8-5. ★★★ 공통 negative 프롬프트 (prompt-smith — **전 패널 서픽스 · v2 전면 교체**)

```
NEGATIVE: no photorealistic background, no photographic texture, no photo lighting, no realistic
office render, no live-action background, no 3d render, no CG background, no photobash, no photograph,
no hyperdetailed environment, no material grain, no film grain, no lens flare, no light leaks, no bokeh
circles, no chromatic aberration, no HDR, no gritty, no grime, no dirt, no rust, no stains, no scratched
surfaces, no macro fingerprints, no mismatched art styles, no character pasted onto a realistic
background, no unlined background, no gloomy, no grim, no bleak, no desaturated, no muted colors, no
cold gray palette, no clinical office lighting, no black shadows, no pitch black darkness, no watermark,
no signature, no artist logo, no brand marks, no english text, no latin letters, no gibberish text, no
garbled text, no misspelled korean, no random letters on props, no legible numbers, no digital clock, no
timestamps, no scoreboard digits, no real-game UI, no copyrighted champions, no existing game logos, no
fantasy, no magic, no system window, no status window, no water, no ocean, no sky, no snow field, no
forest, no nest, no spread feathered wings, no flying, no glasses on HANJI, no teal or cyan accents on
RAKU's or HOO's props, no tape patch on HOO's headset, no white sticker outline, no die-cut border, no
reference sheet layout, no turnaround, no multiple views, no character lineup, no white studio
background, no realistic animal anatomy, no crowd faces, no narration box
```

**제거된 v1 negative** (리얼리즘을 강제하던 잔재): 없음 — v1 negative는 리얼리즘을 *강제*하진 않았다.
**진짜 범인은 positive 프롬프트였다**(`HIGHLY DETAILED SEMI-REALISTIC PAINTED ENVIRONMENT`) → §1-4에서 제거 완료.
**추가된 v2 negative**: 사진 렌더링 20종 + 화풍 불일치 3종 + 칙칙함 8종.

---

*개정: art-director · 2026-07-12 (v2 화풍 대전환) · 파일 기반 통신(SendMessage 미사용)*
*근거 서열: **사용자 피드백 > 리서치 가설.** v1의 "배경 극단 리얼리즘"(concept §9-4 / world §0 — 의인화 전환율 상쇄 가설)은 **사용자 육안 판정으로 기각**됐다.*
*사용자 제공 목표 룩 3장(Hanji_4/5 · HOO_3) + 실패 패널 3장(P26·P50·P02) 실물 열람 후 도출 · **캐릭터 외형 재정의 0** · ref-sheet-artist 미호출(재렌더 금지 준수)*
