/**
 *  최신영화정보
 */
const curPageObj = document.querySelector('.curPage');
const prePage = document.querySelector('.prePage');
const indexWrap = document.querySelector('.indexWrap');
const nextPage = document.querySelector('.nextPage');
const goAddMovieBtn = document.querySelectorAll('.goAddMovieBtn');

let curPage = Number(curPageObj.value);
console.log("curPage : " + curPage);
let lastPage = 4;

for(let i = 0; i < lastPage; i++){
    indexWrap.innerHTML += `<button class="pageIndex">${i+1}</button>`;
}

prePage.onclick = () => {
    if(curPage != 1){
        curPage -= 1;
        console.log("현재페이지 " + curPage);
        location.replace("/admin/latest-movie-list?page="+curPage);
    }else if(curPage == 1){
        alert("첫번쩨 페이지 입니다.");
    }
}

nextPage.onclick = (e) => {
    if(curPage != lastPage){
        curPage += 1;
        console.log("현재페이지 " + curPage);
        location.replace("/admin/latest-movie-list?page="+curPage);
    }else if(curPage == lastPage){
        alert('마지막 페이지 입니다.');
    }
}

const pageIndex = document.querySelectorAll('.pageIndex');

for(let i = 0; i < pageIndex.length; i++){
    pageIndex[i].onclick = () => {
        var value = pageIndex[i].innerText;
        curPage = value;
        console.log("현재페이지 " + curPage);
        location.replace("/admin/latest-movie-list?page="+curPage);
    }
}

for(let i = 0; i < goAddMovieBtn.length; i++){
    goAddMovieBtn[i].onclick = (e) => {
        var movieCd = e.target.parentElement.querySelector('.movieCd').value;
        location.href = `/admin/kobis-add-movie?movieCd=`+ movieCd;
    }
}