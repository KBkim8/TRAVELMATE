<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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



table td{
	justify-content: center;
	align-items: center;
}

</style>
</head>
<body>
  
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  
<div id="shape">
  
  
	<form action="${root}/car/list" method="get">
		<div id="search-area">
		      <input type="hidden" name="page" value="1">
		      <select name="searchType">					
		        <option value="carKind">차량이름</option>
		        <option value="carKind">차량크기</option>
		        <option value="price">가격</option>					
		      </select>
		      
		      <input type="text" name="searchValue" placeholder="검색할 내용을 입력하세요">
		      <input type="submit" value="검색">
		</div>
	    <div id="local">
	    <div>
	      지역
	    </div>
	    <div id="local-checkbox">
	      <div>
		    강원도 <input type="checkbox" name="local" value="gang">
	        충천남/북도<input type="checkbox" name="local" value="">
	        경상남/북도<input type="checkbox" name="local" value="">
	        전라남/북도<input type="checkbox" name="local" value="">
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
  	</form>
  	
  <br><br>
  
  <table>
    <thead>
      <tr>
        <th>차량이미지</th>
        <th>차량이름</th>
        <th>차량가격</th>
        <th>대여지역</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${voList}" var="vo"> 
         <tr>
             <td><img src="${root}/static/img/carImg/${vo.title}" alt="ASD" width="100px" height="100px"  ></td>
             <td>${vo.carKindKind}</td>
             <td>${vo.price}</td>
             <td>${vo.lcname}</td>
         </tr>
      </c:forEach>
    </tbody>
  </table>  
  
   <div id="page-area">
    	<c:if test="${pv.currentPage > 1}">
     	<a class="btn btn-primary btn-sm" href="${root}/car/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&local=${searchVo.local}">이전</a>
    	</c:if>
     	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
     		<c:if test="${pv.currentPage != i}">
       	<a class="btn btn-primary btn-sm" href="${root}/car/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&local=${searchVo.local}">${i}</a>
     		</c:if>
     		<c:if test="${pv.currentPage == i}">
       	<a class="btn btn-primary btn-sm">${i}</a>
     		</c:if>
     	</c:forEach>
     <c:if test="${pv.currentPage < pv.maxPage}">
     	<a class="btn btn-primary btn-sm" href="${root}/car/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&local=${searchVo.local}">다음</a>
     </c:if>
    </div>

</div>
</body>
</html>