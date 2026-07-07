# Character Sheets — 《리:메타 (RE:META)》 EP01 일관성 토큰

- 작성: art-director
- 일자: 2026-07-06
- 입력: `_workspace/02_story/characters.md` §8 (외형 토큰 블록) · §1 (반별 색) · `style-bible.md` §5·§6·§7
- 방법론: `webtoon-panel-breakdown` B-2(시트 구조) / B-3(불변·가변 분리) / B-7(레퍼런스 사양)
- 소비자: **prompt-smith**(모든 패널에 identity_tag + 불변 토큰 복붙) · **ref-sheet-artist**(선렌더) · **panel-validator**(레퍼런스 대조)

> **사용법:** 캐릭터 등장 패널마다 `identity_tag` + **불변 외형 토큰(자구 그대로)** + 상황 표정/의상 변주구를 프롬프트에 주입. 반 유니폼 색은 style-bible §5 표 준수. 유건 잔상·손 떨림은 §7-B. **불변 토큰은 함부로 수정 금지**(렌더된 패널과 어긋남).
>
> **EP01 등장 로스터:** 유건 · 배태산 · 남도경 · 정하루 · 윤태오 · 한상혁 · 고형준(원경). **진소예는 EP04 영입(EP01 미등장)** — 시트는 자산으로 하단 보관. 진하윤·THE DEALER도 자산 보관(딜러=얼굴 렌더 금지).

---

## 반별 유니폼 색 규약 (전 캐릭터 공통 앵커 — style-bible §5)

| 반 | identity | 유니폼 토큰 (프롬프트 주입) |
|---|---|---|
| 4군 콜드 벤치 | COLDBENCH | `dull iron-grey stand-collar zip track jacket, faded teal trim, worn stretched cuffs, academy hex emblem left chest, slag dull-iron tier badge right chest` |
| 1군 크라운 룸 | CROWNROOM | `deep navy stand-collar track jacket, gold piping, white inner shirt, premium glossy, gold holo tier badge right chest` |
| 코치 | — | `desaturated grey old coach track jacket, faded old team logo, no class color` |
| 총감독 | — | `charcoal three-piece suit + long coat (not a uniform)` |

- 콜드 벤치 5인 공통 하의: `slim charcoal training pants`. 등판에 콜사인 레터링.
- **승급 전까지 색 불변.** 혼용·오염 금지(style-bible §8-B-3).

---

## 1. 유건 (주인공 / ZERO · 前 ORACLE)

- **identity_tag:** `YUGEON`
- **불변 외형 토큰 (일관성 핵심 — 자구 고정):**
  `YUGEON, 19yo Korean man (looks worn like late-20s), short black two-block undercut with messy fringe grazing eyebrows, dark-brown sharp narrow eyes with heavy dark circles, lean slim build 175cm, slightly hunched gamer posture, pale skin, faint scar on right hand`
- **기본 의상:** `COLDBENCH uniform (dull iron-grey track jacket, faded teal trim), black hoodie underneath, old black gaming headset around neck`
- **식별 표식 (1~2):** ① 오른손등 옅은 흉터(트라우마 손 떨림 매개) ② 목에 낡은 검정 헤드셋 ③ 짙은 다크서클(노장의 눈).
- **표정 변주(외형 고정, 표정만 교체):**
  - 디폴트: `expressionless, half-lidded languid eyes (secretly calculating)`
  - 콜 잡을 때: `eyes sharpen sudden, focused commander gaze`
  - 각성(P57): `eyes ignite amber, resolute`
  - 회귀 직후(P16~20): `disbelief then cold calculation, aged eyes on young face`
- **의상 변주:** 기본(콜드 벤치)만. 콜드오픈 P01~13은 **前 ORACLE = 뒤통수 실루엣·역광 위주로 정면 얼굴 최소**(정체 은닉, style-bible LOC_CROWN_ARENA).
- **전용 시각 규칙 (style-bible §7-B):** 유건 시점 패널에만 청록 잔상 오버레이. 손 클로즈업 4컷(P08·P17·P28·P56) 동일 프레이밍. P57 청록→앰버 발화.
- **금지:** 머리색·눈매·다크서클·손 흉터 변경 금지. 잔상 오버레이를 타인 시점에 오용 금지. 콜드오픈 정면 얼굴 노출 금지.
- **레퍼런스 시트 경로(확정 후):** `_workspace/04_visual/refs/yugeon_ref.png`

---

## 2. 배태산 (WALL / 밴가드)

- **identity_tag:** `TAESAN`
- **불변 외형 토큰:**
  `TAESAN, 20yo Korean man, short brown sporty crop cut, dark-brown large fierce eyes with thick eyebrows, tall muscular build 188cm, tan skin`
- **기본 의상:** `COLDBENCH uniform with sleeves rolled up, faded teal trim`
- **식별 표식:** ① 콧등 반창고(band-aid on nose bridge) ② 오른 눈썹 흉터(scar through right eyebrow).
- **표정 변주:** 디폴트 `blazing aggressive glare` / 외침 `mouth wide shouting` / 당황 `flustered wide eyes`.
- **금지:** 눈썹 흉터·콧등 반창고 생략 금지, 체격 축소 금지.
- **레퍼런스 경로:** `_workspace/04_visual/refs/taesan_ref.png`

