# EP01 Lettering — 《리:메타 (RE:META)》 1화 in-image 말풍선/대사 베이크 명세

- 작성: letterer
- 일자: 2026-07-06
- 입력: `_workspace/03_episode/ep01_script_final.md`(대사·화자·톤·SSOT) · `_workspace/04_visual/style-bible.md` §7(말풍선 시각 규약) · `_workspace/02_story/characters.md` §2~6(말투)
- 소비자: **prompt-smith**(이 스펙을 codex 프롬프트에 따옴표로 베이크) · **panel-validator**(렌더 결과 텍스트 글자 단위 대조) · **episode-compositor**(오버레이 없이 순서 조립·간격 힌트)
- 방법론: `webtoon-assembly` §2(레터링 섹션)

> **베이크 원칙(필수)**: 말풍선·한글 대사는 이미지 생성 시 작화와 함께 그린다(후작업 오버레이 없음). 따라서 (1) 말풍선당 대사를 **짧게** 끊고, (2) **대본 원문 철자 그대로** 적으며(맞춤법·문장부호·말줄임표 포함), (3) **통합 레터링** — 말풍선·글자가 작화와 같은 손그림 잉크 톤으로 녹아들게(디지털 폰트 평면 얹기 금지). 한 패널 말풍선 1~2개 원칙(3분할 소개 컷 P30·채팅 스택 P42는 예외).
>
> **말풍선 종류(style-bible §7-A 1:1)**: `dialogue`=흰 둥근/검은 글자 · `thought`=점선 구름/회흑 글자·꼬리없음 · `shout`=뾰족 폭발/굵은 글자 · `system`=시안-틸 `#27E0D0` HUD 사각박스(UI·채팅·중계·현판·배지) · `sfx`=손그림 의성어(말풍선 없음).
>
> **한글 레터링 톤(공통)**: 굵은 둥근 고딕(bold rounded Korean gothic), 검정 글자/흰 풍선 고대비, 충분히 큰 크기, `keep-all` 어절 유지, 얼굴·핵심 작화·잔상 단서 회피.
>
> **★SSOT 자구(글자 단위 동일 베이크 — 반전 공정성)**: `서지 셋. 타이탄 버려.` 를 **P03 = P36 = P49** 완전 동일하게 베이크. validator가 세 컷을 글자 단위로 상호 대조한다. (P49는 윤태오의 **인용** — 따옴표 스타일링만 추가, 한글 자구는 동일.)
>
> **대사 무게중심 3컷(대형 단독 말풍선, 주변 요소 최소)**: P54 `…그 계정, 너였어?` / P56 `그 파멸은… / …아직 오지 않은 미래였어.` / P57 `이번엔…… / …이긴다.`

---

## ① 콜드오픈 — 「크라운」 결승 붕괴 (P01~P16)

### panel_001
- bubble_1:
  - speaker: (환경 UI · 대형 LED)
  - type: system
  - text: "THE CROWN · WORLD FINAL"
  - position: 상단 배경 LED (작화 통합 signage, 역광)
  - read_order: 1
  - note: 영문 diegetic 대형 스크린 signage(LOC_CROWN_ARENA 통합). 아래 매치포인트가 초점.
- bubble_2:
  - speaker: (환경 UI · 대형 LED)
  - type: system
  - text: "매치포인트"
  - position: 상단 LED, 한글 강조 라벨
  - read_order: 2
- bubble_3:
  - speaker: 중계 자막
  - type: system
  - text: "한 세트만 따면 됩니다."
  - position: 하단 방송 자막 바(중앙)
  - read_order: 3
- note: 유건=뒤통수 실루엣만(정면 얼굴 금지). system HUD 3개는 배경/자막 레이어라 과밀 아님.

### panel_002
- bubble_1:
  - speaker: 중계 해설
  - type: system
  - text: "이대로면… 세계 챔피언이 바뀝니다."
  - position: 하단 방송 자막 바
  - read_order: 1
