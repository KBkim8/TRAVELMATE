<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/reportListDetail.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	 <div id="content">
            <div id="declaration">
            
                <div>신고번호</div>
                <div><input type="text" name="no"></div>
                <div>회원번호</div>
                <div><input type="text" name="memberNo"></div>
                <div>회원아이디</div>
                <div><input type="text" name="memberId"></div>
                <div>회원닉네임</div>
                <div><input type="text" name="memberNick"></div>
                <div>게시판이름</div>
                <div><input type="text" name="boardName"></div>
                <div>신고내용</div>
                <div><input type="text" name="boardName"></div>
                <div>신고사유</div>
                <div><input type="text" name="boardName"></div>

                <button id="close" onclick="goHome();">닫기</button>
            </div>
    </div>  
        
</body>
</html>
<script>
    function goHome(){
        window.location.href = '${root}/admin/reportlist?page=1';
    };
</script>