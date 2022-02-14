/**
 *  무비차트
 */

const movie_container = document.querySelector('.movie_list');

let movie_item = "";

getMovieData();

function getMovieData(){
    $.ajax({
        type: "get",
        url: "/get-movies",
        success: function(data){
            movie_item += setMovieData(data);
            console.log(movie_item);
            movie_container.innerHTML = movie_item;
        },
        error: function(){
            alert("비동기 처리 오류");
        }
    });
}

function setMovieData(movieList){

    let movieHtml = "";

    for(let i = 0; i < movieList.length; i++){
        movieHtml += `<li class="movie_wrap">
                                    <div class="lank_num">No.${i+1}</div>
                                    <div class="img_wrap">
                                        <a href="/movies/detail-view?movieCd=${movieList[i].movie_code}"><img src="/image/${movieList[i].movie_poster_img}" alt=""></a>
                                        <div class="content_wrap">
                                            <h3 class="movie_title">${movieList[i].movie_title_kor}</h3>
                                            <div class="release_date_box">
                                                <span class="realeas_date">${movieList[i].movie_release_date} 개봉</span>
                                            </div>
                                            <a href="#" class="reserve_btn">예매하기</a>
                                    </div>
                                </li>`;
    }
                                            // <span class="dday_date">D-</span>
                                        // </div>
                                        // <div class="limit_age">
                                        //     <img src="image/movie_grade/${movieList[i].movie_limited_age}.png" alt="">
                                        // </div>

    return movieHtml;
}