- bubble_2:
  - speaker: 팀보이스 인디케이터
  - type: system
  - text: "● ORACLE — 콜 개시"
  - position: 좌상단 소형 HUD 인디케이터
  - read_order: 2

### panel_003  ★SSOT 오더 1차
- bubble_1:
  - speaker: 유건(ORACLE)
  - type: dialogue
  - text: "서지 셋. 타이탄 버려."
  - position: 상단 우측 여백(헤드셋 쪽으로 꼬리, 미니맵 작화 안 가림)
  - read_order: 1
- note: ★SSOT 자구. P36·P49와 글자 단위 동일 베이크 필수. 청록 잔상 미니맵이 핵심 작화 → 말풍선은 여백으로.

### panel_004
- bubble_1:
  - speaker: 유건(ORACLE)
  - type: dialogue
  - text: "스파인 열려. 3초 안에."
  - position: 상단 좌측 여백(옆얼굴+헤드셋 쪽 꼬리)
  - read_order: 1
- bubble_2:
  - speaker: 유건(ORACLE)
  - type: dialogue
  - text: "지금."
  - position: 우측 하단 소형 단독(스타카토 강조)
  - read_order: 2
- note: 짧은 명령형 연쇄(콜 잡은 유건 말투). 두 풍선 위→아래 리듬.

### panel_005
- bubble_1:
  - speaker: 유건(ORACLE)
  - type: thought
  - text: "……어디 가."
  - position: 상단 여백(어긋난 아바타 반대쪽, 익스클로즈업 회피)
  - read_order: 1

### panel_006
- bubble_1:
  - speaker: 중계
  - type: system
  - text: "어? 어어—?!"
  - position: 상단 방송 자막(다급)
  - read_order: 1
- bubble_2:
  - speaker: (효과음)
  - type: sfx
  - text: "콰직—"
  - position: 화면 파열 지점에 손그림 통합(붕괴색)
  - read_order: 2

### panel_007
- bubble_1:
  - speaker: 유건(ORACLE)
  - type: thought
  - text: "…왜."
  - position: 상단 여백(익스트림 클로즈업 동공 회피, 최소 단독)
  - read_order: 1

### panel_008  · 손 떨림 트라우마①
- 말풍선 없음 (대사 없음)
- sfx: "드르르……"
  - position: 떨리는 오른손 하단에 손그림 통합, 청록 흐트러짐
- note: P17·P28·P56과 동일 프레이밍 대구. 텍스트는 SFX만.

### panel_009
- bubble_1:
  - speaker: 해설
  - type: system
  - text: "이게… 이게 무슨 일이죠?"
  - position: 하단 방송 자막(상단 라인)
  - read_order: 1
- bubble_2:
  - speaker: 해설
  - type: system
  - text: "스코어가… 뒤집혔습니다."
  - position: 하단 방송 자막(하단 라인)
  - read_order: 2
- note: 원문 "방금… 스코어가… 뒤집혔습니다."를 베이크 축약(앞 라인이 이미 충격 전달, 한글 깨짐 방지). 주의 패널.

### panel_010
- bubble_1:
  - speaker: (대형 스크린, 스치듯)
  - type: system
  - text: "…「조작」…"
  - position: 상단 배경 스크린에 흐릿·스치듯(관중 무음 정적)
  - read_order: 1
- note: 무음 처리 컷 — SFX 없음. 「조작」 낫표는 그대로 베이크(반전 씨앗).

### panel_011
- 말풍선 없음 (무대사 · 하이앵글 고립)
- note: prompt에 `no speech bubble, no text` 허용 컷.

### panel_012
- bubble_1:
  - speaker: 유건(ORACLE)
  - type: thought
  - text: "소리가… 빨려 들어간다."
  - position: 상단 여백(화면 왜곡 중심 회피)
  - read_order: 1

