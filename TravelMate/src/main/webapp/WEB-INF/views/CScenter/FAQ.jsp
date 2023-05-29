<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

    #content{
        position: relative;
	    width: 1170px;
	    height: 1000px;
	    left: 420px;
	    bottom: 450px;
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

    #acco-area {
      position: absolute;
      width: 1300px;
      height: 1000px;
      left: 100px;
      top: 230px;
      
    }

    .accordion-header{
        text-align: center;
    }

</style>
</head>
<body>

  <%@ include file="/WEB-INF/views/common/cs-header.jsp" %>
  <!-- 내용영역 -->
  <div id="content">
      <div id="first-content">
          <img src="${root}/static/img/사각형.png" alt="사각형" id="square">
          <hr>
          <a>자주 묻는 질문</a>
      </div>
      <div id="acco-area">
        <div class="accordion" id="accordionExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <strong>예약하는 방법을 모르겠어요.</strong>
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    호텔과 렌터카의 경우, 원하는 날짜와 도시를 선택하신 후
                        원하는 조건에 맞춰서 예약하시면 됩니다.
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <strong>내가 쓴 글을 삭제, 수정하고싶어요.</strong>
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    로그인 후, [마이페이지] ->  게시글 조회에서 해당 게시글을 확인하신 뒤, 
                    클릭하여 해당 글이 있는 페이지로 이동하시면 글 내용 하단에 삭제/수정 기능이 있습니다.
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <strong>탈퇴 후 재가입 할 수 있나요?</strong>
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    탈퇴 후 재가입 하실 수 있으나, 
                    사용했던 아이디로는 재가입이 불가능하며, 탈퇴 전의 회원정보, 예약정보 등은 복구 불가능합니다.
                </div>
              </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
                   <strong> 아이디, 비밀번호가 기억나지 않아요.</strong>
                  </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    로그인 페이지에서 아이디/비밀번호 찾기를 진행해주세요.
                    <br>
                    <a href="${root}/find-id">아이디, 비밀번호 찾기</a>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="headingFive">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
                    <strong>숙소 예약 시, 예약자와 투숙자가 상이해도 무방한가요?</strong>
                  </button>
                </h2>
                <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    숙소는 가급적 예약자와 투숙자가 일치해야 하며, 상이할 경우 투숙자명 일치가 필요로 됨에 따라
                        마이페이지 예약상세 > 1:1문의 를 통하여 변경 요청 주시기 바랍니다.
                  </div>
                </div>
              </div>
          </div>
    </div>
  </div>

</body>

</html>