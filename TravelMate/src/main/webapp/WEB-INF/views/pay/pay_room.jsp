<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>

#shape{
	position: relative;
    width: 1390px;
    height: 100%;
    bottom: 900px;
    left: 400px;
  
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
    line-height: 50px;   
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

#btn01, #btn03{
  margin-top: 50px;
  margin-right: 400px;
  margin-left: 400px;
  margin-bottom: 50px;
}

</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
    

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
          <h3>여행자 확인 및 결제<hr></h3>
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

      <b>총 결제 금액:</b><br><br><br><br><br>

      <h2>결제수단</h2>

      <hr>
      <div>
        <button id="btn01">신용카드</button>
        <button id="btn02">무통장입금</button>
      </div>

      <hr>

      <div>
        <button id="btn03">뒤로가기</button>
        <button id="btn04">결제하기</button>
      </div>
  
    </div>
</body>
</html>