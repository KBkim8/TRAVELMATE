<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


#content01{
        position: relative;
        width: 1390px;
        height: 100%;
        bottom: 1500px;
        left: 300px;
        margin-top: 300px;
    }

    #first-content>img{
        position: absolute;
        left: 100px;
        top: 125px;
        width: 40px;
        height: 60px;
    }

    #content01>#first-content>hr:nth-child(2){
        height: 1px;
        width: 1300px;
        background-color: rgb(116, 116, 116);
        border: 0px solid rgb(65, 65, 65);
        position: absolute;
        left: 100px;
        top: 180px;
    }

    #content01>#first-content>a:nth-child(3){
        position: absolute;
        left: 160px;
        top: 135px;
        color: black;
        font-size: 28px;
        font-weight: bold;
    }

    #inquery-area{
        width: 1300px;
    }

    #title-area{
        display: flex;
    }
    #inquery-input{
        position: absolute;
        width: 1300px;
        height: 1000px;
        left: 100px;
        top: 230px;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
        justify-content: center;
        align-items: center;
        border-radius: 30px;
        border: 1px dashed black;
        margin: auto;
        font-size: 30px;
    }

    input[name=title] {
        width: 1000px;
        height: 50px;
        border-radius: 20px;
        font-size: 20px;
    }

    textarea {
        width: 1000px;
        height: 600px;
        font-size: 30px;
        border-radius: 20px;
    }

    #content-wrap {
        display: flex;
        justify-content: center;
        align-content: center;
        text-align: center;
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
        width: 150px;
        height: 40px;
        font-size: 20px;
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

    <%@ include file="/WEB-INF/views/common/cs-header.jsp" %>
    
    <!-- 내용영역 --> 
   <div id="content01">
    <div id="first-content">
        <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
        <hr>
        <a>1:1문의하기</a>
    </div>
        <form action="${root}/cs/inquery" method="POST">
	        <div id="inquery-input">
	            <div id="title-wrap">
	                    <span id="word">제목</span>
	                    <input type="text" name="title" >
	                </div>
	                <div id="content-wrap">
	                    <span id="word">내용</span>
	                    <textarea name="content"></textarea>
	                </div>
	                <div id="btn-area">
	                    <!-- 작성 버튼 누르면 문의 내역 페이지로 보내주기 -->
	                    <input type="submit" id="btn01" value="작성하기"></input>
	            </div>
	        </div>
       	</form>
    </div>

</body>
<script>

</script>
</html>