### panel_013
- 말풍선 없음 (대사 없음 · 역재생 붕괴 긴 세로 컷)
- sfx: "지지직—"
  - position: 청록 잔상 파편 역재생 위에 손그림 통합(붉은 글리치색)

### panel_014
- 말풍선 없음 (암전 · 최대 세로 여백 · 무대사)
- note: `no speech bubble, no text`. 조립 시 상하 여백 크게(gap↑).

### panel_015
- 말풍선 없음 (대사 없음)
- sfx: "삐— 삐— 삐—"
  - position: 검정 화면 속 옅게·멀리(작게, 하단 옅은 빛 근처)
- note: 알람/새소리 스밈. 옅고 작은 손그림.

### panel_016
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "이 소리……"
  - position: 상단 여백(눈뜸 익스클로즈업 회피)
  - read_order: 1

---

## ② 회귀 + 입학 + 콜드 벤치 배치 (P17~P31)

### panel_017  · 대구 회수(P08 ↔ 굳지 않은 손)
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "…안 떨려."
  - position: 상단 여백(눈앞에 든 오른손 안 가림)
  - read_order: 1
- note: P08과 동일 구도·크롭. 청록 잔상 없음(선명).

### panel_018
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "이 방…….""
  - position: 상단 여백(좁은 방 정경)
  - read_order: 1

### panel_019
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "이 얼굴."
  - position: 거울 상단 여백(19세 얼굴 안 가림)
  - read_order: 1

### panel_020  · 독자 정보 우위 확립
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "…돌아왔어."
  - position: 상단 여백(클로즈업 눈 회피, 절제 단독)
  - read_order: 1
- note: 회귀 직접 설명 금지 — 이 1줄만. 단독 배치.

### panel_021
- 말풍선 없음 (무대사 · 손+헤드셋 인서트)
- note: 손끝 멈칫(트라우마 잔재). 텍스트 없음.

### panel_022
- bubble_1:
  - speaker: (입학 게이트 현판)
  - type: system
  - text: "TERRA e-SPORTS ACADEMY"
  - position: 상단 배경 게이트 현판(작화 통합 영문 signage)
  - read_order: 1
- bubble_2:
  - speaker: 신입 A
  - type: dialogue
  - text: "야 봤어? 나 1군 노린다."
  - position: 좌측 인물군 위 여백(꼬리=신입 A)
  - read_order: 2
- note: 현판은 배경 signage, 실제 대사 말풍선은 신입 A 1개.

### panel_023  · 성장 UI
- bubble_1:
  - speaker: (티어 배지 오버레이)
  - type: system
  - text: "TIER: SLAG"
  - position: 배지 인서트 상단(시안 글로우 HUD, INSERT 1:1)
  - read_order: 1
- bubble_2:
  - speaker: (티어 배지 오버레이)
  - type: system
  - text: "─ 최하위 ─"
  - position: 배지 하단 소형 라벨
  - read_order: 2

### panel_024
- bubble_1:
  - speaker: 학생 B
  - type: dialogue
  - text: "쟤 어디 반이래?"
  - position: 상단 좌측 여백(꼬리=학생 B)
  - read_order: 1
- bubble_2:
  - speaker: 학생 C
  - type: dialogue
  - text: "…콜드 벤치. 곧 잘릴 애들."
  - position: 하단 우측 여백(꼬리=학생 C)
  - read_order: 2
- note: 위→아래 화자 교대. 비웃음 톤.

### panel_025
- 말풍선 없음 (무대사 · 하강 세로컷)
- note: `no speech bubble, no text`.

### panel_026
- bubble_1:
  - speaker: (낡은 팻말)
  - type: system
  - text: "THE COLD BENCH"
  - position: 문 위 배경 팻말(작화 통합 영문 signage)
  - read_order: 1
- bubble_2:
  - speaker: 유건
  - type: thought
  - text: "…여기가 밑바닥이군."
  - position: 하단 여백(문 미디엄)
  - read_order: 2

