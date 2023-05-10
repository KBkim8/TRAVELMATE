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

<link rel="stylesheet" href="${root}/static/css/sidebar.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

    <div id="side-bar">
        <img src="./img/삼각형.png" alt="삼각형">
        <div id="side">
            <div id="side-content">
                    <div class="topbar" style="position: absolute; top:0;">
                        <div class="left_sub_menu">
                            <div class="sub_menu">
                                <div id="sub-img">
                                    <img id="site-logo" src="./img/travle mate.png" alt="로고">
                                    <img id="triangle2" src="./img/삼각형2.png" alt="삼각형2">
                                </div>
                                <h2 id="admin-private" data-hover="ADMIN PRIVATE" class="SMN_effect-23-2">ADMIN PRIVATE</h2>
                                <ul class="big_menu">
                                    <li>고객센터 <i class="arrow fas fa-angle-right"></i></li>
                                    <ul class="small_menu">
                                        <li><a href="#">FAQ</a></li>
                                        <li><a href="#">1:1 문의하기</a></li>
                                        <li><a href="">1:1 문의내역</a></li>
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