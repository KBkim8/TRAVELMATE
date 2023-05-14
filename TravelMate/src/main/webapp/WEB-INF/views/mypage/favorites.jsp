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

    #fav-content-area{
        width: 1300px;
        height: 80%;
        left: 130px;
        top: 230px;
        position: absolute;
        display: grid;
        grid-template-rows: 2fr 1fr;
    }
    
    #fav-list-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px dashed black;
        font-size: 25px;
        justify-content: center;
        align-content: center;
    }

    #content-wrap{
        width: 100%;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        justify-content: center;
        align-items: center;
        text-align: center;
        margin: auto;
    }

    #content-wrap img {
        width: 150px;
        height: 150px;
        margin-right: 0;
    }

    .paging-area{
        width: 100%;
        height: 10%;
        border: 1px solid lightgray;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
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
    .black-bg {
        display: none;
        width: 400px;
        height: 200px;
        position: absolute;
        background: rgba(0, 0, 0, 0.5);
        left: 700px;
        bottom: 600px;
        z-index: 5;
        padding: 50px;
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
            <a>관심상품</a>
        </div>
        <div id="fav-content-area">
            <div id="fav-list-box">
                <!-- 반복문 처리 -->
                <div id="content-wrap">
                    <div><img src="${root}/static/img/마음샌드.jpg" alt=""></div>
                    <div> 
                        상품명 : [파리바게트]마음샌드
                        <br>
                        상품수량 : 1박스(20개)
                        <br>
                        상품가격 : 9,500원   
                    </div>
                    <div>
                        <button class="delBtn" id="btn01">삭제</button>
                        <div class="black-bg">
                        <div class="white-bg">
                        <h4>삭제되었습니다.</h4>
                        <button class="btn btn-danger" id="btn01">닫기</button>
                        </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div id="content-wrap">
                    <div><img src="${root}/static/img/d오메기떡.jpg" alt=""></div>
                    <div> 
                        상품명 : [탐난다]제주오메기떡
                        <br>
                        상품수량 : 1박스(20개)
                        <br>
                        상품가격 : 9,500원   
                    </div>
                    <div>
                        <button class="delBtn" id="btn01">삭제</button>
                    </div>
                </div>
                <hr>
                <div id="content-wrap">
                    <div><img src="${root}/static/img/d오메기떡.jpg" alt=""></div>
                    <div> 
                        상품명 : [탐난다]제주오메기떡
                        <br>
                        상품수량 : 1박스(20개)
                        <br>
                        상품가격 : 9,500원   
                    </div>
                    <div>
                        <button class="delBtn" id="btn01">삭제</button>
                    </div>
                </div>
            </div>
            <div class="paging-area">
             1 ,  2 ,  3
            </div>
        </div>
    </div>
</body>

<script>

$(".delBtn").on("click", function () {
        $(".black-bg").addClass("show-modal");
      }); //css에서 작성한 show-modal이라는 클래스명 추가

      $(".btn-danger").on("click", function () {
        $(".black-bg").removeClass("show-modal");
      }); // 

</script>

</html>