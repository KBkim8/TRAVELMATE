<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    #start{
        width: 80vh;    
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
        height: 175px;
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
        margin: auto;
        
    }

    #agree{
        border: 1px solid black;
    }

    #agree_detail{
        border: 1px solid black;
    }

    #btns{
        width: 50%;
        height: 40px;
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
<div id="start">
	<h1>차량 정보<hr></h1>
	<div id="supbox">
        <div id="boxx">
            <img width="380px" src="data:image/jpeg;base64,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" alt="avante">
        </div>
        <div>
            <div id="box">

                <div class="boxtitle">
                    아반떼떼떼떼
                    <br>
                    <br>
                    5인승   //  자동 변속   //  Gasoline
                    <br>
                    <br>
                    이용일      //       2023.05.01(월) - 2023.05.02(화)
                    <br>
                    <br>                    
                    인수 장소       //      제주시 제성1길 30
                               
                </div>
                <br>
                <div id="rebtn">
                    <button type="button" class="btn btn-success">후기 보러가기</button>
                </div>
                <br>
            </div>
        </div>
    </div>
    
    <br>
    <br>
    <br>
    <h1>예약자 정보</h1>
    <h3 id="auto">예약과 관련된 정보를 연락처로 보내드립니다.</h3>
    <h4>회원정보로 예약자 정보 채워넣기</h4>
    <input type="checkbox" id="getInfo"><hr>
    <br>
    <div id="ctinfo">
        <br>

        <h2 id="name">예약자 명</h2>
        <input type="text" id="name" placeholder="이름 입력">

        <br>

        <h2>휴대폰 번호</h2>
        <input type="text" id="phoneno" placeholder="'-' 제외하고 입력">

        <br>

        <h2>이메일 주소</h2>
        <input type="email" id="email" placeholder="example@mail.com">
    </div>
    <br>
    <br>
    <br>
    <h1>최종 결제 정보<hr></h1>
    <br>
    <h3 id="carinclude">포함사항</h3>
    <br>
    <h3>차량 대여료</h3>
    <br>
    <h3>금연</h3>
    <br>
    <h3>네비게이션</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    <h3>~~~~~</h3>
    <br>
    
    <hr>
    <div id="btns">
        <button type="button" class="btn btn-success">뒤로가기</button>
        <button type="button" class="btn btn-success">관심상품 담기</button>
        <button type="button" class="btn btn-success">결제하기</button>
    </div>
</div>
</body>
</html>