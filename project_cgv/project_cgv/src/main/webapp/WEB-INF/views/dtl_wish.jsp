<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 기대되는 영화</title>
    <link rel="stylesheet" href="/css/mypage_dtl.css">
    <link rel="stylesheet" href="/css/modal.css">
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
    <section id="mypage_dtl">
        <div class="contents">
            
            <!-- 왼쪽 세부 메뉴 -->
            <article class="nav_container">
                <div class="user_box">
                    <img src="/images/default_profile.gif" alt="">
                    <div class="name_box"><strong class="user_name">하나은</strong>님</div>
                </div>
                <div class="nav_box active">
                    <a href="/user/mycgv/wish">
                        <span class="movie_count">1</span>
                        <span class="nav_title">기대되는 영화</span>
                    </a>
                </div>
                <div class="nav_box">
                    <a href="/user/mycgv/watched">
                        <span class="movie_count">31</span>
                        <span class="nav_title">내가 본 영화</span>
                    </a>
                </div>
                <div class="nav_box">
                    <a href="/user/mycgv/review">
                        <span class="movie_count">1</span>
                        <span class="nav_title">내가 쓴 평점</span>
                    </a>
                </div>
            </article>

            <!-- 오른쪽 세부 페이지 -->
            <article class="detail_container">
                <h1 class="detail_title">기대되는 영화</h1>
                <ul id="detail_box2">
                    <li class="content_box">
                        <div class="img_wrap"><a href="#"><img src="/images/spiderman.jpg" alt=""></a></div>
                        <div class="content_wrap">
                            <h3 class="movie_title">해적-도깨비 깃발</h3>
                            <div class="release_date_box">
                                <span class="realeas_date">2022.01.26 개봉</span>
                                <span class="dday_date">D-12</span>
                            </div>
                            <a href="#" class="reserve_btn">예매하기</a>
                        </div>
                        <button class="delete_btn" type="button"></button>
                    </li>
                </ul> 
            </article>
        </div>
    </section>
    <jsp:include page="include/footer.jsp"></jsp:include>
    <script src="/js/mypage_dtl.js"></script>
</body>
</html>