<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/admin/bannerEdit.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/admin/header.jsp" %>

    <!-- 내용영역 -->
    <div id="content">

        <form action="${root}/admin/banneredit" method="POST" enctype="multipart/form-data">
            <div id="declaration">
            
                <div>배너이름</div>
                <input type="text" name="bannerName" placeholder="${vo.name}">
                <div>이미지</div>
                <input type="file" name="f">
                <div id="img-area">
                    <img src="${root}/static/img/adBanner/${vo.image}" alt="광고이미지">
                </div>
                <div>회원닉네임</div>
                <input type="text" name="memberNick" placeholder="${vo.nick}" readonly>
                <div>기념품번호</div>
                <input type="number" name="souvenirNo" placeholder="${vo.souvenirNo}" min="0">

                <input type="hidden" name="no" value="${vo.no}">
                <input type="submit" value="수정하기">
            </div>
        </form>

    </div>  

</body>
</html>
<script>
    //미리보기
    const fileTag = document.querySelector("input[type=file]");
    const imgArea = document.querySelector("#img-area");
    

    fileTag.onchange = function(e){
        
        if(fileTag.files.length == 0){		//취소누른상태
            imgArea.innerHTML = '';
            return;
        }

        for(let i = 0 ; i < fileTag.files.length; i++){
            const fr = new FileReader();
            fr.readAsDataURL(fileTag.files[i]);

            fr.onload = function(e){
                const imgTag = document.createElement('img');
                imgTag.src = e.target.result;
                imgTag.alt = "미리보기이미지사진";
                imgTag.width = 100;
                imgTag.height = 100;
                imgArea.appendChild(imgTag);
            };
        }
    };
</script>