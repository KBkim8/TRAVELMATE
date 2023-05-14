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
        height: 1000px;
        left: 130px;
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
        justify-content: space-around;
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
        width: 250px;
        height: 50px;
        font-size: 28px;
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
                          <td><span>이름</span></td>
                          <td>${mvo.name} 김강분</td>
                        </tr>
                        <tr>
                          <td><span>닉네임</span></td>
                          <td>${mvo.nick} NICK01</td>
                        </tr>
                        <tr>
                          <td><span>전화번호</span></td>
                          <td>${mvo.phone} 01049263933</td>
                        </tr>
                        <tr>
                          <td><span>주소</span></td>
                          <td>${mvo.address} 경기도 용인시 수지구 고기로</td>
                        </tr>
                        <tr>
                          <td><span>이메일</span></td>
                          <td>${mvo.email} k0322123@gmail.com</td>
                        </tr>
                        <tr>
                            <td><span>가입일</span></td>
                            <td>${mvo.joindata} 2023.04.01</td>
                          </tr>
                          <tr>
                            <td><span>회원등급</span></td>
                            <td>${mvo.email} GOLD <img src="${root}/static/img/goldrank.png" alt="" id="rankImg"></td>
                          </tr>
                    </table>
            </div>
              <div id="btn-area">
                   <a href="${root}/mypage/edit" id="btn01">정보 수정하기</a>
               </div>
        </div>
    </div>
            
</body>

</html>