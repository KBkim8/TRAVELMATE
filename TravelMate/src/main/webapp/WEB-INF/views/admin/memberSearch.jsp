<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/memberSearch.css">
<script defer src="${root}/static/js/memberSearch.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

     <!-- 내용영역 -->
     <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>회원조회</a>
            <div id="report-search">
                <form action="" method="GET">
                    <select name="searchType">
                        <option value="memberId">회원아이디</option>
                        <option value="memberNick">회원닉네임</option>
                        <option value="email">회원이메일</option>
                        <option value="status">회원상태</option>
                    </select>
                    <input class="" name="searchValue" type="text" placeholder="회원관련 검색">

                    <input type="submit" value="검색">
                </form>
            </div>
        </div>
        <div id="declaration">
            <div></div>
            <div>회원번호</div>
            <div>아이디</div>
            <div>닉네임</div>
            <div>회원등급</div>
            <div>상태</div>
            <div id="hr"><hr></div>
            <div id="report-content">
                <label class="chk_box">
                <input type="checkbox" value="" name="stop">
                <span class="on"></span>
        
                </label>
            </div>
            <div>회원번호</div>
            <div>아이디</div>
            <div>닉네임</div>
            <div>회원등급</div>
            <div>상태</div>
            <div id="hr2"><hr></div>
            <div id="report-content">
                <label class="chk_box">
                <input type="checkbox" value="" name="stop">
                <span class="on"></span>
                </label>
            </div>
            <div>회원번호</div>
            <div>아이디</div>
            <div>닉네임</div>
            <div>회원등급</div>
            <div>상태</div>
            <div id="hr3"><hr></div>
        
            <button id="moreList">상세조회</button>
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
        <div id="memberMore" class="stop-active1">
              
              <div id="modal-content">
                  <div id="close">
                      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                      <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                      </svg>
                  </div>                                                    
                  <div>회원번호</div>                             
                  <div>▶</div>                             
                  <div>1</div>                             
                  <div>아이디</div>                             
                  <div>▶</div>                             
                  <div>user01</div>                             
                  <div>닉네임</div>                             
                  <div>▶</div>                             
                  <div>nick01</div>                             
                  <div>이메일</div>                             
                  <div>▶</div>                             
                  <div>sfsdf@naver.com</div>                             
                  <div>주소</div>                             
                  <div>▶</div>                             
                  <div>서울시 강남구 kh정보교육원</div>                             
                  <div>회원등급</div>                             
                  <div>▶</div>                             
                  <div>실버</div>                             
                  <div>가입일</div>                             
                  <div>▶</div>                             
                  <div>2023-01-01</div>                             
                  <div>정보수정일</div>                             
                  <div>▶</div>                             
                  <div>2023-01-02</div>                             
                  <div>상태</div>                             
                  <div>▶</div>                             
                  <div>O</div>                             
                  <div>탈퇴여부</div>                             
                  <div>▶</div>                             
                  <div>X</div>                             
              </div>

            </div>
        </div>  

</body>
</html>