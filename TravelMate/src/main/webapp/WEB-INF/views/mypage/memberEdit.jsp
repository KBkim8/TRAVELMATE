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
        border: 1px dashed black;
        height: 90%;
        margin: auto;
        font-size: 30px;
        display: flex;
        justify-content: center;
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

    #btn-area{
        margin: auto;
        margin-top: 10%;
        place-items: center center;
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
            <div id="edit-input-box">
                <form action="" method="POST">
                    <!-- table 로 만들기 -->
                    <table class="edit-input-area">
                        <tr>
                          <td><span>비밀번호</span></td>
                          <td> <input type="password" name="memberPwd"></td>
                        </tr>
                        <tr>
                          <td><span>비밀번호 확인</span></td>
                          <td><input type="password" name="memberPwd2"></td>
                        </tr>
                        <tr>
                          <td><span>닉네임</span></td>
                          <td><input type="text" name="memberNick"></td>
                          <td><button id="btn01">중복확인</button></td>
                        </tr>
                        <tr>
                          <td><span>주소</span></td>
                          <td> <input type="text" name="address"></td>
                        </tr>
                        <tr>
                          <td><span>이메일</span></td>
                          <td><input type="email" name="email"></td>
                          <td><button id="btn01">중복확인</button></td>
                        </tr>
                    </table>
            </div>
              <div id="btn-area">
                   <input type="submit" value="수정" id="btn01">
                   <input type="button" value="취소" id="btn01">
               </div>
                </form>
        </div>
    </div>
            
</body>

</html>