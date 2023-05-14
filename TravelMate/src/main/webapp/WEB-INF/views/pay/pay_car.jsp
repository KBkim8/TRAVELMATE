<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    #content{
        position: relative;
        margin-top: 400px;
        width: 1390px;
        height: 100%;
        bottom: 1300px;
        left: 400px;
    }

    #h1{
    	font: bolder;
    	font-size: xx-large;
    }
    #h2{
    	font: bolder;
    	font-size: x-large;
    }
    #h3{
    	font: bold;
    	font-size: larger;
    }
    #h4{
    	font: bold;
    	font-size: large;
    }

#shape{
  width: 1300px;
  height: 100%;
  margin: auto;
  border: 0px solid black;
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

#pricetotal{
        width: 500px;
        height: 100px;
    }

#btns > button{
    width: 200px;
    height: 40px;
    
}

#btns{
  margin: auto;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
 <div id="content">

 
    <div id="shape">

      <div id="first">
        <div></div>
        <div>
          <h1 id="h1">차량 확인 및 결제<hr></h1>
        </div>
      </div>

      <div id="first2">
        <h2 id="h2">간단한 결제 안내 문구</h2>
      </div>

      <div id="second">
        <div></div>
        
        <div>
          <h1 id="h1">최종 결제 정보<hr></h1>
        </div>
      </div>

      <div id="second2">
        <div>
            <h2 id="h2">예약 정보</h2>
        </div>
      </div>

      <div id="pricetotal">
        <h2 id="h2">총 결제 금액</h2><h2>KRW 354,000<hr></h2>
      </div>
      <br><br><br><br><br>

      <h1 id="h1">결제 수단</h1>

      <hr>
      <div id="btns">
        <button type="button" class="btn btn-success">뒤로가기</button>
        <button type="button" class="btn btn-success">신용카드</button>
        <button type="button" class="btn btn-success">계좌이체</button>
      </div>

      
    </div>
  </div>
</body>
</html>