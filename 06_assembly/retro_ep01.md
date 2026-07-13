# retro — EP01 v2 《왜 졌는지 말해봐》 (2026-07-13 · 사인오프 후)

> **prompt-smith는 EP02 프롬프트 작성 전 이 파일을 Read하고 §3의 검증된 보강 패턴을 선적용한다.** (CLAUDE.md §성능 규약 6)

---

## 1. ★ v1 폐기에서 배운 것 (이 회차의 진짜 산출물)

v1은 **6축 검증을 100% 통과하고 사용자에게 폐기당했다.** 여기서 나온 벽 4개:

| # | 교훈 | 왜 |
|:-:|---|---|
| **1** | **명세가 틀리면 6축 검증은 무력하다.** 검증은 *"명세대로 그려졌나"*를 묻지 *"독자가 이해하나"*를 묻지 않는다 | v1의 하드룰이 *"화면에 라벨 0"*·*"직군명 노출 금지"*였다. 패널들은 그 명세를 **완벽히 이행**했고, 그래서 **반전이 전달 불가능**해졌다. 결함은 렌더가 아니라 **브리프**에 있었다 |
| **2** | **QA에 "독자가 이해하는가"를 최상위 게이트로 넣어라.** 6축 아래가 아니라 **위**에 | v2 QA는 **독자 이해도 10문항**(처음 보는 독자 시점 · *추론 요구량 = 0인가*)을 신설했고, 이것이 P023의 앵커 결함을 잡았다 — 6축 원장은 그것을 "수복"으로 통과시켰다 |
| **3** | **negative의 `no text`는 회차를 죽인다.** 화면이 물증인 이야기에서 라벨 금지 = 물증 삭제 | v1: 청록 파형 2개에 라벨 0 → 저게 음성 로그인지, 누구 목소리인지 알 방법이 없었다. **v2 전환: 화면 한글 라벨은 정상이자 필수** — 대신 **화이트리스트**(대본 자구 + 지정 라벨)로 통제하고, 그 밖 문자만 REGEN(P014·P025·P035·P039가 이 그물에 걸렸다) |
| **4** | **검증가는 패널을 혼동한다 — REGEN 판정·수복 확인은 오케스트레이터가 PNG를 직접 봐라** | v1: panel-validator가 패널을 혼동해 오판한 전례. v2: 재렌더본 10장 + P023 2차본을 오케스트레이터가 전부 직접 Read해 육안 확인. **실제로 batchA 원장이 P023을 "수복"으로 오판했고, QA의 끝단 육안이 그것을 뒤집었다** — 원장 자동 신뢰 금지 |
| **5** | **감정 억제를 하드룰로 걸지 마라.** 마스코트 원화의 자산은 표정이다 | v1: *"과장 리액션 금지·표정 변화는 작게"* → 무표정 다수 → 사용자 *"캐릭터도 구현 안 됐다"*. v2: **무표정 = 1급 REGEN**. 결과 무표정 패널 0 |

**한 줄로**: *검증이 통과시켜도 독자가 못 읽으면 실패다. 명세부터 의심하라.*

## 2. REGEN 회복 기록 (총 **11장** — 1차 웨이브 10장 + P023 2차 1장)

**축별 집계**: C1(외형) 1 · C2(배경 연속성) 1 · C3(텍스트 화이트리스트) 4 · C4(프롬프트 충실도/★SSOT) 5 (P023 2회 포함 시 6)
→ **최다 결함축 = C4(연출 지시 미이행)와 C3(화이트리스트 밖 문자)**. EP02 프롬프트는 이 두 축에 방어를 집중한다.

| 패널 | 축 | 결함 | 적용 보강 | 결과 |
|:-:|:-:|---|---|:-:|
| **P023** (1차) | C4 ★SSOT | P022와 완전히 다른 프레이밍(미니맵이 작은 인셋) → 되감기의 인과 단절 | `LOCKED FRAMING - IDENTICAL TO PREVIOUS PANEL` + negative `no small inset minimap` | ⚠️ **부분 수복 — 원장은 "수복" 판정했으나 QA가 뒤집음**(풀블리드가 됨 = P022의 *방*이 사라짐) |
| **P023** (2차) | C4 ★SSOT | 1차 재렌더본이 **풀블리드** — P022는 방 가장자리가 보이는 컷 | **명세가 아니라 실제 렌더를 복제**: `the screen DOMINATES the frame BUT THE ROOM IS STILL VISIBLE AROUND ITS EDGES: amber DESK LAMP at LEFT, dark mug LOWER-LEFT, owl figurine shelf at RIGHT` + `⛔ NOT a full-bleed screen-only shot` + negative의 `no pulled-back room view`(신지시와 충돌) **제거** | ✅ **수복** |
| **P012** | C1 | 전경 두 학생 뒤통수가 **사람의 검은 머리카락** | 전경 = 펭귄(깃털+청록 헤드셋)·라쿤(빨강+테이프) 명시 + negative `no human hair, no human heads` | ✅ |
| **P005** | C2 | 로비 소파 크림 → 적갈색 급변 | LOC_LOBBY 토큰에 `CREAM/OFF-WHITE sofa` 고정 + negative `no brown sofa` | ✅ |
| **P014** | C3 | 벽 보드에 `모집 분야` → 직군 보드 조기 노출 | 벽 보드 = **아이콘만, 글자 0** + negative `no readable text on the wall board` | ✅ |
| **P025** | C3 | 서류에 가짜 글자 | 서류 = 백지 또는 단순 도식선 | ✅ (대사·R4 충격 표정·배경 라벨 전부 보존) |
| **P035** | C3 | 배경에 **가짜 직군 보드**(`JOB BOARD`+엉뚱한 단어+`FOCUS ADAPT WIN`) → 진짜 보드(P032)를 흐림 | 벽·화면에 판독 가능 글자 0 + negative `no job board, no motivational poster` | ✅ |
| **P039** | C3 | 모니터 베젤에 영문 `RAKU` | 베젤 무각인 + negative `no brand name on the monitor` | ✅ |
| **P017** | C4 | HOO 시선이 HANJI를 안 향함(컷의 유일 기능 실패) | `HIS EYES ARE UNMISTAKABLY LOCKED ON HANJI` | ✅ |
| **P053** | C4 ★SSOT | ① HANJI가 화면을 안 짚음 → `여기.`가 가리킬 대상 소멸 ② HOO가 셋 중 가장 크게 웃음(미소 진폭 역전) | ① `HANJI IS POINTING AT THE SCREEN … does NOT withdraw` ② `HOO'S SMILE IS THE SMALLEST OF THE THREE` + negative `no big grin on HOO` | ✅ |
| **P054** | C4 | HANJI가 명패를 **올려다보지 않고 정면**을 봄(마지막 감정 소멸) | `LOOKING UP AT THE NAMEPLATE … head TILTED UP` + negative `no looking at the viewer` | ✅ |

