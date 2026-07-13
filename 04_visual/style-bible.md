# style-bible — EP01 스타일 바이블 (이스포츠 진로 홍보툰)

**확정 일자: 2026-07-12** · art-director
**개정 v2 (화풍 대전환): 2026-07-12** — 사용자 지시에 의한 배경 화풍 전면 교체
**개정 v3 (신규 이야기 《왜 졌는지 말해봐》): 2026-07-13** — **그림 언어(§1·§2·§4) 무변경.** 교체된 것은 **무대(§6 LOC)·연기(§3-A)·물증(§5-A FOG_PATCH)·화면 라벨(§5-C)**뿐이다
입력: `04_visual/refs/INDEX.md` + **레퍼런스 시트 3종 실물 열람**(HOO/Hanji/Raku_ref.png) · **사용자 제공 목표 룩 3종 실물 열람**(`00_input/characters/Hanji_4.png` · `Hanji_5.png` · `HOO_3.png`) · **렌더된 EP01 패널 3종 실물 열람**(P26·P50·P02 — 실패 진단) · `02_story/world.md`(§4 LOC · §7 금기 · R6) · `02_story/concept.md`(§5 톤) · `02_story/twist-plan.md`(§1-3 물증 · §1-4 SSOT 쌍 · §4-4 청록 서명) · `03_episode/ep01_script_final.md`(§0-3 보강 3종)
소비자: **prompt-smith**(전 패널 프롬프트 주입) · **panel-director**(샷리스트) · **letterer**(베이크 명세) · **panel-validator**(C1~C6 판정 기준) · episode-compositor

> **이 문서는 캐릭터 외형을 정의하지 않는다.** 외형 정본은 `04_visual/refs/INDEX.md` + 렌더 완료된 레퍼런스 시트 3장이다.
> 이 문서가 정의하는 것은 **그 캐릭터들이 놓일 화면**이다: 화풍 · 색 · 공간 · 말풍선 · 금지.
> ⛔ **레퍼런스 시트는 재렌더하지 않는다.** ref-sheet-artist 호출 없음. **캐릭터 외형은 v2에서 한 글자도 바뀌지 않았다.**

---

# §0-A. ★★★ v3 개정 요약 (2026-07-13 · **prompt-smith는 이 절부터 읽는다**)

> **v2의 그림 언어는 사용자 승인·검증을 통과한 자산이다. 한 글자도 안 바뀌었다.**
> §1(작화) · §2-1~2-4(색·조명 토큰) · §4(화면비) · §7-1~7-2(말풍선 시각) = **그대로 쓴다.**
> **바뀐 것은 "그 언어로 무엇을 그리는가"다** — 이야기가 통째로 교체됐기 때문이다.

## 0-A-1. 갈아끼우기 표 (v2 → v3 · 이대로 실행)

| # | v2 (폐기) | **v3 (대체)** |
|:-:|---|---|
| **1** | LOC 7종(`LOC_PRACTICE`·`LOC_STAGE`·`LOC_BOOTH`·`LOC_DESK`·`LOC_BACKSTAGE`·`LOC_PCBANG`·`LOC_CORRIDOR`) | ★ **LOC 5종으로 전면 교체**(§6): `LOC_LOBBY` · `LOC_CORRIDOR` · `LOC_PRACTICE` · `LOC_ANALYSIS` · `LOC_ENDCARD`. ⛔ **무대·부스·PC방·백스테이지는 이 회차에 존재하지 않는다** |
| **2** | 조명 배분: 밝은 곳 1(연습실) · 어두운 곳 4 | ★★ **기본값이 밝음으로 뒤집혔다.** `WARM_DAY` = **LOBBY·CORRIDOR·PRACTICE·ENDCARD(4/5)** / `WARM_NIGHT` = **LOC_ANALYSIS 단 하나.** ⛔ **차가운 공간 0 — LOC_STAGE 예외 조항은 함께 폐기됐다** |
| **3** | §3 연기 규정 *"과장 리액션 금지 · 표정 변화는 작게"* | ★★★ **명시적 폐기.** → **§3-A 표정 연기 규정**(표정이 감정을 명확히 전달해야 한다 · 27컷 코드 H1~H9/R1~R9/O1~O9) |
| **4** | §5-A **P37 청록 파형 물증**(2단 파형 띠) | ★★★ **§5-A `FOG_PATCH`로 전면 교체** — 미니맵 남보라 반투명 덮개 + 한글 라벨 `시야 없음`. **이 회차 반전의 유일한 물증** |
| **5** | §5-B **P2↔P38 부스 유리 쌍**(`LOCKED_COMPOSITION`) | **§5-B 3대구 잠금으로 교체**: P22↔P23(스크러버) · P03↔P52(눈) · P20/P24↔P46(FOG 있음↔없음) |
| **6** | *"화면 문자·판독 가능 숫자 0"* (P22 만17세만 예외) | ★★ **화면 한글 라벨은 이제 필수다**(§5-C 화이트리스트 12종). **숫자·영문 0은 유지**(예외: `FC 온라인` — 정식 명칭) |
| **7** | §8-0-6 *"어두운 씬 = 따뜻한 광원 필수 (예외: LOC_STAGE)"* | **예외 조항 삭제.** 이 회차에 예외는 **없다** — 어두운 컷은 LOC_ANALYSIS뿐이고, **거기엔 앰버 램프가 반드시 있다** |

## 0-A-2. ⛔ v3에서 **바뀌지 않은 것**

- **캐릭터 외형** — `refs/INDEX.md` + 시트 3장이 정본. **ref-sheet-artist 미호출 · 재렌더 금지.**
- **§1 전체**(한 화면 한 손 · 잉크 선 배경 · 셀 채색 · 둥근 소품) · **§1-4 `STYLE:` 블록 문자열**.
- **§2 색**(남보라 어둠 · 앰버 따뜻한 키 · 인디고 그림자 · 청록 서명 · 온도 대비) · **`WARM_NIGHT`/`WARM_DAY` 토큰 문자열**.
- **§4 화면비 3종**(A/B/C) · **§7 말풍선 시각 규약** · **§8-0~8-4 금지 목록**(패널 번호만 갱신).
- **헤드셋 색 식별자**: HOO=네이비 / HANJI=시안청록 / RAKU=빨강. **눈: RAKU만 초록.**

---

