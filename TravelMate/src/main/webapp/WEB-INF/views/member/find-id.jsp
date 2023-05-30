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
	    width: 1170px;
	    height: 1000px;
	    left: 420px;
	    bottom: 430px;
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
        height: 800px;
        left: 430px;
        top: 230px;
        display: grid;
        grid-template-rows:1fr 1fr 1fr 1fr 1fr;
        justify-items: center;
    }


    #edit-area > div > input {
        width: 500px;
        height: 50px;
        border: none;
        border-bottom: 1px solid black;
        margin-left: 50px;
        font-size: 20px;
    }
    
    input[name="memberNick"]{
        margin-top: 40px;
    }


    #btn-area > div{
        font-size: 18px;
    }

    #btn01 {
        background-color: #73d38eb4;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        font-size: 20px;
        margin-top: 20px;
        width: 200px;
        height: 40px;
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

    <%@ include file="/WEB-INF/views/common/mypage-header.jsp" %>
	
	<!-- 내용영역 --> 
   
            <div id="content">
				
                <div id="first-content">
                    <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
                    <hr>
                    <a>아이디 찾기</a>
                </div>
				
                <form action="${root}/find-id" method="POST">

                <div id="edit-area">
                    <img src="${root}/static/img/loginImg.png" alt="이미지" >
                            <div>닉네임<input type="text" name="memberNick" placeholder="닉네임을 입력하세요"></div>
                            <div>비밀번호<input type="text" name="memberPwd" placeholder="비밀번호를 입력하세요"></div>
                            <div>이메일<input type="email" name="memberEmail" placeholder="이메일을 입력하세요"></div>
                            <button type="submit" value="아이디 찾기" id="btn01">아이디 찾기</button>
                            <div id="btn-area">
                                <div id="find-pwd"><a href="${root}/find-pwd">비밀번호 찾기</a></div>
                                <br>
                                <div id="login"><a href="${root}/login">로그인</a></div>
                            </div>
                </div>
                </form>
		</div>

</body>
</html>

	<c:if test="${not empty loginMember}">
		<script>
            alert("당신의 아이디는 "+'${loginMember.id}'+"이에요!");
        </script>
	</c:if>