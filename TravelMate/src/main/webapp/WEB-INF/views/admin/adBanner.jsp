<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/adBanner.css">
<script defer src="${root}/static/js/adBanner.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

     <!-- 내용영역 -->
     <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>광고배너관리</a>
            <div id="report-search">
                <form action="" method="GET">
                    <select name="searchType">
                        <option value="bannerName">배너이름</option>
                        <option value="memberNick">회원닉네임</option>
                    </select>
                    <input class="" name="searchValue" type="text" placeholder="배너관련 검색">

                    <input type="submit" value="검색">
                </form>
            </div>
        </div>
        <div id="declaration">
            <div></div>
            <div>배너번호</div>
            <div>회원번호</div>
            <div>기념품코드</div>
            <div>배너이름</div>
            <div>배너이미지</div>
            <div id="hr"><hr></div>
            <div id="report-content">
                <label class="chk_box">
                <input type="checkbox" value="" name="stop">
                <span class="on"></span>
        
                </label>
            </div>
            <div>1</div>
            <div>user01</div>
            <div>성심당</div>
            <div>성심당 할인광고</div>
            <div><h6>test.jpg</h6></div>
            <div id="hr2"><hr></div>
            <div id="report-content">
                <label class="chk_box">
                <input type="checkbox" value="" name="stop">
                <span class="on"></span>
                </label>
            </div>
            <div>2</div>
            <div>user02</div>
            <div>(주)이모네</div>
            <div>춘천닭갈비 광고</div>
            <div><h6>good.png</h6></div>
            <div id="hr3"><hr></div>
        
            <button id="delete">삭제</button>
            <button id="update" onclick="bannerEdit();">수정</button>
            <button id="write" onclick="bannerWrite();">글쓰기</button>
        </div>  

        <div id="page-area">
          <a href="">◀</a>
          <a href="">1</a>
          <a href="">2</a>
          <a href="">3</a>
          <a href="">4</a>
          <a href="">5</a>
          <a href="">▶</a>
        </div>
        <div id="imgMore" class="stop-active1">
              
              <div id="modal-content">
                  <div id="close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                  </div>                                                    
                  
                  <div id="bannerImg">
                    <img src="${root}/static/img/adBanner/adBanner01.jpg" alt="광고배너">
                  </div>
              </div>

            </div>
        </div>  

</body>
</html>