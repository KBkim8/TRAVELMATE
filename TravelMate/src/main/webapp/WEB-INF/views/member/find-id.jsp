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
        bottom: 1500px;
        left: 300px;
        margin-top: 300px;  /*이녀석도*/
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

    #edit-area{
        position: absolute;
        width: 100px;
        height: 1000px;
        left: 430px;
        top: 230px;
        display: grid;
        /* grid-template-rows: 3fr 1fr; */
    }
    
    /* #edit-input-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px dashed black;
        height: 90%;
        margin: auto;
        font-size: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    #edit-input-box > input {
        width: 500px;
        height: 70px;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
        margin-left: 30px;
    } */
    /* #btn-area{
        margin: auto;
        margin-top: 10%;
        place-items: center center;
    } */
    
    /* #btn-area > input{
        width: 400px;
        height: 60px;
        font-size: 30px;
        border-spacing: 20px;
    } */


    #btn01 {
        background-color: #73D38E;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        font-size: 2em;
        margin-top: 20px;
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
	
	<!-- 내용영역 --> 
   
            <div id="content">
				
                <div id="first-content">
                    <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
                    <hr>
                    <a>아이디 찾기</a>
                </div>
				
                <form action="" method="POST">

                <div id="edit-area">
                    <img src="${root}/static/img/loginImg.png" alt="이미지" >
			
                        
                            <span>이름</span><input type="text" name="memberName" placeholder="이름 을 입력하세요" size="40">
                            <br>
                            <span>생년월일</span><input type="text" name="memberPwd" placeholder="20000930" size="40">
                            <br>
                            <span>이메일</span><input type="email" name="memberEmail" placeholder="e-mail" size="40">
                            <br>
                            <button type="submit" value="아이디 찾기" id="btn01">아이디 찾기</button>
                            <br>
                            <br>
                            <br>
                            <a href="${root}/find-pwd"> <button type="button" value="비밀번호 찾기" id="btn01">비밀번호 찾기 </button></a>
                           
                            
                            
                        </div>
                    </form>

					
				
			</form>

		</div>


</body>
</html>