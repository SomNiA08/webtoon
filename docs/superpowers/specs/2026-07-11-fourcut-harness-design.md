# fourcut 하네스 설계 스펙 (4컷 웹툰 제작 하네스)

- 일자: 2026-07-11
- 상태: 사용자 검토 대기
- 위치 주의: 이 스펙은 신규 리포 `harness/fourcut` 스캐폴드 시 해당 리포 `docs/`로 이동한다(웹툰 리포에는 설계 기록만 임시 보관).
- 근거: webtoon(27 에이전트, 50+ 패널)·publish(17 에이전트, 카드뉴스) 두 하네스 검수 결과. 4컷은 "publish의 소량 자산 스케일 + webtoon의 캐릭터 일관성·연출"의 교차점이므로, **기계부는 publish 최신판을 이식하고 에이전트단만 새로 설계**한다.

---

## 1. 목적과 제작 단위

리서치 소재 또는 사용자의 개인 이야기를 **4컷 웹툰 스트립**으로 자동 제작해 SNS 발행 패키지까지 출하하는 경량 하네스.

- **1 스트립(strip{NNN}) = 4컷** — 컷당 1:1 1080×1080 PNG 4장을 개별 렌더(말풍선·한글 대사 in-image 베이크).
- 출하 형태 2종: ① 인스타 캐러셀 = 컷 4장 그대로 ② 세로 스트립 조립 PNG 1장(`_compose_strip.py` 스크립트 조립 — 렌더 아님).
- 스트립당 렌더 4~6장(재렌더 포함), 소요 ~5분 — webtoon 회차 대비 ~1/12 비용.

## 2. 트랙 2종 (스트립마다 하나 선택)

| 트랙 | 소재 원천 | 규율 |
|------|----------|------|
| `research` | 리서치팀의 `material-bank.md`에서 소재 선택 | 원문 팩트 왜곡 금지 — script-editor가 원문 대조 |
| `story` | 사용자가 `01_source/`에 넣은 이야기/일기/에피소드 텍스트 | 톤·목소리 존중, 사실 검증 생략. **리서치팀 완전 우회** |

## 3. 에이전트 11명

### 리서치팀 3명 (publish 2계층 신선도 이식)

| 에이전트 | 역할 | 신선도 |
|---|---|---|
| `gag-analyst` | 4컷 유머 문법·펀치라인 기법·SNS 알고리즘(인스타/스레드) 역설계 → `01_research/format-brief.md` | **30일 재사용** — 이내면 재기동 금지 |
| `topic-scout` | 지금 뜨는 이슈·밈·공감 소재 수집 → `01_research/topic-scan_{date}.md` | 매 배치 신규(1명이라 저렴) |
| `material-synthesizer` | 위 둘 + `ledger.md`(중복 대조) 종합 → `01_research/material-bank.md`(소재 후보 N개 + 앵글 + 트랙 추천) | 배치당 1회 |

소재 뱅크는 누적 자산: 한 번 조사로 여러 스트립을 뽑아 쓰고, 소진 시 topic-scout만 재기동. webtoon `01_research/trend-brief.md`·publish topic-scan 등 형제 하네스 산출물도 `01_source/`로 반입해 소재로 쓸 수 있다.

### 제작팀 8명

| 에이전트 | 역할 | 원형(이식원) | 모델 |
|---|---|---|---|
| `gag-writer` | 소재 → 4컷 기승전결 대본(컷별 대사 + 레터링 베이크 스펙). 트랙별 모드 내장 | webtoon dialogue-writer+letterer+episode-outliner 통합 | 세션 |
| `script-editor` | 펀치라인 전달력·자구·(research) 원문 대조 | script-editor + fact-checker 라이트 | 세션 |
| `cast-keeper` | **최초 1회**: 사용자 보유 레퍼런스 PNG를 `00_input/cast/`로 임포트 → 일관성 토큰 추출 → `cast-sheet.md` + `style-bible.md`. ref 렌더 단계 없음(이미지 보유). 신규 캐릭터 추가 시에만 재기동 | art-director + character-designer 통합 | 세션(비전) |
| `prompt-smith` | 컷 4개 프롬프트(일관성 토큰 + ref 앵커 + 한글 베이크). 직전 retro 선적용 | webtoon prompt-smith | 세션 |
| `cut-validator` | 6축 검증 → REGEN 루프 + 매니페스트 생성 | panel-validator | 세션(비전) |
| `strip-compositor` | `_compose_strip.py`(PIL)로 세로 스트립 조립 | episode-compositor 축소 | sonnet 허용 |
| `sns-packager` | 인스타·스레드 캡션/해시태그 md | platform-packager 축소 | sonnet 허용 |
| `showrunner` | `_verify_release.sh` exit 0 확인 → 사인오프 → `retro_strip{NNN}.md` + ledger 갱신 | showrunner | 세션(비전) |

버린 것(4컷에 과잉): webtoon의 시리즈 기획층 6명(concept-architect·worldbuilder·series-plotter·twist-master·tension-engineer·episode-outliner 독립체), panel-artist a/b/c 분담(REGEN도 컷 수가 적어 드라이버 재실행으로 충분), 세로 뷰어, publish의 아티클 집필층·브랜드 킷(캐스트 refs가 그 역할).

