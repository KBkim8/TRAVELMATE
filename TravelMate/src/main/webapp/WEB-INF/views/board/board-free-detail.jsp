<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #content{
        position: relative;
        width: 1390px;
        height: 100%;
        bottom: 1300px;
        left: 300px;
		margin-top: 650px;
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

	#hr{
		border: 3px groove black;
		margin-left: 200px;
	}

	#reply-write-area{
		display: grid;
		grid-template-columns: 5fr 1fr;
	}

	#reply-write-area > input{
		margin-left: 280px;
		width: 900px;
		border-radius: 20px;
		font-size: 1.5em;
		background-color: #d8f1c7;
		height: 60px;
	}

	#btn01{
		font-size: 1.5em;
		height: 60px;
	}	

	#reply-list-area > table{
		margin-left: 280px;
		margin-top: 20px;
		width: 900px;
		border-radius: 20px;
		font-size: 1.5em;
		border-spacing: 4px;
		background-color: #d8f1c7;
	}

	#reply-list-area > table > tbody > tr > td{
		text-align: center;
	}

	#reply-list-area > table > thead > tr > th , #reply-area > table > tbody > tr > td{
 		 border: 3px solid black;
		border-radius: 10px;
		box-sizing: border-box;
	}

	#btn-area{
		box-sizing: border-box;
		margin-left: 300px;
	}
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/mypage-header.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
	<!-- 내용영역 -->
    <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>공지사항 상세 조회</a>  
        </div>
		<form action="${root}/free/edit" method="POST">
			<div id="write-area">
				<input type="hidden" name="no" value="${fvo.no}"> 
				<input type="text" name="title" value="${fvo.title }" readonly="readonly">
				&nbsp;
				&nbsp;
				&nbsp;
				<span style="font-size: 1.5em;">작성자:${fvo.memberNick }</span>
				&nbsp;
				&nbsp;
				<span style="font-size: 1.5em;">작성일시:${fvo.enrollDate }</span>
				&nbsp;
				<span style="font-size: 1.5em;">조회수 :${fvo.hit }</span>
				<textarea name="content" id="summernote" >${fvo.content }</textarea>
			</div>
				
			<!-- 글 수정 삭제는 not empty loginMember처리  -->
			<div id="btn-area">
				<button type="button" id="btn01" onclick="edit();">수정</button>
				<button type="button" id="btn01" onclick="del();">삭제</button>
				<input type="submit" value="수정하기">
			</div>

		</form>

		

		<hr id="hr">
		
		<!-- 	댓글구역 -->

        <div id="reply-write-area">
				<input type="text" name="content" placeholder="댓글쓰기"> <button id="btn01" onclick="writeComment()">작성하기</button>
        </div>

		<div id="reply-list-area">
			<table > 
				<thead>
					<tr>
						<th>댓글내용</th>
						<th>작성일시</th>
						<th>글쓴이</th>
					</tr>
					</thead>
				<tbody>
						
				</tbody>
			</table>
		</div>


    </div>

</body>
</html>
<script>




// summernote
$('#summernote').summernote({
	
        placeholder: '내용입력',
        tabsize: 2,
        height: 1300,
        maxHeight:1300,
        minHeight:1000,
        width: 1400,
		
		callbacks : {
			onImageUpload : f01
		},
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });

      function f01(FileList) {

        const fd = new FormData();
        for(let file of FileList){
            fd.append("f" , file);
        }

      $.ajax({
			url :'${root}/upload' ,
			type : 'post',
			data : fd,
			processData : false,
			contentType : false,
			dataType:'json',
			success : (changeNameList)=>{
				console.log(changeNameList);
				for(let changeName of changeNameList){
					$('#summernote').summernote('insertImage' , '${root}/static/img/board-img/' + changeName);
				}
			},
			error : (e)=>{
				alert(e);
			}
		});
    }
///////////////////////////////////////////////////////////////////////////////////



	
	function del(){
		const result = confirm("해당 게시글을 삭제 하시겠습니까?");
		if(!result){
			return;
		}
		location.href = '${root}/free/del?no=' + '${fvo.no}';
	}



	function edit(){
			document.querySelector('input[name=title]').readOnly = false;
			document.querySelector('#summernote').readOnly = false;
		} 






			//댓글 작성
	function writeComment(){
		const comment = document.querySelector("input[name=content]").value;
		$.ajax({
			url : "${root}/free/reply/write" ,
			type : "POST" ,
			data : {
				'boardNo' : '${fvo.no}' ,
				'content' : comment ,
			} ,
			success : (x)=>{
				console.log(x);
				if(x == 'ok'){
					alert("댓글이 등록되었습니다.");
					document.querySelector("input[name=content]").value = '';
					loadComment();
				}else{
					alert("로그인 후 작성 가능합니다...");
				}
			} ,
			error : (x)=>{
				console.log(x);
			} ,
		});
	}
	

	//댓글 불러오기
	function loadComment(){
		const replyListArea = document.querySelector("#reply-list-area");
		
		$.ajax({
			url : '${root}/free/reply/list' ,
			type : "GET" ,
			data : {
				no : '${fvo.no}'
			} ,
			success : function(data){
				console.log(data);
				
				const x = JSON.parse(data);
				console.log(x);
				const tbody = document.querySelector('#reply-list-area > table tbody');
				tbody.innerHTML = "";
				let str = "";
				for(let i = 0; i < x.length; i++){
					str += '<tr>';
					str += '<td>' + x[i].content + '</td>';
					str += '<td>' + x[i].enrollDate + '</td>';
					str += '<td>' + x[i].memberNick + '</td>';
					str += '</tr>';
				}
				tbody.innerHTML += str;
			} ,
			error : function(e){
				console.log(e);
			} ,
		});
	}

	loadComment();
</script>