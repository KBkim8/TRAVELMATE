<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>

    /* 내용영역 */
    #content{
        position: relative;
        width: 1390px;
        height: 100%;
        bottom: 1500px;
        left: 300px;
        margin-top: 300px;
    }

    #first-content>img{
        position: absolute;
        left: 100px;
        top: 125px;
        width: 40px;
        height: 60px;
    }

    #content>#first-content>hr:nth-child(2){
        height: 1px;
        width: 1300px;
        background-color: rgb(116, 116, 116);
        border: 0px solid rgb(65, 65, 65);
        position: absolute;
        left: 100px;
        top: 180px;
    }

    #content>#first-content>a:nth-child(3){
        position: absolute;
        left: 160px;
        top: 135px;
        color: black;
        font-size: 28px;
        font-weight: bold;
    }
    
    #content > table {
    	position: absolute;
        width: 1300px;
        height: 500px;
        left: 100px;
        top: 230px;
		margin: auto;
		border: 1px dashed black;
        border-radius: 20%;
		border-collapse: collapse;
		text-align: center;
		line-height: 50px;
	}

    #content > table th {
        font-size: 25px;
        font-weight: bold;
        border-bottom: 2px solid black;
    }

	#content > table td {
		border-bottom: 1px solid black;
	}

	#content > table > tbody tr {
		height: 27px;
	}

	#content > table > thead > tr > th:nth-child(1){width: 10%;}
	#content > table > thead > tr > th:nth-child(2){width: 50%;}
	#content > table > thead > tr > th:nth-child(3){width: 30%;}
	#content > table > thead > tr > th:nth-child(4){width: 10%;}

	#page-area{
        position: absolute;
        width: 1300px;
        height: 30px;
        left: 100px;
        top: 820px;
		margin: auto;
		display : flex;
		justify-content: space-evenly;
	}
	
	tbody > tr:hover {
		background-color: lightgray;
		cursor: pointer;
	}

    #btn01 {
        background-color: #73D38E;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        width: 100px;
        height: 30px;
        font-size: 20px;
        margin-left: 15px;
    }

    #btn02{
        background-color: #73D38E;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        width: 50px;
        height: 30px;
        font-size: 20px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   

    /* 카테고리 및 검색 */
    #report-search input[type="submit"]{
        /* background-image: url('./img/검색이미지.png'); */
        /* background-repeat: no-repeat; */
        background-color: rgba(84, 190, 128, 0.562);
        border: 0px;
        cursor:pointer;
        outline: 0;
        color: rgb(4, 4, 4);
        position: absolute;
        left: 267px;
        top: 5px;
    }

    #report-search{
        position: absolute;
        right: 180px;
        top: 141px;
    }

    #report-search>form>input[type="text"]{
        width: 180px;
        height: 30px;
        font-size: 14px;
    }

    
    
    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/cs-header.jsp" %>
    <!-- 내용영역 -->
    <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>1:1 문의내역</a>
        </div>
            <!-- 게시판 카테고리 검색 -->
            <div id="report-search">
                <form action="" method="GET">
                    <input class="" name="searchValue" type="text" placeholder="게시글 검색">
                    <input type="submit" value="검색">
                </form>
            </div>
        <table>
				<thead>
					<tr>
						<th>문의번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일시</th>
					</tr>
				</thead>

				<tbody>
				
					<c:forEach items="${ list }" var="inq">
					<tr>
						<td>${ inq.no }</td>
						<td>${ inq.title }</td>
						<td>${ inq.memberNick }</td>
						<td>${ inq.enrollDate }</td>
					</tr>
					</c:forEach>
					
				</tbody>

			</table>
			
			<div id="page-area">
				<c:if test="${pv.currentPage > 1 }">
				<a id="btn01" href="${root}/CScenter/Inquerylist?page=${pv.currentPage-1}">이전</a>
				</c:if>
				<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
					<a id="btn02" href="${root}/CScenter/Inquerylist?page=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pv.currentPage < pv.maxPage}">
				<a id="btn01" href="${root}/CScenter/Inquerylist?page=${pv.currentPage+1}">다음</a>
				</c:if>
			</div>
	</div>
</body>

</html>


<script>

	const tbody = document.querySelector("tbody");
	tbody.addEventListener("click", function(e){
	const no = e.target.parentNode.children[0].innerText;
	location.href = "${root}/cs/detail?no=" + no;
	
});

</script>