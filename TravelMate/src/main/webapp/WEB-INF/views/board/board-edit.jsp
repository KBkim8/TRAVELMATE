<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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
        width: 300px;
    }

	input[type="button"]{
        width: 300px;
    }

	#div{
		display: flex;
		justify-content: space-evenly;
		
	}

</style>
</head>
<body>

	<div id="wrap">
		
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<main>
			<h1>게시글 수정</h1>
            <hr>
			<form action="${root}/board/edit" method="post">
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
				<div id="div">
					<input class="btn btn-primary btn-lg" type="submit" value="수정하기">
					<a href="${root}/delet"><input class="btn btn-primary btn-lg" type="button" value="삭제하기"></a>
				</div>
			</form>
			
		</main>
		
	</div>

</body>
</html>
