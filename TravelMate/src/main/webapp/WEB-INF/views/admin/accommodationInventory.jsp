<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/accommodationInventory.css">
<script defer src="${root}/static/js/accommodationInventory.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	  <!-- 내용영역 -->
      <div id="content">
          <div id="first-content">
              <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
              <hr>
              <a>숙소재고조회</a>
              <div id="report-search">
                  <form action="" method="">
                      <select name="searchType">
                          <option value="accomName">숙소명</option>
                          <option value="accomKind">숙소종류</option>
                          <option value="countYn">재고여부</option>
                      </select>
                      <input class="" name="searchValue" type="text" placeholder="숙소재고관련 검색">

                      <input type="submit" value="검색">
                  </form>
              </div>
          </div>
          
          <div id="declaration">
                <div><img src="${root}/static/img/accommodationImg/accomImg01.png" alt="차량조회" onclick="openModal();"></div>
                <div><img src="${root}/static/img/accommodationImg/accomImg02.png" alt="차량조회"></div>
                <div><img src="${root}/static/img/accommodationImg/accomImg03.png" alt="차량조회"></div>
                <div id="page-area">
                    <a href="">◀</a>
                    <a href="">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">▶</a>
                </div>
          </div>

        <div id="accomMore" class="stop-active1">
            <div id="modal-content">
                <div id="close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                </div>                                                    
                <div>숙소코드</div>                        
                <div>▶</div>                        
                <div><input type="text" value="1" name="accomNo" readonly></div>
                <div>숙소명</div>                        
                <div>▶</div>                        
                <div><input type="text" value="[그랜드 하얏트 호텔]스위트 룸" name="carKind" readonly></div>                           
                <div>숙소종류</div>                        
                <div>▶</div>                        
                <div><input type="text" value="호텔" name="accomKind" readonly></div>
                <div>등록일</div>                        
                <div>▶</div>                        
                <div><input type="date" value="2023-01-01" name="enrollDate" readonly></div>    
                <div>재고여부</div>                        
                <div>▶</div>                        
                <div><input type="text" value="X" name="countYn" readonly></div>
                <div>예약시작일</div>                        
                <div>▶</div>                        
                <div><input type="date" value="2023-01-01" name="accomStart" readonly></div>  
                <div>예약종료일</div>                        
                <div>▶</div>                        
                <div><input type="date" value="2023-01-01" name="accomEnd" readonly></div>                                                                                                                              
                <div>수용인원</div>                        
                <div>▶</div>                        
                <div><input type="text" value="2" name="maxPeople" readonly></div>                                                                                                                           
            </div>
      </div>
</body>
</html>