<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${root}/static/css/left_sidebar.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

 <!-- 왼쪽사이드바 -->
        <div id="side-bar">
            <img src="${root}/static/img/삼각형.png" alt="삼각형">
            <div id="side">
                <div id="side-content">
                        <div class="topbar" style="position: absolute; top:0;">
                            <div class="left_sub_menu">
                                <div class="sub_menu">
                                    <div id="sub-img">
                                        <img id="site-logo" src="${root}/static/img/TM small logo.png" alt="로고">
                                        <img id="triangle2" src="${root}/static/img/삼각형.png" alt="삼각형2">
                                    </div>
                                    <ul class="big_menu">
                                        <li>회원관리 <i class="arrow fas fa-angle-right"></i></li>
                                        <ul class="small_menu">
                                            <li><a href="#">신고내역</a></li>
                                            <li><a href="#">제재이력조회</a></li>
                                            <li><a href="#">회원조회</a></li>
                                        </ul>
                                    </ul>
                                    <ul class="big_menu">
                                        <li>상품관리 <i class="arrow fas fa-angle-right"></i></li>
                                        <ul class="small_menu">
                                            <li><a href="#">차량재고조회</a></li>
                                            <li><a href="#">숙조재고조회</a></li>
                                            <li><a href="#">기념품재고조회</a></li>
                                            <li><a href="#">판매등록요청조회</a></li>
                                        </ul>
                                    </ul>
                                    <ul class="big_menu">
                                        <li>배너관리 <i class="arrow fas fa-angle-right"></i></li>
                                        <ul class="small_menu">
                                            <li><a href="#">광고배너관리</a></li>
                                        </ul>
                                    </ul>
                                </div>
                            </div>
                            <div class="overlay"></div>
                        </div>
                </div>
            </div>
        </div>


</body>
</html>