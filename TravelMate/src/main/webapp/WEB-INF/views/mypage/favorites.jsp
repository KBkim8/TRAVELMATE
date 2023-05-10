<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    body{
        width: 100%;
        height: 100%;
    }

    #wrapper{
        width: 100%;
        height: 100vh;
        display: grid;
        grid-template-columns: 1fr 4fr 1fr;
    }

    #square{
        width: 25px;
        height: 50px;
        background-color: rgba(115, 211, 142);
        margin-top: 20px;
    }

    .mem-info{
        margin-top: 30px;
        margin-left: 3%;
        font-size: 1.5em;
    }

    
    #title-area{
        display: flex;
    }

    #fav-list-area{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }

    
    .delBtn{
        background-color: rgba(115, 211, 142, 0.574);
        width: 50px;
        height: 30px;
        border-radius: 10%;
        border: none;
    }

    #fav-list-box{
        width: 1000px;
        height: 80%;
        background-color: rgba(220, 220, 220, 0.378);
        margin: auto;
        border-radius: 10%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .fav-box-area{
        border-collapse: collapse;
        margin: auto;
    }

    td img{
        width: 200px;
        height: 100px;
    }

    .fav-box-area tr,th,td{
        border-bottom: 1px solid black;
        height: 60px;
    }


    .fav-box-area th:first-child,
    .fav-box-area td:first-child {
        border-left: 0;
    }
    .fav-box-area th:last-child,
    .fav-box-area td:last-child {
        border-right: 0;
    }

    td:nth-child(2){
        width: 300px;
    }

    td:nth-child(3){
        width: 100px;
    }

    .fav-info{
        width: 250px;
        height: 100px;
        background-color: rgba(128, 128, 128, 0.262);
        margin: auto;
        vertical-align: middle;
        display: flex;
        place-items: center center;
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
    
    .black-bg {
        display: none;
        width: 50%;
        height: 100%;
        position: fixed;
        background: rgba(0, 0, 0, 0.5);
        z-index: 5;
        padding: 110px;
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

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="wrapper">
            <div id="sidebar">
				<%@ include file="/WEB-INF/views/common/mg_sidebar.jsp" %>
            </div>
            <div id="fav-list-area">
                <div id="title-area">
                    <div id="square"></div>
                    <h3 class="mem-info">관심상품</h3>
                </div>
                <hr>
                    <div id="fav-list-box">
                          <table class="fav-box-area" align="center">
                            <!-- 나중에 반복문으로 페이징 처리 -->
                                <tr>
                                    <td><img src="${root}/static/img/마음샌드.jpg" alt=""></td>
                                    <td>
                                        <div class="fav-info">
                                            상품명 : [탐난다]제주오메기떡
                                            <br>
                                            상품수량 : 1박스(20개)
                                            <br>
                                            상품가격 : 9,500원        
                                        </div>
                                    </td>
                                    <td> 
                                        <button class="delBtn">삭제</button>
                                        <div class="black-bg">
                                        <div class="white-bg">
                                          <h4>삭제되었습니다.</h4>
                                          <button class="btn btn-danger" id="close">닫기</button>
                                        </div>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><img src="${root}/static/img/d오메기떡.jpg" alt=""></td>
                                    <td>
                                        <div class="fav-info">
                                            상품명 : [탐난다]제주오메기떡
                                            <br>
                                            상품수량 : 1박스(20개)
                                            <br>
                                            상품가격 : 9,500원        
                                        </div>
                                    </td>
                                    <td><button class="delBtn">삭제</button></td>
                                </tr>
                                <tr>
                                    <td><img src="${root}/static/img/마음샌드.jpg" alt=""></td>
                                    <td>
                                        <div class="fav-info">
                                            상품명 : [탐난다]제주오메기떡
                                            <br>
                                            상품수량 : 1박스(20개)
                                            <br>
                                            상품가격 : 9,500원        
                                        </div>
                                    </td>
                                    <td><button class="delBtn">삭제</button></td>
                                </tr>
                                <tr>
                                    <td><img src="${root}/static/img/d오메기떡.jpg" alt=""></td>
                                    <td>
                                        <div class="fav-info">
                                            상품명 : [탐난다]제주오메기떡
                                            <br>
                                            상품수량 : 1박스(20개)
                                            <br>
                                            상품가격 : 9,500원        
                                        </div> 
                                    </td>
                                    <td><button class="delBtn">삭제</button></td>
                                </tr>
                          </table>
                    </div>
                </div>
                <div id="fast-menu-bar">
                    
                </div>
        </div>
        
            <div class="paging-area">
                1 ,  2 ,  3
            </div>
            
    </main>
   

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