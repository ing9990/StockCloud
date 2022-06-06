# 주식 투자 모의 계좌 프로젝트

`웹 소켓과 실시간 주가 API를 활용하여 모의투자 서비스와 거래량 워드 클라우드를 제공하는 프로젝트`

`GITHUB TAG`

* `github.com/ing9990`
* `github.com/NYH0227`

## 사용 기술

### **FRONT END**

- JSP
- JS
- SweetAlert
- Bootstrap
- CSS

### **BACK END**

- Spring MVC
- Spring Boot
- Spring Data Jpa
- Spring Boot Email
- Google SMTP
- JSoup
- Servlet JSTL
- Lombok

### **TRADING**

- Web Socket
- Trading View

### **UTILITY**

- Python
- Jupyter Notebook
- Anaconda
- WordCloud
- Beautiful Soup

### **DATABASE**

- MySQL

### **API TEST**

- POSTMAN

## 기능

### `1. 관리자 페이지`

- __`회원 목록 보기 기능`__
- __`회원 등급 상승 기능`__
- __`회원 등급 하락 기능`__
- __`회원 Ban 기능`__
- __`WordCloud 오늘 날짜로 새로고침 기능`__

### `2. 사용자 페이지`

- __`회원가입 기능 (인증번호 필요)`__
- __`로그인 기능`__
- __`로그아웃 기능`__
- __`Main Page에서 종목 코드 입력으로 실시간 차트 보기 기능`__
- __`User Info에서 회원 정보 수정 기능`__
- __`종목이름으로 종목코드를 가져오는 기능`__
- __`주식 실시간 시세 api와 웹 소켓을 사용한 모의 투자 기능`__
- __`나의 수익률과 회원 중 수익률 랭킹을 확인하는 기능`__


### `API`

|    API Addr                  |     METHOD                |  Description          |
|---|---|  ---|
|http://localhost:8090/api/v1/mail/{username}/{email}   | GET |  이메일 인증 키 발송    |
|http://localhost:8090/api/v1/users | GET  | 유저 리스트 조회  |
|http://localhost:8090/api/v1/user/id/{id} | GET   |  유저 ID 조회 |
|http://localhost:8090/api/v1/get-stockcode/{stockname} | GET  | 종목명으로 종목코드 검색  |
|http://localhost:8090/api/v1/   | POST    |  유저 회원가입   |
|http://localhost:8090/api/v1/put/{id}   | PUT  |  유저 등급 상승 |
|http://localhost:8090/api/v1/uput/{id}  | PUT  | 유저 등급 강등 |
|http://localhost:8090/api/v1/delete/{id}   |DELETE   | 유저 퇴출 |
|http://localhost:8090/api/v1/editUserInfo/{id}   | PUT  | 회원 정보 수정 |
|http://localhost:8090/api/v2/stock/{id} | GET  | 보유 종목 조회 |
|http://localhost:8090/api/v2/money/{id} | GET   | 보유 현금 조회 |
|http://localhost:8090/api/v2/stock/buy  | POST | 종목 매수 {RequestBody} |
|http://localhost:8090/api/v2/stock/sell   | POST   | 종목 매도 {RequestBody} |
