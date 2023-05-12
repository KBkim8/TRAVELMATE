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

    #reply-form-area {
		width: 600px;
		margin: auto;
		border-left: 1px solid black;
		border-right: 1px solid black;
		box-sizing: border-box;
		padding-left: 10px;
		padding-right: 10px;
	}

	#reply-form-area > input:first-child {
		width: 480px;
	}

	#reply-list-area > table {
		width: 600px;
		box-sizing: border-box;
		border-collapse: collapse;
		margin: auto;
	}

	#reply-list-area > table td , #reply-list-area > table th {
		border: 1px solid black;
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

			<h1>게시글 조회</h1>
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
			</form>

            <div id="reply-area">
				<input type="hidden" name="noticeNo" value="${vo.no}">
				<div id="reply-form-area">
					<input type="text" name="content" placeholder="댓글을 입력하세요">
					<input type="button" value="댓글쓰기" onclick="writeComment();">
				</div>
				<div id="reply-list-area">
					<table>
						<thead>
							<tr>
								<th>댓글내용</th>
								<th>작성자</th>
								<th>작성일시</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>

			<div id="right-sidebar">
				<%@ include file="/WEB-INF/views/common/right_sidebar.jsp"%>
			</div>
			
		</main>
		
	</div>

</body>
</html>
