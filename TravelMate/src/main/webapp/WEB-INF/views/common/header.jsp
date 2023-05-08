<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<!-- 부트스트랩 -->    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="${root}/static/css/reset.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
      margin: auto;
      background-color: rgb(255, 255, 255);
    }
    #shape{
      margin: auto;
    }
    header{
      background-color: #39ec93;
      color: white;
      height: 150px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    header > div{
      display: flex;
    }

    nav{
      width: 100%;
      height: 150px;
      border: 1px dashed gray;
    }
      
    #logo{
        width: 100%;
        height: 100%;
    }
    #top{
        position: fixed;
        right: 5%;
    }
    
    
    </style>
</head>
<body>

<div id="top">
     <a href="">로그인</a>
     <a href="">회원가입</a>
     <a href="">마이페이지</a>
     <a href="">고객센터</a>
      </div>
    <header>
      <img id="logo" src="${root}/static/img/로고.png" alt="로고">
    </header>

    <!-- 메뉴바 -->
    <nav>
      메뉴바
    </nav>

     

</body>
</html>