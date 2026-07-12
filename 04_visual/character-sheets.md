# character-sheets — EP01 캐릭터 일관성 토큰 (승계 사본 · 재정의 아님)

**확정 일자: 2026-07-12** · art-director
**⛔ 외형 정본은 이 문서가 아니다.** 정본 = `04_visual/refs/INDEX.md` + 렌더 완료된 레퍼런스 시트 3장.
이 문서는 그 정본을 **패널 프롬프트에 그대로 박을 형태로 토큰화한 승계 사본**이다. 정본과 어긋나면 **정본이 이긴다.**
**⛔ 레퍼런스 시트 재렌더 금지** — ref-sheet-artist 미호출. 이 3장은 **시리즈 자산**이며 후속 회차에서 재사용한다.

소비자: **prompt-smith**(토큰 주입 + `-i` 첨부 대상) · **panel-validator**(C1 대조) · panel-artist-a/b/c

---

## 0. 사용법 (prompt-smith — 이거 하나만 지키면 된다)

1. 패널에 등장하는 캐릭터의 **`ANCHOR`** 파일을 **`codex exec -i`로 첨부**한다. → 일관성의 1차 장치. **토큰만으로는 안 잡힌다.**
2. **`IDENTITY`** 토큰 문자열을 **한 글자도 바꾸지 말고** 프롬프트에 붙인다.
3. 표정·포즈·헤드셋 상태는 **`VARIABLE`**에서 골라 **따로** 붙인다. ⛔ IDENTITY 안에 섞지 마라.
4. style-bible §8-5 **공통 negative** + 아래 **캐릭터별 negative**를 서픽스에 붙인다.

### 1차 식별자 = **헤드셋 색** (섞이면 캐릭터가 무너진다)
| | HOO | HANJI | RAKU |
|---|---|---|---|
| **헤드셋** | **네이비** | **시안-청록** | **빨강** |
| **눈** | 호박 | 호박 | ★ **초록** (라쿤만) |
| **표식** | **검은 원형 안경**(유일) | **정수리 깃털 한 가닥** | **검은 눈가 마스크 + 줄무늬 꼬리** |

---

# HANJI — 펭귄 · 이스포츠 취준생 · **주인공 / 반전의 소유자**

| | |
|---|---|
| **identity_tag** | **`HANJI`** |
| **ANCHOR** | `04_visual/refs/Hanji_ref.png` (**`-i` 첨부 필수**) |
| **원본 정본** | INDEX.md — Hanji_2 확정 |

### IDENTITY (불변 — 그대로 복붙)
```
HANJI: chibi penguin, 2-3 heads tall, navy-black head back and flippers, white belly with a soft
jagged fur-edge chest ruff, small orange triangular beak, orange webbed feet, ONE dark crown feather
with a cream tip standing up from the top of his head, large amber-gold eyes, bright cyan-teal
over-ear headset with a dark grey band and a boom mic
```

### VARIABLE (패널마다 고른다)
- **표정**: 잔잔한 미소 / **결의·외침(부리 벌림)** / **울먹임(눈물)** / ★ **참는 얼굴**(P27 — ⛔ 슬픈 얼굴 아님, **눈만 한 번 내려간다**) / ★ **못 알아보는 얼굴**(P44 — 자기 글씨를 남의 것처럼 본다. ⛔ 놀람 아님) / ★ **말하는 중, 부리 벌림**(P2·P38 — **쌍 고정**)
- **헤드셋**: 착용 / ★ **목에 건 채**(P37 — **B-1 필수. 청록 붐마이크가 근경에 들어와야 파형이 "목소리"로 읽힌다**) / 벗는 손(P34)
- **의상**: 없음(맨몸). 소지품 = **오더 노트**(손때 묻은 표지 · 청록 포스트잇 한 장이 삐져나옴)

### 식별 표식
**정수리 깃털 한 가닥**(크림색 끝) · **시안-청록 헤드셋** · 주황 부리/발

### ⛔ 금지
- ⛔ **안경을 씌우지 마라.** 안경은 **HOO의 표식**이다. (원본 7장 중 1장에만 있었고 정본에서 제외됨)
- ⛔ **천사 날개 금지** (원본 Hanji_6의 마스코트 변형 — 캐릭터 정본 아님)
- ⛔ **펼친 깃털 날개 금지.** 팔은 **짧은 물갈퀴**다 — "짧은 팔로 화면을 가리키는 동작"만(P7·P47)
- ⛔ **헤엄·비행 0** · ⛔ 물·눈밭 배경 0
- `negative: no glasses on HANJI, no angel wings, no spread feathered wings, no flying, no swimming`

