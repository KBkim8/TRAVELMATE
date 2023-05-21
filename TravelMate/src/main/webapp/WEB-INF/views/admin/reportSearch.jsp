<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/reportSearch.css">
<script defer src="${root}/static/js/reportSearch.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	  <!-- 내용영역 -->
      <div id="content">
          <div id="first-content">
              <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
              <hr>
              <a>제재이력조회</a>
              <div id="report-search">
                  <form action="${root}/admin/reportSearch" method="get">
                     <input type="hidden" name="page" value="1"> 
                     <select name="searchType">
                          <option value="memberNick">회원닉네임</option>
                          <option value="sanctionName">제재종류</option>
                      </select>
                      <input class="" name="searchValue" type="text" value="${searchVo.searchValue}" placeholder="제재이력관련 검색">
                      <select name="searchValue" class="semiCategory">
                        <option value="영구정지">영구정지</option>
                        <option value="계정일시정지">계정일시정지</option>
                        <option value="글작성 차단">글작성차단</option>
                        <option value="댓글작성 차단">댓글작성차단</option>
                        <option value="경고">경고</option>
                      </select>
                      <input type="submit" value="검색">
                  </form>
              </div>
          </div>
          <div id="declaration">
            <div></div>
            <div>제재내역번호</div>
            <div>제재종류</div>
            <div>회원닉네임</div>
            <div>차단일</div>
            <div>차단종료일</div>
            <div id="hr"><hr></div>

            <c:forEach var="voList" items="${voList}">
                <div>💚</div>
                <div id="no">${voList.no}</div>
                <div>${voList.sanctionName}</div>
                <div>${voList.memberNick}</div>
                <div>${voList.enrollDate}</div>
                <div>${voList.cancelEnrollDate}</div>
                <div id="hr"><hr></div>
            </c:forEach>
        
            <div id="page-area">
                <c:if test="${pv.currentPage > 1}">
                    <a href="${root}/admin/reportSearch?page=${pv.currentPage-1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">◀</a>
                </c:if>
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                    <a href="${root}/admin/reportSearch?page=${i}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">${i}</a>
                </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                    <a href="${root}/admin/reportSearch?page=${pv.currentPage+1}&searchType=${searchVo.searchType}&searchValue=${searchVo.searchValue}">▶</a>
                </c:if>
            </div>
        </div>

          <div id="reportMore" class="stop-active1">
                
                <div id="modal-content">
                    <div id="close">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                        </svg>
                    </div>                                                    
                    <div>제재내역번호</div>                             
                    <div>▶</div>                             
                    <div>1</div>                             
                    <div>신고내역번호</div>                             
                    <div>▶</div>                             
                    <div>1</div>                             
                    <div>제재사유</div>                             
                    <div>▶</div>                             
                    <div>욕설</div>                             
                    <div>회원아이디</div>                             
                    <div>▶</div>                             
                    <div>soyeon</div>                             
                    <div>회원차단일</div>                             
                    <div>▶</div>                             
                    <div>2023-01-01</div>                             
                    <div>차단종료일</div>                             
                    <div>▶</div>                             
                    <div>2023-01-01</div>                             
                    <div>제재횟수</div>                             
                    <div>▶</div>                             
                    <div>3</div>                             
                </div>

          </div>
      </div>
        
</body>
</html>
<script>
   //게시글 상세조회
	const declaration = document.querySelector("#declaration");
	
	declaration.addEventListener("click", function(e) {
	  if (e.target.id === "no") {
	    const no = e.target.innerText;
	    location.href = "${root}/admin/reportlistdetail?no=" + no;
	  }
	});

    //서치타입 변경 시 함수 실행
    const searchType = '${searchVo.searchType}';
    const searchValue = '${searchVo.searchValue}';
    
    const searchValueSelectTag = document.querySelector("select[name='searchValue']");
	const searchValueInputTag = document.querySelector("input[name='searchValue']");
	const submit = document.querySelector("input[type='submit']");
    
   	if(searchType.length > 1){
   		initSearchType();
   	}
    
   	function initSearchType(){
   		const x = document.querySelector('select > option[value="' + searchType + '"]');
	    x.selected = true;   
   	}
   	
    //카테고리를 신고사유로 변경시 함수호출
    const searchTypeTag = document.querySelector('select[name="searchType"]');

    searchTypeTag.addEventListener("change" , setSearchValueTag);
    
	function setSearchValueTag(){
		const searchType = searchTypeTag.value;
		if(searchType == 'sanctionName'){
			setSearchValueTagSelect();
		}else{
			setSearchValueTagInput();
		}
	}

	//검색값 영역을 셀렉트가 보이게
	function setSearchValueTagSelect(){
		searchValueSelectTag.classList.add("active");
        searchValueSelectTag.classList.remove("hidden");
        searchValueSelectTag.disabled = false;

		searchValueInputTag.classList.add("hidden");
        submit.classList.remove("hidden");
        searchValueInputTag.disabled = true;

	}

	//검색값 영역을 인풋이 보이게
	function setSearchValueTagInput(){
        searchValueSelectTag.classList.add("hidden");
        searchValueSelectTag.classList.remove("active");
        searchValueSelectTag.disabled = true;
        
		searchValueInputTag.classList.remove("hidden");
        submit.classList.remove("hidden");
        searchValueInputTag.disabled = false;

        searchValueInputTag.value= '';
	}

    //신고사유 검색한 이후에 검색값 유지
    function initSearchValueSelect(){
        const optionTag = document.querySelector("option[value='"+ searchValue +"']");
        optionTag.selected = true;
    }
	
	setSearchValueTag();
	initSearchValueSelect();

</script>