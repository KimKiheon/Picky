# 편식

<img width=30% src="https://github.com/imsongj/Picky/assets/60054843/4b7c88a3-82ba-4513-a554-d195a7a0bf11">

## 팀 노션
https://www.notion.so/flowerdonk/492f78733bc640828b035dc6f5775c57?pvs=4
## 개인 노션
https://www.notion.so/f1a05999dffb4bf880dbfa7dd0953c94?pvs=4
---

## 📌 프로젝트 소개

### ✔️ 주제

건강한 편의점 조합 추천 앱

### ✔️ 주요 기능

1. 영양 성분 정보 제공
2. 나만의 조합 생성
3. 행사 상품 목록 제공
4. 추천 서비스
    1. 유저 기반 상품 추천
    2. 영양정보 기반 상품 추천
    3. 조합 기반 상품 추천
5. 실시간 인기 검색어 제공

### ✔️ 개발 기간

2023.08.28 - 2023.10.06

### Backend
- IntelliJ IDEA Ultimate
- Java: 11 (Zulu 11.0.2)
- Gradle: 8.2.1
- Python 3.11.4
- PIP 23.2.1
- Spring Boot 2.7.15
- Apache Spark 3.4.1

### Frontend
- Android Studio
- Flutter 3.13.3

### Storage
- MySQL 8.0.3
- Kafka 3.1.2
- Redis

### Dev-Ops / Infra
- Docker
- AWS EC2
- FCM(Firebase Cloud Messaging)
- ZooKeeper 3.6.4

### Collaboration

<aside>
<img src="https://static-00.iconduck.com/assets.00/gitlab-icon-2048x1885-1o0cwkbx.png" alt="https://static-00.iconduck.com/assets.00/gitlab-icon-2048x1885-1o0cwkbx.png" width="40px" />

</aside>



<aside>
<img src="https://25322853.fs1.hubspotusercontent-eu1.net/hub/25322853/hubfs/STAGIL_January2022/Images/jira-software-logo-jira-logo-hd-png.png?width=360&name=jira-software-logo-jira-logo-hd-png.png" alt="https://25322853.fs1.hubspotusercontent-eu1.net/hub/25322853/hubfs/STAGIL_January2022/Images/jira-software-logo-jira-logo-hd-png.png?width=360&name=jira-software-logo-jira-logo-hd-png.png" width="40px" /> 

</aside>

<aside>
<img src="https://cdn.icon-icons.com/icons2/2389/PNG/512/notion_logo_icon_145025.png" alt="https://cdn.icon-icons.com/icons2/2389/PNG/512/notion_logo_icon_145025.png" width="40px" /> 

</aside>

<aside>
<img src="https://cdn-icons-png.flaticon.com/512/906/906391.png" alt="https://cdn-icons-png.flaticon.com/512/906/906391.png" width="40px" />

</aside>

### ✔️ 발표 자료

