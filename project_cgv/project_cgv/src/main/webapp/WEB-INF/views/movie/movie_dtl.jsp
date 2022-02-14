<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 영화상세</title>
    <link rel="stylesheet" href="/css/movie_dtl.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="movie_dtl">
        <div class="contents">
            <h1 class="md_title">영화상세</h1>
            <div class="md_container">
                <div>
                    <div class="img_wrap">
                        <img src="/image/${movieData.movie_poster_img }" alt="" class="movie_poster">
                        <img src="/image/movie_grade/${movieData.movie_limited_age }.png" alt="" class="grade_img">
                    </div>
                </div>
                <div class="md_content_wrap">
                    <div class="title_wrap">
                        <div>
                            <h1 class="movie_title">${movieData.movie_title_kor }</h1>
                            <span class="movie_title_eng">${movieData.movie_title_eng }</span>
                        </div>
                        <div class="status_box now">현재상영중</div>
                    </div>
                    <div class="md_info_wrap">
                        <div class="info_box">
                            <span class="director">감독 : ${movieData.movie_director } /</span>
                            <span class="actors"> 배우 : ${movieData.movie_actors }</span>
                        </div>
                        <div class="info_box">
                            <span class="genre">장르 : ${movieData.movie_genre } /</span>
                            <span class="grade_text">기본 : ${movieData.movie_limited_age }세 이상,</span>
                            <span class="run_time">${movieData.movie_runtime }분</span>
                            <span class="made_country">${movieData.movie_nation }</span>
                        </div>
                    </div>
                    <div class="btn_box">
                        <button class="wish_btn">기대돼요!</button>
                        <button class="reserve_btn">예매하기</button>
                        <div class="msg_box">
                            <div class="msg_icon">?</div>
                            <span class="msg_text on">'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="md_description">
                <div class="description_wrap">
                    <div class="description_title">영화 설명</div>
                    <p class="description_content description_text">
                        ${movieData.movie_description }
                    </p>
                </div>
                <div class="description_wrap">
                    <div class="description_title">트레일러</div>
                    <div class="description_content trailer_wrap">
                        <video src="/image/${movieData.movie_trailer_mp4 }" alt="" autoplay preload="auto" muted controls></video>
                    </div>
                </div>
                <div class="description_wrap">
                    <div class="description_title">관람객 리뷰</div>
                    <ul class="description_content review_wrap">
                        <li class="review_box">
                            <div class="user_profile"><img src="/images/default_profile.gif" alt=""></div>
                            <div class="review_content">
                                <div class="writer_info"><div class="review_icon good_icon"></div><span class="user_nick_name">1년에200편</span></div>
                                <div class="review_text">삼스파..중1때부터 본 영화가 결말을 맺었네요 삼스파..중1때부터 본 영화가 결말을 맺었네요 재밌었습니다삼스파..중1때부터 본 영화가 결말을 맺었네요 재밌었습니다삼스파..중1때부터 본 영화가 결말을 맺었네요 재밌었습니다</div>
                                <div class="review_info">
                                    <span class="write_date">2022.01.15</span>
                                    <div class="like_wrap">
                                        <img src="/images/ico_point_default.png" alt="">
                                        <span class="like_count">0</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>