### ★ SSOT 관여
**P2 ↔ P38 쌍**(style-bible §5-B — `LOCKED_COMPOSITION_P2_P38` 문자열을 두 프롬프트에 동일 복사) · **P37**(청록 붐마이크 근경 + 시선 이동 아래→위) · **P39**(반전 자구 한글 렌더) · **P49/P52**(착지)

---

# HOO — 부엉이 · 진로 멘토 · **이 회차가 파는 유일한 상품**

| | |
|---|---|
| **identity_tag** | **`HOO`** |
| **ANCHOR** | `04_visual/refs/HOO_ref.png` (**`-i` 첨부 필수**) |
| **원본 정본** | INDEX.md — HOO_1~4 |

### IDENTITY (불변 — 그대로 복붙)
```
HOO: chibi owl, 2-3 heads tall, cream-ivory plumage, brown striped ear tufts, brown-and-cream barred
wing feathers, round thin BLACK-RIMMED GLASSES, large amber-gold eyes, small dark grey beak, navy
over-ear headset with a boom mic and a small orange chick emblem on the ear cup, an open navy varsity
jacket with gold trim and gold pocket welts and a round gold-and-navy circular emblem on the chest,
orange-yellow three-toed feet
```

### VARIABLE
- **표정**: 잔잔한 응시(기본) / 눈 크게 뜬 관찰 / 놀람(부리 벌림) / ★ **읽던 얼굴이 아주 잠깐 멈춘다 — 웃지 않는다**(P39) / ★ **아주 짧게 웃는다**(P52 — 그가 받는 유일한 보상. ⛔ 대사로 설명 금지)
- **행동 시그니처**: ★ **리플레이 타임라인 스크러버를 뒤로 끄는 손**(그의 유일한 물리적 행동 — *부엉이는 목을 돌려 뒤를 본다*) · **소리 없이 뒤에 서 있다**(첫 등장·재등장 = 발소리 0 · 문 열리는 소리 0)
- **조명**: 대부분 **아래에서 올라오는 모니터광**(LOC_DESK)

### 식별 표식
★ **검은 원형 안경** (3인 중 **유일한 안경 착용자** — 1차 구분자) · **네이비 헤드셋 + 이어컵의 주황 병아리 엠블럼** · **금색 트림 네이비 재킷**

### ★ F2 — 낡은 헤드셋 (심되 **회수 금지** · EP02 탄약)
- **낡음의 표현**: **이어패드 가죽이 닳아 벗겨짐 + 헤드밴드 쿠션이 눌려 납작함.** 소품 디테일로만.
- **노출 예산**: **클로즈업 ≤ 1컷**(P15~P16 첫 등장) · 그 외엔 배경 고정 토큰으로. P52 종결 컷에 남는다.
- ⛔ **테이프를 붙이지 마라** — **베이지 테이프 패치는 RAKU의 식별 표식**이다. 섞이면 두 캐릭터가 붕괴한다.

### ⛔ 금지
- ⛔ **날지 않는다.** 비행 컷 0 · 펼친 날개 0
- ⛔ **청록 오염 0** — HOO의 소지품에 청록/시안 금지 (청록은 HANJI의 서명색)
- `negative: no tape patch on HOO's headset, no teal or cyan on HOO's props, no flying, no spread wings`

### ★ SSOT 관여
**P37**(손끝이 **아래 띠**를 톡 친다 + 다른 손은 **스크러버를 뒤로 끈다**) · **P39**(⛔ **무대사 — 대사가 있으면 자동 FAIL**) · **P52**

---

# RAKU — 라쿤 · 프로게이머 지망생 · **반박자**

| | |
|---|---|
| **identity_tag** | **`RAKU`** |
| **ANCHOR** | `04_visual/refs/Raku_ref.png` (**`-i` 첨부 필수**) |
| **원본 정본** | INDEX.md — Raku_ref (사용자 원본 시트 그대로) · ★ **이 시트가 작품 전체의 화풍 앵커다** |

