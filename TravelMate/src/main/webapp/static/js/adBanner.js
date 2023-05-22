//해당이미지 누르면 모달
const h6Tags = document.querySelectorAll('div h6');

h6Tags.forEach(function(h6Tag) {
    h6Tag.addEventListener('click', function() {
        const imgMore = document.querySelector('#imgMore')
        imgMore.style.display = 'block'; 
    });
});

//모달 닫기
const closeBtn = document.querySelector('#close');
closeBtn.addEventListener('click', function() {
    const imgMore = document.querySelector('#imgMore')
    imgMore.style.display = 'none'; 
});

//글쓰기 누르면 게시글 작성
function bannerWrite(){
    const root = "/app"; // 최상단 경로 값을 설정해주세요
    const bannerWrite = root + "/admin/bannerwrite";
  
    // 페이지 이동
    window.location.href = bannerWrite;
};

//수정 누르면 게시글 수정
function bannerEdit(){
    const root = "/app"; // 최상단 경로 값을 설정해주세요
    const bannerEdit = root + "/admin/banneredit";
  
    // 페이지 이동
    window.location.href = bannerEdit;
};
