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



#first, #second, #third, #third2{
  display: flex;
  height: 50px;
}

#first > :nth-child(1), #second >:nth-child(1), #third >:nth-child(1){
    background-color: #39ec93;
    width: 25px;
    height: 50px;
}

#first > :nth-child(2), #second > :nth-child(2), #third > :nth-child(2){
    width: 100%;
    line-height: 50px;   
}

#second2, #first2, #third2{
  width: 100%;
  height: 200px;
  margin-top: 50px;
  margin-bottom: 50px;
  background-color: lightgray;
}

#first2, #third2{
  display: grid;
  grid-template-columns: 1fr 5fr;
}

#third2{height: 100px;}

#btn01{
  margin-top: 50px;
  margin-right: 250px;
  margin-left: 250px;
  margin-bottom: 50px;
}

#btn02{margin-right: 300px;}

table{
    height: 200px;
}



</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
        
        
	<div id="shape">

      <div id="first">
        <div></div>
        <div>
          <h3>상품정보<hr></h3>
        </div>
      </div>

      <div id="first2">
        <div>
          <h2>이미지</h2>
        </div>
        <div>
          <h2>예약 정보</h2>
        </div>
      </div>

      <div id="second">
        <div></div>
        <div>
          <h3>주문 정보<hr></h3>
        </div>
      </div>

      <div id="second2">
        <table>
            <tr>
                <td>예약자 명:</td>
                <td><input type="text" placeholder="이름입력" >
            </tr>
            <tr>
                <td>휴대폰 번호:</td>
                <td><input type="text" placeholder=" ‘ - ’ 제외하고 입력">
            </tr>
            <tr>
                <td>배송 받을 주소:</td>
                <td><input type="text" placeholder="ex)경기도 용인시 수지구 동천로 27번길 5" style="width: 400px;"></td>
            </tr>
        </table>
      </div>

      <div id="third">
        <div></div>
        <div>
          <h3>주문 정보<hr></h3>
        </div>
      </div>

      <div id="third2">
        <div>
            구성 
        </div>
        <div>
            <input type="number">
        </div>
    
      </div>

      <b>총 결제 금액</b><br><br><br>

      <hr>
      <div>
        <button id="btn01">뒤로가기</button>
        <button id="btn02">과심상품 담기</button>
        <button id="btn03">결제하기</button>
      </div>

      
    </div>
        
        
    

   

    
</body>
</html>