---

## 3. 남도경 (GLITCH / 아크메이지)

- **identity_tag:** `DOGYEONG`
- **불변 외형 토큰:**
  `DOGYEONG, 19yo Korean man, black straight blunt bangs covering eyebrows, dark-brown droopy eyes with lens reflection, slim pale 173cm, silver-rim glasses`
- **기본 의상:** `COLDBENCH uniform zipped to top, faded teal trim, data-USB pendant on neck, always holding a laptop`
- **식별 표식:** ① 은테 안경(silver-rim glasses) ② 목의 데이터 USB 목걸이.
- **표정 변주:** 디폴트 `indifferent sleepy eyes` / 의심(P43·P45 서브) `narrowed analytic stare over laptop`.
- **금지:** 안경 형태 변경·앞머리 라인 변경 금지.
- **레퍼런스 경로:** `_workspace/04_visual/refs/dogyeong_ref.png`

---

## 4. 정하루 (HALO / 서포트·팀 매니저)

- **identity_tag:** `HARU`
- **불변 외형 토큰:**
  `HARU, 18yo Korean woman, dark-brown short curly bob tucked behind ears, dark-brown round warm eyes, average build 163cm, warm skin tone, dimple on left cheek`
- **기본 의상:** `COLDBENCH cardigan-style track top with faded teal trim, team-manager armband, manager whistle on neck`
- **식별 표식:** ① 왼쪽 볼 보조개(dimple on left cheek) ② 매니저 완장 + 호루라기.
- **표정 변주:** 디폴트 `soft gentle smile` / 걱정 `worried round eyes` / 단단한 순간 `unexpectedly firm gaze`.
- **금지:** 보조개 좌우 반전 금지(왼쪽 고정), 완장·호루라기 생략 금지.
- **레퍼런스 경로:** `_workspace/04_visual/refs/haru_ref.png`

---

## 5. 윤태오 (KAISER / 1군 콜러·라이벌) 【정체를 알아보는 자】

- **identity_tag:** `TAEO`
- **불변 외형 토큰:**
  `TAEO, 20yo Korean man, ash-blonde slicked-back hair with side undercut, cool grey-blue sharp eyes (colored lenses), tall slim-toned 183cm, fair skin`
- **기본 의상:** `CROWNROOM uniform (deep navy track jacket, gold piping, white inner)`; 클리프행어 P48~54 개인방 = `same navy jacket, relaxed at night`.
- **식별 표식:** ① 왼쪽 귀 골드 이어커프 + 다중 피어싱 ② 슬릭백 언더컷.
- **표정 변주:** 디폴트 `arrogant smirk` / ORACLE 화제 시 `tone turns dead-serious, tense recognition` / 확신(P54) `eyes wide with certainty and thrill`.
- **금지:** 머리색(애쉬블론드)·이어커프 위치(왼쪽) 변경 금지.
- **레퍼런스 경로:** `_workspace/04_visual/refs/taeo_ref.png`

---

## 6. 한상혁 (COMPASS / 콜드 벤치 코치) 【W4 은닉 — EP01은 따뜻한 멘토로만】

- **identity_tag:** `SANGHYUK`
- **불변 외형 토큰:**
  `SANGHYUK, 38yo Korean man, greying disheveled medium hair, unkempt stubble, dark-brown tired eyes with deep wrinkles, average 178cm slightly stooped, rough sallow skin`
- **기본 의상:** `desaturated grey old coach track jacket (faded old team logo, no class color), joint brace on right hand, always holding a paper coffee cup`
- **식별 표식:** ① 오른손 관절 보호대(망가진 손 — 유건 손 떨림의 미래 예고) ② 항상 종이컵 커피.
- **표정 변주:** 디폴트 `languid bittersweet half-smile`.
- **EP01 규칙:** 배신 암시 시각 없음(따뜻한 멘토만). W4는 P31 관절 보호대 한 컷으로만 조용히 심음.
- **금지:** 관절 보호대(오른손) 생략 금지, 코치 트랙탑에 반 컬러 부여 금지.
- **레퍼런스 경로:** `_workspace/04_visual/refs/sanghyuk_ref.png`

---

## 7. 고형준 (총감독 / 적대) 【EP01 원경만 — P31】

- **identity_tag:** `HYUNGJUN`
- **불변 외형 토큰:**
  `HYUNGJUN, 52yo Korean man, grey neatly slicked-back hair, thin cold eyes behind gold-rim glasses, tall lean 182cm, pale skin`
- **기본 의상:** `charcoal three-piece suit with long coat (not a uniform), gold wristwatch`
- **식별 표식:** ① 금테 안경 ② 금 손목시계.
- **표정 변주:** 디폴트 `expressionless imposing faint smile`.
- **EP01 규칙:** P31 복도 원경 실루엣/원경만. 클로즈업·대사 없음.
- **레퍼런스 경로(확정 후):** `_workspace/04_visual/refs/hyungjun_ref.png`

