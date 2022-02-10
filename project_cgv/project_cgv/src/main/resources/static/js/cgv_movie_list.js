/**
 *  cgv영화정보
 */

const goMovieDtlBtn = document.querySelectorAll('.goMovieDtlBtn');

for(let i = 0; i < goMovieDtlBtn.length; i++){
    goMovieDtlBtn[i].onclick = (e) => {
        console.log('클릭');
        var movieCd = e.target.parentElement.querySelector('.movieCode').value;
        location.href = `/admin/cgv-movie-detail?movieCd=`+ movieCd;
    }
}