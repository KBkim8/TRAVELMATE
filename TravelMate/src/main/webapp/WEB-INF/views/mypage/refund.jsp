<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>


    #square{
        width: 25px;
        height: 50px;
        background-color: rgba(115, 211, 142);
        margin-top: 20px;
    }

    .mem-info{
        margin-top: 30px;
        margin-left: 1%;
        font-size: 1.6em;
        font-weight: bold;
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
    #refund-area{
        margin: auto;
        width: 100%;
        height: 90%;
        justify-content: center;
        align-items: center;
    }

    #info-area-box{
        width: 1000px;
        height: 70%;
        border: 1px solid rgba(115, 211, 142);
        background-color: rgba(220, 220, 220, 0.378);
        margin: auto;
        place-items: center center;
        display: grid;
        grid-template-columns: 1fr 2fr;
    }

    #btn-area{
        margin: auto;
        margin-left: 37%;
        margin-top: 5%;
        place-items: center center;
    }


    #refund-info-area{
        margin-top: 10%;
        margin-left: 11%;
        margin-bottom: 3%;
        font-size: 1.6em;
    }

    button{
        background-color: rgba(115, 211, 142, 0.574);
        width: 150px;
        height: 50px;
        border-radius: 10%;
        padding: 10px;
        border: none;
        cursor: pointer;
    }
    #info-img img{
        width: 200px;
        height: 200px;
    }

    #info-text{
        line-height: 40px;
    }

    .modal{
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgb(232, 243, 243);
    }

    .modalBox {
        position: absolute;
        background-color: #f98b8b;
        width: 400px;
        height: 200px;
        padding: 15px;
    }

    .madailBox button {
        display: block;
        width: 80px;
        margin: 0 auto;
    }

    .hidden {
        display: none;
    }





    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@include file="/WEB-INF/views/common/mg_sidebar.jsp" %>
        </div>
        <div id="mypage-refund-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">환불</h3>
            </div>
            <hr>
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
                    <button class="confirmBtn">확인</button>
                    <button class="cancelBtn">취소</button>
                </div>
            </div>
        </div>
        <div id="fast-menu-bar">
            
        </div>
        <div class="modal hidden">
            <div class="modalBox">
                <p>결제하신 정보로 환불처리가 진행됩니다.</p>
                <button class="closeBtn">X</button>
            </div>
        </div>
    </main>








</body>
<script>

// 확인 버튼 누르면 모달로 "결제하신 정보로 환불처리가 진행됩니다."
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".confirmBtn").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);

</script>
</html>