**플래그 패널**: 없음(ACCEPT-FLAG 0). ★SSOT 앵커는 예산 사유로 스킵하지 않고 전부 기준 충족까지 재렌더했다.

## 3. ★ 검증된 프롬프트 보강 패턴 (EP02 선적용 — 효과 확인됨)

| 패턴 | 문법 | 방어하는 결함 |
|---|---|---|
| **동일 앵글 대구는 "명세"가 아니라 "실제 렌더"를 복제한다** | 앞 패널의 **실물에서 보이는 소품을 열거**한다(`amber desk lamp at LEFT, mug LOWER-LEFT, owl figurine at RIGHT`). *"IDENTICAL TO PREVIOUS PANEL"*만으로는 모델이 **다른 방향으로 다르게** 그린다 | C4 ★SSOT 대구 붕괴 (P023 — 2회 소요) |
| **의인화 군중/뒤통수는 반드시 종을 명시** | `penguin/raccoon back-of-head, feathers, headset` + negative `no human hair, no human heads` | C1 — 모델은 배경 인물을 **사람으로 되돌린다** |
| **화이트리스트 + 배경 문자 명시적 금지** | 프롬프트에 **허용 문자만 열거**하고 negative에 `no readable text on the wall/monitor/paper` | C3 — 모델은 빈 보드·모니터·서류를 **가짜 글자로 채운다**(4/11 REGEN이 이것) |
| **시선/포인팅은 대문자 단언으로** | `HIS EYES ARE UNMISTAKABLY LOCKED ON X` · `IS POINTING AT THE SCREEN … does NOT withdraw` · `head TILTED UP` | C4 — 컷의 유일 기능이 시선·손짓일 때 모델은 그것을 **가장 먼저 버린다** |
| **미소 진폭도 지시 대상이다** | `X'S SMILE IS THE SMALLEST OF THE THREE` + negative `no big grin on X` | C4 — refs 시트 첨부의 **카탈로그 미소 누출** |
| **negative 충돌 점검** | 새 지시를 넣으면 **기존 negative가 그것을 죽이는지** 확인한다(P023: 새 지시 `room visible` ↔ 기존 negative `no pulled-back room view`) | 재렌더 실패의 숨은 원인 |
| **LOC 토큰에 색·재질까지 고정** | `LOC_LOBBY: CREAM/OFF-WHITE sofa` + negative `no brown sofa` | C2 — 씬 내 배경 급변 |

## 4. EP02 권고

1. **★ `LOC_GAMESCREEN` 고정 토큰을 신설하라** (quality-reviewer 지적 · EP01 최대 미결 결함).
   EP01은 **같은 경기의 같은 맵이 컷마다 다른 그림**이었다 — 픽셀풍(P14) / 청록 격자(P20·P24) / 구름 텍스처(P23) / 준사실 MOBA 조감(P25·P44·P47) / 초록 카툰맵(P46). 반전 이해는 **라벨이 떠받쳐** 성립했으나(이해도 영향 0) *"한 게임을 보고 있다"*는 **배경 연속성이 약하다.** EP01 소급 재렌더는 비권장(8장 재렌더 대비 이득 낮음).
   → **토큰에 담을 것**: 맵 팔레트 1종 · 격자 유무·간격 · 지형 실루엣 1종 · 미니맵 위치(우하단 고정) · FOG_PATCH 색과 손그림 경계 · 파란 원/빨간 원 표기법. **캐릭터 refs와 동급의 SSOT로 취급하고 전 화면 패널에 공통 주입한다.**
2. **독자 이해도 10문항을 QA 최상위 게이트로 유지하라.** 회차마다 문항을 새로 쓴다(*"이 회차의 인과를 처음 보는 독자가 추론 없이 읽는가"*).
3. **★SSOT 앵커의 수복 확인은 오케스트레이터 직접 육안.** 원장의 "수복" 기록을 신뢰하지 마라(P023 실측).
4. **신규 캐릭터(학부모)는 사용자 원화·승인 선행.** 하네스는 캐릭터를 창작하지 않는다.
5. **표정 연기는 v2의 기본값이다.** refs 첨부의 카탈로그 표정을 이기는 **ACTING 블록**을 패널마다 유지하되, 이것을 *무표정*으로 오해하지 마라(v1 사고).

*작성: showrunner · 2026-07-13 · 원천: `_ep01v2_validation_batchA/B.md` REGEN 회복 기록 + `06_assembly/ep01/qa_report.md` + `00_input/brief.md` §v1은 왜 폐기됐는가*
