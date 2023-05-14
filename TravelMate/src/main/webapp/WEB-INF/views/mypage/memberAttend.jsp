<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- calendar를 위한 라이브러리들 지우면 안됨 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js" integrity="sha256-VvQ+gcDf/XacyjwCHZZBxAGTsf6Xv3T3edd2YrkQDTs=" crossorigin="anonymous"></script>
<link href='/resources/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.6.0/lib/main.js'></script>
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

    #calendar{
        width: 1300px;
        height: 100%;
        display: flex;
    }

    .fc .fc-scrollgrid, .fc .fc-scrollgrid table {
        table-layout: auto;
        width: 100%;
    }
    
    .fc .fc-toolbar {
    display: flex;
    justify-content: space-between;
    margin-left: 20%;
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
            <a>출석현황</a>
        </div>
        <form action="" method="POST">
            <div id="edit-area">
                        <div id="calendar"></div>
            </div>
        </form>
    </div>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
          headerToolbar: {
                    left: 'prev,next' ,
                    center: 'title',
                    right: 'dayGridMonth myCustomButton'
                },
        customButtons: {
            myCustomButton: {
            text: '출석하기',
            click: function() {
            alert('출석되었습니다.');
                }
            }
        },
        locale: 'ko'
    });
        calendar.render();
});
</script>
</html>