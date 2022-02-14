/**
 *  index 페이지에 data 뿌려주기
 */

const movie_container = document.querySelector('.movies_wrap');

let movie_item = "";

getMovieData();

function getMovieData(){
	$.ajax({
        type: "get",
        url: "/get-movie-list",
        success: function(data){
        	console.log(data);
            movie_item += setMovieData(data);
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
        if(movieList[i].dDay > 0){
            movieHtml += `<div class="movie">
                                        <div class="img_wrap">
                                            <div class="movie_poster">
                                                <img src="/image/${movieList[i].movie_poster_img}" alt="">
                                            </div>
                                            <div class="limit_age">
                                                <img src="/image/movie_grade/${movieList[i].movie_limited_age}.png" alt="">
                                            </div>
                                            <div class="d_day">
                                                <span>D-</span><span class="d_day_text">${movieList[i].dDay}</span>
                                            </div>
                                            <div class="chart_count">${i+1}</div>
                                            <div class="movie_hover">
                                                <a href="/movies/detail-view?movieCd=${movieList[i].movie_code}" class="movie_detail_btn">상세보기</a>
                                                <a href="#" class="movie_reserve_btn">예약하기</a>
                                            </div>
                                        </div>
                                        <div class="movie_title">${movieList[i].movie_title_kor}</div>
                                    </div>`;
        }else{
            movieHtml += `<div class="movie">
                                        <div class="img_wrap">
                                            <div class="movie_poster">
                                                <img src="/image/${movieList[i].movie_poster_img}" alt="">
                                            </div>
                                            <div class="limit_age">
                                                <img src="/image/movie_grade/${movieList[i].movie_limited_age}.png" alt="">
                                            </div>
                                            <div class="chart_count">${i+1}</div>
                                            <div class="movie_hover">
                                                <a href="/movies/detail-view?movieCd=${movieList[i].movie_code}" class="movie_detail_btn">상세보기</a>
                                                <a href="#" class="movie_reserve_btn">예약하기</a>
                                            </div>
                                        </div>
                                        <div class="movie_title">${movieList[i].movie_title_kor}</div>
                                    </div>`;
        }
    }

    return movieHtml;
}