### panel_027
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "장비도, 사람도— 바닥이야."
  - position: 상단 여백(방 스캔 POV)
  - read_order: 1

### panel_028  · 손 떨림 트라우마②(미스디렉션)
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "……컨디션 탓이야."
  - position: 상단 여백(떨리는 오른손 안 가림)
  - read_order: 2
- sfx: "드르……"
  - position: 마우스 위 떠는 손 하단 손그림 통합(청록 흐트러짐)
  - read_order: 1
- note: SFX(read 1)로 떨림 → thought(read 2)로 부인. P08과 동일 손 프레이밍.

### panel_029
- 말풍선 없음 (무대사 · 주먹+눈 투컷)
- note: `no speech bubble, no text`.

### panel_030  · 동료 3인 소개 (3분할 — 예외 허용)
- bubble_1:
  - speaker: 정하루
  - type: dialogue
  - text: "새로 왔어요? 밥은 먹었고?"
  - position: 좌측 분할 컷, 인물 위 여백(따뜻한 존댓말)
  - read_order: 1
- bubble_2:
  - speaker: 배태산
  - type: dialogue
  - text: "…또 지하로 굴러온 놈이네."
  - position: 중앙 분할 컷, 인물 위 여백(거친 반말)
  - read_order: 2
- bubble_3:
  - speaker: 남도경
  - type: dialogue
  - text: "……."
  - position: 우측 분할 컷, 노트북 뒤 소형(무심·말없음 표현)
  - read_order: 3
- note: 3분할 소개 컷이라 컷당 말풍선 1개 → 과밀 아님. 도경은 말줄임표만(무심체). *(진소예 미등장 — 이 회차 로스터 3인.)*

### panel_031  · 씨앗: 한상혁·고형준
- bubble_1:
  - speaker: 한상혁
  - type: dialogue
  - text: "콜드 벤치는 코치도 안 와. 알지?"
  - position: 상단 여백(스치는 코치, 꼬리=한상혁)
  - read_order: 1
- note: 툭 던지는 이중 의미. 뒤 복도 고형준 원경엔 말풍선 없음.

---

## ③ 상승 — 힘숨찐 (P32~P47)

### panel_032
- bubble_1:
  - speaker: 정하루
  - type: dialogue
  - text: "상대, 상위반이에요."
  - position: 상단 좌측 여백(꼬리=하루)
  - read_order: 1
- bubble_2:
  - speaker: 정하루
  - type: dialogue
  - text: "그냥 평가용이니까 편하게—"
  - position: 하단 우측 여백(같은 화자, 이어 말)
  - read_order: 2
- note: 긴 대사 2풍선 분할(베이크 축약 교정 반영).

### panel_033  · 고구마 셋업
- bubble_1:
  - speaker: 배태산
  - type: shout
  - text: "붙어! 내가 연다!"
  - position: 상단 여백(뾰족 폭발형, 굵게)
  - read_order: 1
- bubble_2:
  - speaker: 남도경
  - type: dialogue
  - text: "…혼자 들어가지 마세요. 짤려요."
  - position: 하단 우측 여백(조곤 존댓말, 꼬리=도경)
  - read_order: 2
- note: 원문 "…아, 혼자…" 앞 감탄사 축약(베이크 짧게).

### panel_034  · W2 예지 노출
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "…저기서 온다."
  - position: 상단 여백(청록 예지 홀로그램 오버레이 안 가림)
  - read_order: 1
- note: 잔상 오버레이가 핵심 작화 → 말풍선 최소·여백.

### panel_035
- 말풍선 없음 (무대사 · 눈 클로즈업)
- note: `no speech bubble, no text`. 계산 완료의 정적.

### panel_036  ★SSOT 오더 2차
- bubble_1:
  - speaker: 유건
  - type: dialogue
  - text: "서지 셋. 타이탄 버려."
  - position: 상단 우측 여백(P03과 동일 배치·꼬리, 미니맵 안 가림)
  - read_order: 1
