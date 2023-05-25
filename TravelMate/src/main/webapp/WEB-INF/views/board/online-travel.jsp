<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 /* 내용영역 */
 #content{
        position: relative;
	    width: 1390px;
	    height: 100%;
	    bottom: 1100px;
	    left: 400px;
    }

    #first-content>img{
        position: absolute;
        left: 100px;
        top: 125px;
        width: 40px;
        height: 60px;
    }

    #content>#first-content>hr:nth-child(2){
        height: 1px;
        width: 1300px;
        background-color: rgb(116, 116, 116);
        border: 0px solid rgb(65, 65, 65);
        position: absolute;
        left: 100px;
        top: 180px;
    }

    #content>#first-content>a:nth-child(3){
        position: absolute;
        left: 160px;
        top: 135px;
        color: black;
        font-size: 28px;
        font-weight: bold;
    }

	/* //////////////////// */
	#online-area{
		margin-top: 500px;
		display: grid;
		grid-template-columns: repeat(3 ,1fr);
		place-items: center center;
		gap: 100px;
	}

	#online-area a img{
		width: 600px;
		height: 300px;
	}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/mypage-header.jsp" %>

	 <!-- 내용영역 -->
	 <div id="content">
        <div id="first-content">
            <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
            <hr>
            <a>랜선 여행</a>
			
		</div>
			<div id="online-area">
				
				<a href="https://www.youtube.com/watch?v=dEnBXRkDBUE"><img  src="${root}/static/img/ranson.png" alt="이미지" id="ransonImg1"></a>
				<a href="https://www.youtube.com/watch?v=2BPLbTIpOZI"><img src="${root}/static/img/ranson2.png" alt="이미지" id="ransonImg2"></a>
				<a href="https://www.youtube.com/watch?v=t9gVHZlb3vA"><img src="${root}/static/img/ranson3.png" alt="이미지" id="ransonImg3"></a> 
				
				
				<a href="https://www.youtube.com/watch?v=gLatnL0R9Pg"><img id="ransonImg4" src="${root}/static/img/pari.png" alt="이미지"></a>  
				<a href="https://www.youtube.com/watch?v=gLatnL0R9Pg"><img id="ransonImg5" src="${root}/static/img/런던.png" alt="이미지"></a>  
				<a href="https://www.youtube.com/watch?v=lN7WZco3Avg"><img id="ransonImg6" src="${root}/static/img/충주.png" alt="이미지"></a>   
				
			</div>
			
			
</body>
</html>