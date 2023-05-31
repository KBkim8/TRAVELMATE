<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${root}/static/css/header2 home.css">
<script defer src="${root}/static/js/header.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body bottommargin="0">
    
    <div id="wrap">
        <!-- 헤더영역 -->
       	<div id="realLogo">
            <a href="${root}/home">
                <img id="mainLogo" src="${root}/static/img/logo.png" alt="홈로고">
            </a>
        </div>
            
        <div id="logoCategory">
            <c:if test="${empty loginMember}">
            <a href="${root}/static/img/logo.png">회원가입</a>
            <a>|</a>
             <a href="${root}/login">로그인</a>
            <a>|</a>
        	</c:if>
        	
        	<c:if test="${not empty loginMember}">
        	<a href="${root}/logout">로그아웃</a>
            <a>|</a>
        	</c:if>
        	
            <a href="${root}/mypage/member/detail">마이페이지</a>
            <a>|</a>
            <a href="${root}/cs/faq">고객센터</a>
        </div>
        <nav class="menu align-center expanded text-center SMN_effect-45 menu align-center expanded text-center SMN_effect-23">
            <div></div>
            <div><a data-hover="예약">예약</a></div>
            <div><a href="">숙소</a></div>
            <div><a href="">차량</a></div>
            <div><a>|</a></div>
            <div><a data-hover="커뮤니티">커뮤니티</a></div>
            <div><a href="">정보</a></div>
            <div><a href="">토론</a></div>
            <div><a href="">리뷰</a></div>
            <div><a href="">공지</a></div>
            <div><a href="">여행일지</a></div>
            <div><a>|</a></div>
            <div><a href="" data-hover="랜선여행">랜선여행</a></div>
            <div><a>|</a></div>
            <div><a href="" data-hover="전체메뉴">전체메뉴</a></div>
            <div></div> 
        </nav>

    </div>


</body>
</html>