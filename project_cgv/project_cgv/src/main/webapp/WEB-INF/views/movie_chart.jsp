<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 무비차트</title>
    <link rel="stylesheet" href="/css/movie_chart.css">
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
    <section id="movie_chart">
        <div class="contents">
            <div class="list_container">
                <h1 class="list_title">무비차트</h1>
                <div class="list_content">
                    <ul class="movie_list">
                        <li class="movie_wrap">
                            <div class="lank_num">No.1</div>
                            <div class="img_wrap">
                                <a href="/movies/detail-view"><img src="/images/spiderman.jpg" alt=""></a>
                            </div>
                            <div class="limit_age">
                                <img src="img/grade-12.png" alt="">
                            </div>
                            <div class="content_wrap">
                                <h3 class="movie_title">해적-도깨비 깃발</h3>
                                <div class="release_date_box">
                                    <span class="realeas_date">2022.01.26 개봉</span>
                                    <span class="dday_date">D-12</span>
                                </div>
                                <a href="#" class="reserve_btn">예매하기</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>