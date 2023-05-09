<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>  
    <!doctype html>
    <html lang="ko">
    <head>
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
      margin-top: -20px;
       text-align: center;
       font-size: 120px; 
       color: #ffffff; 
    }
    
    #search-area {
      height: 300px;
      background-color: green;
        display: flex;
        justify-content: end;
        padding: 30px;
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
    
    #banner{
        height: 180px;   
    }

    #img{
      width: 100%;
      height:200px;
    }
    #ranson{
      background-color: rgb(139, 207, 139);
    }

    #ranson > a {
      width:200px; 
      height:200px;
      margin-top: 24px;
      margin-left: 230px;
    }

    #ranson > a:nth-child(1){
      text-decoration-style:wavy;
    }

    #wrap{
      width: 100%;
      height: 500px;
      
    }

    #wrap{
      display: grid;
      grid-template-columns:2fr 1fr ;
      border: 3px solid black;
    }

    #wrap > a >img{
      place-content: center center;
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

  

    </style>
    </head>
    <body>
    
    <div class="jb-box">
        <video muted autoplay loop>
          <source src="${root}/img/codes-23355.mp4" type="video/mp4">
        </video>
        <div class="jb-text">
          <p>TRAVLE MATE</p>
        </div>
      </div>
      
      <div id="banner">
        <a href="/app/test"><img id="img" src="${root}/img/banner.png" alt="이미지"></a> 
      </div>  

        <div id="search-area" >
            <h1 align="center">지금 TRAVEL MATE 는</h1>
              <form action="">
                  <button class="btn btn-primary">여름인기 여행지검색 click! </button>
              </form>
          </div>

      <div id="ranson">
       <a href=""><h1 align="center">랜선으로 여행을 즐겨보세요</h1></a>
        <a href="https://www.youtube.com/watch?v=dEnBXRkDBUE"><img src="${root}/img/ranson.png" alt="이미지"></a>
        <a href="https://www.youtube.com/watch?v=2BPLbTIpOZI"><img src="${root}/img/ranson2.png" alt="이미지"></a>
        <a href="https://www.youtube.com/watch?v=t9gVHZlb3vA"><img src="${root}/img/ranson3.png" alt="이미지"></a>  
      </div>

      <div id="wrap">

        <a href=""><h4>지인에게 특산품을 선물해보세요!</h4></a>
        <a href=""><h4>여행 정보를 서로 공유해보세요!</h4></a>
        <a href="/app/test">
          <img width="350px" height="300px" src="${root}/img/pr.png" alt="이미지"> 
          <img width="350px" height="300px" src="${root}/img/pr2.png" alt="이미지">
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