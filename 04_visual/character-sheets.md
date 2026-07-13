# character-sheets — EP01 v2 《왜 졌는지 말해봐》 캐릭터 일관성 토큰 (2026-07-13 · art-director)

입력: `04_visual/refs/INDEX.md`(**외형 SSOT**) · `02_story/characters.md`(표정 27컷) · `04_visual/style-bible.md`(§3-A 연기 · §5-C 라벨) · `00_input/brief.md`(하드룰 8)
소비자: **prompt-smith**(외형 토큰 + `-i` 첨부 + ACTING 블록) · **panel-validator**(C1 대조) · **panel-artist-a/b/c**(REGEN)

> ## ⛔ **외형은 재설계 대상이 아니다.**
> 정본은 **사용자 원화**(`00_input/characters/`)와 **레퍼런스 시트 3장**(`04_visual/refs/`)이다.
> 이 문서는 그 외형을 **승계**만 한다. **ref-sheet-artist 미호출 · 시트 재렌더 금지**(시리즈 자산).
> 이 문서가 새로 정하는 것은 단 하나 — **★ 표정 누출 차단 규약**(§4)이다.

---

# §0. ★★★ prompt-smith 3줄 요약 (다른 걸 다 잊어도 이건 지켜라)

1. **패널에 등장하는 캐릭터의 시트를 `_render_jobs/panels/{NAME}.refs`에 적는다** → `codex -i` 첨부 = 외형이 실제로 조건화된다.
2. **첨부하면 카탈로그 표정(영업용 미소 · 반짝이는 눈)까지 복사된다** → 그래서 **모든 프롬프트에 `ACTING:` 블록**이 붙는다.
3. ★★★ **ACTING은 "표정을 지우는 장치"가 아니라 "표정을 바꿔 쓰는 장치"다.**
   > ## **차단 대상은 *상황에 안 맞는 카탈로그 미소*이지 *표정 자체*가 아니다.**
   > **v1은 이걸 무표정으로 오해해서 폐기됐다.** 사용자 판정: *"표정이 없다."* **v2의 기본값은 밝고 표정이 풍부하다.**

---

# §1. HANJI (한지) — 펭귄 · 고3 · **주인공**

| 항목 | 값 |
|---|---|
| **identity_tag** | **`HANJI`** |
| **레퍼런스 앵커** | ★ **`04_visual/refs/Hanji_ref.png`** ← **`.refs` 파일에 이 경로를 적는다** |
| **1차 식별자** | ★ **청록(teal) 헤드셋 + 붐마이크** |
| **2차 식별자** | **정수리 깃털 한 가닥**(감정 안테나) · **주황 부리·물갈퀴** |

## 1-1. 불변 토큰 (**한 글자도 바꾸지 마라 — 전 패널 공통**)

```
HANJI = penguin boy, navy-black back and head, white belly front, short rounded orange beak,
a single strand of feather sticking up from the crown, large round AMBER eyes, TEAL headset with a boom
mic, orange webbed feet, 2.5-head chibi proportions, bold black ink outline, clean cel shading
```

| 축 | 값 (불변) |
|---|---|
| 종·체형 | 펭귄 · 2~3등신 치비 · 둥근 실루엣 · **HOO보다 작고 RAKU보다 머리 하나 크다** |
| 색 3종 | `#1B2A41`(네이비블랙 등·머리) · `#2EC4B6`(청록 헤드셋) · `#F5871F`(주황 부리·발) |
| 눈 | **호박색** · 크고 둥글다 |
| 팔 | ★ **짧은 물갈퀴**(mitten flipper) — ⛔ **깃털 날개 금지** |

## 1-2. 가변 (패널마다 지정)
**표정(H1~H9) · 포즈 · 카메라 · 조명 · 헤드셋 착용 상태 · 짚는 손의 위치.** ⛔ **가변을 불변 토큰에 섞지 마라.**

## 1-3. ⛔ 금지 (위반 = C1 REGEN)
- ⛔ **안경 금지** — 안경은 **HOO의 표식**이다(원화 Hanji_5의 안경은 정본에서 제외됨).
- ⛔ **천사 날개 금지 · 펼친 깃털 날개 금지** · ⛔ **헤엄·비행 금지**.
- ⛔ **초록 눈 금지**(초록은 RAKU만) · ⛔ **빨강/네이비 헤드셋 금지**.
- ⛔ 원화 아티팩트 영문(*"Aanjil"* · *"Hanjo"*) 전이 금지.