- note: ★SSOT — P03과 글자·형태 완전 동일 베이크(반전 공정성). validator 상호 대조 앵커.

### panel_037  · 콜 명령형 쏟아짐
- bubble_1:
  - speaker: 유건
  - type: dialogue
  - text: "태산 밴가드, 앞. 하루 시야 잡아."
  - position: 상단 좌측 여백(옆얼굴+헤드셋 꼬리)
  - read_order: 1
- bubble_2:
  - speaker: 유건
  - type: dialogue
  - text: "도경, 스파인 막아. 3초 뒤 열려."
  - position: 하단 우측 여백(이어지는 명령)
  - read_order: 2
- note: 호명=현재 로스터(태산·하루·도경, 소예 미등장). 명령형 2풍선. **주의 패널** — 어절 다소 많음, 베이크 깨지면 각 문장을 마침표 기준 추가 분할 REGEN.

### panel_038
- bubble_1:
  - speaker: 배태산
  - type: dialogue
  - text: "…어? 어어, 야 이거—"
  - position: 상단 여백(반신반의, 꼬리=태산)
  - read_order: 1

### panel_039  · 사이다 1차 정점
- bubble_1:
  - speaker: (효과음)
  - type: sfx
  - text: "콰앙—!"
  - position: 폭발 클로즈업 중심에 손그림 통합(화이트 임팩트)
  - read_order: 1
- bubble_2:
  - speaker: 남도경
  - type: dialogue
  - text: "…맞혔어요. 정확히 거기서."
  - position: 하단 우측 여백(존댓말+수치체, 꼬리=도경)
  - read_order: 2
- note: SSOT 교정 반영 — "맞혔어요"(맞히다) 존댓말 자구 정확 베이크.

### panel_040  · 미스디렉션(허세)
- bubble_1:
  - speaker: 배태산
  - type: shout
  - text: "야! 너 뭐야?! 어떻게 안 거야?!"
  - position: 상단 여백(뾰족 폭발형, 굵게)
  - read_order: 1
- bubble_2:
  - speaker: 유건
  - type: dialogue
  - text: "…찍었어."
  - position: 하단 우측 여백(능청 단독, 꼬리=유건)
  - read_order: 2
- note: "…찍었어." 이중 의미(서브텍스트=안다). 단독 강조.

### panel_041
- bubble_1:
  - speaker: 정하루
  - type: dialogue
  - text: "……우연이라기엔."
  - position: 상단 좌측 여백(꼬리=하루)
  - read_order: 1
- bubble_2:
  - speaker: 남도경
  - type: dialogue
  - text: "…우연 아니에요."
  - position: 하단 우측 여백(고개 듦, 꼬리=도경)
  - read_order: 2

### panel_042  · 여론 레이어(채팅 스택 — 예외 허용)
- bubble_1:
  - speaker: 관전 채팅
  - type: system
  - text: "꼴찌반 신인이?"
  - position: 우측 채팅 로그 스택 1행(반투명 시안 테두리 소형)
  - read_order: 1
- bubble_2:
  - speaker: 관전 채팅
  - type: system
  - text: "저거 우연 아니냐 ㅋㅋ"
  - position: 우측 채팅 스택 2행
  - read_order: 2
- bubble_3:
  - speaker: 관전 채팅
  - type: system
  - text: "쟤 뭐야?"
  - position: 우측 채팅 스택 3행
  - read_order: 3
- note: 소형 system 3개 세로 스택(채팅 UI라 과밀 아님). 반투명·얇은 시안.

### panel_043  · 도경 데이터 의심
- bubble_1:
  - speaker: 남도경
  - type: thought
  - text: "…이 콜, 승률 12%짜린데."
  - position: 노트북 뒤 상단 여백(관찰 컷)
  - read_order: 1

### panel_044  ★SSOT 오더 3차(관전)
- bubble_1:
  - speaker: 윤태오
  - type: thought
  - text: "…응?"
  - position: 상단 여백(발 멈춘 윤태오, 리플레이 미니맵 안 가림)
  - read_order: 1
