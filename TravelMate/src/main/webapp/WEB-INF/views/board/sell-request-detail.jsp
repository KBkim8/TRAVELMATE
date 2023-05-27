<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/sellrequestDetail.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	 <div id="content">
         <form action="${root}/admin/sellrequestdetail" method="post">
            <div id="declaration">
                <div>게시글번호</div>
                <div><input type="text" value="${vo.no}" name="no"></div>
                <div>작성자</div>
                <div><input type="text" value="${vo.writer}" name="writer"></div>
                <div>제목</div>
                <div><input type="text" value="${vo.title}" name="title"></div>
                <div>내용</div>
                <div><input type="text" value="${vo.content}" name="content"></div>
                <div>작성일</div>
                <div><input type="text" value="${vo.enrollDate}" name="enrollDate"></div>
                <div>이미지</div>
                <div id="img-area">
                    <img src="${root}/static/img/adBanner/adBanner02.jpg" alt="배너이미지">
                </div>
                
                <input id="close" type="submit" value="등록하기">
            </div>
        </form>
    </div>  
        
</body>
</html>