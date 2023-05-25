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
	    bottom: 900px;
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
        height: 90%;
        margin: auto;
        font-size: 30px;
        display: flex;
        justify-content:center;
        align-items: center;
    }

    .edit-input-area {
        border-collapse: separate;
        border-spacing: 20px;
    }
    
    .edit-input-area input {
        width: 500px;
        height: 70px;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
        margin-left: 30px;
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
        border-spacing: 20px;
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

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   
    
    .quitBtn{
        border: none;
        outline: none;
    	width : 100px;
    	height : 40px;
        font-size: 15px;
        background-color: gainsboro;
        color: black;
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
            <a>회원정보조회</a>
        </div>
        <div id="edit-area">
            <div id="edit-input-box">
                    <!-- table 로 만들기 -->
                    <table class="edit-input-area">
                        <tr>
                          <td><span>아이디</span></td>
                          <td>${loginMember.id}</td>
                        </tr>
                        <tr>
                          <td><span>닉네임</span></td>
                          <td>${loginMember.nick}</td>
                        </tr>
                        <tr>
                          <td><span>주소</span></td>
                          <td>${loginMember.address}</td>
                        </tr>
                        <tr>
                          <td><span>이메일</span></td>
                          <td>${loginMember.email}</td>
                        </tr>
                        <tr>
                            <td><span>가입일</span></td>
                            <td>${loginMember.enrollDate}</td>
                          </tr>
                          <tr>
                            <td><span>회원등급</span></td>
                            <td>${loginMember.memberGradeName} <img src="${root}/static/img/goldrank.png" alt="" id="rankImg"></td>
                          </tr>
                          <tr>
                            <td><span>누적 출석일수</span></td>
                            <td>${vo.totalAttend}</td>
                          </tr>
                    </table>
            </div>
              <div id="btn-area">
                   <a href="${root}/mypage/member/edit" id="btn01">수정하기</a>
                   <button class="quitBtn" onclick="quit();">회원탈퇴</button>
               </div>
        </div>
    </div>
            
</body>
<script>

	//탈퇴
	function quit() {
		const result = confirm('탈퇴하시겠습니까?');
		if(result){
			location.href='${root}/mypage/member/quit';
		}
	}

</script>

</html>