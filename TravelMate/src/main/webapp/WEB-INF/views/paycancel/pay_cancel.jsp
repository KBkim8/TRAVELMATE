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
  width: 100%;
  height: 150px;
  margin-top: 50px;
  margin-bottom: 50px;
  background-color: lightgray;
}

#second2{
  width: 100%;
  height: 200px;
  display: grid;
  grid-template-columns: 1fr 5fr;
  margin-top: 50px;
  margin-bottom: 50px;
  background-color: lightgray;
}

#btn01, #btn02{
  background-color: #73D38E;
  border: 0;
  padding: 15px 25px; //버튼 크기 조절
  display: inline-block;
  text-align: center;
  color: white;
  border-radius: 6px;
  margin-left: 400px
}

#btn01:hover, #btn02:hover  {background-color: #80C49D;}
#btn01:active, #btn02:active {
  box-shadow: 0 0 0 1px #82c8a0 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}


</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="shape">

      <div id="first">
        <div></div>
        <div>
          <h3>약관 동의 및 결제취소<hr></h3>
        </div>
      </div>

      <div id="first2">
        <h2>청약철회 약관 동의칸</h2>
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
            <h4>예약자 이름:</h4>
            <h4>예약자 연락처:</h4>
            <h4>배송 주소: --</h4>
            <h4>수량: N</h4>
        </div>
      </div>

      <b>총 결제 금액:</b><br><br><br><br><br>

      <h2>결제를 취소 하시겠습니까?</h2>

      <hr>
      <div>
        <button id="btn01">예</button>
        <button id="btn02">아니오</button>
      </div>

      
    </div>
</body>
</html>