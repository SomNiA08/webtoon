---
name: webtoon-orchestrator
description: "웹툰 제작 에이전트 팀(27명)을 조율하는 메인 오케스트레이터. 인기 웹툰 트렌드 조사 → 대사 위주·고긴장·매 회차 반전 시나리오 작성 → 캐릭터 다각도 레퍼런스 시트를 먼저 렌더 → 회차당 50+ 패널을 말풍선·한글 대사 in-image 베이크로 codex-image 동시 5장 병렬 렌더 → panel-validator 생성-검증 루프로 기준 만족까지 재생성 → 세로 스크롤 뷰어 조립까지 전 과정을 단계별 팀 재구성으로 운영한다. 트리거: '웹툰 만들어/제작', '웹툰 한 화/회차 만들어', '웹툰 시나리오부터 이미지까지', '웹툰 에피소드 제작', '웹툰 하네스 실행'. 후속 작업: '다음 화 만들어', '이 회차 다시/수정/보완', '반전 더 강하게', '패널 다시 그려', '특정 단계만 다시 실행', '이전 결과 기반 개선' 등에도 반드시 이 스킬을 사용. 단순 웹툰 추천/감상은 직접 응답."
---

# Webtoon Orchestrator — 웹툰 제작 팀 조율

웹툰 한 회차를 트렌드 조사부터 완성 뷰어까지 만들어내는 통합 오케스트레이터. 27개 전문 에이전트를 **4개 단계별 팀**으로 순차 운영한다.

## 실행 모드: 에이전트 팀 (단계별 재구성)

세션당 활성 팀은 1개뿐이므로, 각 Phase마다 `TeamCreate`로 팀을 만들고 작업이 끝나면 `TeamDelete`로 정리한 뒤 다음 Phase 팀을 만든다. 이전 팀의 산출물은 저장소 루트의 산출물 디렉토리(`00_input/`~`RELEASE/`)에 남아 다음 팀이 Read로 이어받는다.

**폴백(팀 API 없음):** 현재 환경에 `TeamCreate`/`TeamDelete` 도구가 없으면 팀 생성을 시도하지 말고, 같은 구성원을 **Agent 도구 팬아웃**으로 실행한다(독립 작업은 한 메시지에 병렬 스폰, 의존 작업은 순차). `TaskCreate`/`SendMessage`가 있으면 진행 추적·팀원 간 공유에 활용한다.

**모델:** 팀원 스폰 시 기본은 **세션 모델 상속(model 미지정)**. 오버라이드 지침(토큰·시간 최적화):
- **비전 판정 게이트 — 다운그레이드 금지(세션 모델 유지):** panel-validator, quality-reviewer, art-director, ref-sheet-artist, showrunner. 이미지 육안 판정·반전 전달 판단의 정확도가 회차 품질을 직접 좌우한다(EP01 오버레이 13장 누출·P49 유출 모두 판정 실패).
- **품질 민감 집필 — 세션 모델 권장:** twist-master, script-editor, dialogue-writer, prompt-smith(모든 패널 품질의 상류).
- **기계적 실행 — `model: "sonnet"` 오버라이드 허용(비용↓):** panel-artist-a/b/c(드라이버 호출·무결성 스크립트·재렌더 디스패치가 주 업무, 창의 판단 최소).
- 그 외(리서치 4인·worldbuilder·series-plotter 등)는 기본 상속, 사용자가 비용 절감을 요청하면 sonnet 허용.

**스폰 프롬프트 규약(탐색 낭비 방지):** 팀원을 스폰할 때 프롬프트에 ① 읽을 입력 파일의 **정확한 경로 목록** ② 출력 파일 경로 ③ "목록 외 저장소 탐색 금지" ④ 회차 번호·직전 단계 요약 2~3줄을 반드시 담는다. 에이전트가 Glob/Grep으로 저장소를 훑는 왕복이 스폰당 수천 토큰을 낭비한다.

