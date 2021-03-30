# 경매 사이트
* 회원 자유 경매 사이트(like ebay, smartstore)

# 개발환경
* 프로그래밍 언어 - Java 8(jdk 1.8)
> JSP(Java Server Pages), JavaScript, CSS, HTML, Servelet,  jQuery
* 데이터베이스 - Oracle 11g database(sqldeveloper)
* Tomcat9.0 활용 웹 어플리케이션 동작

# 데이터베이스 설정 
* https://www.erdcloud.com/d/YRWEvLok9yAsogsXx
* AUCTION(경매정보) 
  * ANO, TITLE, CONTENTS, REGDATE, STARTTIME, ENDTIME, MAXPRICE, MINPRICE, IMGPATH, MNO, AMOUNT, CATEGORY, STATUS
* BIDDING(경매의 입찰정보) 
  * BNO, MNO, ANO, PRICE, TIME
* MEMBER(회원정보) 
  * MNO, ID, PW, NAME, EMAIL, ADDRESS, ACCOUNT, REGDATE
* PAY(입금/대금정보) 
  * PNO, BNO, MNO, ANO, ADDRESS, STATUS, PCHECK
* ANSWER(질문게시판 대댓글) 
  * ANSWER, ADATE, QNO, ANO, MNO
* QBOARD(질문게시판) 
  * QNO, QTITLE, QCONTENTS, QDATE, MNO

# 기능
* 로그인/로그아웃, 회원가입/탈퇴
* 회원이 등록한 경매, 경매에 참여한 목록, 회원 정보 확인
* 경매상품 등록/수정/삭제
* 입찰 등록/취소(회원만 가능)
* 입찰알림창(입찰금액이 경매조건에 맞거나 제한시간내에 최고입찰금일 경우)
* 경매물품 질문(게시판)
* 사이트 이용시 질문(게시판)
> Servlet.MultipartRequest 활용 경매 등록/수정 파일 업로드 구현

> jQuery의 ajax 활용 로그인, 회원가입/수정, 경매 등록 등의 유효성 검사를 비동기 방식으로 구현

> Tomcat v9.0 웹 어플리케이션 실행(AuctionMain.jsp)

# 사진
![0](https://user-images.githubusercontent.com/55347692/112752365-b4f71b80-900d-11eb-9799-249e50ae56b7.png)
![1](https://user-images.githubusercontent.com/55347692/112748162-0515b400-8ff5-11eb-8492-f6a046be9492.PNG)
![2](https://user-images.githubusercontent.com/55347692/112748164-06df7780-8ff5-11eb-8b8c-16fa4a6b25ac.PNG)
![3](https://user-images.githubusercontent.com/55347692/112748165-07780e00-8ff5-11eb-8d93-8f1642f5e9d2.PNG)
![4](https://user-images.githubusercontent.com/55347692/112748167-07780e00-8ff5-11eb-9908-ec31060f1b9e.PNG)
![5](https://user-images.githubusercontent.com/55347692/112748168-0810a480-8ff5-11eb-8185-0bc6ddd57736.PNG)
![6](https://user-images.githubusercontent.com/55347692/112748169-0810a480-8ff5-11eb-91e9-13a90eaabdc8.PNG)
![7](https://user-images.githubusercontent.com/55347692/112748170-08a93b00-8ff5-11eb-8d0b-8755bb3d3f4e.PNG)
![8](https://user-images.githubusercontent.com/55347692/112748171-08a93b00-8ff5-11eb-8ab1-0c035cd7baf8.PNG)
![9](https://user-images.githubusercontent.com/55347692/112748172-0941d180-8ff5-11eb-8178-cc78c777f7b7.PNG)