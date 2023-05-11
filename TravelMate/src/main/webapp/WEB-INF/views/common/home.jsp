<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>  
    <!doctype html>
    <html lang="ko">
    <head>
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
        <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
      </svg>
        <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <title>CSS</title>
    <style>
    body { 
      padding: 0px; 
      margin: 0px; 
    }
    
    .jb-box {
       width: 100%; 
       height: 20%; 
       overflow: hidden;
       margin: 0px auto; 
       position: relative; 
      }
    
    video { 
      width: 100%;
     }
    
    .jb-text {
       position: absolute; 
       top: 50%; 
       width: 100%; 
      }
    
    .jb-text p { 
      opacity: 0.5;
      margin-top: -20px;
       text-align: center;
       font-size: 120px; 
       color: #ffffff; 
    }
    
    #search-area {
      display: flex;
      justify-content: space-evenly;
      height: 300px;
    
    }

    #bn{
      width: 900px;
      height: 300px;
    }

    #search >div{
      font-size: 2em;
      justify-content: center;
        padding: 30px;
    }
    
    /* 여행지검색 버튼 */
    #search  button{
    border-radius: 30px;
    width: 200px;
    }
    
    /* 여름 인기 휴양지 버튼 hover */
    .btn {
       border-radius: 100px;
       background-color: rgb(13, 126, 231);
    }
    .btn:hover{
      background-color: blueviolet;
    }
    
    #banner{
        height: 180px;   
    }

    #img{
      width: 80%;
      height:200px;
      margin-left: 300px;
    }
    #ranson{
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      grid-template-rows: 4fr;
      
      grid-column: span 3;
      background-color: rgb(139, 207, 139);
    }

    #ranson > a {
      margin-left: 50px;
    }
    
    #wrap{
      width: 100%;
      height: 500px;
      
    }

    #wrap{
      display: grid;
      grid-template-columns:1.5fr 1fr ;
      border: 3px solid black;
      align-items: center;
      justify-items: center;
      
    }

    #wrap > a >img{
      place-content: center center;
      margin-left: 30px;
    }

    #wrap > a > h4 {
      margin-left: 60px;
    }

    #wrap > a > h4:hover{
      font-size: 2em;
    }
    #wrap > a{
      text-decoration: none;
    }

    .bi{
      background-color: red;
    }
  

    </style>
    </head>
    <body>
    
    <div class="jb-box">
        <video muted autoplay loop>
          <source src="${root}/static/img/KakaoTalk_20230511_192349681.mp4" type="video/mp4">
        </video>
        <div class="jb-text">
          <p>TRAVEL_MATE</p>
        </div>
      </div>
      
      <div id="banner">
        <i class="bi bi-arrow-right-circle-fill"></i>  <a href="/app/test"><img id="img" src="${root}/static/img/banner.png" alt="이미지"></a> <i class="bi bi-arrow-left-circle-fill"></i>
      </div>  

      <hr>

        <div id="search-area" >
              <form action="">
                <a href=""><img id="bn" src="${root}/static/img/a.png" alt="이미지"></a>
                <a href=""><img id="bn" src="${root}/static/img/b.png" alt="이미지"></a> 
                <button class="btn btn-primary" > 여름인기 여행지검색 click! </button>
              </form>
        </div>

          <a href=""><h1 align="center" style="background-color:rgb(139, 207, 139); margin: auto;">랜선으로 여행을 즐겨보세요</h1></a>
      <div id="ranson">
        <a href="https://www.youtube.com/watch?v=dEnBXRkDBUE"><img style="width: 450; height: 450px;" src="${root}/static/img/ranson.png" alt="이미지"></a>
        <a href="https://www.youtube.com/watch?v=2BPLbTIpOZI"><img src="${root}/static/img/ranson2.png" alt="이미지"></a>
        <a href="https://www.youtube.com/watch?v=t9gVHZlb3vA"><img src="${root}/static/img/ranson3.png" alt="이미지"></a>  
      </div>

      <div id="wrap">

        <a href=""><h4 align="center">지인에게 특산품을 선물해보세요!</h4></a>
        <a href=""><h4>여행 정보를 서로 공유해보세요!</h4></a>
        <a href="/app/test">
          <img width="350px" height="300px" src="${root}/static/img/pr.png" alt="이미지"> 
          <img width="350px" height="300px" src="${root}/static/img/prr2.png" alt="이미지"> 
          <img width="350px" height="300px" src="${root}/static/img/pr2.png" alt="이미지">
        </a>  
        <a href="/app/test">제주도 차박 여행 후기</a> 
        
      </div>
    	
	      
    </body>
    </html>
    
    <script>
    const searchBtn = document.querySelector('#search button');
    searchBtn.addEventListener('click' , ()=>{
        
    });
    </script>