<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #square{
        position: absolute;
        left: 500px;
        top: 465px;
        width: 25px;
        height: 50px;
    }

    #first-content > a{
        margin-left: 30px;
        font-size: 50px;
    }

    #member-edit-area{
        width: 1300px;
        height: 100%;
    }

    main{
        width: 100%;
        height: 100vh;
    	display: grid;
        grid-template-columns: 1fr 4fr 1fr;
        
    }
    #title-area{
        display: flex;
        margin-top: 5%;
    }

    #edit-area{
        margin: auto;
        width: 100%;
        height: 90%;
        display: grid;
        grid-template-rows: 3fr 1fr;
    }

    
    #btn-area{
        margin: auto;
        margin-top: 10%;
        place-items: center center;
        z-index: 2;
    }
    
    #btn-area > input{
        width: 200px;
        height: 60px;
        font-size: 30px;
        border-spacing: 20px;
    }

    #edit-input-box{
        z-index: 2;
        width: 1300px;
        height: 90%;
        border: 2px solid rgba(115, 211, 142);
        border-radius: 30px;
        margin: auto;
        font-size: 2em;
    }
    
    .edit-input-area{
        margin-top: 10%;
        margin-left: 10%;
        border-spacing: 50px;
        border-collapse: separate;
    }

    .edit-input-area input {
        width: 500px;
        height: 70px;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
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


    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@ include  file="/WEB-INF/views/common/left_sidebar.jsp"%>
        </div>
        <div id="member-edit-area">
            <div id="title-area">
                <div id="first-content">
                    <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
                    <a>회원정보수정</a>
                </div>
            </div>
            <hr>
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
                              <td><span>전화번호</span></td>
                              <td><input type="text" name="phoneNumber"></td>
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

        <div id="fast-menu-bar">
			<%@include file="/WEB-INF/views/common/right_sidebar.jsp" %>
        </div>
    </main>

</body>

</html>