---

# §2. RAKU (라쿠) — 라쿤 · 중2 · **대비 주인공**

| 항목 | 값 |
|---|---|
| **identity_tag** | **`RAKU`** |
| **레퍼런스 앵커** | ★ **`04_visual/refs/Raku_ref.png`** ← **화풍 앵커이기도 하다**(사용자 원본 모델 시트) |
| **1차 식별자** | ★ **빨간 헤드셋 + 이어컵의 베이지 테이프 패치** |
| **2차 식별자** | **검은 눈가 마스크** · **초록 눈**(셋 중 유일) · **줄무늬 꼬리** |

## 2-1. 불변 토큰

```
RAKU = raccoon boy, grey fur, black bandit mask marking around the eyes, GREEN eyes, RED headset with a
beige tape patch on the earcup, grey hoodie, lanyard ID badge, bushy ringed striped tail, the smallest of
the three, 2.5-head chibi proportions, bold black ink outline, clean cel shading
```

| 축 | 값 (불변) |
|---|---|
| 종·체형 | 라쿤 · 2~3등신 치비 · ★ **셋 중 가장 작다**(중2 — HANJI보다 머리 하나 작게) |
| 색 3종 | `#9AA0A6`(회색 털) · `#E03131`(빨강 헤드셋) · `#3FBF6F`(초록 눈) |
| 눈 | ★★ **초록** — **절대 호박색으로 렌더하지 마라**(셋을 가르는 축) |
| 복장 | 회색 후드티 + **사원증 랜야드** |
| 감정 안테나 | ★ **귀 + 줄무늬 꼬리** — 자신만만=쫑긋·꼬리 흔들림 / 패배=꼬리 곤두섬 / 억울=귀 뒤로·꼬리 처짐 / 머쓱=귀 한쪽 꺾임 |

## 2-2. 가변
**표정(R1~R9) · 귀/꼬리 상태 · 포즈(의자 방향) · 헤드셋 착용**(막4에서 쓴다).

## 2-3. ⛔ 금지
- ⛔ **청록 금지** — RAKU의 소지품·소품에 **청록·시안 0**(청록은 HANJI의 서명색).
- ⛔ **안경 금지** · ⛔ **호박색 눈 금지** · ⛔ **HANJI보다 크게 그리지 마라**.

---

# §3. HOO (후) — 부엉이 · **아카데미 멘토**(가상 마스코트)

| 항목 | 값 |
|---|---|
| **identity_tag** | **`HOO`** |
| **레퍼런스 앵커** | ★ **`04_visual/refs/HOO_ref.png`** |
| **1차 식별자** | ★ **네이비 헤드셋 + 붐마이크**(이어컵에 **주황 병아리 로고**) |
| **2차 식별자** | ★ **검은 뿔테 원형 안경**(셋 중 **HOO만**) · **금색 트림 네이비 재킷 + 원형 엠블럼** · **갈색 귀깃** |

## 3-1. 불변 토큰

```
HOO = owl mentor, cream-white feathers, brown ear tufts, round black-rimmed glasses, large AMBER eyes,
NAVY headset with a boom mic (small orange chick logo on the earcup), navy jacket with gold trim and a
round emblem, orange feet, the largest and broadest of the three, 2.5-head chibi proportions, bold black
ink outline, clean cel shading
```

| 축 | 값 (불변) |
|---|---|
| 종·체형 | 부엉이 · 2~3등신 치비 · ★ **셋 중 가장 크고 넓다**(안정감) |
| 색 3종 | `#F5F0E6`(크림) · `#1F2D5A`(네이비 재킷·헤드셋) · `#D4AF37`(금색 트림) |
| 눈·안경 | 호박색 눈 · **검은 뿔테 원형 안경** |
| 손 | ★ **날개 끝이 손이다** — 화면을 **짚는다**(⛔ 레이저 포인터·화살표 금지) |
| ★ 연기 특기 | ★★ **안경 반사광이 감정 장치다** — 관찰(O1·O3)엔 **반사광 한 줄이 눈을 가리고**, 반전(O4·O6)엔 **반사광을 없애 눈을 보여준다** |

## 3-2. 가변
**표정(O1~O9) · 고개 기울기(부엉이답게 15~20°) · 안경 반사광 유무 · 팔짱↔짚는 날개.**

