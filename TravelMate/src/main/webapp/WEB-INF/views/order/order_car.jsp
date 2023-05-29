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
    
    #start{
        width: 1300px;    
        margin: auto;
    }

    #supbox{
        margin: auto;
        
        height: 175px;
        display: grid;
        grid-template-columns: 1fr 2fr;
    }

    #boxx{
        margin-right: 0px;
    }

    #box{
        margin-left: 0px;
        width: 600px;
        height: 250px;
        background-color: rgba(0, 0, 0, 0.288);
        border: 1px solid black;
        
        display: grid;
        grid-template-rows: 5fr 1fr;

    }

    #rebtn{
        height: 50px;
        width: 200px;
        margin-right: 0px;    	
    }

    #agree{
        width: 90%;
        height: 200px;
        margin: auto;
    }

    #agree_detail{
        width: 90%;
        height: 80px;
        margin: auto;
    }
    
    #ctinfo{
        width: 500px;
        height: 200px;
        margin-left: 0px;
        
    }

    #agree{
        border: 1px solid black;
    }

    #agree_detail{
        border: 1px solid black;
    }

    #btns{
        width: 60%;
        height: 40px;
        margin: auto;
    }

    #carinclude{
        font: bolder;
        font-size: x-large;
    }
    #name{
        margin: auto;
    }

    #pricetotal{
        width: 500px;
        height: 100px;
        margin: auto;
    }
    
    
    #ctinfo > input{
    	width: 200px;
    	height: 40px;
    }
    
    #rebtn > button{
    	width : 200px;
    	height: 40px;
    }
    
    #btns > button{
    	width : 200px;
    	height: 40px;
    	margin: auto;
    }
    
    
    
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	
	<!-- 내용영역 -->
<div id="content">
    
    	<div id="start">
		<h1 id="h1">차량 정보<hr></h1>
		<div id="supbox">
	        <div id="boxx">
	            <img width="380px" src="${root}/static/img/carImg/${vo.title}" alt="carImg">
	        </div>
	        <div>
	            <div id="box">
	
	                <div class="boxtitle">
	                    <h3 id="h3">차종명 : ${vo.carKindKind}</h3>
	                    <br>
	                    <br>
	                    <h3 id="h3"> 탑승가능인원 : ${vo.max}  //  자동 변속   //  Gasoline</h3>
	                    <br>
	                    <br>
	                    <h3 id="h3">이용일      //       2023.05.01(월) - 2023.05.02(화)</h3>
	                    <br>
	                    <br>                    
	                    <h3 id="h3">인수지역 : ${vo.lcname}</h3>
	                    <br>
	                    <br>                    
	                    <h3 id="h3">번호판 : ${vo.licensePlate}</h3>
	                    <br>
	                    <br>                    
	                    <h3 id="h3">가격 : ${vo.price}</h3>
	                    
	                    
	                    <br>
	                    <br>                    
	                    <h3 id="h3">재고 : ${vo.count}</h3>
	                    <br>
	                    <br>                    
	                    <h3 id="h3">출고일 : ${vo.licenseDate}</h3>
	                               
	                </div>
	                <br>
	                <div id="rebtn">
	                	<br>
	                	<br>
	                	
	                    <button type="button" class="btn btn-success">후기 보러가기</button>
	                </div>
	                <br>
	            </div>
	        </div>
	    </div>
	    
	    <br>
	    <br>
	    <br>
	    <h1 id="h1">예약자 정보</h1>
	    <h3 id="h3">예약과 관련된 정보를 연락처로 보내드립니다.</h3>
	    <br>
	    <div id="ctinfo">
	        <br>
	
	        <h2 id="h2">예약자 명</h2>
	        <input type="text" id="name" placeholder="이름 입력">
	
	        <br>
	
	        <h2 id="h2">휴대폰 번호</h2>
	        <input type="text" id="phoneno" placeholder="'-' 제외하고 입력">
	
	        <br>
	
	        <h2 id="h2">이메일 주소</h2>
	        <input type="email" id="email" placeholder="example@mail.com">
	    </div>
	    <br>
	    <br>
	    <br>
	   <div>
			<input type="text" id="calender" name="daterange" value="06/01/2023 - 06/05/2023" />
	    </div>

	    <h1 id="h1">최종 결제 정보<hr></h1>
	    <br>
	    <h3 id="h3">${vo.price}</h3>
	   					<!-- 
	                    최종 가격 어떻게? 하루 가격 x 대여한 날짜수 구해야댐
	                    (vo.price) * (end_date - start_date) 
	                     -->
	    <br>
	    <h3 id="h3">※유의사항※</h3>
	    <br>
	    <h3 id="h3">차량 내 절대금연</h3>
	    <br>
	    
	    
	    <hr>
	    <div id="btns">
	        <button type="button" class="btn btn-success" onclick="backPage();">뒤로가기</button>
	        <button type="button" class="btn btn-success" onclick="favorite();">관심상품 담기</button>
	        <button type="submit" class="btn btn-success">결제하기</button>
	    </div>
    </div>
</div>
	
	
	


</body>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
	<script>
	let x;
	
	$(function() {
  		$('input[name="daterange"]').daterangepicker({
    	opens: 'left'
	  	}, function(start, end, label) {
    	console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    	x = start.format('YYYY-MM-DD') 
    	+ end.format('YYYY-MM-DD');
	  });
	});
	
	 function backPage() {
	    location.href="${root}/car/list";
	  }
		  
	  function favorite(){
		  if(${loginMember} == null){
				alert("로그인 하고 오세요")	  
				return;
		  }else{
			  alert("상품이 등록되었습니다.");
		  }
		  location.href="${root}/favorite?no=${vo.no}&name=${vo.name}";
		 
	  }
</script>
</html>