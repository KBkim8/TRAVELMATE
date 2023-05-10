<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #square{
        width: 25px;
        height: 50px;
        background-color: rgba(115, 211, 142);
        margin-top: 20px;
    }

    .mem-info{
        margin-top: 30px;
        margin-left: 3%;
        font-size: 1.7em;
        font-weight: bold;
    }

    
    #side-bar{
        height: 100%;
        background-color: rgb(108, 237, 156);
    }
    
    main{
        width: 100%;
        height: 100vh;
    	display: grid;
        grid-template-columns: 1fr 4fr 1fr;
        grid-template-rows: 6fr 1fr;
    }
    #title-area{
        display: flex;
    }

    #inq-list-box{
        width: 1000px;
        height: 90%;
        /* background-color: rgba(220, 220, 220, 0.378); */
        margin: auto;
        border-radius: 10%;
        display: flex;
    }
    
    .list-box-area{
        width: 1000px;
        height: 600px;
        margin-top: 10%;
        border-collapse: collapse;
        justify-content: center;
        align-items: center;
        margin: auto;
        text-align: center;
    }

    td img{
        width: 30px;
        height: 30px;
    }

    .list-box-area th,
    .list-box-area td {
        border: 1px solid black;
    }

    .list-box-area th:first-child,
    .list-box-area td:first-child {
        border-left: 0;
    }
    .list-box-area th:last-child,
    .list-box-area td:last-child {
        border-right: 0;
    }

    thead,tbody{
        text-align: center;
    }

    .paging-area{
        width: 100%;
        height: 50px;
        border: 1px solid lightgray;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    
    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
          <%@ include file="/WEB-INF/views/common/cs_sidebar.jsp" %>
        </div>
        <div id="inq-list-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">1:1 문의내역</h3>
            </div>
            <hr>
                <div id="inq-list-box">
                      <!-- table 로 만들기 -->
                      <table class="list-box-area" align="center">
                        <thead>
                            <tr>
                                <th>문의번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일시</th>
                            </tr>
                        </thead>
                        <!-- 나중에 반복문으로 페이징 처리 -->
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>게시글 삭제하고 나서 다시 되돌리는 방법이 있나요?</td>
                                <td>마라탕</td>
                                <td>2023.05.23</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>배송 중인 상품 환불 가능한가요?</td>
                                <td>마이멜로디</td>
                                <td>2023.05.22</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>배송 기간 얼마나 걸리는 지 궁금합니다.</td>
                                <td>심투용</td>
                                <td>2023.04.11</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>배송 기간 얼마나 걸리는 지 궁금합니다.</td>
                                <td>심투용</td>
                                <td>2023.04.11</td>
                            </tr>
                        </tbody>
                      </table>
                </div>
            </div>
        <div id="fast-menu-bar">

        </div>
		<span></span>
        <div class="paging-area">
            1 ,  2 ,  3
        </div>
    </main>

</body>

</html>