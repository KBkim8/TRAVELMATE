<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	main{
		width: 100%;
		height: 90%;
		display: grid;
		grid-template-columns: 1fr 4fr 1fr;
	}

	h1{
		margin-left: 40px;
	}

	hr{
		border: 3px;	
	}

	#wrap{
		width: 100%;
		height: 100%;
	}

	form {
		background-color: rgb(207, 236, 207);
		width: 100%;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
		align-items: center;
	}
	
	#check1{
		margin-left: 20px;
	}

	.btn{
		width: 300px;
	}

	#agree{
		/* display: grid;
		grid-template-rows: 1fr 1fr 1fr;
		gap: 2rem; */
		width: 500px;
		height: 300px;
		border-radius: 20px;
		margin: auto;
		background-color: rgb(168, 235, 171);
	}

	#agree label{
		
		margin-top: 19px;
		margin-left: 30px;
	}

	form div{
		font-size: 2em;
	}

	input[type="checkbox"]{
        display: none;
      }

	input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
      }

	input[id="check1"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }

	  input[id="check2"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }

	  input[id="check3"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }


</style>
</head>
<body>

	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<main>
			<div id="left-sidebar">
				<%@include file="/WEB-INF/views/common/left_sidebar.jsp" %>
			</div>
			
			<h1>회원가입</h1>
			<hr>
			<form action="" method="POST">
				<input type="text" name="memberId" placeholder="아이디를 입력하세요" maxlength="100" size="35" > <input  class="btn btn-primary" type="button" value="아이디 중복확인">
				<br>
				비밀번호<input type="text" name="memberPwd" placeholder="비밀번호를 입력하세요" maxlength="100" size="35" >
				<br>
				비밀번호 확인<input type="text" name="pwdChk" placeholder="비밀번호 확인" maxlength="100" size="35" > 
				<br>
				E-MAIL<input type="text" name="memberEmail" placeholder="이메일을 입력하세요" maxlength="100" size="35" >  <input class="btn btn-primary" type="button" value="이메일 중복확인">
				<br>
				닉네임<input type="text" name="memberNick" placeholder="닉네임을 입력하세요" maxlength="100" size="35" >  <input class="btn btn-primary" type="button" value="닉네임 중복확인">
				<br>

				<div id="agree">

					<div>
						<input type="checkbox" id="check1"> 
						<label for="check1"></label>
						<span style="font-size: 0.4em;">[필수] 만 19세 이상입니다</span>
					</div>

					<div>
						<input type="checkbox" id="check2">
						<label for="check2"></label>
						<span style="font-size: 0.4em;">[필수]트레블 메이트 이용 약관 동의</span>
					</div>

					<div>
						<input type="checkbox" id="check3">
						<label for="check3"></label>
						<span style="font-size: 0.4em;">[선택] 광고성 정보 수신 동의</span>
					</div>

				  
				</div>
				
				<input class="btn btn-primary" type="submit" value="동의하고 가입하기">
				
			</form>

			<div id="right-sidebar">
				<%@ include file="/WEB-INF/views/common/right_sidebar.jsp"%>
			</div>

		</main>
	
		


			
	</div>

</body>
</html>