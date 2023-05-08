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
    #pwd-input{
        margin: auto;
        width: 100%;
        height: 90%;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
        justify-content: center;
        align-items: center;
    }

    #pwd-area-box{
        width: 600px;
        height: 100%;
        border: 1px solid rgba(115, 211, 142);
        background-color: rgba(220, 220, 220, 0.378);
        margin: auto;
        place-items: center center;
    }

    #btn-area{
        margin: auto;
        place-items: center center;
    }

    #memberPwd{
        border-style: hidden;
        border-radius: 5%;
        background-color: white;
    }

    #pwd-wrap{
        margin-top: 30%;
        margin-left: 25%;        
    }

    #pwd-input-info{
        margin-top: 15%;
        margin-left: 18%;
    }

    button{
        background-color: rgba(115, 211, 142, 0.574);
        width: 100px;
        height: 40px;
        border-radius: 10%;
        padding: 10px;
        border: none;
    }



    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">

        </div>
        <div id="memberPwd-check-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">회원정보</h3>
            </div>
            <hr>
            <div id="pwd-input">
                <div id="pwd-input-info">조회 및 수정을 위해 비밀번호를 다시 입력해주세요.</div>
                <div id="pwd-area-box">
                <form action="" method="POST">
                    <div id="pwd-wrap">
                        <span id="pwd">비밀번호</span>
                        <input type="password" id="memberPwd">
                    </div>
                    </form>
                </div>
               <div id="btn-area">
                    <button id="confirm">확인</button>
                    <button id="cancel">취소</button>
                </div>
            </div>
        </div>
        <div id="fast-menu-bar">

        </div>
    </main>








</body>
<script>
$(function(){
  // 눈표시 클릭 시 패스워드 보이기
  $('.eyes').on('click',function(){
    $('.input.password').toggleClass('active');

    if( $('.input.password').hasClass('active') == true ){
    	$(this).find('.fa-eye').attr('class',"fa fa-eye-slash fa-lg").parents('.input').find('#password').attr('type',"text");
    				// i 클래스                // 텍스트 보이기 i 클래스
    }
    else{
    	$(this).find('.fa-eye-slash').attr('class',"fa fa-eye fa-lg").parents('.input').find('#password').attr('type','password');
    }
  });
});
</script>
</html>