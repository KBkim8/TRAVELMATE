<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	main{
		width: 100%;
		height: 90%;
		display: grid;
		grid-template-columns: 1fr 4fr 1fr;
	}

	#write-area{
		width: 900px;
		display: grid;
		grid-template-columns: 1fr 3fr 1fr 1fr;
		grid-template-rows: 30px 570px;
        margin-left: 20%;
	}

	#write-area > textarea {
		grid-column: span 3;
	}

    input[type="submit"]{
        margin-left: 40%;
        width: 300px;
    }

</style>
</head>
<body>

	<div id="wrap">
		
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<main>
		<div id="left-sidebar">
			<%@include file="/WEB-INF/views/common/left_sidebar.jsp" %>
		</div>
		
			<div id="content-area1">
				<h1>게시글 작성</h1>
            <hr>
			<form action="${root}/board/write" method="post">
				<div id="write-area">
					<span>제목</span>
					<input type="text" name="title" placeholder="제목을 입력하세요">
					<span>카테고리</span>
					<select name="categoryNo">
						<c:forEach items="${cvoList}" var="cvo">
							<option value="${cvo.no}">${cvo.name}</option>	
						</c:forEach>
					</select>
					<span>내용</span>
					<textarea name="content" placeholder="내용을 입력하세요"></textarea>
				</div>
				<input class="btn btn-primary btn-lg" type="submit" value="작성하기">
			</form>
			</div>
			
			<div id="right-sidebar">
				<%@ include file="/WEB-INF/views/common/right_sidebar.jsp"%>
			</div>
			
		</main>
		
	</div>

</body>
</html>
