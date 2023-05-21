<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/home.css">
<script defer src="${root}/static/js/home.js"></script>
</head>
<body bottommargin="0">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<!-- 내용영역 -->
    <div id="content">
        <div id="content-header">
            <h4>관리센터</h4>
            <hr>
            <div class="toggle">
                <a>📢 회원정지 시 닉네임과 아이디를 꼭 확인해주세요.</a>
                <button id="toggle-close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                </button>
            </div>
        </div>

        <div id="content-body">
            <div id="memberManage">
                <a>신고내역</a>
                <div id="report">
                    <a>욕설사용</a>
                    <a>닉네임01</a>
                    <a>23-01-01</a>
                    <a>광고글도배</a>
                    <a>닉네임02</a>
                    <a>23-01-01</a>
                </div>
                <div id="report-more">
                    <a href="${root}/admin/reportlist?page=1">더보기 ▶</a>
                    <hr>
                </div>
            </div>
            <div id="productManage">
                <a>판매등록요청조회</a>
                <div id="sellList">
                    <a>렌트카 판매등록 요청합니다.</a>
                    <a>23-01-01</a>
                    <a>숙소 판매등록 요청합니다.</a>
                    <a>23-01-01</a>
                </div>
                <div id="sell-more">
                    <a href="${root}/admin/sellrequest">더보기 ▶</a>
                    <hr>
                </div>
            </div>
            <div id="bannerManage">
                <a>광고배너관리</a>
                <div id="adBanner">
                    <a>성심당 할인광고</a>
                    <a>(주)성심당</a>
                    <a>23-01-01</a>
                    <a>성심당 할인광고</a>
                    <a>(주)성심당</a>
                    <a>23-01-01</a>
                </div>
                <div id="banner-more">
                    <a href="${root}/admin/banner">더보기 ▶</a>
                </div>
            </div>
            <div id="qa">
                <a>자주묻는질문</a>
                <div id="qaList">
                    <a>로그인이 안돼요.</a>
                    <a>23-01-01</a>
                    <a>회원탈퇴를 하고 싶습니다.</a>
                    <a>23-01-01</a>
                </div>
                <div id="qa-more">
                    <a href="">더보기 ▶</a>
                </div>
            </div>
        </div>
    </div>
	
</body>
</html>