- note: 화면 속 오더 미니맵은 P03·P36 동일 형태(작화 SSOT, 말풍선 아님).

### panel_045
- bubble_1:
  - speaker: 윤태오
  - type: thought
  - text: "이 오더… 어디서 봤지?"
  - position: 상단 여백(눈 클로즈업 회피)
  - read_order: 1

### panel_046
- bubble_1:
  - speaker: 윤태오
  - type: thought
  - text: "…설마."
  - position: 상단 여백(오버숄더 투샷, 유건 뒤통수 응시)
  - read_order: 1
- note: P51 "…이럴 리가."와 자구 구분(감지의 박자).

### panel_047
- 말풍선 없음 (무대사 · 시선 엇갈림 불안 전조)
- note: `no speech bubble, no text`.

---

## ④ 클리프행어 — 정체 인지 + 2차 훅 (P48~P57)

### panel_048  · 윤태오=ORACLE 신도
- bubble_1:
  - speaker: 윤태오
  - type: thought
  - text: "…기분 탓일 리가 없어."
  - position: 상단 여백(태블릿 발광 화면 안 가림)
  - read_order: 1

### panel_049  ★SSOT 자구 인용(대조=미스디렉션 해제)
- bubble_1:
  - speaker: 윤태오
  - type: dialogue
  - text: "서지 셋. 타이탄 버려."
  - position: 상단 중앙 여백(따옴표 인용 스타일링, 분할 화면 두 미니맵 사이)
  - read_order: 1
- bubble_2:
  - speaker: 윤태오
  - type: dialogue
  - text: "…이건 그 사람 손버릇이야."
  - position: 하단 우측 여백(꼬리=윤태오)
  - read_order: 2
- note: ★bubble_1 한글 자구 = P03=P36과 글자 단위 동일(반전 성립 근거). **인용 표시로 따옴표 스타일만 추가하고 한글 자모는 절대 변경 금지.** validator 3컷 상호 대조.

### panel_050  · 부계정 흔적
- bubble_1:
  - speaker: 윤태오
  - type: thought
  - text: "이 계정… 리셋 흔적이 있어."
  - position: 상단 여백(로그 화면 클로즈업 안 가림)
  - read_order: 1

### panel_051
- bubble_1:
  - speaker: 윤태오
  - type: dialogue
  - text: "…이럴 리가."
  - position: 상단 여백(손+눈 투컷, 확신 임박)
  - read_order: 1
- note: P46 "…설마"와 자구 구분(다른 박자).

### panel_052
- 말풍선 없음 (대사 없음 · 최대 세로 여백 · 침묵의 박자)
- note: `no speech bubble, no text`. 조립 gap 크게.

### panel_053
- 말풍선 없음 (무대사 · 로우 실루엣, 고개 듦)
- note: `no speech bubble, no text`.

### panel_054  ★반전 회수 · 1차 클리프행어 【대사 무게중심】
- bubble_1:
  - speaker: 윤태오
  - type: dialogue
  - text: "…그 계정, 너였어?"
  - position: 화면 중앙 대형 단독(익스트림 클로즈업 눈만 살짝 피해, 크게)
  - read_order: 1
- note: ★대형 단독 말풍선. 다른 요소 최소. 클리프행어 SSOT 자구 — 글자 정확 베이크 최우선. **주의 패널.**

### panel_055  · 충격 증폭(잔상 시인)
- 말풍선 없음 (무대사 · 잔상 미세 흔들림으로 무언의 시인)
- note: `no speech bubble, no text`. 대사 없이 청록 잔상 흔들림만.

### panel_056  ★반전 회수 · 손 대구 최종 【대사 무게중심】
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "그 파멸은…"
  - position: 상단 여백 대형(과거/현재 손 오버랩 작화 안 가림)
  - read_order: 1
