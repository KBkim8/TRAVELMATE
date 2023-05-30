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
        margin-top: 800px;  /*이녀석도*/
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
        margin-top: 20px;
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
                    <a>로그인</a>
                </div>
				
                <form action="${root}/login" method="POST">
                 <div id="edit-area">
                    <img src="${root}/static/img/loginImg.png" alt="이미지" >
                            <span>아이디</span><input type="text" name="memberId" placeholder="아이디 입력하세요" size="40">
                            <br>
                            <span>비밀번호</span><input type="password" name="memberPwd" placeholder="비밀번호 입력하세요" size="40">
                            <hr>
                            <br>
                            <input type="submit" value="로그인" id="btn01" >
                            <br>
                            <br>
                            <br>
                            <a href="${root}/find-id"> <button type="button" value="아이디 찾기" id="btn01">아이디 찾기</button></a>
                            <a href="${root}/find-pwd"> <button type="button" value="비밀번호 찾기" id="btn01">비밀번호 찾기 </button></a>
                 </div>
                </form>

		</div>


</body>
</html>

<script>

    
    // function idCheck() {
    //     const idInputValue =document.querySelector('input[name=memberId]').value;
        
    //     $.ajax({
    //         url :'${root}/login/id/check',
    //         type : 'POST',
    //         data : {
    //             'idInputValue' : idInputValue,
    //         },
    //         success : (data)=>{
    //             if(data == 'ok'){
    //                 alert('아이디틀렸습니다');
    //             }
               
    //         },
    //         error : (e)=>{
    //             console.log(e);
    //         },
    //     });

    // }

</script>