## 에이전트 구성 (27명, 4팀)

| 팀 | 팀원 | 역할 | 스킬 | 주요 출력 |
|----|------|------|------|----------|
| **리서치팀** | trend-scout | 장르/트로프 동향 | webtoon-trend-research | 01_research/trend-scout.md |
| | platform-ranker | 플랫폼 랭킹·연재구조 | webtoon-trend-research | 01_research/platform-ranker.md |
| | audience-analyst | 독자층·이탈·몰입 | webtoon-trend-research | 01_research/audience-analyst.md |
| | hook-analyst | 후킹/반전 메커니즘 역설계 | webtoon-trend-research | 01_research/hook-analyst.md |
| | trend-synthesizer | 종합 기획 브리프 | webtoon-trend-research | 01_research/trend-brief.md |
| **시나리오팀** | concept-architect | 하이콘셉트/로그라인 | webtoon-scenario | 02_story/concept.md |
| | worldbuilder | 세계관·규칙 | webtoon-scenario | 02_story/world.md |
| | character-designer | 캐스트(외형+성격+아크) | webtoon-scenario | 02_story/characters.md |
| | series-plotter | 시리즈 아크·회차 맵 | webtoon-scenario | 02_story/series-arc.md |
| | twist-master | 매 회차 반전 설계 | webtoon-scenario | 02_story/twist-plan.md |
| | tension-engineer | 긴장 곡선·클리프행어 | webtoon-scenario | 02_story/tension-curve.md |
| | episode-outliner | 회차 비트시트(50+ 패널) | webtoon-scenario | 03_episode/ep{NN}_beatsheet.md |
| | dialogue-writer | 대사 위주 대본 | webtoon-scenario | 03_episode/ep{NN}_script.md |
| | script-editor | 교정·반전 명료성 | webtoon-scenario | 03_episode/ep{NN}_script_final.md |
| **비주얼팀** | art-director | 스타일 바이블·일관성 토큰·장소 토큰·말풍선 규약 | webtoon-panel-breakdown | 04_visual/style-bible.md, character-sheets.md |
| | ref-sheet-artist | 캐릭터 다각도/표정 레퍼런스 시트(패널 전 선행) | webtoon-panel-render | 04_visual/refs/*.png, refs/INDEX.md |
| | panel-director | 50+ 패널 샷리스트(scene_id/location) | webtoon-panel-breakdown | 04_visual/ep{NN}_shotlist.md |
| | letterer | in-image 말풍선/대사 베이크 명세 | webtoon-assembly | 04_visual/ep{NN}_lettering.md |
| | prompt-smith | 패널별 codex 프롬프트(베이크+장소+레퍼런스) | webtoon-panel-render | 04_visual/ep{NN}_prompts.md |
| | panel-artist-a | 그룹 A REGEN 재렌더(1차는 렌더 드라이버) | webtoon-panel-render | 05_panels/ep{NN}/panel_*.png |
| | panel-artist-b | 그룹 B REGEN 재렌더(1차는 렌더 드라이버) | webtoon-panel-render | 05_panels/ep{NN}/panel_*.png |
| | panel-artist-c | 그룹 C REGEN 재렌더(1차는 렌더 드라이버) | webtoon-panel-render | 05_panels/ep{NN}/panel_*.png |
| | panel-validator | 패널 6축 검증·재생성 루프 게이트(general-purpose) | webtoon-panel-render | 04_visual/ep{NN}_validation.md |
| **조립검수팀** | episode-compositor | 세로 스크롤 뷰어 조립 | webtoon-assembly | 06_assembly/ep{NN}/index.html |
| | quality-reviewer | QA 검수(general-purpose) | webtoon-assembly | 06_assembly/ep{NN}/qa_report.md |
| | continuity-manager | 회차 간 연속성 | webtoon-assembly | 06_assembly/continuity.md |
| | showrunner | 총괄·사인오프·패키징 | webtoon-assembly | RELEASE/ep{NN}/ |

## 워크플로우

### Phase 0: 컨텍스트 확인 (후속 작업 판별)

기존 산출물 존재 여부(`02_story/concept.md` 기준)와 사용자 요청으로 실행 모드를 정한다.

1. `02_story/concept.md` 미존재 → **초기 실행**. Phase 1로.
2. 산출물 존재 + "다음 화" 요청 → **새 회차 실행**. {NN}을 증가시키고, 02_story·style-bible·character-sheets·**refs/(레퍼런스 시트)**·continuity.md는 재사용(Read, 재렌더 금지 — 시리즈 일관성), **`01_research/trend-brief.md`도 30일 이내면 재사용(Phase 2 스킵 — Phase 2의 "리서치 재사용 게이트" 참조)**, 03_episode 이후만 새로 생성.
3. 산출물 존재 + "이 회차의 OO만 다시" 요청 → **부분 재실행**. 해당 단계 팀만 재구성하여 호출하고, 그 산출물만 덮어쓴다. 하위 단계(예: 대본 수정 시 샷리스트→렌더→조립)는 영향받는 만큼만 재실행. **패널을 1장이라도 재렌더했으면 아래 "재렌더 원자 규약"을 반드시 완주한다.**
4. 산출물 존재 + 새 기획 입력 → **새 기획 실행**. 기존 산출물 디렉토리(`00_input/`~`RELEASE/`, `_render_jobs/`, `_render_logs/`)를 `_archive/{YYYYMMDD_HHMMSS}/`로 이동 후 Phase 1.

부분/새회차 재실행 시 이전 산출물 경로를 팀원 프롬프트에 포함해 "Read 후 개선점만 반영"을 지시한다.

### Phase 1: 준비

1. 사용자 입력 분석 — 회차 번호 {NN}, 장르 방향(있으면), 제약(수위·길이·톤).
2. `00_input/brief.md`에 입력·회차 번호·제약을 기록.
3. 작업 디렉토리 보장: `mkdir -p 00_input 01_research 02_story 03_episode 04_visual 05_panels 06_assembly RELEASE _render_jobs _render_logs`.

### Phase 2: 트렌드 리서치 (리서치팀)

**실행 모드:** 에이전트 팀

**리서치 재사용 게이트(5-에이전트 재기동 전 필수 확인 — 토큰·시간 절약):** `01_research/trend-brief.md`가 이미 있고 헤더의 "종합 일자"가 **30일 이내**면, 사용자가 명시적으로 재조사를 요청("트렌드 다시 조사해줘" 등)하지 않는 한 리서치팀을 재기동하지 않는다 — 기존 브리프를 Read로 재사용하고 곧장 Phase 3으로 간다(웹 리서치 5인분의 비용 절약; 웹툰 트렌드는 회차 주기로 바뀌지 않는다). 종합 일자가 30일을 넘었거나(신선도 상실), 브리프가 없거나, 새 기획이 기존 브리프의 장르 방향과 무관하면 아래를 실행한다.

1. `TeamCreate(team_name: "webtoon-research", members: [trend-scout, platform-ranker, audience-analyst, hook-analyst, trend-synthesizer])` — 전원 `agent_type`=커스텀 이름, 모델은 세션 상속(§실행 모드의 모델 원칙).
2. `TaskCreate`로 5개 작업 등록. trend-synthesizer 작업은 나머지 4개에 `depends_on`.
3. 4명의 조사자가 병렬 조사, 흥미로운 발견을 SendMessage로 공유(hook-analyst↔trend-scout 등).
4. trend-synthesizer가 4개 산출물을 종합 → `01_research/trend-brief.md`.
5. `TeamDelete`로 정리. (산출물은 `01_research/`에 보존)

### Phase 3: 시나리오 (시나리오팀)

**실행 모드:** 에이전트 팀 (파이프라인 + 팬아웃)

1. `TeamCreate(team_name: "webtoon-story", members: [concept-architect, worldbuilder, character-designer, series-plotter, twist-master, tension-engineer, episode-outliner, dialogue-writer, script-editor])`.
2. 작업 의존성: concept → **{world ∥ characters}(병렬 — 둘 다 concept.md만 소비, wall-clock 1단계 단축)** → series-arc(둘 다 대기) → {twist-plan, tension-curve}(상호 조율) → beatsheet → script → script_final. **병렬 조정 규칙(1줄)**: 캐릭터의 능력·제약은 world.md 규칙을 인용해 서술하고(world 미확정 구간은 '규칙 인용 필요' 표시), 충돌은 series-plotter가 series-arc 확정 전에 조정한다 — 출처 병기, 삭제 금지.
3. **매 회차 반전 보장**: twist-master가 twist-plan에 회차별 반전을 명시하고, script-editor가 script_final에서 반전이 명료하게 전달되는지 검수.
4. **50+ 패널 분량 확보**: episode-outliner가 비트를 충분히 쪼개 50패널 이상 분량을 만든다.
5. 산출물: `02_story/*`, `03_episode/ep{NN}_script_final.md`.
6. `TeamDelete`로 정리.

### Phase 4: 비주얼 프로덕션 (비주얼팀)

**실행 모드:** 에이전트 팀 (감독자 + 생성-검증 루프). **codex 동시 세션 ≤ 5 엄수.**

1. `TeamCreate(team_name: "webtoon-visual", members: [art-director, ref-sheet-artist, panel-director, letterer, prompt-smith, panel-artist-a, panel-artist-b, panel-artist-c, panel-validator])`.
2. **아트 디렉션**: art-director가 `style-bible.md`(작화·**장소 토큰 LOC_***·**말풍선 시각 규약** 포함) + `character-sheets.md`(일관성 토큰+레퍼런스 사양)를 만들고 팀에 공유.
3. **레퍼런스 시트 렌더 ∥ 문서 트랙(크리티컬 패스 중첩)**: ref-sheet-artist가 주요 캐릭터의 다각도/표정 레퍼런스를 codex로 렌더(동시 ≤5, ≈2웨이브 5~6분)하는 **동안** 4·5(샷리스트·레터링·프롬프트)를 병렬로 진행한다 — 레퍼런스 앵커의 **파일 경로는 character-sheets.md 확정 시점에 결정적**(`refs/{IDTAG}_ref.png`)이라 문서 작업에 레퍼런스 '이미지'는 필요 없다. **refs 이미지 확정에 게이트되는 것은 6의 패널 렌더뿐.** 렌더된 refs는 `04_visual/refs/`에 확정 → INDEX.md를 prompt-smith·panel-validator에 인계. (후속 회차는 기존 refs/ 재사용 = 게이트 즉시 통과.) 예외: 레퍼런스 렌더가 외형 변경을 강제하면(드묾) ref-sheet-artist의 변경 통지로 prompt-smith가 영향 패널 프롬프트를 **패널 렌더 전에** 패치한다.
4. **콘티+레터링 병렬**: (3의 레퍼런스 렌더와 동시) panel-director가 `ep{NN}_shotlist.md`(50+ 패널, 각 패널 scene_id/location), letterer가 `ep{NN}_lettering.md`(in-image 말풍선 베이크 명세, 한글 짧게)를 병렬 작성.
5. **프롬프트 합성**: (레퍼런스 렌더 완료를 기다리지 않는다) prompt-smith가 [스타일+장소토큰+캐릭터토큰&레퍼런스앵커+구도/상태색+말풍선/한글 베이크]를 합성한 `ep{NN}_prompts.md`를 만들고 scene 그룹 A/B/C 분배. **`no text` 금지(말풍선을 그려야 함)**, 부정은 `no English/gibberish/misspelled text`. 첫 회차가 아니면 직전 회차 `06_assembly/retro_ep{NN-1}.md`의 검증된 보강 패턴을 선적용(§Phase 6 회고).
6. **렌더링 (동시성 핵심 + 카나리아 선검증)**: `_split_prompts.py` 분할은 prompts.md 완성 즉시(문서 트랙에서) 가능하며, **refs 확정 게이트 통과 후** 렌더를 시작한다 — **① 카나리아 1웨이브(정확히 5장)** — 대표 패널 5장(대사 밀도 높은 패널 ≥2 · 시스템 UI/HUD 텍스트 1 · 무대사 1 · 2인 이상 등장 1)의 `.txt`를 임시 jobsdir로 복사해 `_render.sh`로 선렌더하고, **panel-validator가 이 5장의 6축 전체(C3(d) 통합 레터링 포함) 선검증을 마치기 전에는 추가 웨이브를 띄우지 않는다.** 같은 축 결함이 카나리아 ≥2장이면 시스템성 결함 — prompt-smith가 **전 패널** 공통 프롬프트 패턴을 정본 prompts.md에서 수정 → `_split_prompts.py` 재분할 → 렌더 재개(EP01 오버레이-룩이 13/57장에 퍼진 뒤 끝단에서야 발견된 사고의 재발 방지). 클린이면 **② 1차 전량 렌더 = 공식 드라이버 `_render.sh <jobsdir> <outdir>` 단일 실행**(카나리아 5장은 SKIP — 완료되는 대로 다음 장을 투입하는 **롤링 동시 5**, 기존 PNG SKIP). panel-artist 3명에게 1차 렌더를 팬아웃하지 않는다 — 전역 한도가 5라 3분할은 처리량 이득 없이 조율 토큰만 쓴다. **panel-artist-a/b/c의 역할은 7의 검증 루프에서 REGEN 재렌더 분담**(scene 그룹 소유)이며, 이때도 codex exec 동시 실행 총합 ≤ 5. 50패널 ≈ 26~28분(+카나리아 게이트 수 분 — 시스템성 결함 1건만 막아도 즉시 회수).
7. **검증-재생성 루프 (핵심 — 기준 만족까지, 렌더와 병행)**: panel-validator는 카나리아 선검증(6-①) 이후로는 **전체 렌더 완료를 기다리지 않고** 완료된 패널부터 6축(C1 캐릭터/레퍼런스, C2 배경·장소 연속성, C3 말풍선·한글 텍스트, C4 프롬프트 충실도, C5 대사 흐름, C6 무결성·md5중복) 검증을 시작한다(후반 렌더와 앞 패널 검증이 겹쳐 wall-clock 단축) → ACCEPT/REGEN 판정. REGEN 패널은 prompt-smith가 프롬프트 보강 → **REGEN 재렌더는 1패널 1호출이 아니라 누적 웨이브**: 누적 시점마다 대상 패널 `.txt`(≤5장)만 담은 임시 jobsdir + `_render.sh` 1회로 담당 panel-artist가 디스패치한다(판정·원장은 패널별 유지) → 재검증. **루프 재검증 범위는 재렌더된 패널만**(통과 패널을 반복 재Read하지 않는다 — 토큰 낭비). **패널당 최대 3회**, 초과 시 ACCEPT-FLAG(통과+한계 기록). **단, ★SSOT 앵커 패널(반전 자구/미니맵/손 클로즈업 대구/클리프행어 등 샷리스트에 ★ 표기된 패널)은 C1·C3 결함을 ACCEPT-FLAG로 통과시킬 수 없다** — 예산과 무관하게 기준 만족까지 재렌더하고, 그래도 불가하면 사용자에게 보고 후 지시를 받는다. (선택) 패널 용량 최적화를 쓰는 회차면 **매니페스트 생성 전**에만 적용한다(webtoon-panel-render §패널 용량 최적화 — 검증된 바이트 = 배포 바이트, ep01 소급 금지). 전 패널 통과 시 `04_visual/ep{NN}_validation.md` 완성 + **패널별 md5 매니페스트 기록**: `(cd 05_panels/ep{NN} && md5sum *.png > ../../04_visual/ep{NN}_manifest.md5)` — 파일명만 기록(경로 없이).
8. 산출물: `04_visual/*`(style-bible/character-sheets/refs/shotlist/lettering/prompts/validation), `05_panels/ep{NN}/panel_*.png`(검증 통과본).
9. `TeamDelete`로 정리.

### Phase 5: 조립 · 검수 (조립검수팀)

**실행 모드:** 에이전트 팀 (생성-검증)

1. `TeamCreate(team_name: "webtoon-assembly", members: [episode-compositor, quality-reviewer, continuity-manager, showrunner])`.
2. episode-compositor가 (말풍선이 이미 베이크된) 패널 PNG를 **오버레이 없이** 세로 스크롤 `index.html`로 조립(간격·리듬만 설계).
3. quality-reviewer가 점진적 QA — panel-validator의 `validation.md`(ACCEPT-FLAG 파악)를 먼저 읽고, 회차 전체로 패널 수 50+, **레퍼런스 외형 일관성**, **배경 연속성**, **베이크 한글 텍스트 정확/가독**, **대사 흐름**, **반전 전달**, 손상/중복 이미지를 검수. PASS/FIX/REDO 판정.
4. FIX/REDO 패널 → panel-validator 루프 재투입(prompt-smith 보강+panel-artist 재렌더) 또는 SendMessage 피드백으로 해당 패널만 재작업(최대 2회 루프). 반전이 안 드러나면 시나리오팀/레터러로 피드백.
5. **재렌더 원자 규약 (EP01 실사고 — 절대 생략 금지)**: QA 이후 시점을 포함해 **패널을 1장이라도 재렌더했으면** 다음 4단계를 한 묶음으로 완주한다. ① panel-validator가 재렌더본을 6축 재검증(특히 C1 레퍼런스 대조 — 수정하려던 결함만 보고 끝내지 말 것, 재렌더는 새 결함을 만든다) → ② `ep{NN}_validation.md`·`qa_report.md`의 해당 패널 항목 갱신 → ③ `ep{NN}_manifest.md5` 재생성 → ④ RELEASE에 이미 패키징됐다면 해당 파일 재복사. EP01에서 QA 후 재렌더된 P32·P49가 이 규약 없이 릴리스되어, P49에 태오 흑발(C1 위반)이 무검증 유출됐다.
6. showrunner가 사인오프 전 **md5 릴리스 게이트**를 통과시킨다: `bash _verify_release.sh {NN}`이 **exit 0**이어야 한다(패널 수·손상·md5 중복·매니페스트 정합·RELEASE 사본 일괄 — 불일치가 하나라도 있으면 사인오프 거부 → 5번 규약으로 되돌린다). 통과 시 `RELEASE/ep{NN}/`에 최종 패키징(+매니페스트 사본 포함) + 다음 회차 시드(클리프행어 이어받기) 제안, 패키징 후 게이트 1회 재실행으로 사본 무결성 확인.
7. `TeamDelete`로 정리.

### Phase 6: 마무리

1. 중간 산출물 전체 보존(`00_input/`~`06_assembly/`, `_render_jobs/`, `_render_logs/` = 감사 추적).
2. **회차 회고(retro) 기록 — 사인오프 직후**: `06_assembly/retro_ep{NN}.md`를 작성한다 — 축별(C1~C6) REGEN 건수 집계, ACCEPT-FLAG 패널 목록, **효과가 확인된 프롬프트 보강 패턴**(원천: `ep{NN}_validation.md`의 REGEN 회복 기록 `패널 → 축 → 적용 보강 → 결과`). 다음 회차의 prompt-smith가 프롬프트 작성 전 이 파일을 Read해 검증된 패턴을 선적용한다(같은 결함 클래스 재발 방지 — 레터링 잉크 통합 문구 등).
3. 사용자에게 결과 요약: 회차 제목·로그라인·반전 한 줄·패널 수·뷰어 경로(`RELEASE/ep{NN}/index.html`)·다음 회차 시드.
4. 피드백 요청: "반전 강도/대사 톤/작화 일관성에서 고치고 싶은 부분이 있나요?" (Phase 7 진화 연결)

## 데이터 흐름

```
trend-brief.md
   └→ concept → {world ∥ characters} → series-arc → {twist-plan, tension-curve}
                (병렬 — 둘 다 concept 소비,      └→ beatsheet → script → script_final
                 충돌은 series-plotter 조정)
script_final + characters
   └→ style-bible(+장소토큰 LOC_*, 말풍선 규약)/character-sheets
        ├→ refs/*.png 렌더 (경로는 사전 결정 — 아래 문서 트랙과 병렬, 패널 '렌더'만 확정에 게이트)
        └→ shotlist(scene_id/location) + lettering(in-image 말풍선 명세)
              └→ prompts(스타일+장소+레퍼런스앵커+말풍선 베이크, scene A/B/C)
                    └→ [refs 확정] → 카나리아 5장 렌더+6축 선검증 → 잔여 전량 렌더(롤링 동시 5)
                          └→ panel_*.png ⇄ panel-validator 6축 검증-재생성 루프 ⇄ prompt-smith/panel-artist(REGEN 웨이브 ≤5)
                                └→ validation.md (전 패널 통과)
panel_*.png(말풍선 포함) → index.html(오버레이 없음) → qa_report → (재작업 루프) → RELEASE/ep{NN}/ → retro_ep{NN}.md
```

## 에러 핸들링

| 상황 | 전략 |
|------|------|
| 팀원 1명 실패/중지 | 리더가 유휴 알림 감지 → SendMessage 상태 확인 → 재시작 또는 대체 팀원 생성 |
| 팀원 과반 실패 | 사용자에게 알리고 진행 여부 확인 |
| codex 렌더 0바이트/손상 | 해당 패널만 재렌더(배치 전체 금지). 2회 실패 시 경고 후 통과, 보고서 명시 |
| 카나리아 5장 중 같은 축 결함 ≥2장 | **시스템성 결함** — 추가 웨이브 중지 유지, prompt-smith가 전 패널 공통 패턴을 정본 prompts.md에서 수정 → `_split_prompts.py` 재분할 → 결함 카나리아 REGEN + 전량 렌더 재개 |
| 패널 md5 중복(서로 다른 패널이 동일 이미지) | 중복 패널 삭제 후 단독 재렌더. 크기/헤더 검사로는 못 잡으니 md5 검사 필수(EP01 실제 발생) |
| 배경 급변(도로→실내 등) | panel-validator C2 REGEN → prompt-smith가 장소 토큰(LOC_*) 강화 후 그 패널만 재렌더 |
| 한글 말풍선 깨짐/오탈자 | panel-validator C3 REGEN → 텍스트 짧게·따옴표·굵게로 보강 재렌더. 3회 실패 시 가장 정확한 버전 ACCEPT-FLAG + 보고서 명시 |
| 캐릭터 외형 이탈 | panel-validator C1 REGEN → 레퍼런스 앵커·식별 표식 강조 후 재렌더 |
| codex 전체가 느림(450초+) | 플랜 한도 의심 → `codex login status` 확인, 동시 수를 줄여 재시도(`RENDER_CONCURRENCY=3 bash _render.sh …` — 5 초과 상향은 불가). 행 걸린 세션은 드라이버의 `RENDER_TIMEOUT`(기본 900초)이 FAIL 처리해 슬롯을 회수하고, 이번 패스 FAIL분은 1회 자동 재시도(RETRY)된다 |
| 패널 50개 미만 | episode-outliner/panel-director에게 비트 추가 분할 요청 |
| 반전 불명확(QA REDO) | 시나리오팀(twist-master/script-editor) 또는 letterer로 피드백 후 재작업 |
| QA 이후 재렌더 발생 | **재렌더 원자 규약(Phase 5-5) 강제**: 재검증→리포트 갱신→매니페스트 재생성→RELEASE 재복사. 매니페스트 불일치 상태로 사인오프 금지(EP01 실제 발생 — P49 태오 흑발 무검증 유출) |
| 데이터 충돌 | 출처 병기, 삭제 금지 |
| 무한 재작업 | 패널당 재생성 최대 3회, 단계별 재작업 루프 최대 2회. 초과 시 현 상태로 진행하고 한계를 보고. **단 ★SSOT 앵커 패널의 C1·C3은 예외 — FLAG 통과 불가, 사용자 에스컬레이션** |

## 테스트 시나리오

### 정상 흐름
1. 사용자: "트렌드 반영해서 웹툰 1화 만들어줘."
2. Phase 1: brief 기록, 산출물 디렉토리 생성.
3. Phase 2: 리서치팀 5명 → trend-brief.md.
4. Phase 3: 시나리오팀 9명 → script_final.md (반전 1개+, 50+ 패널 분량).
5. Phase 4: 비주얼팀 9명 → 레퍼런스 시트 렌더 ∥ 샷리스트·레터링·프롬프트 → 카나리아 5장 선렌더+6축 선검증 → 50+ panel PNG(말풍선 베이크, `_render.sh` 롤링 동시 ≤5) → panel-validator 6축 검증-재생성 루프(렌더와 병행, REGEN은 ≤5장 웨이브)로 전 패널 통과 → validation.md.
6. Phase 5: 조립검수팀 4명 → 오버레이 없는 index.html + qa PASS → RELEASE/ep01/.
7. 결과: `RELEASE/ep01/index.html` 세로 스크롤 웹툰(말풍선 포함) + 다음 화 시드.

### 에러 흐름 (배경 급변 + 한글 깨짐 재생성)
1. Phase 4 렌더 후 panel_023의 배경이 같은 씬(도로)인데 실내로 나오고, panel_031의 말풍선 한글이 깨짐.
2. panel-validator가 C2(023)·C3(031) REGEN 판정 → validation.md에 사유·수정 지시 기록.
3. prompt-smith가 023에 장소 토큰(LOC_*) 강화, 031에 텍스트 따옴표·굵게·짧게 보강 → 담당 panel-artist가 그 2장을 한 웨이브로 재렌더(대상 .txt만 담은 임시 jobsdir + `_render.sh`).
4. panel-validator 재검증: 023 ACCEPT, 031은 3회까지도 일부 글자 흔들림 → 가장 정확한 버전 ACCEPT-FLAG + 보고서 명시.
5. 전 패널 통과 후 조립 진행, qa_report·RELEASE 노트에 플래그 패널 한계 명시.

## 후속 작업 가이드

- "다음 화" → Phase 0 case 2(새 회차). 세계관/스타일/연속성 + **리서치 브리프(30일 이내면 Phase 2 스킵)** 재사용, 03_episode 이후만 신규. prompt-smith는 직전 회차 `retro_ep{NN-1}.md`의 검증된 보강 패턴을 선적용.
- "반전 더 강하게" → 시나리오팀 부분 재실행(twist-master, script-editor) → 영향 하위 단계 재실행.
- "패널 N번 다시" → 비주얼팀 부분 재실행(prompt-smith 보강 + 해당 panel-artist 재렌더) → **재렌더 원자 규약 완주**(재검증→리포트 갱신→매니페스트→RELEASE 재복사) → 재조립.
- 같은 유형 피드백 2회+ 반복 시 해당 스킬/에이전트 정의 개선을 제안(하네스 진화). 변경은 CLAUDE.md 변경 이력에 기록.
