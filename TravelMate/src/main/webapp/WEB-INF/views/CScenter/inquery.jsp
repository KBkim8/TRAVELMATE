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
    #inquery-input{
        margin: auto;
        width: 100%;
        height: 90%;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
        justify-content: center;
        align-items: center;
        background-color: rgba(220, 223, 226, 0.479);
        border-radius: 30px;
    }
    #btn-area{
        margin: auto;
        place-items: center center;
    }

    #memberPwd{
        border-style: hidden;
        border-radius: 5%;
        background-color: white;
    }

    #title-wrap, #title-wrap input{
       width: 900px;
       height: 50px;
       margin: auto;
    }


    #content-wrap, #content-wrap textarea{
        width: 900px;
        height: 500px;
        margin: auto;
    }

    #confirm{
        background-color: rgba(115, 211, 142, 0.574);
        width: 100px;
        height: 40px;
        border-radius: 10%;
        padding: 10px;
        border: none;
    }

    #word{
        font-size: 1.3em;
        margin-bottom: 10%;
    }

    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@include file="/WEB-INF/views/common/cs_sidebar.jsp" %>
        </div>
        <div id="inquery-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">문의하기</h3>
            </div>
            <hr>
            <div id="inquery-input">
                <div id="title-wrap">
                        <form action="" method="POST">
                        <span id="word">제목</span>
                        <input type="text" id="title" value="5월 2일에 예약한 거 취소하고 싶어요.">
                    </form>
                    </div>
                    <div id="content-wrap">
                        <span id="word">내용</span>
                        <textarea>확인된 예약 건은 마이페이지 -> 주문내역에서 취소하실 수 있습니다.</textarea>
                    </div>
                    <div id="btn-area">
                        <form action="" method="POST">
                            <input type="submit" id="confirm" value="작성하기"></input>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="fast-menu-bar">

        </div>
    </main>








</body>
<script>

</script>
</html>