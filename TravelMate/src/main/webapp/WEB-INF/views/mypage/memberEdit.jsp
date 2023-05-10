<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #wrap{
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: 1fr 4fr 1fr;
    }

    #square{
        width: 20px;
        height: 40px;
        background-color: rgba(115, 211, 142);
        margin-top: 20px;
    }

    .mem-info{
        margin-top: 30px;
        margin-left: 3%;
        font-size: 1.5em;
    }

    
    #side-bar{
        height: 100%;
        background-color: rgb(108, 237, 156);
    }
    
    main{
        width: 100%;
        height: 100vh;
    	display: grid;
        grid-template-columns: 1fr 4fr 1fr;
        
    }
    #title-area{
        display: flex;
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
        place-items: center center;
    }
    
    #confirm, #cancel{
        background-color: rgba(115, 211, 142, 0.574);
        width: 100px;
        height: 40px;
        border-radius: 10%;
        padding: 10px;
        border: none;
    }

    button{
        width: 80px;
        height: 30px;
        background-color: rgba(115, 211, 142, 0.574);
        border: none;
    }

    #edit-input-box{
        width: 600px;
        height: 90%;
        border: 1px solid rgba(115, 211, 142);
        background-color: rgba(220, 220, 220, 0.378);
        margin: auto;
    }
    
    .edit-input-area{
        margin-top: 15%;
        margin-left: 15%;
        border-spacing: 20px;
        border-collapse: separate;
    }

    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@ include  file="/WEB-INF/views/common/mg_sidebar.jsp"%>
        </div>
        <div id="member-edit-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">회원정보 수정</h3>
            </div>
            <hr>
            <div id="edit-area">
                <div id="edit-input-box">
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
                            <td><button>중복확인</button></td>
                          </tr>
                          <tr>
                            <td><span>전화번호</span></td>
                            <td><input type="text" name="phoneNumber"></td>
                          </tr>
                          <tr>
                            <td><span>이메일</span></td>
                            <td><input type="email" name="email"></td>
                            <td><button>중복확인</button></td>
                          </tr>
                      </table>
                </div>
                <div id="btn-area">
                     <input type="submit" value="수정" id="confirm">
                     <input type="button" value="취소" id="cancel">
                 </div>
            </div>
            </div>
        <div id="fast-menu-bar">

        </div>
    </main>

</body>

</html>