<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/souvenirinventoryWrite.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- 내용영역 -->
    <div id="content">

        <form action="${root}/admin/souvenirinventoryWrite" method="POST">
            <div id="declaration">
            
                <div>기념품명</div>
                <div><input type="text" name="name"></div>
                <div>지역</div>
                <div><input type="text" name="local"></div>
                <div>내용</div>
                <div><input type="text" name="content"></div>
                <div>가격</div>
                <div><input type="text" name="price"></div>
                <div>이미지</div>
                <div><input type="file" name="souvenirImg"></div>
                <div id="img-area">
                 <img src="${root}/static/img/adBanner/adBanner02.jpg" alt="배너이미지">
                </div>

                <input type="submit" value="등록하기">
            </div>
        </form>

    </div>  

</body>
</html>