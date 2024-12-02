# 프로젝트 설명

## 사용자 설명서
### 시스템 개요
오프라인 마트를 다 들리지 않아도 가격비교가 가능하며, 이로 인해 물건을 싸게 사기 위해 어러 매장을 돌아 다니지 않게 된다.

### 필요한 프로그램
- Windows10이상
- STS4
- XAMPP
- SQLyog

### 시스템 세팅법
- STS4설치
- XAMPP, SQLyog 설치
- https://github.com/ljh01067/mypro.git에서 DB.sql의 내용을 SQLyog에 복사 붙여넣기 하기
- 내용전체를 드래그 하여 F9(실행)하기
- 한국소비자원의API(https://www.data.go.kr/data/3043385/openapi.do) 키를 획득한다.
- 프로젝트 루트에다가 API_KEY=본인 API키를 넣으면 된다.

### 사용한 API
공공데이터 포털의 한국소비자원_생필품 가격 정보 API(https://www.data.go.kr/data/3043385/openapi.do)

### 문제 해결 가이드(FAQ)
- 옵션 선택창이 안 나올시 새로고침을 해보고, 그래도 나오지 않는다면 API키를 제대로 입력하였는지 또는 SQLyog의 코드를 제대로 실행하였는지 확인해 주세요.
- API키에 문제가 생겼다면, 재발급 하시고 다시 시도해주세요.