### IDENTITY (불변 — 그대로 복붙)
```
RAKU: chibi raccoon, 2-3 heads tall, grey fur, black bandit eye-mask markings over a cream muzzle,
cream ear insets, BRIGHT GREEN eyes, small black nose, red over-ear headset with a BEIGE TAPE PATCH on
the ear cup and a boom mic, grey hoodie with white drawstrings and a front kangaroo pocket, a black
lanyard holding a BLANK white ID card with no text on it, thick black-and-grey ringed bushy tail, dark
grey paws
```

### VARIABLE
- **표정**: 나른·무표정 / **자신만만**(눈 좁힘 + 미소) / **당황**(땀방울) / ★ **정면 반박**(P41 — 눈썹 내리고 굳은 눈. ⛔ 악의 아님 — *"짧고, 아프고, 틀리지 않았다"*) / ★ **아무렇지도 않게**(P44 — 사실을 인정하며 의미를 부정한다. ⛔ 충격·수긍 0)
- **행동 시그니처(world §3-3)**: ★ **의자를 끌고 HANJI 옆으로 온다**(F3 ×3) · **키캡을 닦고 마우스를 알코올 티슈로 문지르고 손을 턴다**(강박적 반복 — *손이 곧 정체성*) · **남의 마우스 감도·키 배열을 무심코 만진다** · **손등으로 자기 데스크를 툭 친다**(P42)
- **자리**: 늘 **벽쪽 1인석** 또는 **5연석 끝자리**. ⛔ **가운데에 앉히지 마라** — 좌석 위치가 그의 주제다

### 식별 표식
★ **초록 눈**(3인 중 유일) · **검은 눈가 마스크** · **빨간 헤드셋 + 베이지 테이프 패치** · **줄무늬 꼬리** · **백지 사원증**

### ⛔ 금지
- ⛔ **사원증·명찰에 글자·로고를 그리지 마라.** **완전한 백지.** (아카데미 고유물 금지 + 깨진 영문 아티팩트 방지)
- ⛔ **나무를 타지 않는다** · ⛔ **눈 색을 호박색으로 그리지 마라**(초록 = 대비 유지 장치)
- ⛔ **청록 오염 0** — RAKU의 소지품·후드·헤드셋에 청록 금지. ★ **단, 그의 데스크의 포스트잇은 청록이다** — *그건 그의 것이 아니라 **HANJI가 써준 것**이기 때문이다*(TW-2 물증). 이 구분이 소반전의 전부다
- `negative: no text on RAKU's ID card, no logo on the lanyard, no amber eyes on RAKU, no teal on RAKU's own gear`

### ★ SSOT / FLAG 관여
**P43**(청록 포스트잇 클로즈업 → 팬 다운 → **일방통행 바퀴 자국**. ⛔ **자국을 세지 마라 · 포스트잇 글씨를 판독 가능하게 그리지 마라**) · **P28 ↔ P43 손 클로즈업 대구**(FLAG)

---

# 부록 A. 3인 동시 등장 시 구분 강화

| 위험 | 대응 |
|---|---|
| HOO(크림) ↔ HANJI(흰 배) 밝은 면이 겹친다 | **HANJI는 네이비블랙 등/머리**가 항상 화면에 나오게 배치. HOO는 **안경 반사**로 구분 |
| 셋 다 붐마이크 헤드셋 | **색으로만 구분한다**: 네이비 / 시안청록 / 빨강. 저조도 컷(LOC_DESK)에서도 **헤드셋 색은 채도를 유지**한다 |
| 저조도에서 실루엣 혼동 | **실루엣 차별화**: HANJI=정수리 깃털 1가닥 / HOO=양쪽 귀깃 / RAKU=줄무늬 꼬리. **이 3개는 어두워도 보여야 한다** |

# 부록 B. 등장 인물은 이 3인이 전부다

⛔ **새 캐릭터 0.** 수강생 A/B · 팀원 A/B · 캐스터 · 관중 · 학부모는 **전부 얼굴 없음**:
**실루엣 · 뒤통수 · 포커스 아웃 · 프레임 밖 · 화면 밖 목소리(가장자리에서 잘린 말풍선)**.
⛔ **부모를 화면에 등장시키지 마라.**

---

*작성: art-director · 2026-07-12 · 파일 기반 통신(SendMessage 미사용)*
*INDEX.md 승계 · 외형 재정의 0 · 레퍼런스 시트 재렌더 0 · 신규 캐릭터 0*