## 3-3. ⛔ 금지
- ⛔ **비행 금지 · 펼친 날개 금지.** ⛔ **청록 소품 금지.** ⛔ **헤드셋에 테이프 패치 금지**(테이프는 RAKU의 표식).
- ⛔ ★ **실존 강사로 읽히는 표현 0** — HOO는 **가상의 마스코트 멘토**다. 명찰·직함·이름표 **0**(사실 벽).

---

# §4. ★★★ 표정 누출 차단 규약 (**이 문서의 존재 이유 · prompt-smith 필독**)

## 4-1. 문제 (v1 실측)

레퍼런스 시트를 `codex -i`로 첨부하면 **외형만 오는 게 아니다.**
시트는 **도감**이라 세 캐릭터가 전부 **카메라를 보고 웃고 있고, 눈이 반짝인다.**
→ 그 **카탈로그 미소와 반짝이는 눈이 패널로 그대로 복사된다.**
→ **놀라야 할 컷에서 웃고 있고, 억울해야 할 컷에서 눈이 반짝인다.**

## 4-2. ⛔⛔ 오해 금지 (**v1이 여기서 죽었다**)

> ### **차단 대상 = "상황에 안 맞는 카탈로그 표정"**
> ### **차단 대상 ≠ "표정 자체"**

| v1의 오답 (⛔ 폐기) | **v2의 정답** |
|---|---|
| *"과장 리액션 금지 · 표정 변화는 작게"* → **무표정** | ★ **표정이 감정을 명확히 전달해야 한다** (style-bible §3-A) |
| 누출 차단 = **표정을 지운다** | ★★ 누출 차단 = **더 구체적인 표정으로 덮어쓴다** |
| negative에 `no exaggerated expression` | ★ negative에 **`no deadpan, no expressionless faces, no blank stare, no catalog smile`** |

**사용자 판정을 그대로 옮긴다: *"표정이 없다" · "얼굴이 안 보인다."*** — 이것이 v1 폐기 사유다.
**표정을 아끼는 순간 v2는 v1이 된다.**

## 4-3. ★ ACTING 블록 — 작성법 (전 패널 필수)

**표정을 창작하지 마라.** `02_story/characters.md`의 표정표에서 **해당 행을 그대로 복사**한다.
각 행은 이미 **눈 · 눈썹 · 부리(입) · 고개/몸 · 감정 안테나**까지 지정돼 있다 — **그것이 프롬프트 문장이다.**

### 템플릿
```
ACTING (this OVERRIDES the reference sheet's catalog pose and catalog smile - the sheet defines his BODY,
this defines his FACE): {코드} - {눈꺼풀·동공} ; {눈썹} ; {부리/입} ; {고개·몸} ; {감정 안테나}.
His expression must clearly read as {감정 한 단어} at a glance, even with the speech balloon covered.
{미소 지시 — 아래 4-4 표}
```

### 예시 — P33 (H6 · 이름을 듣고 놀람 · ★SSOT)
```
ACTING (this OVERRIDES the reference sheet's catalog pose and catalog smile - the sheet defines his BODY,
this defines his FACE): H6 - eyes at MAXIMUM opening, the amber iris filling the eye with a large bright
highlight ; both eyebrows raised to their highest ; BEAK FULLY OPEN AND FROZEN THAT WAY ; upper body
leaning slightly back, shoulders stiff, front-on close-up ; the single crown feather stands straight up.
His expression must clearly read as STUNNED DISBELIEF at a glance, even with the speech balloon covered.
NO SMILE - he is not happy yet, he is astonished.
```

### 예시 — P53 (H9 · 살짝 웃음 · **미소가 정답인 컷**)
```
ACTING (this OVERRIDES the reference sheet's catalog pose - the sheet defines his BODY, this defines his
FACE): H9 - eyes softly crescent ; eyebrows relaxed ; a small but GENUINE smile, the beak tip clearly
turned up ; head tilted slightly, shoulders loose ; crown feather relaxed.
His expression must clearly read as QUIET HAPPINESS at a glance.
A WARM SMILE IS CORRECT HERE - do not suppress it.
```

## 4-4. ★★ 미소 판정표 (**prompt-smith: 컷마다 이 표를 먼저 본다**)

