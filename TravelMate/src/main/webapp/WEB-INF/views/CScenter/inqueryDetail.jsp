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
        left: 130px;
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

    #title {
        width: 1000px;
        height: 50px;
        border-radius: 20px;
        font-size: 20px;
        background-color: none;
    }

    #content-wrap > textarea {
        width: 1000px;
        height: 600px;
        font-size: 30px;
        border-radius: 20px;
        background-color: none;
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
   <div id="content">
    <div id="first-content">
        <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
        <hr>
        <a>문의상세</a>
    </div>
        <div id="inquery-input">
            <div id="title-wrap">
                    <form action="" method="POST">
                    <input type="text" id="title" value="5월 2일에 예약한 거 취소하고 싶어요.">
                </form>
            </div>
            <div id="content-wrap">
                <textarea>어떻게 취소할 수 있나요? 제가 직접 해야하나요?</textarea>
            </div>
                <div id="reply-area">
                    <input type="hidden" name="noticeNo" value="${vo.no}">
				    <div id="reply-form-area">
					<input type="text" name="content" placeholder="댓글을 입력하세요">
					<input type="button" id="btn01" value="댓글 쓰기" onclick="writeComment();">
				    </div>
				    <div id="reply-list-area">
                        <table>
                            <thead>
                                <tr>
                                    <th>댓글 내용</th>
                                    <th>작성자</th>
                                    <th>작성일시</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
					    </table>
				    </div>
                </div>
            </div>
    </div>

</body>
<script>


    // 댓글 admin, 작성자 둘 다 볼 수 o, 쓰는 건 admin만
	// 댓글 목록 보여주기
	function loadComment(){
		const replyListArea = document.querySelector("#reply-list-area");

		// 댓글 객체로 내용, 작성자 뽑아내기
		$.ajax({
			url : "${root}/notice/reply/list",
			type : "GET",
			data : {
				noticeNo : '${vo.no}'
			},
			success : function(data){
				console.log(data);
				// JSON 형태로 받아서, 화면에 보여주기
				const x = JSON.parse(data);
				console.log(x);

				const tbody = document.querySelector('#reply-list-area tbody');
				tbody.innerHTML = "";
				let str = "";
				for(let i = 0; i < x.length; i ++){
					str += '<tr>';
					str += '<td>' + x[i].content + '</td>';
					str += '<td>' + x[i].wrterNo + '</td>';
					str += '<td>' + x[i].enrollDate + '</td>';
					str += '</tr>';

				}
				tbody.innerHTML += str;

			},
			error : (e)=>{
				console.log(e);				
			} 
		});

	}

	loadComment();

</script>
</html>