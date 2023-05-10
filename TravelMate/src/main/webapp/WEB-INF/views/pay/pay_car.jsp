<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    body{
  background-color: rgb(255, 255, 255);
}

#shape{
  width: 1300px;
  height: 100%;
  margin: auto;
  border: 0px solid black;
}

header{
  background-color: #39ec93;
  color: white;
  height: 150px;
  display: flex;
  justify-content: center;
  align-items: center;
}
header > div{
  display: flex;
  
}
nav{

}

#logo{
    width: 100%;
    height: 100%;
}

#top{
    position: fixed;
    right: 5%;
    
}

#first, #second{
  display: flex;
  height: 50px;
}

#first > :nth-child(1), #second >:nth-child(1){
    background-color: #39ec93;
    width: 25px;
    height: 50px;
}

#first > :nth-child(2), #second > :nth-child(2){
    width: 100%;
    line-height: 20px;   
}

#first2{
  width: 80%;
  height: 150px;
  margin-top: 50px;
  margin-bottom: 50px;
  background-color: lightgray;
}

#second2{
  width: 80%;
  height: 200px;
  display: grid;
  grid-template-columns: 1fr 5fr;
  margin-top: 50px;
  margin-bottom: 50px;
  background-color: lightgray;
}

#btn01{
  margin-top: 50px;
  margin-right: 400px;
  margin-left: 400px;
  margin-bottom: 50px;
}
</style>
</head>
<body>
	<div id="top">
        <a href="">로그인</a>
        <a href="">회원가입</a>
        <a href="">마이페이지</a>
        <a href="">고객센터</a>
    </div>
  <header>
    <img id="logo" src="./dog.jpg" alt="개">
  </header>
  <nav>
    예약 숙소 차량 커뮤니티 전체보기 
  </nav>
    

    <div id="shape">

      <div id="first">
        <div></div>
        <div>
          <h3>여행자 확인 및 결제<hr></h3>
        </div>
      </div>

      <div id="first2">
        <h2>간단한 결제 안내 문구</h2>
      </div>

      <div id="second">
        <div></div>
        
        <div>
          <h3>최종 결제 정보<hr></h3>
        </div>
      </div>

      <div id="second2">
        <div>
          <h2>이미지</h2>
        </div>
        <div>
            <h2>예약 정보</h2>
        </div>
      </div>

      <b>총 결제 금액</b>
      <b>KRW 20,800</b>
      <br><br><br><br><br>

      <h2>결제 수단</h2>

      <hr>
      <div>
        <button id="btn01">신용카드</button>
        <button id="btn02">무통장입금</button>
      </div>

      
    </div>
</body>
</html>