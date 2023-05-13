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
        bottom: 1300px;
        left: 300px;
    }
    

    #first-content>img{
        position: absolute;
        left: 100px;
        top: 70px;
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
        justify-content: center;
        align-items: center;
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

    #write-area{
        margin-top: 170px; /* 이녀석이 노트북이랑 데스크탑이랑 화면다르게 보이게함*/
        margin-left: 20%;
    }

    textarea{
        height: 900px;
        width: 1000px;
        margin-top: 30px;
        resize: none;
        font-size: 2.5em;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
    }


    input[name=title]{
        font-size: 2em;
        width: 500px;
        height: 70px;
        background-color: #d8f1c7;
        border: none;
        border-radius: 20px;
        margin-top: 210px;
    }

    #submit{
        display: flex;
        height: 100px;
        justify-content: center;
        align-items: center;
    }

    #submit input{
        margin-left: 300px;
        font-size: 1.3em;
        height: 70px;
        text-align: center;
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
            <a>게시글 수정</a>
        </div>
        <div id="write-area">
            <input type="text" name="title" placeholder="제목을 입력하세요" value="막막하다">
            <select name="categoryNo" style="width:150px;height:60px; font-size: 2em;">
                    <option value=>축구</option>	
                    <option value=>게임</option>	
                    <option value=>축구</option>	
                    <option value=>축구</option>	
            </select>
            <textarea name="content" placeholder="내용을 입력하세요">ㅁㅁㅁㅁ</textarea>
        </div>

        <div id="submit">
            <input type="submit" value="수정하기" id="btn01">
            <input type="file" name="f" id="">
        </div>

    </div>


</body>
</html>