## 4. 캐릭터 운영 — 고정 캐스트

- 사용자가 이미 보유한 캐릭터 레퍼런스 이미지가 SSOT. 첫 가동 시 cast-keeper가 `00_input/cast/`로 임포트(사용자가 경로 제공)하고 토큰을 추출한다.
- `00_input/cast/`는 git 추적 예외로 보존(webtoon `04_visual/refs/`와 동일 지위), 전 스트립 재사용·재렌더 금지.
- 에피소드별 게스트 캐릭터는 허용하되 토큰만으로 운영(ref 렌더 없음), 재등장이 확정되면 캐스트 승격.

## 5. 검증 6축 (cut-validator)

C1 캐릭터 레퍼런스 일치 · C2 배경/컷 간 연속성 · C3 텍스트 자구 **전수**(베이크 한글 ↔ 대본 1:1, 4장이므로 전수가 기본) · C4 프롬프트 충실도 · C5 개그 전달/컷 흐름(기승전결·펀치라인 가독) · C6 기술 무결성(0바이트·PNG 헤더·md5 중복·해상도/비율).

## 6. 품질 게이트 (두 하네스 실사고 규약 이식)

1. **검증 매니페스트**: cut-validator가 판정 완료 시 md5 매니페스트 생성. showrunner는 매니페스트 게이트 없이 사인오프 금지.
2. **재렌더 원자 규약**: 1컷이라도 재렌더하면 6축 전체 재검증 → 리포트 갱신 → 매니페스트 재생성 → RELEASE 재복사 한 묶음.
3. **전 컷 ★앵커**: 4컷은 전부 앵커 — 특히 1컷(후킹)·4컷(펀치라인)의 C1/C3 결함은 ACCEPT-FLAG 통과 불가.
4. **재렌더본은 새 결함을 만든다**: 6축 전부 재검.
5. **카나리아 = 1컷 선렌더·선검증**(4장뿐이라 웨이브 불필요). 시스템성 결함이면 prompt-smith가 정본 수정 + 재분할 후 재개.
6. **retro 루프**: 사인오프 후 `retro_strip{NNN}.md`, prompt-smith는 새 스트립 전 직전 retro Read 선적용. ledger로 소재·펀치라인 중복 방지.

## 7. 기계부 (publish 최신판 이식 — 신형 codex base64 인라인 저장 계약 반영본)

`_split_prompts.py`(`### cut_N` 헤더, 누락 시 exit 1) · `_render.sh`(롤링 동시, SKIP, RENDER_TIMEOUT, 창-내 1회 재시도) · `_resume.sh` · `_verify_release.sh`(MIN_CUTS=4·연속번호 1~4·스트립 조립본 존재·손상·md5 중복·매니페스트 정합·RELEASE 사본) · `_smoke.sh`(4컷 픽스처로 검사 세트 개정) · `_compose_strip.py`(신규, PIL 세로 조립) · `.gitattributes`(LF 고정).

## 8. 디렉토리

```
00_input/     # strip{NNN}_brief.md(트랙·소재 지정) · cast/(캐릭터 레퍼런스 PNG — SSOT, git 예외)
01_research/  # format-brief.md(30일) · topic-scan_{date}.md · material-bank.md
01_source/    # story 트랙 원문·형제 하네스 반입 소재
02_script/    # strip{NNN}_script.md
03_visual/    # style-bible.md · cast-sheet.md · strip{NNN}_prompts.md · strip{NNN}_validation.md · strip{NNN}_manifest.md5
04_cuts/      # strip{NNN}/cut_1..4.png (gitignore)
05_package/   # strip{NNN}/(strip.png·instagram.md·threads.md·qa_report.md) · retro_strip{NNN}.md · ledger.md(누적)
RELEASE/      # strip{NNN}/ (gitignore)
_render_jobs/ _render_logs/
```

## 9. 함대·환경 규약 (동일 적용)

- 리포 위치 `harness/fourcut`(형제), somnia-hub 등록부(bootstrap.ps1·PORTFOLIO.md) **고유 아키텍처** 편입.
- **SOUL.md·engine.mjs 생성 금지 벽**(`.claude/settings.json` permissions.deny) — 킷 3층 오인 방지.
- 에이전트 frontmatter에 model 고정 금지(세션 상속), 스폰 프롬프트에 경로 명시·탐색 금지, 단독 스폰 폴백(팀 도구 부재 시 파일 통신).
- 스크립트 절대경로 하드코딩 금지, 발행은 수동(패키지까지만 — 계정 자동 포스팅 금지).
- 진입점 스킬 `fourcut-orchestrator` 1개(+ 방법론 스킬은 초기엔 오케스트레이터에 내장, 비대해지면 분리).

## 10. 미결/후속

- 하네스 이름 확정(가칭 `fourcut`).
- 캐릭터 레퍼런스 이미지 경로: 첫 가동 시 사용자가 제공 → cast-keeper 임포트.
- pngquant 용량 최적화는 매니페스트 생성 전 규약 그대로(설치됨).
