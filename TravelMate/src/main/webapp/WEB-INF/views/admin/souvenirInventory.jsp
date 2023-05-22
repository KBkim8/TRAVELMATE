<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/souvenirInventory.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	  <!-- 내용영역 -->
      <div id="content">
          <div id="first-content">
              <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
              <hr>
              <a>기념품재고조회</a>
              <div id="report-search">
                  <form action="" method="">
                      <select name="searchType">
                          <option value="souvenirName">기념품명</option>
                          <option value="areaName">지역명</option>
                      </select>
                      <input class="" name="searchValue" type="text" placeholder="기념품재고관련 검색">

                      <input type="submit" value="검색">
                  </form>
              </div>
          </div>
          
        <form action="" method="post">
          <div id="declaration">
             <div id="img-area01"><img src="${root}/static/img/adBanner/adBanner01.jpg" alt="기념품이미지"></div>
             <div>기념품코드</div>
             <div>|</div>
             <div><input type="text" value="1" name="no" readonly></div>
             <div>품명</div>
             <div>|</div>
             <div><input type="text" value="[성심당]슈크림빵" name="souvenirName" readonly></div>
             <div>지역</div>
             <div>|</div>
             <div><input type="text" value="대전" name="local" readonly></div>
             <div>가격</div>
             <div>|</div>
             <div><input type="text" value="20000" name="price" readonly></div>
             <div>상품등록일</div>
             <div>|</div>
             <div><input type="date" value="2023-01-01" name="enrollDate" readonly></div>
             <div>상품삭제여부</div>
             <div>|</div>
             <div><input type="text" value="X" name="deleteYn" readonly></div>
             <div>재고</div>
             <div>|</div>
             <div><input type="number" value="10" name="count" min="0" max="100"></div>
             <div><button id="countEdit">재고수정</button></div>
             <div id="hr01"><hr></div>
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

        </form>
</body>
</html>
<script>
  const price = document.querySelector('input[name="price"]');
  const value = price.value;
  
  const comma = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
  price.value = comma;
</script>