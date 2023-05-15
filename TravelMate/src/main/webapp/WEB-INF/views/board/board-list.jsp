<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #content{
        position: relative;
        width: 1390px;
        height: 100%;
        bottom: 1300px;
        left: 300px;
    }
    

    #first-content>img{
        position: absolute;
        left: 100px;
        top: 70px;
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

    #edit-area{
        position: absolute;
        width: 1300px;
        height: 1000px;
        left: 130px;
        top: 230px;
        display: grid;
        grid-template-rows: 3fr 1fr;
    }

    #btn01 {
        background-color: #73D38E;
        font-size: 2.5em;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   

    #write-area{
        margin-top: 170px; /* 이녀석이 노트북이랑 데스크탑이랑 화면다르게 보이게함*/
        margin-left: 20%;
    }

    table{
        height: 500px;
        width: 1000px;
        background-color: #d8f1c7;
        border-radius: 20px;
    }

    table > thead > tr th , table > tbody > tr td {
        font-size: 2.5em;
        text-align: center;
        border: 2px solid black;
        height: 20px;
    }

    tbody > tr:hover {
		background-color: rgb(32, 229, 52);
		cursor: pointer;
	}

    input[name=title]{
        font-size: 2em;
        width: 500px;
        height: 70px;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
        margin-top: 210px;
    }

    #page-area{
        margin-left: 250px;
        margin-top: 30px;
    }

    
</style>
</head>
<body>


    <%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<!-- 내용영역 -->
    <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>게시글 목록</a> 
        </div>
        <div id="write-area">
            <input type="text" name="title" placeholder="제목을 입력하세요"> <input id="btn01" type="button" value="검색">
            <select name="categoryNo" style="width:150px;height:60px; font-size: 2em;">
                    <option value=10>축구</option>	
                    <option value=20>게임</option>	
                    <option value=30>축구</option>	
                    <option value=40>축구</option>	
            </select>
            <br>
            <br>
            <table>
                <thead>
                    <tr>
                        <th>번호 </th>
                        <th>제목 </th>
                        <th>작성자 </th>
                        <th>작성일시</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <hr>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>dddddd</td>
                        <td>dddddd</td>
                        <td>2023.09.30</td>
                        <td>30</td>
                    </tr>

                </tbody>
            </table>
                <div id="page-area">
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">이전</a>
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">1</a>
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">2</a>
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">3</a>
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">4</a>
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">5</a>
                    <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage+1}">다음</a>
                    <!-- <c:if test="${ pv.currentPage > 1 }">
                        <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage-1}">이전</a>
                    </c:if>
                    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                        <c:if test="${currentPage ne i}">
                            <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${i}">${i}</a>
                        </c:if>
                        <c:if test="${currentPage == i}">
                            <a id="btn01">${i}</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${ pv.currentPage < pv.maxPage }">
                        <a id="btn01" href="${pageContext.request.contextPath}/notice/list?page=${pv.currentPage+1}">다음</a>
                    </c:if> -->
                </div>
        </div>
    </div>


</body>
</html>

<script>

    //게시글 상세조회
	const tbody = document.querySelector("tbody");
	tbody.addEventListener("click" , function(e){
		const no = e.target.parentNode.children[0].innerText;
		location.href = "${root}/detail?no=" + no;
	});

</script>