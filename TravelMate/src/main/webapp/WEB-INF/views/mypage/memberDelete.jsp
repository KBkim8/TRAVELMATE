<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>

    
    #square{
        width: 25px;
        height: 50px;
        background-color: rgba(115, 211, 142);
        margin-top: 20px;
    }

    .mem-info{
        margin-top: 30px;
        margin-left: 3%;
        font-size: 1.5em;
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
    #del-info-box{
        margin: auto;
        width: 100%;
        height: 90%;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
        justify-content: center;
        align-items: center;
    }

    #info-area-box{
        width: 1000px;
        height: 100%;
        border: 1px solid rgba(115, 211, 142);
        background-color: rgba(220, 220, 220, 0.378);
        margin: auto;
        place-items: center center;
    }

    #btn-area{
        margin: auto;
        place-items: center center;
    }


    #info-wrap{
        width: 100%;
        margin-top: 20%;
        margin-left: 5%;
        font-size: 1.4em;        
    }

    #del-info{
        margin-top: 15%;
        margin-left: 1%;
        font-size: 1.5em;
        font-weight: bold;
    }
    #confirm, #cancel{
        background-color: rgba(115, 211, 142, 0.574);
        width: 100px;
        height: 40px;
        border-radius: 10%;
        padding: 10px;
        border: none;
    }



    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@include file="/WEB-INF/views/common/mg_sidebar.jsp" %>
        </div>
        <div id="member-del-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">회원탈퇴</h3>
            </div>
            <hr>
            <div id="del-info-box">
                <div id="del-info">회원 탈퇴 신청 전 안내 사항을 꼭 확인해주세요.</div>
                <div id="info-area-box">
                    <div id="info-wrap">
                        <div class="bi bi-exclamation-square">  사용한 아이디는 재사용 및 복구가 불가능합니다.</div>
                        <br><br>
                        <div class="bi bi-exclamation-square">  회원 탈퇴를 진행하더라고 작성 게시글은 그대로 남아있으니
                            <br><br>탈퇴 전 직접 삭제해주셔야합니다.</div>
                        </div>
                    </div>
                    <div id="btn-area">
                        <form action="" method="POST">
                            <input type="submit" value="탈퇴" id="confirm">
                            <input type="button" value="취소" id="cancel">
                        </form>
                    </div>
            </div>
        </div>
        <div id="fast-menu-bar">

        </div>
    </main>

</body>
</html>