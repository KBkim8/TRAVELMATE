<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>


#content{
    position: relative;
	    width: 1390px;
	    height: 100%;
	    bottom: 900px;
	    left: 400px;
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

    #refund-info{
        position: absolute;
        width: 1300px;
        height: 80%;
        left: 130px;
        top: 230px;
    }

    #refund-area {
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
    }

    #refund-info-area {
        width: 1300px;
        margin: auto;
        margin-bottom: 20px;
        font-size: 30px;
    }
    
    #info-area-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px dashed black;
        margin: auto;
        font-size: 30px;
        display: grid;
        grid-template-columns: 1fr 3fr;
        align-items: center;
        align-content: center;
    }

    #info-area-box > img {
        width: 150px;
        height: 150px;
    }

    #info-text {
        text-align: center;
    }


    #btn-area{
        margin: auto;
        margin-top: 5%;
        display: block;
        align-items: center;
    }
    
    #btn-area > input{
        width: 200px;
        height: 60px;
        font-size: 30px;
        border-spacing: 20px;
    }


    #btn01 {
        background-color: #73D38E;
        padding: 0px 25px; 
        border: 0;
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        width: 150px;
        height: 50px;
        font-size: 30px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }

	.black-bg {
        display: none;
        width: 700px;
        height: 250px;
        position: absolute;
        background: rgba(255, 255, 255, 0.5);
        left: 400px;
        bottom: 650px;
        z-index: 10;
        padding: 50px;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
    }
    .white_bg {
        background: white;
        border-radius: 5px;
        padding: 50px;
    }

    .show-modal {
        display: inline-block;
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
            <a>환불</a>
        </div>
        <div id="refund-info">
            <div id="refund-area">
                <div id="refund-info-area" class="bi bi-info-square"> 환불상품정보</div>
                <div id="info-area-box">
                    <div id="info-img">
						<img src="${root}/static/img/마음샌드.jpg" alt="goodsImg">                       
                    </div>
                    <div id="info-text">
                        상품명 : 마음샌드 1박스(10개입)
                        <br>
                        결제가격 : 21,000원
                        <br>
                        결제일시 : 2023.05.02
                    </div>
                </div>
                <div id="btn-area">
                    <input type="button" id="btn01" value="확인" class="confirmBtn"></input>
                    <div class="black-bg">
                    <div class="white-bg">
                    <h4>결제하신 정보로 환불처리가 진행됩니다. <br> 
                        결제 수단 : 카드결제
                    </h4>
                    <button class="btn btn-danger" id="btn01">닫기</button>
                    </div>
                    </div>
                    <input type="button" id="btn01" value="취소"></input>
                </div>
            </div>
        </div>
    </div>

</body>
<script>

// 확인 버튼 누르면 모달로 "결제하신 정보로 환불처리가 진행됩니다."
$(".confirmBtn").on("click", function () {
    $(".black-bg").addClass("show-modal");
  }); //css에서 작성한 show-modal이라는 클래스명 추가

  $(".btn-danger").on("click", function () {
    $(".black-bg").removeClass("show-modal");
  }); // 


</script>
</html>