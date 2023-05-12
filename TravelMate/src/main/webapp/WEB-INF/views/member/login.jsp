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
</style>
</head>
<body>

	<div id="wrap">
		<%@include file="/WEB-INF/views/common/header.jsp"  %>

		<span id="span"></span><h1>로그인</h1>
		<hr>

		<main>

			<div id="left-sidebar">
				<%@include file="/WEB-INF/views/common/left_sidebar.jsp" %>
			</div>

            <img src="${root}/static/img/loginImg.png" alt="이미지" >
			
			<div id="login-area">
				
				<form action="" method="POST">
					<span>아이디</span><input type="text" name="memberId" placeholder="아이디 입력하세요" size="40">
					<br>
					<span>비밀번호</span><input type="password" name="memberPwd" placeholder="비밀번호 입력하세요" size="40">
					<hr>
					<br>
					<button type="submit" value="비밀번호 찾기" class="btn btn-primary btn-lg">로그인</button>
					<br>
					<br>
					<br>
					<button type="submit" value="아이디 찾기" class="btn btn-primary btn-lg">아이디 찾기</button>
					<button type="submit" value="비밀번호 찾기" class="btn btn-primary btn-lg">비밀번호 찾기 </button>
				</form>
				
			</div>
			
			<div id="right-sidebar">
				<%@ include file="/WEB-INF/views/common/right_sidebar.jsp"%>
			</div>

		</main>
	</div>
		
		

</body>
</html>