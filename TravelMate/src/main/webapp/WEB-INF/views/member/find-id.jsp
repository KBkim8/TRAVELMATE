<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	h1{
		margin-left: 100px;
	}

	#span{
		width: 30px;
		height: 30px;
		margin-left: 50px;
		background-color: rgb(224, 121, 4);
	}

	main{
		width: 100%;
		height: 90%;
		display: grid;
		grid-template-columns: 1fr 4fr 1fr;
	}


	main > img{
		margin-left: 500px;
		margin-top: 150px;
	}

	#login-area{
		margin-left: 400px;
		width: 800px;
		height: 500px;
		background-color: rgb(176, 206, 130);
		border-radius: 50px;
	}

	#login-area input{
		margin-left: 200px;
		margin-top: 100px;
	}

	#login-area span{
		font-size: 1.5em;
		margin-left: 50px;
	}

	form button{
		margin-left: 150px;
		margin-top: 30px;
	}

	#a {
		margin-left: 900px;
		font-size: 1.5em;
	}
</style>
</head>
<body>

	<div id="wrap">
		<%@include file="/WEB-INF/views/common/header.jsp"  %>



		<main>
			<div id="left-sidebar">
				<%@include file="/WEB-INF/views/common/left_sidebar.jsp" %>
			</div>
            <img src="${root}/static/img/loginImg.png" alt="이미지" >
			<a id="a" href="${root}/find-pwd">비밀번호 찾기</a>
			<div id="login-area">
				
				<form action="" method="POST">
					<span>이름</span><input type="text" name="memberName" placeholder="이름을 입력하세요" size="40">
					<br>
					<br>
					<span>생년월일</span><input type="text" name="memberBirthDate" placeholder="생년월일을 입력하세요" size="40">
					<br>
					<span>이메일</span><input type="password" name="memberEmail" placeholder="이메일 입력하세요" size="40">
					<br>
					<br>
					<button type="submit" value="아이디 찾기" class="btn btn-primary btn-lg">아이디 찾기</button>
				</form>
				
			</div>
			
		</div>
		
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/common/right_sidebar.jsp"%>
		</div>
		
	</main>

</body>
</html>