---

## 8. 자산 보관 — EP01 미등장 (시트만, 렌더 대기)

### 8-1. 진소예 (BLINK / 레이서) — EP04 영입
- **identity_tag:** `SOYE`
- **불변 외형 토큰:** `SOYE, 18yo Korean woman, ash-brown long ponytail with loose strands, large anxious amber eyes, small slim 160cm, bright skin`
- **의상:** `oversized COLDBENCH hoodie-zip, faded teal trim, sleeves over hands, pastel right wrist-guard, one earphone`
- **식별 표식:** 오른 손목 파스텔 보호대, 한쪽 귀 이어폰. 표정 디폴트 `anxious, avoiding gaze`.
- **비고:** 진하윤과 자매 페어 디자인(닮은 골격, 호박눈 vs 하윤 회청눈). **EP01 렌더 금지(미등장).**

### 8-2. 진하윤 (VALKYRIE / 1군 에이스) — 자매 페어
- **identity_tag:** `HAWYUN`
- **불변 외형 토큰:** `HAWYUN, 21yo Korean woman, platinum-white long straight hair half-up, cold grey-blue eyes, slender 170cm, pale skin`
- **의상:** `CROWNROOM slim navy track jacket, gold trim, black gaming gloves both hands`
- **식별 표식:** 목 뒤 발키리 윙 타투 일부, 검정 게이밍 글러브. 표정 디폴트 `expressionless cold`.

### 8-3. THE DEALER (딜러 / 핸드 핸들러) 【얼굴 렌더 절대 금지】
- **identity_tag:** `DEALER`
- **불변 토큰:** `THE DEALER, gender/age unknown, backlit silhouette only (face never visible), gloved hands close-up, deep-black suit`
- **식별 표식:** 붉은 포인트광(담뱃불·시계), 주변 디지털 글리치 노이즈. `팔레트 딥블랙·핏빛레드·노이즈그레이`.
- **★렌더 규약 (style-bible §8-B-4):** **얼굴 이목구비 절대 렌더 금지.** 역광 실루엣·부분광·장갑 낀 손·글리치만. `no visible face, silhouette only`. EP01 미등장(고형준 원경까지가 EP01 적대 시각 한계) — 규약만 고정.

---

## 9. 레퍼런스 시트 사양 (ref-sheet-artist 지시서 — B-7)

> character-sheets 확정 → **패널 렌더 전** 아래 사양으로 다각도/표정 시트 선렌더. 저장: `_workspace/04_visual/refs/`. 렌더 절차는 webtoon-panel-render 0단계.

**공통 규격 (전 캐릭터):**
- 각도 턴어라운드: `front / three-quarter / side / back full-body turnaround`.
- 표정 3~4종 클로즈업: 각 캐릭터 표정 변주표(위)에서 디폴트 + 감정 2~3종.
- 중립 조건: `plain neutral grey background, even flat studio lighting, neutral pose, no dramatic color, model-sheet layout`.
- **텍스트 없음(중요):** `no text, no labels, no speech bubble, no watermark` — 깨끗한 외형 도감(패널과 달리 베이크 안 함, style-bible §8-A 예외).
- 식별 표식 좌/우 위치 또렷이(흉터·이어커프·보조개·관절 보호대·안경) — 흐리면 패널 일관성 약화.
- 글로벌 스타일 토큰(style-bible §1) 유지, 잔상/UI 오버레이는 레퍼런스에 넣지 않음(중립).

**EP01 선렌더 우선순위(등장 비중):**
1. YUGEON (주무대 전편) 2. TAESAN 3. HARU 4. DOGYEONG 5. TAEO (클리프행어) 6. SANGHYUK (P31) 7. HYUNGJUN(원경·간이 시트).
- SOYE·HAWYUN·DEALER는 EP01 렌더 보류(EP04+ / 자산). DEALER는 레퍼런스도 실루엣 기준 시트만.

---

## 10. 자가검증 체크리스트 (webtoon-panel-breakdown B / 품질 체크)

- [x] 캐릭터마다 identity_tag + 불변 외형 토큰(고밀도 명사구·영문·Korean 명시)
- [x] 식별 표식 1~2개 명시(흉터/반창고/안경/보조개/이어커프/관절보호대) — 동일 패널 혼동 방지
- [x] 불변(머리·눈·체형·표식) vs 가변(표정·의상·조명) 분리
- [x] 반 유니폼 색 규약(콜드벤치 회철+청록 / 1군 네이비+골드) 전 캐릭터 앵커
- [x] 유건 잔상·손 떨림 전용 시각 규칙 연결(style-bible §7-B)
- [x] 딜러 얼굴 렌더 금지(실루엣) 명시 · EP01 미등장 자산 분리(소예=EP04)
- [x] 레퍼런스 시트 사양(다각도·표정·전신·텍스트 없음·중립 조건) + 우선순위
- [x] 출력 경로 `_workspace/04_visual/character-sheets.md` · refs/ 경로 지정
