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
    bottom: 500px;
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
  
  
	<form action="${root}/room/list" method="get">
		<div id="search-area">
		      <input type="hidden" name="page" value="1">
		      <select name="searchType">
		        <option value="asd">지역선택</option>					
		        <option value="name">제목</option>					
		        <option value="price">가격</option>					
		        <option value="souvenir">기념품</option>					
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
	        충천남/북도<input type="checkbox" name="local" value="chung">
	        경상남/북도<input type="checkbox" name="local" value="kung">
	        전라남/북도<input type="checkbox" name="local" value="jun">
	      </div>
	      <div>
	        대전<input type="checkbox" name="local" value="dae">
	        울산<input type="checkbox" name="local" value="ull">
	        대구<input type="checkbox" name="local" value="daegu">
	        광주<input type="checkbox" name="local" value="gwang">
	        부산<input type="checkbox" name="local" value="bu">
	        제주도<input type="checkbox" name="local" value="je">
	      </div>
	    </div>
	  	</div>
  	</form>
  	
  <br><br>
  
  <table>
    <thead>
      <tr>
        <th>상품이미지</th>
        <th>상품이름</th>
        <th>상품가격</th>
        <th>지역</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${voList}" var="vo"> 
         <tr>
             <td><img src="${root}/static/img/accomodation_img/${vo.title}" alt="${vo.title}" width="100px" height="100px"  ></td>
             <td>${vo.name}</td>
             <td>${vo.price}</td>
             <td>${vo.local}</td>
         </tr>
      </c:forEach>
    </tbody>
  </table>  
  
   <div id="page-area">
    	<c:if test="${pv.currentPage > 1}">
     	<a class="btn btn-primary btn-sm" href="${root}/room/list?page=${pv.currentPage - 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&local=${searchVo.local}">이전</a>
    	</c:if>
     	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
     		<c:if test="${pv.currentPage != i}">
       	<a class="btn btn-primary btn-sm" href="${root}/room/list?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&local=${searchVo.local}">${i}</a>
     		</c:if>
     		<c:if test="${pv.currentPage == i}">
       	<a class="btn btn-primary btn-sm">${i}</a>
     		</c:if>
     	</c:forEach>
     <c:if test="${pv.currentPage < pv.maxPage}">
     	<a class="btn btn-primary btn-sm" href="${root}/room/list?page=${pv.currentPage + 1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}&local=${searchVo.local}">다음</a>
     </c:if>
    </div>

</div>
</body>
</html>
<script>
const searchType = '${searchVo.searchType}';
const searchValue = '${searchVo.searchValue}';

const searchValueSelectTag = document.querySelector("select[name='searchValue']");
const searchValueInputTag = document.querySelector("input[name='searchValue']");

if(searchType.length > 1){
	initSearchType();
}

// 검색 타입 초기셋팅
function initSearchType(){
	const x = document.querySelector('select > option[value="' + searchType + '"]');
	x.selected = true;
}


//서치타입 변경 시 함수 실행
const searchTypeTag = document.querySelector('select[name="searchType"]');
searchTypeTag.addEventListener("change" , setSearchValueTag);

function setSearchValueTag(){
	const searchType = searchTypeTag.value;
	if(searchType == 'category'){
		setSearchValueTagSelect();
	}else{
		setSearchValueTagInput();
	}
}

//검색값 영역을 셀렉트가 보이게 (타입이 카테고리일 때)
function setSearchValueTagSelect(){
	searchValueSelectTag.classList.add("active");
	searchValueSelectTag.disabled = false;
	searchValueInputTag.classList.remove("active");
	searchValueInputTag.disabled = true;

	searchValueInputTag.value = '';
}

//검색값 영역을 인풋이 보이게 (타입이 카테고리가 아닐 때)
function setSearchValueTagInput(){
	searchValueInputTag.classList.add("active");
	searchValueInputTag.disabled = false;
	searchValueSelectTag.classList.remove("active");
	searchValueSelectTag.disabled = true;
}

	//테이블 행 클릭시 상세조회
	const tbody = document.querySelector('tbody');
	tbody.addEventListener('click', (event)=>{
		//글번호 가져와서
		const name = event.target.parentNode.children[1].innerText;

		//요청보내기
		location.href='${root}/order/room?name=' + name;


	});

</script>
