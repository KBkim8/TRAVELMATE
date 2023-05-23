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

    #fav-content-area{
        width: 1300px;
        height: 80%;
        left: 100px;
        top: 230px;
        position: absolute;
        display: grid;
        grid-template-rows: 2fr 1fr;
    }
    
    #fav-list-box{
        width: 1300px;
        border-radius: 30px;
        border: 1px dashed black;
        font-size: 25px;
        justify-content: center;
        align-content: center;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr;
    }

    .paging-area{
        width: 100%;
        height: 10%;
        border: 1px solid lightgray;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
    }

    #btn01 {
        background-color: #73D38E;
        border: 0;
        padding: 0px 25px; 
        display: inline-block;
        text-align: center;
        color: white;
        border-radius: 6px;
        width: 100px;
        height: 30px;
        font-size: 25px;
        margin-left: 15px;
    }

    #btn01:hover {background-color: #80C49D;}
    #btn01:active {
        box-shadow: 0 0 0 1px #82c8a0 inset,
                0 0 0 2px rgba(255,255,255,0.15) inset,
                0 0 0 1px rgba(0,0,0,0.4);
    }  
    .black-bg {
        display: none;
        width: 400px;
        height: 200px;
        position: absolute;
        background: rgba(0, 0, 0, 0.5);
        left: 700px;
        bottom: 600px;
        z-index: 5;
        padding: 50px;
    }
    .white_bg {
        background: white;
        border-radius: 5px;
        padding: 50px;
    }

    .show-modal {
        display: inline-block;
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
            <a>관심상품</a>
        </div>
        <div id="fav-content-area">
            <div id="fav-list-box">
                <!-- 반복문 처리 -->
                <!-- 차량 -->
                <div id="car-area">
                    <span>차량</span>
                    <hr>
                    <img src="${root}/static/img/소나타DN8.jpg" alt="차량이미지">
                     <div>${cvoList.carKind }</div>
                </div>
                <!-- 숙소 -->
                <div id="accomo-area">
                    <span>숙소</span>
                    <hr>
                    <img src="${root}/static/img/" alt="숙소이미지">
                    <div>"${avoList}"</div>
                </div>
                <!-- 기념품 -->
                <div id="souvenir-area">
                    <span>기념품</span>
                    <hr>
                    <img src="${root}/static/img/아베베도넛.jpg" alt="기념품이미지">
                    <div>"${svoList}"</div>
                </div>

            </div>
            <div id="page-area">
				<c:if test="${pv.currentPage > 1 }">
				<a id="btn01" href="${root}/CScenter/Inquerylist?page=${pv.currentPage-1}">이전</a>
				</c:if>
				<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
					<a id="btn02" href="${root}/CScenter/Inquerylist?page=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pv.currentPage < pv.maxPage}">
				<a id="btn01" href="${root}/CScenter/Inquerylist?page=${pv.currentPage+1}">다음</a>
				</c:if>
			</div>
        </div>
    </div>
</body>

<script>




</script>

</html>