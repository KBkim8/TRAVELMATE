<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/bannerEdit.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- 내용영역 -->
    <div id="content">

        <form action="" method="POST">
            <div id="declaration">
            
                <div>배너이름</div>
                <input type="text" name="bannerName" required>
                <div>이미지</div>
                <input type="file" name="bannerImg">
                <div id="img-area">
                 <img src="${root}/static/img/adBanner/adBanner02.jpg" alt="배너이미지">
                </div>
                <div>회원아이디</div>
                <input type="text" name="memberId" required>
                <div>기념품코드</div>
                <input type="number" name="productNo" required min="0">

                <input type="submit" value="수정하기">
            </div>
        </form>

    </div>  

</body>
</html>