# §0. ★★★ v2 변경 요약 (화풍 대전환 — **아래는 여전히 유효한 화풍 근거다**)

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
| **5** | LOC_* 7종 문자열 **전부** | ~~§6의 새 7종~~ → **⚠️ v3에서 재교체됨: §6의 LOC 5종이 정본이다**(§0-A-1 #1) |
| **6** | `NEGATIVE:` 블록 | **§8-5의 새 블록으로 교체** (리얼리즘 강제 문구 제거 + 이질감 유발 20여 항목 차단 추가) |
| **7** | `low illumination, high saturation` 단독 사용 | **금지.** 반드시 `WARM_NIGHT` 토큰과 **함께** 쓴다 |

## 0-4. ⛔ v2에서 **바뀌지 않은 것** (건드리면 회차가 깨진다)

- **캐릭터 외형** — `refs/INDEX.md` + 시트 3장이 정본. **v2는 캐릭터를 1픽셀도 안 건드린다.**
- **헤드셋 색 식별자** (HOO=네이비 / HANJI=시안청록 / RAKU=빨강) · **청록 서명 규약**(§2-3)
- **말풍선 시각 규약**(§7-1·§7-2)
- ~~P37 물증 명세~~ · ~~P2↔P38 `LOCKED_COMPOSITION`~~ → **⚠️ v3에서 폐기·교체됨**(§0-A-1 #4·#5). 그 이야기는 존재하지 않는다.
- **밝음↔어둠의 상대적 대비**: 어둠은 **이야기 장치**다(world R1 — **불을 끄면 화면이 더 잘 보인다**). **대비는 유지, 어두운 쪽의 톤만 따뜻하게.**
  ⚠️ v3에서 어두운 공간은 **LOC_ANALYSIS 하나뿐**이며, **나머지 4곳은 전부 밝다.**
- **판독 가능 숫자/영문 금지 · 물/하늘/눈밭 금지 · 실존 게임 UI 금지 · 관중 얼굴 금지**
  ⚠️ 단 **한글 화면 라벨은 v3에서 허용·필수로 뒤집혔다**(§5-C).

## 0-5. 렌더 영향 범위

⚠️ **v3 = 새 이야기다. 기존 패널 자산은 전부 `_archive/`로 이관됐다 — 56패널 전량 신규 렌더.**
**카나리아 5장 필수**: 대표 5장(**밝은 씬 1 · LOC_ANALYSIS 어두운 씬 1 · ★FOG_PATCH + `시야 없음` 라벨 1 · 직군 보드 한글 4칸 1 · 표정 클로즈업 1**)을 먼저 렌더해 ① 캐릭터-배경 화풍 통일 ② **한글 라벨 판독성** ③ **표정이 실제로 나오는가**를 육안 확인한다.
→ ②·③이 실패하면 **회차가 죽는다**(v1 폐기 사유 그대로).

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
> **모든 어두운 씬에는 화면 안에 따뜻한 광원이 최소 1개 있다.** (★ **v3: 예외 없음** — 어두운 곳은 `LOC_ANALYSIS` 하나뿐이고, 거기엔 **앰버 램프가 반드시 있다**)

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
| ★ **HANJI 청록 (서명색)** | **`#2FB3A8`** — 물증 전용 잉크 | ★ **v3: 게임 화면의 청록 격자·미니맵 밝은 구역.** **그가 짚을 때 손(청록 헤드셋)과 화면이 같은 색으로 만난다** |
| **HANJI 헤드셋** | 레퍼런스 실물 = **더 밝은 시안-청록**(`#4FC3F7`계) | 헤드셋만. **시트가 정본** |
| ★★ **어둠 (신규)** | **짙은 남보라 `#2E2A4F` ~ `#3A3260`** — ⛔ **검정 금지** | 모든 어두운 씬의 앰비언트 · 그림자 |
| ★★ **그림자 (신규)** | **인디고-보라 `#4A3F6B`** (중성 회색·검정 아님) | 전 패널의 그림자 색 |
| ★★ **따뜻한 키 (신규)** | **앰버 `#FFB870`** / 램프 코어 `#FFD9A0` | **모든 어두운 씬에 1개 이상 필수** — 스탠드 · 웜 LED 스트립 · 화면의 따뜻한 반사 |
| ★★ **캐릭터 림라이트 (신규)** | 따뜻한 주황 `#FFA366` | 어두운 씬에서 **캐릭터 가장자리** — 인물과 배경이 같은 빛을 공유한다는 증거 |
| **화면광 (v3)** | 청록-시안 (`#4FC3F7` ~ `#2FB3A8`) — **차가운 키** | ★ **`LOC_ANALYSIS`의 벽면 대형 화면** — 세 얼굴의 한쪽을 청록으로 물들인다 |
| ★★ **FOG_PATCH (v3 신규)** | **짙은 남보라 `#2E2A4F` 반투명 (~70%)** — ⛔ **검정 금지** | **미니맵의 시야 없는 구역**(§5-A) |
| **실내등** | ★ **따뜻한 크림 화이트** (차가운 형광등은 폐기 — 그게 배경을 사무실로 만들었다) | `LOC_PRACTICE` · `LOC_LOBBY` · `LOC_CORRIDOR` |
| ★ **골든 낮빛 (v3)** | 따뜻한 금색 오후 햇살 | **통유리(LOBBY)** · **블라인드 슬랫 줄무늬(CORRIDOR·PRACTICE)** · ★ **ANALYSIS의 블라인드 틈**(여긴 아직 낮이라는 증거) |
| **RGB** | 무지개 키보드 발광 (저채도로 죽이지 말 것) | `LOC_PRACTICE` 키보드 |
| ⛔ **무대광 (폐기)** | ~~차가운 청백 + LED 보드 블루~~ | **v3에 무대는 없다. 차가운 공간 0.** |

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

### WARM_NIGHT (**v3: 어두운 씬 = `LOC_ANALYSIS` 단 하나. 그 방의 전 컷에 주입**)
```
WARM_NIGHT: cozy warm night lighting - the darkness is DEEP INDIGO AND VIOLET, never black; teal-cyan
screen glow as the cool key light, PLUS at least one WARM AMBER LIGHT SOURCE visible in frame (desk
lamp, warm LED strip, or warm bounce off a surface) casting soft orange rim light on the characters and
a warm pool of light on the desktop; shadows are saturated indigo-purple, never neutral gray; warm and
cool colors meet on every surface; soft glow and gentle bloom around lights; colors stay bright and
saturated; low illumination but COZY AND INVITING, absolutely not gloomy or grim
```

### WARM_DAY (**v3: 기본값. `LOC_LOBBY` · `LOC_CORRIDOR` · `LOC_PRACTICE` · `LOC_ENDCARD` — 즉 5곳 중 4곳**)
```
WARM_DAY: warm bright lighting - creamy warm-white ceiling light, soft golden afternoon daylight
through the blinds, warm wood and cream surfaces, gentle peach-tinted shadows, airy and clean; high key
and cheerful, absolutely not clinical, not blue-gray, not a cold office
```

## 2-5. ★★★ 조도의 위계 (**v3 전면 교체 — 이 회차는 밝다**)

```
[가장 밝음]   LOC_LOBBY      통유리 골든 오후 햇살 · 크림 화이트     WARM_DAY   ← 들어오는 곳 · 나가는 곳
[밝음]        LOC_CORRIDOR   블라인드 골든 줄무늬 빛                 WARM_DAY   ← 이동 · 호흡
[밝음]        LOC_PRACTICE   크림 웜 화이트 + 골든 햇살              WARM_DAY   ← 손이 배우는 곳
[아늑한 어둠] LOC_ANALYSIS   남보라 + 앰버 램프 + 청록 화면광        WARM_NIGHT ← ★ 눈이 배우는 곳 · 반전
[밝음]        LOC_ENDCARD    로비 햇살 승계                          WARM_DAY   ← 착지
```

> ### **불을 끄는 방이 이 회차에서 유일하게 진실이 보이는 방이다.** (world R1)
> ⚠️ **어둠 ≠ 침울.** LOC_ANALYSIS는 **영화관**이지 심문실이 아니다.
> **앰버 램프 1개(필수) · 블라인드 틈으로 새어드는 낮빛 · 세 얼굴에 얹힌 따뜻한 주황 림라이트.**
> 상영 전의 **설렘**이지 취조의 **압박**이 아니다.

### ⛔ v2의 "LOC_STAGE 예외 조항"은 폐기됐다
무대는 이 회차에 **존재하지 않는다.** 따라서 **차가운 공간은 0개**이며,
**§8-0-6(어두운 씬 = 화면 안 따뜻한 광원 필수)에 예외가 없다.** LOC_ANALYSIS의 앰버 램프는 **면제 불가**다.

---

# §3. 분위기 (톤)

| 축 | 규정 |
|---|---|
| **장르** | 현실 직시형 진로 드라마. 1회 완결 드라마형 |
| **감정 타깃** | **사이다 아님. 안도.** *"이 어른은 나에게 헛바람을 넣지 않는다."* |
| **핵심 낙차** | **귀여운 작화 × 무거운 대사.** 화면은 밝고 아늑하고 선명, **대사만 무겁다** |
| ★ **온기 (v2 유지)** | **어떤 장면도 독자를 춥게 만들지 않는다.** 어두운 컷엔 화면 안 따뜻한 광원 1개 필수 (**v3: 예외 없음**) |
| ★★★ **연기 (v3 전면 교체)** | ~~과장 리액션 금지 · 표정 변화는 작게~~ → ⛔ **폐기.** **§3-A가 정본이다** |
| **효과** | 효과선·집중선은 **절제하되 금지는 아니다** — **놀람의 순간(P24 한타·P41 패배·P47 성공)엔 가벼운 임팩트 표현 허용.** ⛔ **글리치·스캔라인·픽셀 노이즈는 여전히 0**(§8-0-3·§3-4) · ⛔ P31(반전 자구 컷)엔 효과선 0 |
| **군중** | ⛔ **조연의 얼굴을 그리지 마라** — 실루엣 · 뒤통수 · 화면 밖 목소리. **새 캐릭터 0** |

---

# §3-A. ★★★ 표정 연기 규정 (**v3 신설 — v1을 죽인 룰의 정확한 반대**)

## 3-A-0. 폐기 선언 (prompt-smith·panel-validator는 이 문단을 인용해 판정한다)

> ## ⛔ ***"과장 리액션 금지" · "표정 변화는 작게"* 규정은 폐기됐다.**
> **그 규정이 v1을 죽였다.** 사용자 판정: ***"표정이 없다" · "얼굴이 안 보인다."***
> 사용자가 만든 마스코트의 **최대 자산은 표정**인데, 스타일 바이블이 그것을 스스로 봉인했다.

### ✅ 대체 규정 — **표정은 감정을 명확히 전달해야 한다**

| # | 규정 | 집행 |
|:-:|---|---|
| **1** | ★ **한 컷의 감정은 얼굴만 보고 이름 붙일 수 있어야 한다.** 대사를 가리고 봐도 *"놀랐다/억울하다/뿌듯하다/머쓱하다"*가 읽혀야 한다 | 읽히지 않으면 = **무표정 = v1 회귀 = REGEN** |
| **2** | **감정은 얼굴 4부위 전부로 만든다**: **눈꺼풀 · 눈썹 · 부리(입) · 고개 각도.** 하나만 움직이면 표정이 아니다 | ACTING 블록은 **4부위를 전부 지정**한다(§3-A-1) |
| **3** | ★ **감정 안테나**를 함께 움직인다: HANJI = **정수리 깃털 한 가닥** / RAKU = **귀 + 줄무늬 꼬리** / HOO = **안경 반사광 + 고개 기울기** | 종족 신체가 감정을 증폭한다 — 이것이 마스코트의 특권이다 |
| **4** | **밝음이 기본값이다.** 이 회차의 지배 정서는 **호기심 · 놀람 · 뿌듯함 · 머쓱함**이지 침울·체념이 아니다 | ⛔ `deadpan` · `expressionless` · `blank stare` · `subtle expression` = **negative에 박는다** |
| **5** | ⛔ **단, 세 캐릭터의 진폭은 다르다.** 미소의 크기: **RAKU > HANJI > HOO** | HOO의 O9(유일한 미소)를 RAKU급으로 그리면 **캐릭터가 무너진다** |
| **6** | ⛔ **과장이 허용되는 것은 감정이지 왜곡이 아니다.** 얼굴이 프레임을 뚫거나(초광각) 데포르메로 무너지지 않는다 | 등신·비율은 refs 시트 고정 |

## 3-A-1. 27컷 표정 코드 — **정본은 `02_story/characters.md`다**

> **prompt-smith: 표정을 창작하지 마라. characters.md의 표정표에서 해당 행을 ACTING 블록으로 그대로 복사한다.**
> 각 행은 이미 **눈 · 눈썹 · 부리(입) · 고개/몸 · 감정 안테나**까지 지정돼 있다. 그것이 프롬프트 문장이다.

| 캐릭터 | 코드 | 출처 (Read 경로) |
|---|---|---|
| **HANJI** | **H1**(긴장한 도착) · **H2**(찔림) · **H3**(머뭇거림) · **★H4**(무심코 짚음 — 분석 모드 ON) · **H5**(짚고 나서 후퇴) · **★★★H6**(이름을 듣고 놀람) · **H7**(얼떨떨한 뿌듯함) · **H8**(조용한 확신) · **★H9**(살짝 웃음) | `02_story/characters.md` §1 표정 레퍼토리 |
| **RAKU** | **R1**(자신만만) · **R2**(깔봄) · **R3**(어이없음) · **★R4**(패배의 순간) · **★★R5**(억울함) · **R6**(못 믿겠음→시도) · **★R7**(되는데?) · **★★R8**(인정하기 싫은 머쓱함) · **★R9**(배우려는 얼굴) | `02_story/characters.md` §2 표정 레퍼토리 |
| **HOO** | **O1**(읽는 눈) · **O2**(과제를 던짐) · **O3**(무판정) · **★O4**(눈이 열림) · **★O5**(짚어주는 확신) · **★★★O6**(이름을 붙임) · **O7**(한 개만 고쳐줌) · **O8**(현실을 말함) · **★O9**(마지막의 짧은 미소) | `02_story/characters.md` §3 표정 레퍼토리 |

**27컷 전부가 회차 어딘가에 배치돼야 한다.** 미배치 = 캐릭터 미구현 = v1의 실패(script_final §C-3 하드룰 3 통과 확인됨).

## 3-A-2. ★ 표정 SSOT 앵커 (**ACCEPT-FLAG 통과 불가 — 기준 만족까지 재렌더**)

| 코드 | 패널 | 통과 기준 (panel-validator) |
|:-:|:-:|---|
| **H4** | **P20** | 눈꺼풀 **완전히 올라감** · 동공 또렷 · 부리 벌어져 말하는 중 · 정수리 깃털 **곧게 섬** · ⛔ **미소 0**(이건 집중이다) |
| **H6** | **P33** | ★★★ **눈 최대 개방** · 호박색 홍채가 꽉 참 · **부리가 완전히 벌어진 채 멈춤** · ⛔ **미소 0**(이건 놀람이다) |
| **R5** | **P42** | ★★ **아래 눈꺼풀이 위로 올라온 울먹 직전 눈** · 입이 아래로 꺾인 역U · 뺨 부풀림 · **귀 뒤로 · 꼬리 처짐** — **회차 감정 하이라이트. 여기서 표정을 아끼면 v1 회귀다** |
| **R7** | **P47** | **눈 최대 개방 + 초록 홍채 하이라이트 폭발 · 입 활짝(이빨) · 엉덩이가 뜬다** — 이 회차 유일한 신체적 환희 |
| **R1↔R9** | **P03↔P52** | **같은 앵글 · 같은 구도 · 눈만 정반대**(반쯤 감긴 눈 ↔ 정면 큰 눈). 대구가 2차 반전을 완성한다 |
| **O6** | **P31** | ★★★★ 정면 클로즈업 · **안경 반사광 걷힘(눈이 보인다)** · 부리 또렷하게 벌어져 발음 · ⛔ **미소 0 · 끄덕임 0**(§3-A-3) |

## 3-A-3. ⛔ 표정 누출 차단 — **"무표정"이 아니라 "상황에 맞는 표정"**

레퍼런스 시트를 `codex -i`로 첨부하면 **외형과 함께 카탈로그 표정(반짝이는 눈 + 영업용 미소)이 복사된다.**

> ### **차단 대상은 "상황에 안 맞는 카탈로그 미소"이지 "표정 자체"가 아니다.**
> ⚠️ **prompt-smith 오해 금지**: 누출 차단을 **무표정 지시로 번역하면 v1을 그대로 재생산한다.**
> 방법은 **표정을 지우는 것이 아니라, 더 구체적인 표정으로 덮어쓰는 것**이다.

| 컷 | 시트 미소를 | 이유 |
|---|---|---|
| **H4 · H6 · O6 · R4 · R5 · O1 · O3** | ⛔ **이긴다**(ACTING이 덮어쓴다) | 집중·놀람·선언·패배·억울함 — **미소가 오답인 컷** |
| **H7 · H9 · R7 · O9** | ✅ **막지 마라 — 미소가 정답이다** | 단 **진폭은 RAKU > HANJI > HOO**(§3-A-0 규정 5) |

상세 문자열·per-패널 매핑은 **`04_visual/character-sheets.md` §4**가 정본.

---

# §4. 화면비 · 해상도 (v1 유지 — 변경 0)

**세로 스크롤 뷰어 기준. 모든 패널은 좌우 풀블리드.**

| 코드 | 화면비 | 해상도 | 용도 |
|:-:|---|---|---|
| **A (기본)** | **세로 2:3** | **1024 × 1536** | 인물 컷 · 대사 컷 · 표준. **전체의 ~70%** |
| **B (와이드)** | **가로 3:2** | **1536 × 1024** | 설정샷 · 공간 확립 · 화면 정면 · 좌석 배치 |
| **C (정방)** | **1:1** | **1024 × 1024** | 손 클로즈업 · 소품 클로즈업 (P28·P30·P34·P43) |

### ⛔ 화면비 하드 룰 (**v3 — 새 패널 번호 기준**)
- ★★★ **화면(미니맵·타임라인·직군 보드)이 나오는 컷은 반드시 B(1536×1024).**
  → **P14 · P15 · P20 · P22 · P23 · P24 · P32 · P39 · P44 · P46 · EC2(P56)**.
  **이유: 한글 라벨(`시야 없음`·`되감기`·`전력분석관`)이 판독되려면 화면이 커야 한다.** 세로 컷에 화면을 욱여넣으면 라벨이 깨진다 = 회차가 죽는다.
- ★ **P03 과 P52 는 반드시 같은 코드(A · 1024×1536)** — 대구 쌍(눈만 정반대).
- ★ **P22 → P23** 은 **같은 코드 · 같은 앵글**(스크러버 위치만 다르다).
- ★ **P20 / P24 → P46** 은 **같은 코드 · 같은 화면 크기**(FOG_PATCH 있음↔없음 대조).
- **P31**(반전 자구) = **A**. 정면 클로즈업 · 배경 단순화 · 말풍선 1개에 면적을 몰아준다.
- **P33 · P42 · P47**(무대사/감정 정점) = **A**. **얼굴이 프레임의 절반 이상**을 차지한다.
- **P51**(27자) · **P32**(28자 + 25자 2말풍선) = **말풍선 면적을 아끼지 마라.** 저밀도 배경 컷.
- **여백은 패널이 아니다.** episode-compositor의 `gap` 값으로 처리한다.
- ⛔ **C(1:1) 사물 클로즈업 예산 = 회차 전체 최대 8장**(하드룰 1). **얼굴 없는 컷을 여기 낭비하지 마라.**

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

## 5-2. ★ SSOT 앵커 (**ACCEPT-FLAG 통과 불가** — 기준 만족까지 재렌더 또는 사용자 에스컬레이션)

**P20**(FOG_PATCH + `시야 없음` 라벨 + 짚는 손) · **P22↔P23**(되감기 대구) · **P24**(덮개에서 적이 쏟아진다) ·
**P31**(반전 자구 · O6) · **P32**(직군 보드 4칸 한글) · **P33**(H6 놀람) · **P42**(R5 억울함) ·
**P46**(FOG 없음) · **P03↔P52**(R1↔R9 대구) · **P53**(H9 + 짚는 손 재연)

> 전체 11종의 통과 기준은 `03_episode/ep01_script_final.md` §D-1이 정본. 여기서는 **시각 규격만** 확정한다.

---

## 5-A. ★★★ `FOG_PATCH` — 반전의 물증 (**v3 신설 · 이 회차 최중요 시각 장치**)

> ## **안 읽히면 회차가 죽는다.**
> v1은 물증(청록 파형 2개)에 **라벨을 안 붙여서** 반전이 독자에게 도달하지 못했고, 그래서 폐기됐다.
> **v3의 물증은 라벨이 붙는다.** 이것은 스타일이 아니라 **회차의 생존 조건**이다.

### 5-A-1. 정의

**`FOG_PATCH` = 미니맵의 한 사분면(왼쪽 위)을 덮은 짙은 남보라 반투명 덮개 + 그 위의 한글 라벨 `시야 없음`.**
= *"여긴 안 보였다"* = **패배의 원인.** RAKU의 오답(*"한타 졌잖아요"*)이 짚은 곳이 **아닌** 곳.

```
   미니맵 (둥근 모서리 정사각형 · 화면 우하단 고정)
 ┌───────────────────────┐
 │▓▓▓▓▓▓▓▓▓╲   시야 없음  │  ← ★ FOG_PATCH: 왼쪽 위 사분면이 짙은 남보라
 │▓▓▓▓▓▓▓▓▓▓╲            │     반투명 덮개로 덮여 있다. 가장자리는 부드러운 곡선.
 │▓▓▓▓▓▓▓▓╱              │     ⛔ 그 안에 아무것도 안 보인다 — 빨간 점 0.
 │ ╲▓▓▓▓╱      ●  ●      │
 │          ●  ●  ●      │  ← 파란 점 5개는 반대편(오른쪽 아래)에 뭉쳐 있다
 └───────────────────────┘
```

### 5-A-2. ★★★ 렌더 규격 (**prompt-smith: 아래 문자열을 그대로 복사한다. 한 글자도 바꾸지 마라**)

```
FOG_PATCH: on the generic 5v5 minimap in the lower-right corner of the big screen, the ENTIRE UPPER-LEFT
QUADRANT is covered by a DEEP INDIGO-VIOLET SEMI-TRANSPARENT FOG OVERLAY (color #2E2A4F, about 70% opacity,
NEVER black, NEVER grey, NEVER pure shadow); its edge is a soft irregular hand-drawn CURVE with a clean ink
line, clearly separating covered from uncovered - the boundary must read at a glance, no muddy gradient;
INSIDE the fog NOTHING is visible - no dots, no terrain, no shapes, it is simply blank and hidden; OUTSIDE
the fog the teal-cyan grid and rounded terrain blobs are crisp and clearly lit; FIVE BLUE DOTS are clustered
together in the opposite corner (lower-right of the minimap), far from the fog, all facing away from it; a
short bold Korean label "시야 없음" is printed directly on or beside the fog overlay in heavy white gothic
sans-serif with a dark outline, LARGE and clearly legible, reading as a UI tag; the minimap has rounded
corners, clean flat cel fills, soft glow, drawn NOT photographed
```

### 5-A-3. 규격 표 (panel-validator C2/C3 판정 기준)

| 축 | 명세 | FAIL 조건 |
|---|---|---|
| **위치** | 미니맵 **왼쪽 위 사분면**. 미니맵은 대형 화면 **우하단 고정** | 사분면이 컷마다 옮겨 다닌다 |
| **색** | ★ **짙은 남보라 `#2E2A4F` 반투명 (약 70%)** | ⛔ **검정 · 회색 · 단순 그림자 = 즉시 REGEN**(§8-0-5) |
| **경계** | **부드럽고 불규칙한 손그림 곡선 + 잉크 선.** 덮인 곳/안 덮인 곳이 **한눈에 갈린다** | 어중간한 그라데이션 · 직선 · 사진 노이즈 |
| **내부** | **아무것도 없다.** 점 0 · 지형 0 | 덮개 안에 뭔가 보인다(= "안 보인다"가 무너진다) |
| **외부** | **청록 격자가 또렷하다** | 화면 전체가 어두워 대비가 안 산다 |
| **점 배치** | **파란 원 5개 = 반대편(우하단)에 뭉쳐 있다** — 적을 안 보고 있다 | 파란 점이 덮개 근처에 있다 |
| ★★★ **라벨** | **`시야 없음`**(5자) · **굵은 흰 고딕 + 어두운 외곽선** · **크게 · 판독 가능** | ⛔ **라벨이 없거나 깨지면 P20은 ACCEPT-FLAG 통과 불가 — 판독될 때까지 재렌더** |
| **렌더 문법** | 셀 채색 · 부드러운 글로우 · 둥근 모서리 | ⛔ 스캔라인 · 글리치 · 픽셀 노이즈 · 사진 화면 질감 |

### 5-A-4. ★★ 라벨의 등장·유지·소멸 (**시간 축 — 이걸 틀리면 반전이 안 터진다**)

| 패널 | FOG_PATCH | **`시야 없음` 라벨** | 이유 |
|:-:|:-:|:-:|---|
| **P14 · P15** | ✅ **보인다** | ⛔ **없다** | **사후 필연성.** RAKU가 오답을 말할 때 답은 **이미 화면에 있다.** ⛔ 하이라이트·화살표·강조 원 0 — **보이되 강조되지 않는다** |
| **P20** | ✅ | ★★★ **여기서 처음 붙는다** | HANJI가 짚는 순간 = 라벨이 붙는 순간. **얼굴 + 짚는 물갈퀴 + 라벨이 한 프레임** |
| **P22 · P23 · P24** | ✅ | ★★ **유지된다** | **P24 = "`시야 없음`이라 적힌 상자에서 빨간 원 5개가 쏟아져 나오는 그림."** 이 한 컷이 인과를 **추론 없이** 전달한다 |
| **P39** | ✅ | ⛔ **없다** | RAKU의 둘째 판 시작 — **독자는 아는데 RAKU만 모른다**(정보 격차 역전) |
| **P44** | ✅ | ✅ | HOO의 날개가 **그 구역을 톡 짚는다**(딱 하나만 고친다) |
| **P46** | ⛔ **없다** | ⛔ **없다** | ★ **밝아진 것이 라벨의 부재다.** 청록 격자가 **끝까지 다 보인다.** ⛔ FOG가 있으면 즉시 REGEN |

### 5-A-5. ⛔ 화면 안 절대 금지

`숫자 전부`(KDA · 체력 · 시간 · 점수 · 승률) / `영문` / `실존 게임 UI · 챔피언 초상 · 스킬바 · 로고` /
`화살표 · 강조 원 · 비교 자막` / `화이트리스트(§5-C) 밖의 한글` / `깨진 한글`
→ 눈금이 필요하면 **숫자 라벨 없는 짧은 틱 마크**만.

---

## 5-B. ★★★ 3대구 잠금 (**v3 — 반전의 시각 문법. 세 쌍은 같은 앵글로 못 박는다**)

> **prompt-smith: 각 쌍의 두 프롬프트에 아래 `LOCKED_*` 문자열을 그대로 복사한다.**
> **panel-validator: 쌍 대조로 검증한다**(한 장씩 보면 못 잡는다).

### ⓐ **P22 ↔ P23** — 되감기 (움직이는 것은 스크러버 하나뿐)

```
LOCKED_REWIND_P22_P23:
identical camera on the big analyst-room screen, straight-on, same distance, same framing, same minimap
in the lower-right with the same FOG_PATCH and the same "시야 없음" label in the same place; the ONLY
difference between the two panels is the position of the round scrubber on the bottom replay timeline bar
- it sits on the RIGHT in the first panel and on the LEFT in the second; the "되감기" label and the "◀◀"
icon stay in the same spot on the left of the bar; identical lighting, identical colors
```
★ **P22의 `◀◀`는 눌린 상태로 빛난다.** ★ **HOO의 날개(손)가 스크러버를 뒤로 끄는 동작이 보인다.**

### ⓑ **P03 ↔ P52** — 호칭의 온도 (움직이는 것은 눈과 몸의 방향뿐)

```
LOCKED_RAKU_P3_P52:
identical camera on RAKU, same eye level, same three-quarter angle, same bust framing, same scale,
same shoulder line height, same bright practice-room lighting; the ONLY differences are his EYES and
which way his body points
```
| | **P03**(막1) | **P52**(막5) |
|---|---|---|
| **눈** | **R1** — 반쯤 감긴 눈, 위에서 아래로 훑는다 | ★ **R9** — **눈 정면·최대 개방.** R1의 정확한 반대 |
| **몸** | 뒤로 기대 다리 꼬기. **HANJI를 등진다** | ★ **의자가 HANJI를 정면으로 향한다.** 손가락이 화면을 가리킨다 |
| **배경** | 그가 앉은 **벽쪽 1인석** | ★ **1인석은 비어 있다** (그는 5연석 쪽으로 왔다) |
⛔ **누구도 이 변화를 대사로 설명하지 않는다.** 구도가 말한다.

### ⓒ **P20 / P24 ↔ P46** — 보이지 않던 것이 보인다

```
LOCKED_MINIMAP_SCALE:
the minimap is rendered at the SAME SIZE and the SAME position (lower-right of the big screen) and shot
from the SAME camera distance in every panel where it appears; the viewer must be able to compare them
directly across panels
```
**P20/P24** = FOG_PATCH **있음** + 라벨 **있음** → **P46** = FOG_PATCH **없음** + 라벨 **없음** + 청록 격자가 끝까지 보인다.
> **이 대조가 RAKU의 대사 *"…밝은데?"*를 그림으로 증명한다.**

---

## 5-C. ★★★ 화면 한글 라벨 규격 (**v3 신설 — v1의 "화면 문자 0" 룰은 폐기됐다**)

> ⛔ **v1은 화면에 라벨을 못 쓰게 해서 반전이 전달되지 않았다.** brief 하드룰 4가 그것을 뒤집었다:
> ### **화면의 증거에는 반드시 대사나 라벨이 붙는다. 독자가 추론할 것 = 0.**

### 5-C-1. 화이트리스트 (**이것만 그린다 — 밖으로 나가면 REGEN**)

| 라벨 | 자수 | 어디에 | 등장 패널 |
|---|:-:|---|---|
| **`시야 없음`** | 5 | ★★★ 미니맵 FOG_PATCH 위 | P20 · P22 · P23 · P24 · P44 |
| **`되감기`** | 3 | 타임라인 좌측 | P22 · P23 |
| **`◀◀`** | 2 | 되감기 아이콘 (눌리면 빛난다) | P22 · P23 |
| **`한타`** | 2 | 화면 하단 작은 태그 | P14 |
| **`전력분석관` `코치` `감독` `운영`** | 5/2/2/2 | ★★ 분석실 벽 **직군 보드 4칸** | P32 (정면·전 칸 판독 가능) |
| **`농심 이스포츠 아카데미`** | 12 | 로비 벽 명패 | P01 · P54 · EC1 |
| **`리그 오브 레전드` `발로란트` `FC 온라인`** | 8/4/7 | 엔드카드 과정 보드 | EC2 **한정** |

⛔ **위 목록 밖의 화면 문자는 전부 금지.** ⛔ **머리글 라벨 금지**(`개설 과정` 등 — 화이트리스트에 없다).

### 5-C-2. ★ 판독 가능성 규격 (**이게 안 지켜지면 회차가 죽는다**)

| # | 규정 | 근거 |
|:-:|---|---|
| **1** | **굵은 고딕 산세리프 · 고대비 · 가로쓰기.** 손글씨체·세로쓰기·장식체 금지 | codex는 얇고 작은 한글을 깨뜨린다 |
| **2** | ★ **크게.** 라벨은 **UI 태그처럼** 그려진다 — 화면 폭의 **1/5 이상**을 쓰는 것을 두려워하지 마라 | 작게 그리면 판독 실패 |
| **3** | ★ **짧게.** 화면 라벨 1개 = **최대 5자.** 문장·설명 금지 | 길수록 깨진다 |
| **4** | **명도 대비**: 어두운 덮개 위 = **흰 글자 + 어두운 외곽선** / 밝은 화면 위 = **검은 글자** | 남보라 위 흰 글자가 가장 안전하다 |
| **5** | ★★ **화면이 나오는 컷은 B(1536×1024)** — 라벨에 픽셀을 준다 | §4 화면비 하드룰 |
| **6** | ⛔ **판독 가능한 숫자 0 · 영문 0** (유일 예외: **`FC 온라인`** — 정식 명칭) | brief 사실 벽 |
| **7** | ⛔ **깨진 한글 = 즉시 REGEN.** 원화 아티팩트 영문(*"Aanjil"*·*"Hanjo"*) 전이도 즉시 REGEN | negative에 고정 |

### 5-C-3. 안전판 (라벨 1개가 깨져도 회차가 즉사하지 않는 이유)

**모든 화면 라벨에는 같은 뜻의 대사가 붙어 있다** — 이것이 하드룰 4의 이중 안전판이다.

| 라벨 | 짝이 되는 대사 |
|---|---|
| `시야 없음` | **P20 HANJI** *"여기 시야가 없었어요."* + **짚는 물갈퀴** |
| `되감기` `◀◀` | **P22 HOO** *"되감아 볼까."* |
| `전력분석관`·`코치`·`감독`·`운영` | **P32 HOO** *"이스포츠엔 이런 직업이 있어. 코치, 감독, 운영."* + *"그리고 전력분석관."* |

> ⚠️ **그렇다고 라벨을 포기하지 마라.** 안전판은 보험이지 대안이 아니다.
> **P20·P32는 ★SSOT 앵커 — 라벨이 판독될 때까지 재렌더한다.**

---

# §6. 장소 고정 토큰 (LOC_*) — **5종 · v3 전면 교체**

> **prompt-smith: 아래 문자열을 씬의 LOC에 맞춰 프롬프트에 그대로 붙여넣는다. 한 글자도 바꾸지 마라.**
> ⛔ **v2의 LOC 7종(무대·부스·PC방·백스테이지·구 연습실·구 데스크·구 복도)은 전량 폐기.** 그 이야기는 존재하지 않는다.
> ✅ **동선은 하루 반나절, 건물 하나다**: **로비 → 복도 → 연습실 → 복도 → 분석실 → 연습실 → 로비 → 엔드카드.**
> ⛔ **어둡고 침울하게 만들지 마라.** 기본은 **`WARM_DAY`(밝음)**. 어두워지는 곳은 **`LOC_ANALYSIS` 단 하나**뿐이며, 그마저 **아늑하다.**
> 공통 벽: **기관명은 로비 명패·엔드카드에만**(그 외 로고·간판·현수막·수강료표 **0**) / **실존 게임 UI·챔피언·로고 0 → 일반화된 5v5** / **판독 가능 숫자 0** / **화면 한글은 §5-C 화이트리스트만**.

## LOC_LOBBY — 아카데미 입구·로비 (첫 컷 · 마지막 컷) · `WARM_DAY` · **가장 밝다**
```
LOC_LOBBY: bright welcoming esports academy lobby drawn in warm cel-shaded anime style, a tall glass
front wall with GOLDEN AFTERNOON SUNLIGHT pouring in and laying warm rectangles of light across a warm
wooden floor, creamy white walls, one rounded sofa with a low round table, a single potted plant with
simple rounded leaves, a blank standing banner with NO text on it, a clean wall plaque mounted on the
wall; simplified rounded props with clean black ink outlines and flat cel fills, gentle peach-tinted
shadows, soft bloom around the sunlight, airy cheerful and warm; NO photo texture, NO signage other than
the wall plaque, NO logos, NO price lists
```
★ **고정 소품(연속성 앵커)**: **벽 명패**(`농심 이스포츠 아카데미` — **판독 가능 필수**) · **글자 없는 빈 배너** · **둥근 소파 + 낮은 테이블** · **화분 하나**
★ **명패는 회차에 두 번만 정면으로 보인다**: **P01**(첫 등장) · **P54**(HANJI가 올려다본다) + **EC1**. 나머지 컷에선 프레임 밖.
★ **대구 규약**: **P01~P05 로비 = 둘이 서로 모른 척**(소파에 떨어져 앉음) ↔ **막5 = 거리가 좁혀져 있다.** 같은 소파, 같은 햇살, 다른 거리.
⛔ 명패에 **다른 문구·영문·수강료·실적 0.** 배너는 **끝까지 비어 있다**(`[[TBD: 아카데미 정보]]`).

## LOC_CORRIDOR — 아카데미 복도 (이동·호흡) · `WARM_DAY` · **밝다**
```
LOC_CORRIDOR: bright academy corridor in the afternoon drawn in warm cel-shaded anime style, one wall is
a window with half-closed blinds casting GOLDEN SLAT STRIPES of light in a row across a smooth floor,
warm cream walls, three simple rounded doors along the other wall each with a BLANK empty name slot and
no writing, a water cooler with a stack of paper cups; simplified rounded props with clean black ink
outlines and flat cel fills, soft peach shadows, warm and calm and bright; NO photo texture, NO signage,
NO text on the doors, NO logos
```
★ **고정 소품**: ★★ **바닥의 골든 빛 줄무늬**(블라인드 그림자) · **문 3개**(연습실·분석실·빈 문 — **표찰은 전부 빈 슬롯**) · **정수기 + 종이컵**
★★ **대구 앵커(빛 줄무늬)**: **P06** = HANJI가 **줄무늬를 밟지 않고 벽에 붙어 지나간다** ↔ **P54** = **줄무늬 한가운데 선다.** 같은 복도 · 같은 빛 · 다른 걸음.
⛔ **복도를 어둡게 만들지 마라.** v2의 밤 복도는 폐기됐다 — **여긴 낮이다.**

## LOC_PRACTICE — 연습실 (두 학생이 만나는 곳 · 막1 · 막4) · `WARM_DAY` · **밝다**
```
LOC_PRACTICE: bright cozy academy practice room drawn in warm cel-shaded anime style, creamy warm-white
ceiling lights, soft golden afternoon daylight through half-closed blinds on one window wall, gentle
peach-tinted shadows, one straight 5-seat team row of simplified rounded desks facing forward plus ONE
ISOLATED SINGLE DESK against the side wall, chunky rounded gaming chairs scaled to chibi bodies with the
backrest rising above their heads, simplified mechanical keyboards with rounded keycaps, rounded monitors,
cable bundles drawn as simple looping shapes under the desks, warm wood desktops, two drink cans, a blank
whiteboard showing only an empty grid, floor mat with soft curved wheel-track marks; all furniture and
props have clean black ink outlines and flat cel fills; NO photo texture, NO signage, NO logos, NO text
on the whiteboard
```
★ **고정 소품**: **5연석 팀 열**(정면) · ★ **벽쪽 1인석 = RAKU 자리**(혼자 솔랭 = R4의 시각화) · **바닥 매트의 바퀴 자국** · **빈 화이트보드** · **음료 캔 두 개**
★ **바퀴 자국은 세지 마라**(세는 순간 숫자가 된다). **방향이 증거다: RAKU의 1인석 → 5연석 방향으로만.**
★ **캔의 조용한 앵커**: 막1엔 **따로 떨어져** 있고, 막5엔 **나란히** 놓인다. ⛔ **클로즈업 금지 — 배경에만**(얼굴 예산을 쓰지 마라).
★ **거리가 관계다**: 막1의 두 사람 = **좌석 3칸** / 막4~5 = **옆자리.** ★ **P52에서 1인석은 비어 있다**(§5-B ⓑ).
⛔ **차가운 형광등·회색 사무실 금지** — v1 P26을 사무실로 만든 원인.

## LOC_ANALYSIS — ★★★ 분석실 (반전의 무대 · 막2·막3) · `WARM_NIGHT` · **이 회차 유일한 어둠**
```
LOC_ANALYSIS: cozy dim analysis room drawn in warm cel-shaded anime style, ceiling lights OFF and blinds
lowered but WARM GOLDEN DAYLIGHT still leaks in around the edges of the blinds (it is still afternoon
outside); ONE BIG WALL SCREEN glowing teal and cyan is the cool key light and it dominates the room, PLUS
ONE WARM AMBER DESK LAMP visible in frame casting a warm pool of light on the table and soft orange rim
light on the characters; the darkness is DEEP INDIGO AND VIOLET, never black, never grey; a long rounded
meeting table with three chunky rounded chairs, two clean paper cups of water, and a simple four-panel
JOB BOARD mounted on the wall beside the screen with four rounded pictogram icons; faces lit from below
in teal with warm amber on the opposite edge; simplified rounded props with clean black ink outlines and
flat cel fills; colors stay bright and saturated; COZY AND WARM like a cinema before the film starts,
absolutely NOT gloomy, NOT grim, NOT an interrogation room; NO photo texture, NO grime, NO film grain
```
★ **고정 소품**: ★★★ **벽면 대형 화면 1장**(리플레이 = 이 회차의 물증 화면 — §5-A) · ★★ **직군 보드 4칸**(§6-A) · **앰버 데스크 램프 1개**(**면제 불가**) · **긴 회의 테이블 + 둥근 의자 3개** · **깨끗한 종이컵 물 2개**
★ **조도**: 천장등 **끔** · 블라인드 **내림** — 단 **가장자리로 골든 낮빛이 샌다**(여긴 아직 낮이라는 증거이자 따뜻함의 보증).
★ **연출 규칙 — 화면광이 세 얼굴에 다르게 얹힌다**: **RAKU는 눈부셔하고** · **HANJI는 몸을 앞으로 기울이고** · **HOO는 화면이 아니라 아이들의 얼굴을 본다.**
★★ **짚는 것은 손가락이다.** ⛔ **레이저 포인터 · 화살표 · 강조 원 · 하이라이트 박스 금지.** HANJI의 **짚는 물갈퀴**와 HOO의 **날개 끝**이 화면을 직접 짚는다.
★★★ **짚는 컷은 얼굴과 손이 같은 프레임**(하드룰 1 — 손만 나오는 클로즈업에 예산을 쓰지 마라).
⛔ **침울 금지.** 어둠은 **영화관의 어둠**이다. 검정 어둠 · 저채도 · 앰버 광원 부재 = **즉시 REGEN**(§8-0).

### §6-A. 직군 보드 (분석실 벽 · **하드룰 5의 집행 장치**)
```
JOB_BOARD: a simple four-panel job board on the analysis room wall, four equal cells each holding ONE
simple rounded pictogram (magnifying glass / whistle / clipboard / headset) above ONE short bold Korean
word in heavy black gothic sans-serif on a light cell: "전력분석관", "코치", "감독", "운영"; the amber
desk lamp light falls on the board making all four words clearly legible; clean ink outlines, flat cel
fills, NO other text, NO numbers, NO english, NO logos
```
★ **등장 리듬 — 심고, 회수한다**: **막1~2엔 프레임 구석에 흐릿하게**(독자는 못 읽는다 · ⛔ **P29에서 짚지 마라**) → ★★ **P32에서 정면으로 잡힌다**(4칸 전부 판독 가능 · HOO의 날개가 `전력분석관` 칸을 짚는다).
⛔ **사실 벽**: 보드는 ***"이스포츠 산업에 이런 직업이 있다"*는 일반 사실**이다. ⛔ **"우리 아카데미가 배출한다" · 취업률 · 실적 · 협약사 · 강사진 0.**

## LOC_ENDCARD — 엔드카드 2장 (EC1=P55 · EC2=P56) · `WARM_DAY`
```
LOC_ENDCARD: bright clean end-card layout drawn in warm cel-shaded anime style, the academy lobby's
golden afternoon light and creamy white wall as the backdrop, generous empty space, one clean wall
plaque, one simple rounded board, and ONE EMPTY WHITE SQUARE SLOT with a thin ink border; flat cel
fills, soft bloom, warm and inviting; NO photo texture, NO logos, NO price list, NO extra text
```
- **EC1(P55)**: **세 캐릭터 전신/실루엣** + **명패** `농심 이스포츠 아카데미`. 말풍선 0.
- **EC2(P56)**: **과정 보드 3줄** — `리그 오브 레전드` · `발로란트` · `FC 온라인` (**확정 사실**) + **빈 정사각 슬롯**.
- ⚠️ **QR을 렌더하지 마라.** **빈 정사각 슬롯만 렌더**하고 `00_input/academy_blog_qr.jpg`를 **PIL로 픽셀 합성**한다(v1 검증 기법).
- ⛔ **머리글 라벨 금지**(`개설 과정` 등 — §5-C 화이트리스트 밖). ⛔ **수강료·기간·취업률·실적 0.**

# §7. 말풍선 시각 규약 (**in-image 베이크** — 시각 스타일 v2 유지 · **사용처만 v3**)

> ⛔ **"이미지 내 텍스트 금지"는 이 하네스의 규약이 아니다.** 말풍선과 한글 대사는 **작화에 함께 생성**된다.
> ★ **v3: 대사가 기본값이다.** 말풍선 있는 패널 **50/54** · 무대사 **4장**(P26·P33·P42·P54)뿐.

## 7-1. 종류별 시각 스타일

| 종류 | 시각 | 이 회차 사용처 |
|---|---|---|
| **대사** | **흰 둥근 말풍선 + 굵은 검은 테두리**(캐릭터 아웃라인과 같은 굵기) + **화자 입을 향한 삼각 꼬리** | **대부분**(말풍선 59개 중 57) |
| **외침** | **뾰족 폭발형 흰 풍선 + 굵은 테두리** | **P41** *"어어—"*(RAKU 패배) · **P47** *"되는데?!"*(RAKU 환희) — **2곳뿐** |
| **화면 밖 목소리(오프패널)** | **프레임 가장자리에서 잘린 말풍선, 꼬리는 프레임 밖으로.** 화자 얼굴 0 | **P14 · P22 · P23 · P24 · P39 · P46** — **새 캐릭터 아님** |
| **화면 라벨** | 게임 UI·보드·명패에 **박히는 굵은 한글.** **말풍선 아님** | §5-C 화이트리스트 **12종** — `시야 없음` · `되감기` · `전력분석관` 등 |
| ⛔ **생각 풍선** | **0** — 이 회차에 생각 말풍선은 **없다** | — |
| ⛔ **나레이션 박스** | **0** | — |
| ⛔ **시스템창/계약자** | **0** — 판타지 0 | — |

★ **어두운 씬(LOC_ANALYSIS)에서도 말풍선은 흰색이다.** 남보라 배경 위에서 흰 풍선이 가장 잘 읽힌다 — 풍선을 어둡게 만들지 마라.

## 7-2. 한글 레터링 톤

- **굵은 고딕 산세리프 · 검정 · 고대비 · 가로쓰기.** 세로쓰기 금지. 손글씨체 금지.
- **1행 ≤ 12자 권장 · 2~3행 조판.** 말풍선 여백을 아끼지 마라.
- **평균 ≈10.4자 / 최대 28자**(P32 *"이스포츠엔 이런 직업이 있어. 코치, 감독, 운영."*) · 차장 27자(P51).
  → **P32·P51은 3행 조판 + 저밀도 배경.** 말풍선 면적을 아끼지 마라.
- ★ **한 패널 2말풍선 = 9곳**(P05·P06·P10·P11·P32·P35·P40·P45·P46) — **읽기 순서를 위→아래 / 좌→우로 고정.** **P32는 L19 → L20 순서 절대 고정.**
- ★★ **P31은 말풍선 1개 · 다른 텍스트 0**(효과음·화면 글자·라벨 전부 금지). 반전 자구가 혼자 서야 한다.
- **감정 강세**는 글자 크기·굵기로만. 색 글자·그라데이션 글자 금지.

## 7-3. ★★ 레터링과 반전 (letterer 직결 — **v3 전면 교체**)

| 구간 | 규약 | 독자가 읽는 것 |
|---|---|---|
| **막2 · 물증**(P20·P22·P23·P24) | ★★★ **화면 라벨(`시야 없음`)이 말풍선과 함께 프레임에 있다.** 라벨 + 대사 + 짚는 손 = **3중 전달** | *"안 보이는 곳에서 당했다"* — **추론 0** |
| **막3 · 반전**(P31) | ★★★★ **말풍선 1개.** 다른 텍스트 0. 배경 단순화 | *"그게 전력분석관이 하는 일이야."* |
| **막3 · 침묵**(P33) | ★★ **무대사.** 침묵이 P31의 무게를 만든다 | **H6의 얼굴이 대사다** |
| **막4 · 대조**(P46) | ★ **라벨의 부재가 메시지다** — FOG_PATCH가 없으니 라벨도 없다 | *"…밝은데?"* |

> ⛔ **공백을 효과음·강조·여백으로 가리키지 마라.** 무대사 컷은 **표정이 대사**다.

## 7-4. 자구 변경 금지 (반전의 못 — **letterer·prompt-smith 한 글자도 바꾸지 마라**)
- **P15** *"한타 졌잖아요."* ↔ **P25** *"한타는 여기서 이미 진 거야."* — **"한타"를 단어 단위로 뒤집는다**
- **P20** *"여기 시야가 없었어요."* ↔ **P44** *"들어가기 전에 여기 한 번 봐."* ↔ **P45** *"…아까 짚은 데잖아요."*
- **P27** *"너 방금 뭐 한 줄 알아?"* → **P29** *"…뭐예요, 방금 그거."* → **P30** *"그거, 이름이 있어."* → **P31** *"그게 전력분석관이 하는 일이야."* → **P32** *"네가 방금 한 게 이거야."* — **지시 사슬 5연속**
- **P04** *"형 고3이면…"*(❄) ↔ **P52** *"형, 이거 어떻게 봐요?"*(🔥) — **"형"은 그 사이 한 번도 안 나온다**

---

# §8. 금지 목록 (위반 = panel-validator REGEN)

## 8-0. ★★★ 화풍 벽 (v2 신설 — **1급 · 이 회차 최다 결함원**)

1. ⛔ **캐릭터와 배경이 다른 그림체로 보이면 REGEN**(C2 귀속). 사진/3D/실사 배경에 애니 캐릭터를 얹지 마라.
2. ⛔ **배경 소품에 잉크 선이 없으면 REGEN.** 무선 채색 배경 금지.
3. ⛔ **사진 질감 금지**: 재질 그레인 · 먼지 · 얼룩 · 때 · 녹 · 스크래치 · 매크로 지문.
4. ⛔ **사진 조명 금지**: 렌즈 플레어 · 보케 원 · 라이트 리크 · 필름 그레인 · 색수차.
   ※ **그려진 소프트 포커스는 허용.** 금지되는 건 **사진 보케**다.
5. ⛔ **검정 어둠 금지.** 어둠은 **짙은 남보라**다. ★ **FOG_PATCH도 마찬가지 — 검정 덮개 = 즉시 REGEN**(§5-A).
6. ⛔ **어두운 씬에 따뜻한 광원이 없으면 REGEN.** ★ **v3: 예외 없음**(LOC_STAGE 예외 조항 폐기 — 무대가 없다). **LOC_ANALYSIS의 앰버 램프는 면제 불가.**
7. ⛔ **저채도·칙칙·음침 금지.** `gloomy · grim · gritty · desaturated · muted · cold gray` = 전부 REGEN 사유.
8. ★★★ ⛔ **무표정 금지 (v3 신설 · 1급).** 표정이 감정을 전달하지 못하면 **REGEN**(§3-A). `deadpan` · `expressionless` · `blank stare` · `subtle expression` = **v1 회귀 = 회차 사망 사유.**
9. ★★★ ⛔ **화면 한글 라벨이 없거나 깨지면 REGEN**(§5-C). 특히 **P20의 `시야 없음`** · **P32의 직군 4칸**.

## 8-1. 리얼리즘 벽 (v2 유지)
10. ⛔ **판타지 0**: 마법 · 시스템 창 · 이세계 · 게임 속 진입 · 초능력 · 미래 기술.
11. ⛔ **동물 능력의 초현실적 사용 0**: HANJI는 **헤엄치지도 날지도 않는다.** HOO는 **날지 않는다.** RAKU는 **나무를 타지 않는다.**
12. ⛔ ★ **화면에 물·바다·하늘·눈밭·숲·둥지를 그리지 마라.**
13. ⛔ **HANJI에게 펼친 깃털 날개를 그리지 마라.** 팔은 **짧은 물갈퀴**다.

## 8-2. 사실 벽 (실존 기관 홍보물 — **v3에서 부분 완화**)
14. ✅ **기관명은 허용**: `농심 이스포츠 아카데미` — **로비 명패(P01·P54) · 엔드카드(EC1)** 한정. ⛔ 그 외 **로고 · 간판 · 현수막 · 수강료표 · 커리큘럼 보드 · 강사 명패 · 협약사 로고 0.** 배너는 **끝까지 비어 있다.**
15. ⛔ **판독 가능한 숫자 0** — KDA · 체력 · 시간 · 점수 · 승률 · 수강료 · 기간 **전부.** **예외 없음.**
16. ⛔ **실존 상용 게임의 UI·챔피언·스킬 아이콘·로고 복제 0** → **일반화된 5v5**(파랑 원 5 vs 빨강 원 5 · 추상 지형).
17. ⛔ **판독 가능한 영문 0.** **유일 예외: `FC 온라인`**(EC2 · 확정 정식 명칭). ★ 원화의 깨진 영문 아티팩트(*"Aanjil"*, *"Hanjo"*)가 패널에 전이되면 **즉시 REGEN**.
18. ⛔ ★★ **미확인 사실 0** — 취업률 · 프로 배출 실적 · 협약 기업 · 강사진 · 수강 기간. **직군 보드는 "산업에 이런 직업이 있다"는 일반 사실이지 "우리가 배출한다"가 아니다.** 위반 = **거짓 광고 = 최우선 REGEN.**

## 8-3. 톤 벽
19. ⛔ **조연의 얼굴 0** — 실루엣 · 뒤통수 · 화면 밖 목소리. **새 캐릭터 0.**
20. ⛔ **나레이션 박스 0 · 생각 말풍선 0.**
21. ⛔ **글리치·스캔라인·픽셀 노이즈 0.** ※ **효과선·집중선은 놀람의 순간(P24·P41·P47)에 가볍게 허용**(§3 효과) — ⛔ **단 P31(반전 자구 컷)엔 0.**
22. ⛔ ★★ **화면 증거를 보여주고 아무도 말·라벨로 안 짚으면 REGEN**(brief 하드룰 4 — **v1을 죽인 실패**).
23. ⛔ ★ **얼굴 없는 컷(사물·손·발만)이 회차 8장을 넘으면 REGEN**(하드룰 1 — 얼굴 보이는 패널 ≥70%).

## 8-4. 렌더 오염 (레퍼런스 첨부의 부작용)
24. ⛔ **흰 스티커 테두리 · 순백 배경 · 다각도 나열 레이아웃 0.**
25. ⛔ ★★ **카탈로그 표정 누출 0** — 시트의 영업용 미소·반짝이는 눈이 **H4·H6·O6·R4·R5·O1·O3**에 들어오면 REGEN. **※ 단 H7·H9·R7·O9는 미소가 정답이다**(§3-A-3).
26. ⛔ **청록 오염 0** — RAKU·HOO 소품에 청록 금지. (※ **앰버 조명·화면 청록광은 서명이 아니다** — 오염 아님)
27. ⛔ **테이프 패치는 RAKU의 표식이다**(빨간 헤드셋 이어컵). HOO·HANJI 헤드셋에 붙이지 마라.
28. ⛔ **HANJI에게 안경을 씌우지 마라.** **안경은 HOO만.** **눈: RAKU만 초록.**

## 8-5. ★★★ 공통 negative 프롬프트 (prompt-smith — **전 패널 서픽스 · v3**)

```
NEGATIVE: no photorealistic background, no photographic texture, no photo lighting, no realistic
office render, no live-action background, no 3d render, no CG background, no photobash, no photograph,
no hyperdetailed environment, no material grain, no film grain, no lens flare, no light leaks, no bokeh
circles, no chromatic aberration, no HDR, no gritty, no grime, no dirt, no rust, no stains, no scratched
surfaces, no macro fingerprints, no mismatched art styles, no character pasted onto a realistic
background, no unlined background, no gloomy, no grim, no bleak, no oppressive, no desaturated, no muted
colors, no cold gray palette, no clinical office lighting, no black shadows, no pitch black darkness, no
black fog overlay, no grey fog overlay, no deadpan faces, no expressionless faces, no blank stare, no
flat affect, no watermark, no signature, no artist logo, no brand marks, no english text, no latin
letters, no gibberish text, no garbled text, no misspelled korean, no random letters on props, no
legible numbers, no digits, no digital clock, no timestamps, no scoreboard numbers, no KDA, no health
bars, no real-game UI, no copyrighted champions, no existing game logos, no champion portraits, no
fantasy, no magic, no system window, no status window, no water, no ocean, no sky, no snow field, no
forest, no nest, no spread feathered wings, no flying, no glasses on HANJI, no green eyes on HANJI or
HOO, no teal or cyan accents on RAKU's or HOO's props, no tape patch on HOO's or HANJI's headset, no
white sticker outline, no die-cut border, no reference sheet layout, no turnaround, no multiple views,
no character lineup, no white studio background, no realistic animal anatomy, no crowd faces, no new
characters, no narration box, no thought bubble, no glitch, no scanlines, no pixel noise, no price list,
no curriculum text, no arrows, no highlight circles, no laser pointer
```

### ★ negative 예외 2건 (**prompt-smith — 해당 패널에서만 해당 토큰을 뺀다**)
| 패널 | 빼는 토큰 | 이유 |
|---|---|---|
| **EC2 (P56)** | `no english text, no latin letters` | **`FC 온라인`**의 "FC" — brief 확정 정식 명칭. 그 외 영문은 여전히 0 |
| **화면/보드/명패 컷**(§5-C 라벨 패널) | (없음 — **한글은 애초에 금지 대상이 아니다**) | ⚠️ negative에 `no korean text`·`no text`를 **절대 넣지 마라.** 넣으면 **라벨이 사라지고 반전이 죽는다** |

**v3 추가분**: 무표정 4종(`deadpan`·`expressionless`·`blank stare`·`flat affect`) · 검정/회색 덮개 2종 · 숫자·게임UI 강화 6종 · 캐릭터 혼동 방지 2종 · 화면 강조장치 3종(`arrows`·`highlight circles`·`laser pointer` — **짚는 것은 손가락이다**).

---

*개정: art-director · **v3 2026-07-13**(신규 이야기 《왜 졌는지 말해봐》) · 파일 기반 통신(SendMessage 미사용)*
*근거 서열: **`00_input/brief.md`(사용자 승인·하드룰 8종) > `02_story/world.md`(LOC·FOG_PATCH·화이트리스트) > `02_story/characters.md`(표정 27컷) > `03_episode/ep01_script_final.md`(패널 원장) > 이 문서.***
*⛔ **그림 언어(§1 작화 · §2 색·조명 토큰 · §4 화면비 · §7-1 말풍선 시각)는 사용자 승인·검증 완료 자산 — v3에서 한 글자도 바뀌지 않았다.***
*교체된 것: **§3-A 표정 연기(v1 "표정 변화는 작게" 폐기) · §5-A FOG_PATCH · §5-B 3대구 · §5-C 화면 한글 라벨 · §6 LOC 5종 · §8 금지 갱신.***
*⛔ **캐릭터 외형 재정의 0 · ref-sheet-artist 미호출**(`04_visual/refs/` 재렌더 금지 준수).*