- bubble_2:
  - speaker: 유건
  - type: thought
  - text: "…아직 오지 않은 미래였어."
  - position: 하단 여백 대형(이어지는 독백)
  - read_order: 2
- note: ★대형 단독(생각). 2풍선 위→아래로 시점 반전 확정. **주의 패널.**

### panel_057  ★2차 훅 선언 【대사 무게중심】
- bubble_1:
  - speaker: 유건
  - type: thought
  - text: "이번엔……"
  - position: 상단 여백 대형(앰버 발화 눈 익스클로즈업 안 가림)
  - read_order: 1
- bubble_2:
  - speaker: 유건
  - type: thought
  - text: "…이긴다."
  - position: 하단 여백 대형·단독 강조(결의 정점)
  - read_order: 2
- note: ★대형 단독. "…이긴다." 최종 훅 — 단독 강조. 색온도 반전(청록→앰버) 작화 위. **주의 패널.**

---

## 요약 (prompt-smith / panel-validator 인계)

### 말풍선 통계 (총 57패널) — 정확 집계
- **총 텍스트 요소: 71개** (말풍선 65 + 손그림 SFX 6)
  - dialogue(대사): **25**
  - thought(생각): **22**
  - shout(외침): **2** (P33 배태산, P40 배태산)
  - system(HUD·중계·채팅·현판·배지): **16** (P01×3, P02×2, P06 중계×1, P09×2, P10×1, P22 현판×1, P23×2, P26 팻말×1, P42 채팅×3)
  - sfx(손그림 의성어, 말풍선 아님): **6** (P06 콰직—, P08 드르르……, P13 지지직—, P15 삐— 삐— 삐—, P28 드르……, P39 콰앙—)
- 검산: 25 + 22 + 2 + 16 + 6 = 71.

### 무대사 패널 (말풍선 없음)
- **완전 무대사(텍스트 0, `no speech bubble, no text`)**: P11, P14, P25, P29, P35, P47, P52, P53, P55 — **9개**
- **SFX만(말풍선 없음, 손그림 의성어 有)**: P08(드르르……), P13(지지직—), P15(삐— 삐— 삐—) — **3개**
  - (추가 SFX 동반 컷: P06 콰직—+중계, P28 드르……+생각, P39 콰앙—+대사 — 이들은 말풍선도 있음)

### 주의 패널 (베이크 리스크 / 검증 집중)
- **★SSOT 자구 동일 3컷**: **P03 = P36 = P49**(bubble_1) `서지 셋. 타이탄 버려.` — 글자 단위 상호 대조. P49는 따옴표 인용 스타일만 추가, 한글 자모 불변.
- **★대사 무게중심(대형 단독, 자구 정확 최우선)**: **P54** `…그 계정, 너였어?` / **P56** `그 파멸은…` · `…아직 오지 않은 미래였어.` / **P57** `이번엔……` · `…이긴다.`
- **어절 다소 많음(깨지면 마침표 기준 추가 분할 REGEN)**: **P37**(2풍선), P09(축약 반영), P32(2풍선 분할 완료).
- **영문 diegetic signage(작화 통합, 오타 주의)**: P01 `THE CROWN · WORLD FINAL`, P22 `TERRA e-SPORTS ACADEMY`, P23 `TIER: SLAG`, P26 `THE COLD BENCH` — 영문이므로 §8 `no English text` 부정문과 충돌하지 않게 prompt-smith가 signage 예외로 명시.
- **낫표·기호 정확 베이크**: P10 `…「조작」…`(낫표), P02 `● ORACLE — 콜 개시`.

### episode-compositor 간격(gap) 힌트
- 최대 여백(gap↑, 침묵/암전/반전 체류): P14(암전), P25(하강), P52(침묵), P53, P55, P54(클리프행어), P57(정점).
- 무봉제(gap 0, 연속 컷): P03~P04, P05~P06~P07(붕괴 연쇄), P44~P45~P46(감지 연쇄), P56~P57(각성 연쇄).
