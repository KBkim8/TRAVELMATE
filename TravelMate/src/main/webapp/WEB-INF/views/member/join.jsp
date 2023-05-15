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
    

    #btn01 {
        background-color: #73D38E;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        font-size: 2em;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   

    /* ----------------------------------------------------------------------------------------- */


	#agree label{
		
		margin-top: 19px;
		margin-left: 30px;
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

	  input[id="check4"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }

	  input[id="check5"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }

	form {
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
		align-items: center;
	}
    
	#agree{
		width: 500px;
		height: 300px;
		border-radius: 20px;
		margin: auto;
		background-color: rgb(168, 235, 171);
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
                    <a>회원가입</a>
                </div>
				
			<form action="" method="POST" id="join-form">

                <div id="edit-area">
                    <input type="text" name="memberId" placeholder="아이디를 입력하세요" maxlength="100" size="35" > <input  id="btn01" type="button" value="아이디 중복확인">
					<br>
					비밀번호<input type="text" name="memberPwd" placeholder="비밀번호를 입력하세요" maxlength="100" size="35" >
					<br>
					비밀번호 확인<input type="text" name="pwdChk" placeholder="비밀번호 확인" maxlength="100" size="35" > 
					<br>
					E-MAIL<input type="text" name="memberEmail" placeholder="이메일을 입력하세요" maxlength="100" size="35" >  <input id="btn01" type="button" value="이메일 중복확인">
					<br>
					닉네임<input type="text" name="memberNick" placeholder="닉네임을 입력하세요" maxlength="100" size="35" >  <input id="btn01" type="button" value="닉네임 중복확인">
					<br>
	
					<div id="agree">
	
						<div>
							<input type="checkbox" id="check1"> 
							<label for="check1"></label>
							<span style="font-size: 1.5em;">[필수] 만 19세 이상입니다</span>
						</div>
	
						<div>
							<input type="checkbox" id="check2">
							<label for="check2"></label>
							<span style="font-size: 1.5em;">[필수]트레블 메이트 이용 약관 동의</span>
						</div>

						<div>
							<input type="checkbox" id="check3">
							<label for="check3"></label>
							<span style="font-size: 1.5em;">[필수]개인정보 수집에 대한 동의</span>
						</div>

						<div>
							<input type="checkbox" id="check4">
							<label for="check4"></label>
							<span style="font-size: 1.5em;">[필수]트레블 메이트 이용 약관 동의</span>
						</div>
	
						<div>
							<input type="checkbox" id="check5">
							<label for="check5"></label>
							<span style="font-size: 1.5em;">[선택] 광고성 정보 수신 동의</span>
						</div>
	
					  
					</div>
					
					<input id="btn01" type="submit" value="동의하고 가입하기">
                </div>

					
				
			</form>

		</div>


</body>
</html>