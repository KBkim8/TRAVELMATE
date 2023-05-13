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
        width: 400px;
        height: 60px;
        font-size: 30px;
        border-spacing: 20px;



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

				
			<form action="" method="POST" id="join-form">

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


		</div>


</body>
</html>