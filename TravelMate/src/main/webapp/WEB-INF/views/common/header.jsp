<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<!-- 부트스트랩 -->    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="${root}/static/css/header.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

    <div id="wrap">
        <!-- 헤더영역 -->
        <img id="logoImg" src="${root}/static/img/logo 복사.png" alt="로고이미지">
        <a href="#"><img id="mainLogo" src="${root}/static/img/mainLogo2.png" alt="홈로고"></a>
        <div id="logoCategory">
            <a href="">회원가입</a>
            <a>|</a>
            <a href="">로그인</a>
            <a>|</a>
            <a href="">장바구니</a>
            <a>|</a>
            <a href="">고객센터</a>
        </div>
        <nav class="menu align-center expanded text-center SMN_effect-45 menu align-center expanded text-center SMN_effect-23">
            <a data-hover="예약">예약</a>
            <a href="">숙소</a>
            <a href="">차량</a>
            <a>|</a>
            <a data-hover="커뮤니티">커뮤니티</a>
            <a href="">정보</a>
            <a href="">토론</a>
            <a href="">리뷰</a>
            <a href="">공지</a>
            <a href="">여행일지</a>
            <a>|</a>
            <a href="" data-hover="랜선여행">랜선여행</a>
            <a>|</a>   
            <a href="" data-hover="전체메뉴">전체메뉴</a>
        </nav>
        
</body>
</html>