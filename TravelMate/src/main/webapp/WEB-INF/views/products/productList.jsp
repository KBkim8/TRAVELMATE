<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
#shape{
	position: relative;
    width: 1390px;
    height: 100%;
    bottom: 900px;
    left: 400px;
  
}


#search-area{
  padding: 30px;
}

#local{
  height: 100px;
  display: grid;
  align-items: center;
  padding-left: 30px;
  grid-template-columns: 1fr 15fr;
}

#local > div:nth-child(1){
  display: flex;
  justify-content: center;
  align-items: center;
  width: 50px;
  height: 50px;
  background-color: #39ec93;
}

#local > div:nth-child(2){
  display: grid;
  height: 100%;
}

#local-checkbox > div{
  display: flex;
  justify-content: center;
  align-items: center;
}
#local-checkbox > div > input{margin: 10px;}

table {
  width: 100%;
  border-collapse: collapse;
}
th, td {
  border-bottom: 1px solid #444444;
  height: 100px;
  text-align: center;
}

#page-area{
  width: 500px;
  margin: auto;
  display: flex;
  justify-content: space-evenly;
}

#write-btn-area{
  widows: 500px;
  margin: auto;
  display: flex;
  flex-direction: row-reverse;
}

</style>
</head>
<body>
  
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  
<div id="shape">
  
  
  <div id="search-area">
    <form action="${root}/board/list" method="get">
      <input type="hidden" name="page" value="1">
      <select name="searchType">
        <option value="title">숙소</option>					
        <option value="writer">렌터카</option>					
        <option value="category">기념품</option>					
      </select>
      <input type="text" name="searchValue" placeholder="검색할 내용을 입력하세요">
      <input type="submit" value="검색">
    </form>
	</div>
  <div id="local">
    <div >
      지역
    </div>
    <div id="local-checkbox">
      <div>
        강원도 <input type="checkbox">
        충천남/북도<input type="checkbox">
        경상남/북도<input type="checkbox">
        전라남/북도<input type="checkbox">
      </div>
      <div>
        대전<input type="checkbox">
        울산<input type="checkbox">
        대구<input type="checkbox">
        광주<input type="checkbox">
        부산<input type="checkbox">
        제주도<input type="checkbox">
      </div>
    </div>
  </div>
  
  <div style="float: right;">
    <select name="searchType">
      <option value="title">최신순</option>					
      <option value="writer">조회순</option>					
      <option value="category">가격순</option>					
    </select>
  </div>
  
  <table>
    <thead>
      <tr>
        <th>상품이미지</th>
        <th>상품이름</th>
        <th>상품가격</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>상품이미지</td>
        <td>상품이름</td>
        <td>상품가격</td>
      </tr>
      <tr>
        <td>상품이미지</td>
        <td>상품이름</td>
        <td>상품가격</td>
      </tr>
      <tr>
        <td>상품이미지</td>
        <td>상품이름</td>
        <td>상품가격</td>
      </tr>
      <tr>
        <td>상품이미지</td>
        <td>상품이름</td>
        <td>상품가격</td>
      </tr>
      <tr>
        <td>상품이미지</td>
        <td>상품이름</td>
        <td>상품가격</td>
      </tr>
    </tbody>
  </table>
  <div id="page-area">
    <c:if test="${pv.currentPage > 1}">
      <a class="btn btn-primary" href="${pageContext.request.contextPath }/notice/list?page=${pv.currentPage-1}">이전</a>				
    </c:if>

    <c:forEach begin="${pv.startPage }" end="${pv.endPage }" var="i">
      <a class="btn btn-primary" href="${pageContext.request.contextPath }/notice/list?page=${i }">${i}</a>
    </c:forEach>
    <c:if test="${pv.currentPage < pv.maxPage }">
      <a class="btn btn-primary" href="${pageContext.request.contextPath }/notice/list?page=${pv.currentPage+1 }">다음</a>
    </c:if>
    
    
  </div>
</div>
</body>
</html>