[최종 발표 PPT](https://github.com/KimKiheon/Picky/blob/master/exec/%ED%8A%B9%ED%99%94PJT_%EC%84%9C%EC%9A%B8_5%EB%B0%98_A505_%EC%A0%84%EC%9E%84%EC%86%A1.pptx)

[편식합시다. - YouTube](https://www.youtube.com/watch?v=EsqhW0yHhcQ)

---

## 👥 팀원

### ✔️ FE

- 류정모
    - [FE] Figma를 활용한 목업 제작, Flutter를 활용한 편식 어플리케이션 개발,  UI/UX 설계
- 전임송
    - [FE] 팀장, 발표, Figma를 활용한 목업 제작, Flutter를 활용한 편식 어플리케이션 개발,  UI/UX 설계

### ✔️ BE

- 임준성
    - [BE] 크롤러 구현, 데이터 정제, 전처리 담당, UCC 제작
- 김기헌
    - [BE] 아키텍쳐 설계, Business 서버 구축, 관련 API 개발
- 권도현
    - [BE] 데이터 분산 처리 담당, 데이터 파이프라인 구축, 추천 시스템 구축
- 김유진
    - [BE] : Auth, Notification 서버 구축, 관련 API 개발

---

## 프로젝트 회고
추석 연휴 약 1주일이 껴있었기 때문에, 프로젝트 볼륨은 그렇게 크지 않았지만 배포나 인프라 구축과 랭킹 시스템에 집중했던 지난 프로젝트와 
다르게 서비스의 주력 API를 오랜만에 개발했더니 배울 점이 많았다.

그동안 개발했던 API들은 데이터가 크지 않아서 체감하지 못했던 N+1 문제와 쿼리 성능에 대해 고민을 많이 할 수 있던 프로젝트였다.

이를 고려치 않고 단순히 필터들을 and와 beetween 연산으로 했더니 로컬 환경 테스트 과정에서 최악의 경우 응답속도가 10초 이상 나왔는데,
N+1 문제를 해결해도 8초 이상 걸렸다. 검색 쿼리를 계속해서 개선하면서 4초대로 줄일 수 있었고, 서버에서 응답속도는 1초 이하로 유지되었다.

또한 서버에 Redis를 High Availability(고가용성)을 고려하여 구축하였고, 아키텍처 설계 미스로 추천 시스템 결과들을 redis에 저장하였더니
트래픽이 너무 증가해 계속 다운되는 경험을 했다. 추천 시스템을 Spark를 사용하여 python 언어로 구축하다보니 api 개발이 아닌 저장소를 이용하려 했던
아키텍처 설계에서의 실수였고, 결국 프로젝트에 Flask를 도입하면서, 아키텍처 또한 많은 수정을 거쳤다.

또한 도입하지는 못했지만, 이번 프로젝트를 진행하면서 Spring batch나 CQRS패턴, Hexagonal Architecure라는 새로운 개념에 대해서도 알게 되어 학습해보았고, 다음 프로젝트에
도입해보고 싶다는 생각을 했다.

이러한 점들을 통해 새로운 지식과 개념들을 다시 학습할 수 있던 좋은 경험이었다.

---

## 🗂️ DOCS

### ✔️ 시스템 아키텍처

<img width=50% src="https://github.com/imsongj/Picky/assets/60054843/e8fb9111-1e2d-4179-a369-bc12be12ac12">

### ✔️ ER-Diagram

<img width=50% src="https://github.com/imsongj/Picky/assets/60054843/e5711efb-1aa4-46e1-9bf0-b1d0f1fe321d">


---

## 📱 UI/UX

### ✔️ Figma 목업


[편식 화면 설계도 Figma](https://www.figma.com/file/GxTwXO3ZQBauj2lkI0X8t6/%ED%99%94%EB%A9%B4-%EC%84%A4%EA%B3%84%EB%8F%84?type=design&node-id=0%3A1&mode=design&t=fsk9VuUYjyr0LKOS-1)

<img width=10% src="/uploads/6979f81d0c91e3f7f9e053f0b035a988/moooookup.gif">


### ✔️ 어플리케이션 UI


<h2>홈페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/4b7c88a3-82ba-4513-a554-d195a7a0bf11">

<h2>검색 페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/05f9bae6-db1d-4c2c-adae-cbe1f5e23351">

<h2>상품목록 페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/32ecffc1-72fb-47aa-91c6-179f55812ebe">

<h2>상세보기 페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/7d552d75-c289-497a-bfa0-3f241ab8c92c">

<h2>상품조합 페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/69dd7710-32d5-4992-9baf-78ac4dcb5683">

<h2>로그인 페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/c25d221c-b7d7-4832-9ecc-b2c371d5bf43">

<h2>스크랩북 페이지<h2>
<img width=20% src="https://github.com/imsongj/Picky/assets/60054843/82934804-ccd8-4bad-b909-0c16108bed10">
