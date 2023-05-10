<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- calendar를 위한 라이브러리들 지우면 안됨 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>


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
    
    #attend-cal{
        margin: auto;
        width: 100%;
        height: 90%;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
        justify-content: center;
        align-items: center;
    }


    #btn-area{
        margin: auto;
        place-items: center center;
    }

    button{
        background-color: rgba(115, 211, 142, 0.574);
        width: 100px;
        height: 40px;
        border-radius: 10%;
        padding: 10px;
        border: none;
    }

    #calendar{
        max-width: 900px;
        margin: 40px auto;

    }



    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div id="sidebar">
			<%@ include file="/WEB-INF/views/common/mg_sidebar.jsp" %>
        </div>
        <div id="attend-area">
            <div id="title-area">
                <div id="square"></div>
                <h3 class="mem-info">출석현황</h3>
            </div>
            <hr>
            <div id="attend-cal">
                <div class="container calendar-container">
                    <div id="calendar"></div>
                </div>
               <div id="btn-area">
                    <button id="confirm"></button>
                    <button id="cancel"></button>
                </div>
            </div>
        </div>
        <div id="fast-menu-bar">

        </div>
    </main>








</body>
<script type="text/javascript">
    $(document).ready(function(){
          $('#calendar').fullCalendar({
            header: {
              right: 'custom2 prevYear,prev,next,nextYear'
            },
            // 출석체크를 위한 버튼 생성
            customButtons: { 
                custom2: {
                  text: '출석체크하기',
                  id: 'check',
                  click: function() {	
                    	$ajax{
                    		url: '/users/attendances',
                    		type: 'GET',
                    		dataType: "JSON",
                    		success: function (data) { },
                    		error: function() {
                    			alert('there was an error while fetching events!');
                    		},
                    		color: 'purple',   
                    		textColor: 'white' 
                    	}
                        // ajax 통신으로 출석 정보 저장하기 
                        // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                        // 통신 성공시 버튼 바꾸고, property disabled 만들기 
                  }
                }
            },
           // 달력 정보 가져오기 
            eventSources: [
                {
                    // ajax 통신으로 달력 정보 가져오기 
                    // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
                    color: 'purple',   
                     textColor: 'white' 
                }
            ]
          }); 
    });
    </script>
</html>