<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
    #faq-area{
        width: 100%;
        height: 100%;
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
        height: 1300px;
    	display: grid;
        grid-template-columns: 1fr 4fr 1fr;
        
    }
    #title-area{
        display: flex;
    }
    
    #faq-area-box{
        width: 1000px;
        height: 60%;
        border: 1px solid rgba(115, 211, 142);
        margin: auto;
        place-items: center center;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr 1fr 1fr;
    }

    #faq-box1, #faq-box2, #faq-box3, #faq-box4, #faq-box5{
        width: 80%;
        height: 40%;
        background-color: rgba(146, 146, 146, 0.589);
        border-radius: 30px;
    }

    #question{
        font-size: 1.2em;
    }

    #answer{
        display: none;
    }

    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@include file="/WEB-INF/views/common/cs_sidebar.jsp" %>
        </div>
        <div id="faq-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">자주 묻는 질문</h3>
            </div>
            <hr>
                <div id="faq-area-box">
                    <div id="faq-box1">
                        <div class="question1" id="question">
                            예약하는 방법을 모르겠어요.
                        </div>
                        <div class="answer1" id="answer">
                            호텔과 렌터카의 경우, 원하는 날짜와 도시를 선택하신 후
                            원하는 조건에 맞춰서 예약하시면 됩니다.
                        </div>
                    </div>
                    <div id="faq-box2">
                        <div class="question2" id="question">
                            내가 쓴 글을 삭제, 수정하고싶어요.
                        </div>
                        <div class="answer2" id="answer">
                             로그인 후, [마이페이지] ->  게시글 조회에서 해당 게시글을 확인하신 뒤, 
                            클릭하여 해당 글이 있는 페이지로 이동하시면 글 내용 하단에 삭제/수정 기능이 있습니다.
                        </div>
                    </div>
                    <div id="faq-box3">
                        <div class="question3" id="question">
                            탈퇴 후 재가입 할 수 있나요?
                        </div>
                        <div class="answer3" id="answer"> 
                            탈퇴 후 재가입 하실 수 있으나, 
                            사용했던 아이디로는 재가입이 불가능하며, 탈퇴 전의 회원정보, 예약정보 등은 복구 불가능합니다.
                        </div>
                    </div>
                    <div id="faq-box4">
                        <div class="question4" id="question">
                            아이디, 비밀번호가 기억나지 않아요.
                        </div>
                        <div class="answer4" id="answer"> 
                            로그인 페이지에서 아이디/비밀번호 찾기를 진행해주세요.
                            <br>
                            <a href="">아이디, 비밀번호 찾기</a>
                        </div>
                    </div>
                    <div id="faq-box5">
                        <div class="question5" id="question">
                            숙소 예약 시, 예약자와 투숙자가 상이해도 무방한가요?
                        </div>
                        <div class="answer5" id="answer"> 
                            숙소는 가급적 예약자와 투숙자가 일치해야 하며, 상이할 경우 투숙자명 일치가 필요로 됨에 따라
                            마이페이지 예약상세 > 1:1문의 를 통하여 변경 요청 주시기 바랍니다.
                        </div>        
                    </div>
                </div>
            </div>
        <div id="fast-menu-bar">

        </div>
    </main>

</body>
</html>