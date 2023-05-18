<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

   

    /* ----------------------------------------------------------------------- */


    
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	>
              



          <div id="banner">
  
            <!--왼쪽화살표 -->
            <button id="btn01">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
              <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
              </svg>
            </button>
          
             <a href="">
              <img id="img" src="${root}/static/img/banner.png" alt="이미지">
              <img id="img2" src="${root}/static/img/d오메기떡.jpg" alt="이미지">
              <img id="img3" src="${root}/static/img/마음샌드.jpg" alt="이미지">
            </a>
          
            <!-- 오른쪽화살표 -->
            <button id="btn02">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
               <path  d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
               </svg>
            </button>
          
            </div>  
          
            <hr>
          
            <div id="search-area" >
              <a href="">
              <img id="bn" src="${root}/static/img/a.png" alt="이미지">
              <img id="bn" src="${root}/static/img/b.png" alt="이미지"> 
               <button class="btn btn-primary" > 여름인기 여행지검색 click! </button>
              </a>
            </div>
          
              <a href=""><h1 align="center" style="background-color:rgb(139, 207, 139); margin: auto;">랜선으로 여행을 즐겨보세요</h1></a>
             <div id="ranson">
              
              <!-- 왼쪽화살표 -->
              <button id="btn03">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
              <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
              </svg>
              </button>
            
            <a href="https://www.youtube.com/watch?v=dEnBXRkDBUE"><img style="width: 450; height: 450px;" src="${root}/static/img/ranson.png" alt="이미지" id="ransonImg1"></a>
            <a href="https://www.youtube.com/watch?v=2BPLbTIpOZI"><img src="${root}/static/img/ranson2.png" alt="이미지" id="ransonImg2"></a>
            <a href="https://www.youtube.com/watch?v=t9gVHZlb3vA"><img src="${root}/static/img/ranson3.png" alt="이미지" id="ransonImg3"></a> 
            
              
            <a href="https://www.youtube.com/watch?v=gLatnL0R9Pg"><img id="ransonImg4" src="${root}/static/img/pari.png" alt="이미지"></a>  
            <a href="https://www.youtube.com/watch?v=gLatnL0R9Pg"><img id="ransonImg5" src="${root}/static/img/런던.png" alt="이미지"></a>  
            <a href="https://www.youtube.com/watch?v=lN7WZco3Avg"><img id="ransonImg6" src="${root}/static/img/충주.png" alt="이미지"></a>   
            
            <!-- 오른쪽화살표 -->
            <button id="btn04">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
              <path  d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
              </svg>
            </button>
           
            </div>
          
            <div id="wrap">
          
            <div id="pr">
             <a href=""><h2 align="center">지인에게 특산품을 선물해보세요!</h2></a>
             <a href=""> <img width="350px" height="300px" src="${root}/static/img/pr.png" alt="이미지"> </a>
             <a href=""> <img width="350px" height="300px" src="${root}/static/img/pr2.png" alt="이미지"> </a>
             <a href=""> <img width="350px" height="300px" src="${root}/static/img/prr.png" alt="이미지"> </a>
            </div>
             
            <div id="br">
              <a href=""><h2 align="center">여행 정보를 서로 공유해보세요!</h2></a>
              <a href="/app/test"  style="font-size: 2em;">제주도 차박 여행 후기</a>
              <br>  
              <br>  
              <a href="/app/test" style="font-size: 2em;">강원도 차박 여행 후기</a>  
              <br>
              <br>
              <a href="/app/test" style="font-size: 2em;"> 강릉 차박 여행 후기</a>  
              <br>
              <br>
              <a href="/app/test" style="font-size: 2em;"> 포천 차박 여행 후기</a>  
            </div>
            
            </div>





            </div>
    </div>


</body>
</html>

<script>













</script>