| 컷 | 시트의 미소를 | ACTING 마지막 줄 |
|---|---|---|
| ★ **H4**(P20 짚음) · **H6**(P33 놀람) | ⛔ **이긴다** | `NO SMILE - this is INTENSE FOCUS.` / `NO SMILE - this is ASTONISHMENT.` |
| ★ **O1 · O3**(P09·P16 관찰·무판정) | ⛔ **이긴다** | `NO SMILE, NO NOD - he is neither approving nor denying.` |
| ★★ **O6**(P31 이름을 붙임) | ⛔ **이긴다** | `NO SMILE, NO NOD, NO ADMIRATION - he is stating a fact. Glasses glare GONE, eyes visible.` |
| **O5**(P30 *"그거, 이름이 있어."*) | ⛔ **이긴다** | `NO SMILE, NO EYE-SMILE, NO NOD - low and slow. Gaze front, not at RAKU.` |
| ★ **R4**(P41 패배) · **R5**(P42 억울함) | ⛔ **이긴다** | `NO SMILE - he is about to cry. Ears back, tail drooping.` |
| **R2 · R3**(깔봄·어이없음) | ⛔ **이긴다** | `A SMIRK, not a friendly smile - one corner only, eyes half-lidded.` |
| **H1 · H2 · H3 · H5**(위축·머뭇거림) | ⛔ **이긴다** | `NO SMILE - anxious, gaze down and away.` |
| ✅ **H7**(P34 뿌듯함) · **H9**(P53) | ✅ **막지 마라** | `A shy, genuine smile IS CORRECT here.` |
| ✅ **R7**(P47 *"되는데?!"*) | ✅ **막지 마라 — 최대치** | `A HUGE open-mouth grin with teeth IS CORRECT - maximum joy.` |
| ✅ **O9**(P53 마지막 미소) | ✅ **막지 마라 — 단 작게** | `A VERY SMALL smile - just the beak tip. It is his ONLY smile in the episode, so it must stay small.` |

### ★ 미소의 진폭 규약 (셋을 가르는 축)
> ## **RAKU(활짝, 이빨) > HANJI(수줍은 진짜 미소) > HOO(부리 끝만, 딱 한 번)**
> ⛔ **HOO의 O9를 RAKU급으로 그리면 캐릭터가 무너진다.** 그의 미소는 **작아야 값이 있다**(회차 내내 웃지 않았으니까).

---

# §5. 렌더 잡 첨부 규약 (`.refs` — **이미지 조건화**)

| 패널 등장 | `_render_jobs/panels/{NAME}.refs` 내용 |
|---|---|
| HANJI 단독 | `04_visual/refs/Hanji_ref.png` |
| RAKU 단독 | `04_visual/refs/Raku_ref.png` |
| HOO 단독 | `04_visual/refs/HOO_ref.png` |
| 2인 이상 | **등장 인물의 시트를 전부** (1줄 1개) |
| **화면·사물만**(오프패널 컷) | ★ **가장 최근에 나온 캐릭터 시트 1장을 붙인다** — 화풍(잉크 선·셀 채색)이 흔들리지 않게 |

⚠️ **시트는 이제 검증 잣대이자 생성 입력이다.** 빠뜨리면 외형이 무너지고, 붙이면 표정이 샌다 — **그래서 §4가 있다.**

---

# §6. panel-validator C1 체크리스트 (**패널 1장을 볼 때 묻는 것**)

- [ ] **헤드셋 색**: HOO=**네이비** / HANJI=**청록** / RAKU=**빨강** — 혼동 시 즉시 REGEN
- [ ] **눈 색**: RAKU만 **초록**. HANJI·HOO는 **호박색**
- [ ] **안경**: **HOO만**. HANJI에 안경이 있으면 REGEN
- [ ] **테이프 패치**: **RAKU 헤드셋에만**
- [ ] **크기 위계**: **HOO > HANJI > RAKU**
- [ ] **HANJI의 팔 = 짧은 물갈퀴** (깃털 날개 아님)
- [ ] ★★★ **표정이 명세(H/R/O 코드)대로 나왔는가** — **무표정 = v1 회귀 = REGEN**
- [ ] ★★ **카탈로그 미소가 새지 않았는가** — 단, **H7·H9·R7·O9는 미소가 정답이다**(막지 마라)
- [ ] 원화 아티팩트 영문(*"Aanjil"*·*"Hanjo"*) 전이 0

---

*작성: art-director · 2026-07-13 · 파일 기반 통신(SendMessage 미사용 — 단독 스폰 폴백)*
*근거 서열: **`04_visual/refs/INDEX.md`(외형 SSOT) > `00_input/brief.md` > `02_story/characters.md`(표정 27컷) > 이 문서.***
*⛔ **캐릭터 외형 재설계 0 · ref-sheet-artist 미호출 · `04_visual/refs/` 재렌더 금지**(시리즈 자산).*
