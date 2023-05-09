<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #wrap{
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: 1fr 4fr 1fr;
    }

    #square{
        width: 20px;
        height: 40px;
        background-color: rgba(115, 211, 142);
        margin-top: 20px;
    }

    .mem-info{
        margin-top: 30px;
        margin-left: 3%;
        font-size: 1.5em;
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
        
    }
    #title-area{
        display: flex;
    }

    
    .refund{
        background-color: rgba(115, 211, 142, 0.574);
        width: 50px;
        height: 30px;
        border-radius: 10%;
        border: none;
    }

    #order-list-box{
        width: 800px;
        height: 90%;
        background-color: rgba(220, 220, 220, 0.378);
        margin: auto;
        border-radius: 10%;
        display: flex;
    }
    
    .list-box-area{
        margin-top: 10%;
        border-collapse: collapse;
        justify-content: center;
        align-items: center;
        margin-left: auto;
        margin-right: auto;
    }

    td img{
        width: 30px;
        height: 30px;
    }

    .list-box-area tr,th,td{
        border-bottom: 1px solid black;
        height: 40px;
        text-align: center;
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

    td:nth-child(2){
        width: 300px;
    }

    td:nth-child(3){
        width: 100px;
    }

    thead,tbody{
        text-align: center;
    }
    
    
    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">

        </div>
        <div id="order-list-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">주문내역조회</h3>
            </div>
            <hr>
                <div id="order-list-box">
                      <!-- table 로 만들기 -->
                      <table class="list-box-area">
                        <thead>
                            <tr>
                                <th>주문 번호</th>
                                <th>주문 상세 내용</th>
                                <th>주문 날짜</th>
                                <th>주문 상태</th>
                            </tr>
                        </thead>
                        <!-- 나중에 반복문으로 페이징 처리 -->
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><img src="${root}/static/img/마음샌드.jpg" alt="">[파리바게트]제주 마음샌드</td>
                                <td>2023.05.01</td>
                                <td>결제완료<input type="button" class="refund" value="환불"></input></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><img src="${root}/static/img/d오메기떡.jpg" alt="">오메기떡</td>
                                <td>2023.05.01</td>
                                <td>배송중</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>[파리바게트]제주 마음샌드</td>
                                <td>2023.05.01</td>
                                <td>배송완료</td>
                            </tr>
                        </tbody>
                      </table>
                </div>
            </div>
        <div id="fast-menu-bar">

        </div>
    </main>

</body>

</html>