<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    /* 내용영역 */
    #content{
        position: relative;
        width: 1390px;
        height: 100%;
        bottom: 1500px;
        left: 300px;
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
    
    #order-list-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px dashed black;
        height: 1000px;
        left: 130px;
        top: 230px;
        font-size: 25px;
        position: absolute;
        display: grid;
        grid-template-rows: 1fr 2fr 2fr 2fr;
        justify-content: center;
        align-content: center;
    }

    #img {
        width: 150px;
        height: 150px;
        margin-right: 0;
    }

    #title-wrap ,#content-wrap{
        width: 100%;
        display: grid;
        grid-template-columns: 1fr 3fr 1fr 1fr;
        justify-content: center;
        align-items: center;
        text-align: center;
        margin: auto;
    }


    #order-goods-wrap01 {
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-items: center;
    }

    #order-goods-status{
        display: grid;
        grid-template-rows: 1fr 1fr;
        justify-items: center;
        width: 120px;
        height: 180px;
        align-items: center;
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
        font-size: 25px;
        margin-left: 15px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   

    /* 카테고리 및 검색 */
    #report-search input[type="submit"]{
        background-image: url('./검색이미지.jpg');
        background-repeat: no-repeat;
        background-color: rgba(120, 120, 120, 0);
        border: 0px;
        cursor:pointer;
        outline: 0;
        position: absolute;
        left: 200px;
        top: 5px;
    }

    #report-search{
        position: absolute;
        right: 200px;
        top: 141px;
        width: 150px;
        height: 30px;
    }

    #report-search>form>input[type="text"]{
        width: 180px;
        height: 30px;
        font-size: 14px;
    }


</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/mypage-header.jsp" %>
    <!-- 내용영역 -->
    <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>주문내역</a>
        </div>
            <div id="report-search">
                <form action="" method="GET">
                    <input class="" name="searchValue" type="text" placeholder="주문내역 검색">
                    <input type="submit" value="검색">
                </form>
            </div>
        <div id="order-list-box">
            <div id="title-wrap">
                <div>주문 번호</div>
                <div>주문 상세 내용</div>
                <div>주문 날짜</div>
                <div>주문 상태</div>
            </div>
            <!-- 반복문 처리 -->
            <div id="content-wrap">
                <div>1</div>
                <div><div id="order-goods-wrap01"><img src="${root}/static/img/마음샌드.jpg" alt="" id="img"><div id="order-info">[파리바게트]제주 마음샌드<br>주문수량 : 1개<br>주문금액:20,000원</div></div></div>
                <div>2023.05.01 13:55:21</div>
                <div><div id="order-goods-status">결제완료<br><button id="btn01"><a href="${root}/mypage/refund">환불</a></button></div></div>
            </div>
            <div id="content-wrap">
                <div>2</div>
                <div><div id="order-goods-wrap01"><img src="${root}/static/img/d오메기떡.jpg" alt="" id="img"><div id="order-info">[파리바게트]제주 마음샌드<br>주문수량 : 1개<br>주문금액:20,000원</div></div></div>
                <div>2023.05.01 13:55:21</div>
                <div><div id="order-goods-status">배송중<br><button id="btn01"><a href="${root}/mypage/refund">환불</a></button></div></div>
            </div>
            <div id="content-wrap">
                <div>3</div>
                <div><div id="order-goods-wrap01"><img src="${root}/static/img/아베베도넛.jpg" alt="" id="img"><div id="order-info">제주 아베베도넛<br>주문수량 : 2개<br>주문금액:30,000원</div></div></div>
                <div>2023.05.01 13:55:21</div>
                <div> <div id="order-goods-status">배송중<br><button id="btn01"><a href="${root}/mypage/refund">환불</a></button></div></div>
            </div>
      </div>
    </div>


</body>

</html>