<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>   
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    
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
        margin-top: 200px;
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

    <%@ include file="/WEB-INF/views/common/mypage-header.jsp" %>
	
	<!-- 내용영역 -->
    <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>리뷰글 작성</a>
        </div>
        <div id="write-area" >
            <form action="${root}/car/review/write" method="POST">
                <input type="text" name="title" placeholder="제목을 입력하세요">
                <br>
                <textarea name="content" id="summernote" placeholder="내용을 입력하세요"></textarea>
            </div>
    
            <div id="submit">
                <input type="submit" value="작성하기" id="btn01">
            </div>
            </form>
    </div>


</body>
</html>

<script>

$('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 320,
        maxHeight:900,
        minHeight:500,
        width: 800,
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

	  //파일업로드 발생시 동작
	  function f01(fileList) {
		console.log(fileList);

		const  fd = new FormData();

		for(let file of fileList){
			fd.append( 'f' ,file);   // f에 파일담아서보냄
		}
		

		$.ajax({
			url :'/upload' ,
			type : 'post',
			data : fd,
			processData : false,
			contentType : false,
			dataType:'json',
			success : (changeNameList)=>{
				console.log(changeNameList);
				for(let changeName of changeNameList){
					$('#summernote').summernote('insertImage' , '${root}/static/car-review-img/' + changeName);
				}
			},
			error : (e)=>{
				alert(e);
			}
		});
	  }










</script>