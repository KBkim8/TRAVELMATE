<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #square{
        position: absolute;
        left: 500px;
        top: 470px;
        width: 25px;
        height: 50px;
    }

    #first-content > a{
        margin-left: 30px;
        font-size: 50px;
    }
    
    main{
        width: 100%;
        height: 100vh;
    	display: grid;
        grid-template-columns: 1fr 4fr 1fr;
        
    }

    #title-area{
        display: flex;
        margin-top: 5%;
    }

    #memberPwd-check-area{
        width: 1300px;
        height: 90%;
    }

    #pwd-input{
        margin: auto;
        width: 1300px;
        height: 90%;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
        justify-content: center;
        align-items: center;
    }

    #pwd-area-box{
        z-index: 2;
        width: 1300px;
        height: 100%;
        border: 2px solid rgba(115, 211, 142);
        border-radius: 20px;
        margin: auto;
        place-items: center center;
    }

    #btn-area{
        margin: auto;
        margin-top: 10%;
        place-items: center center;
        z-index: 2;
    }

    #memberPwd{
        width: 500px;
        height: 70px;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
    }

    #pwd-wrap{
        margin-top: 23%;
        margin-left: 20%;
        font-size: 2em;        
    }

    #pwd-input-info{
        margin-top: 10%;
        margin-left: 3%;
        font-size: 2em;
    }

    
    #btn01 {
        background-color: #73D38E;
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



    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@ include file="/WEB-INF/views/common/left_sidebar.jsp" %>
        </div>
        <div id="memberPwd-check-area">
            <div id="title-area">
                <div id="first-content">
                    <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
                    <a>마이페이지</a>
                </div>
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
                    <input type="submit" id="btn01" value="확인"></input>
                    <button id="btn01">취소</button>
                </div>
            </div>
        </div>
        <div id="right_sidebar">
			<%@include file="/WEB-INF/views/common/right_sidebar.jsp" %>
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