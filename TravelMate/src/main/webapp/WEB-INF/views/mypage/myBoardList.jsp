<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    /* 내용영역 */
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
    
    #board-list-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px dashed black;
        height: 80%;
        left: 130px;
        top: 230px;
        font-size: 25px;
        position: absolute;
        align-content: center;
    }

    #content-wrap{
        width: 100%;
        height: 150px;
        display: grid;
        grid-template-columns: 1fr 1fr 2fr 1fr 1fr;
        justify-content: center;
        align-content: center;
        align-items: center;
        text-align: center;
        margin: auto;
    }

    #title-wrap{
        width: 100%;
        height: 150px;
        display: grid;
        grid-template-columns: 1fr 1fr 2fr 1fr 1fr;
        justify-content: center;
        align-content: center;
        text-align: center;
        margin: auto;
        font-weight: bold;
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
        margin-left: 15px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }   

    /* 카테고리 및 검색 */
    #report-search input[type="submit"]{
        background-image: url('./img/검색이미지.png');
        background-repeat: no-repeat;
        background-color: rgba(255, 255, 255, 0);
        border: 0px;
        cursor:pointer;
        outline: 0;
        color: rgba(255, 255, 255, 0);
        position: absolute;
        left: 267px;
        top: 5px;
    }

    #report-search{
        position: absolute;
        right: 262px;
        top: 141px;
    }

    #report-search>form>input[type="text"]{
        width: 180px;
        height: 30px;
        font-size: 14px;
    }

    select[name="searchType"]{
        width: 110px;
        height: 30px;
        font-size: 15px;
    }

    hr{
        width: 100%;
        height: 0;
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
            <a>게시글 조회</a>
        </div>
            <!-- 게시판 카테고리 검색 -->
            <div id="report-search">
                <form action="" method="GET">
                    <select name="searchType">
                        <option value="free">자유</option>
                        <option value="review">리뷰</option>
                        <option value="purchase">판매</option>
                        <option value="ranson">랜선여행</option>
                    </select>
                    <input class="" name="searchValue" type="text" placeholder="게시글 검색">

                    <input type="submit" value="검색">
                </form>
            </div>
        <div id="board-list-box">
            <div id="title-wrap">
                <div>게시판 카테고리</div>
                <div>게시글 번호</div>
                <div>제목</div>
                <div>작성일시</div>
                <div></div>
            </div>
            <hr>
            <!-- 반복문 처리 -->
            <!-- 상세조회 처리 코드 도연님한테 물어보고 제대로 해주기 -->
            <div id="content-wrap">
                <div>자유</div>
                <div>1</div>
                <div>title01</div>
                <div>2023.05.01 13:55:21</div>
                <div><button id="btn01"><a href="${root}/board/page=1">상세조회</a></button></div>
            </div>
            <hr>
            <div id="content-wrap">
                <div>리뷰</div>
                <div>2</div>
                <div>title02</div>
                <div>2023.05.01 13:55:21</div>
                <div><button id="btn01"><a href="${root}/board/page=1">상세조회</a></button></div>
            </div>
            <hr>
            <div id="content-wrap">
                <div>랜선여행</div>
                <div>3</div>
                <div>title03</div>
                <div>2023.05.01 13:55:21</div>
                <div><button id="btn01"><a href="${root}/board/page=1">상세조회</a></button></div>
            </div>
            <hr>
        </div>
    </div>


</body>

</html>

</body>
</html>