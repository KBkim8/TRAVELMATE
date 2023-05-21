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
	    bottom: 1100px;
	    left: 400px;
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
        height: 1000px;
        left: 100px;
        top: 230px;
        display: grid;
        grid-template-rows: 3fr 1fr;
    }
    
    #edit-input-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px solid black;
        height: 500px;
        margin: auto;
        font-size: 20px;
        display: flex;
        justify-content:center;
    }

    .edit-input-area {
        border-collapse: separate;
        border-spacing: 50px;
        padding-left: 20px;
    }
    
    .edit-input-area input {
        width: 500px;
        height: 50px;
        background-color: #d8f1c7;
        border: none;
        margin-left: 30px;
        font-size: 20px;
    }

    .edit-input-area button {
        margin-top: 10px;
        font-size: 25px;
        width: 200px;
        height: 50px;
    }

    #rankImg {
        width: 90px;
        height: 90px;
    }

    #btn-area{
        width: 1300px;
        margin: auto;
        margin-top: 5%;
        place-items: center center;
        display:grid;
        grid-template-columns: 9fr 1fr;
    }
    
    #btn-area > input{
        width: 200px;
        height: 60px;
        font-size: 30px;
        border-spacing: 40px;
    }


    #btn01 {
        background-color: #73D38E;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        width: 250px;
        height: 50px;
        font-size: 28px;
        margin-left: 80px;
    }

    #btn02{
        background-color: aliceblue;
        width: 100px;
        height: 40px;
        border: none;
        font-size: 20px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   
    
    
    input {
        font-size: 30px;
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
            <a>회원정보수정</a>
        </div>
        <div id="edit-area">
            <form action="${root}/mypage/member/edit" method="POST">
                <div id="edit-input-box">
                        <!-- table 로 만들기 -->
                        <table class="edit-input-area">
                            <tr>
                              <td><span>아이디</span></td>
                              <td><input type="text" value="${loginMember.id}" readonly></td>
                            </tr>
                            <tr>
                              <td><span>닉네임</span></td>
                              <td>
                                <input type="text" name="memberNick" value="${loginMember.nick}"> 
                                <button type="button" id="btn02" onclick="checkDup();">중복확인</button>
                                <span id="nickSpan"></span>
                            </td>
                            </tr>
                            <tr>
                              <td><span>주소</span></td>
                              <td><input type="text" name="address" value="${loginMember.address}"></td>
                            </tr>
                            <tr>
                              <td><span>이메일</span></td>
                              <td><input type="text" name="email" value="${loginMember.email}"></td>
                            </tr>
                        </table>
                </div>
                  <div id="btn-area">
                       <input type="submit" id="btn01" value="수정하기"></input>
                   </div>
            </form>
        </div>
    </div>
            
</body>

<script>

	function checkDup(){
        //닉네임 중복 확인
        $(document).ready(function() {
        $('#btn02').click(function() {
            var memberNick = $('input[name="memberNick"]').val();
        
            const nickSpan = document.querySelector('#nickSpan');
        
            $.ajax({
            url: '/app/join',  // 중복 확인을 처리하는 서버의 URL을 입력하세요
            method: 'POST',
            data: { 'memberNick' : memberNick },
            success: function(response) {
                // 서버로부터의 응답 처리
                if (response === 'duplicate') {
                // 중복된 아이디인 경우 처리 로직
                nickSpan.textContent = '이미 사용중인 닉네임 입니다.';
                nickSpan.style.color = 'red';
                } else {
                // 사용 가능한 아이디인 경우 처리 로직
                nickSpan.textContent = '사용 가능한 닉네임 입니다.';
                nickSpan.style.color = 'green';
                }
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 처리 로직
                console.error(error);
            }
            });
        });
        });
    }
	
	
	//이메일체크
	const emailInput = document.querySelector('input[name="memberEmail"]');
	const checkButton = document.getElementById('btn00');
	const messageElement = document.getElementById('message');
	
	// 이메일 체크 
	function validateEmail(email) {
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	return emailRegex.test(email);
	}
	
	// 버튼 클릭 이벤트 처리
	checkButton.addEventListener('click', function() {
	const email = emailInput.value;
	
	if (validateEmail(email)) {
	    messageElement.textContent = '유효한 이메일 주소입니다.';
	    messageElement.style.color = 'green';
	} else {
	    messageElement.textContent = '유효하지 않은 이메일 주소입니다.';
	    messageElement.style.color = 'red';
	}
	});


</script>


</html>