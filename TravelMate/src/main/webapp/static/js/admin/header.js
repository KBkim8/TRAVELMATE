//사이드바
$(function () {
    $(".sub_menu ul.small_menu").hide();
    $(".sub_menu ul.big_menu").click(function () {
        $("ul", this).slideToggle(300);
    });
});

//상단으로
uppage.addEventListener("click", () => {
    window.scrollTo({ top: 0, behavior: "smooth" });  
});

//하단으로
downpage.addEventListener("click", () => {
    window.scrollTo({ 
        top: document.body.scrollHeight,
        behavior: "smooth", 
    });
});

//사이드바열기
const aside = document.querySelector("#sidebar-category");
const rightSide = document.querySelector("#right-sidebar-category");
const sideClose = document.querySelector("#side-close");
const insta = document.querySelector("#insta");
const blog = document.querySelector("#blog");
const facebook = document.querySelector("#facebook");
const youtube = document.querySelector("#youtube");
const notice = document.querySelector("#notice");
const faq = document.querySelector("#faq");
const qna = document.querySelector("#qna");
const info = document.querySelector("#info");
const accom = document.querySelector("#accom");
const rentcar = document.querySelector("#rentcar");
const img01 = document.querySelector("#img01");

rightSide.addEventListener("click" , function(){
    aside.classList.add("active1");
    sideClose.classList.remove("active2");
    insta.classList.remove("active2");
    blog.classList.remove("active2");
    facebook.classList.remove("active2");
    youtube.classList.remove("active2");
    notice.classList.remove("active2");
    faq.classList.remove("active2");
    qna.classList.remove("active2");
    info.classList.remove("active2");
    accom.classList.remove("active2");
    rentcar.classList.remove("active2");
    img01.classList.remove("active2");
});


//사이드바닫기
sideClose.addEventListener("click", function(){
    aside.classList.remove("active1");
    sideClose.classList.add("active2");
    insta.classList.add("active2");
    blog.classList.add("active2");
    facebook.classList.add("active2");
    youtube.classList.add("active2");
    notice.classList.add("active2");
    faq.classList.add("active2");
    qna.classList.add("active2");
    info.classList.add("active2");
    accom.classList.add("active2");
    rentcar.classList.add("active2");
    img01.classList.add("active2");
});

