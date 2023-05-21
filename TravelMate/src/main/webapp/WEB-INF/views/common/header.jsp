<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${root}/static/css/header.css">
<script defer src="${root}/static/js/header.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<c:if test="${not empty alertMsg}">
	<script>
		alert("${alertMsg}");
	</script>
</c:if>
<c:remove var="alertMsg" scope="session"/>
</head>
<body bottommargin="0">
    
    <div id="wrap">
        <!-- 헤더영역 -->
       	<div id="realLogo">
            <a href="${root}/admin/home">
                <img id="mainLogo" src="${root}/static/img/logo.png" alt="홈로고">
            </a>
        </div>
            
        <div id="logoCategory">
            <a href="${root}/static/img/logo.png">회원가입</a>
            <a>|</a>
            <a href="">로그인</a>
            <a>|</a>
            <a href="">장바구니</a>
            <a>|</a>
            <a href="">고객센터</a>
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
         <!-- 왼쪽사이드바 -->
        <div id="side-bar">
            <img src="${root}/static/img/삼각형.png" alt="삼각형">
            <div id="profile">
                <img src="${root}/static/img/adminProfile.png" alt="프로필사진">
                <a>관리자 님 환영합니다 :)</a>
            </div>
            <div id="side">
                <div id="side-content">
                     <div class="topbar" style="position: absolute; top:0;">
                        <div class="left_sub_menu">
                            <div id="sub-img">
                                 <img id="triangle2" src="${root}/static/img/삼각형2.png" alt="삼각형2">
                            </div>
                        </div>        
                        <div class="sub_menu">
                            <h2 id="admin-private" data-hover="ADMIN PRIVATE" class="SMN_effect-23-2">ADMIN PRIVATE</h2>
                            <ul class="big_menu">
                                <li>회원관리 <i class="arrow fas fa-angle-right"></i></li>
                                <ul class="small_menu">
                                    <li><a href="${root}/admin/reportlist?page=1">· 신고내역</a></li>
                                    <li><a href="${root}/admin/reportSearch?page=1">· 제재이력조회</a></li>
                                    <li><a href="${root}/admin/memberSearch">· 회원조회</a></li>
                                </ul>
                            </ul>
                            <ul class="big_menu">
                                <li>상품관리 <i class="arrow fas fa-angle-right"></i></li>
                                <ul class="small_menu">
                                    <li><a href="${root}/admin/carinventory">· 차량재고조회</a></li>
                                    <li><a href="${root}/admin/accommodationinventory">· 숙조재고조회</a></li>
                                    <li><a href="${root}/admin/souvenirinventory">· 기념품재고조회</a></li>
                                    <li><a href="${root}/admin/sellrequest">· 판매등록요청조회</a></li>
                                </ul>
                            </ul>
                            <ul class="big_menu">
                                <li>배너관리 <i class="arrow fas fa-angle-right"></i></li>
                                <ul class="small_menu">
                                    <li><a href="${root}/admin/banner">· 광고배너관리</a></li>
                                </ul>
                            </ul>
                        </div>
                         </div>
                         <div class="overlay"></div>
                     </div>
                </div>
            </div>
        </div>

        <!-- 오른쪽사이드바 -->
        <div id="right-sidebar">

            <ul>
              <li>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart-check-fill" viewBox="0 0 16 16">
                    <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm-1.646-7.646-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708.708z"/>
                    </svg>
                </div>
              </li>
              <li id="uppage">
                <div> 
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
                    </svg>
                </div>
              </li>
              <li id="right-sidebar-category">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                </div>
              </li>
              <li id="downpage">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </div>
              </li>
            </ul>
        </div>
        <div id="sidebar-category">
            <button id="side-close" class="active2">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                </svg>
            </button>
        </div>

    </div>


</body>
</html>