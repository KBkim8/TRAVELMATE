<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/sellRequest.css">
<script defer src="${root}/static/js/sellRequest.js"></script>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

      <!-- 내용영역 -->
      <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>판매등록요청조회</a>
            <div id="report-search">
                <form action="" method="GET">
                    <select name="searchType">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                    </select>
                    <input class="" name="searchValue" type="text" placeholder="판매등록조회관련 검색">

                    <input type="submit" value="검색">
                </form>
            </div>
        </div>
        <div id="declaration">
          <div></div>
          <div>게시글번호</div>
          <div>작성자</div>
          <div>제목</div>
          <div>작성일</div>
          <div>이미지</div>
          <div id="hr"><hr></div>
          <div id="report-content">
              <label class="chk_box">
              <input type="checkbox" value="" name="stop">
              <span class="on"></span>
      
              </label>
          </div>
          <div>1</div>
          <div>1</div>
          <div>(주)우리닭갈비</div>
          <div>23-01-01</div>
          <div>test.jpg</div>
          <div id="hr2"><hr></div>
          <div id="report-content">
              <label class="chk_box">
              <input type="checkbox" value="" name="stop">
              <span class="on"></span>
              </label>
          </div>
          <div>2</div>
          <div>2</div>
          <div>성심당</div>
          <div>23-01-01</div>
          <div>test2.png</div>
          <div id="hr3"><hr></div>
          
          <button id="enroll">등록하기</button>
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
        <div id="enrollMore" class="stop-active1">
            
            <form action="" method="post">
                <div id="modal-content">
                  <div>게시글번호</div>                                               
                  <div>▶</div>                                               
                  <div><input type="text" value="1" name="boardNo" readonly></div>   
                  <div>작성자</div> 
                  <div>▶</div>                                            
                  <div><input type="text" value="성심당" name="writer" readonly></div>                                            
                  <div>제목</div> 
                  <div>▶</div>                                            
                  <div><input type="text" value="슈크림빵 판매등록 요청합니다." name="title" readonly></div>                                            
                  <div>내용</div>   
                  <div>▶</div> 
                  <div><input type="text" value="슈크림빵 판매등록 요청드립니다. 등록해주세요." name="content" readonly></div>
                  <div>작성일</div>                              
                  <div>▶</div>                              
                  <div><input type="date" value="2023-01-01" name="enrollDate" readonly></div>                              
                  <div>이미지</div>                              
                  <div id="plus">▶</div>                       
                  <div id="modal-img">
                    <input type="image" src="${root}/static/img/adBanner/adBanner01.jpg" alt="모달이미지" readonly>
                  </div>                       
                  <div id="submitDiv"><input type="submit" value="등록"></input></div>
                  <div id="buttonDiv"><button type="button" id="close">취소</button></div>
                </div>
            </form>

        </div>
    </div>

</body>
</html>