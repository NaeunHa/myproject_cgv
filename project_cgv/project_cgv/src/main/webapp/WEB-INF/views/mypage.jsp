<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 마이페이지</title>
    <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
    <section id="mypage">
        <div class="contents">
            <div class="info_wrap">       
                <div class="my_info info_box">
                    <div class="user_profile"><img src="/images/default_profile.gif"></div>
                    <h1>하나은님</h1>
                    <span>nanee0706</span>
                    <button type="button" class="modify_btn"></button>
                </div>
                <div class="sub_info_box info_box">
                    <div class="sub_info">
                        <div>
                            <h2>MEMBERSHIP</h2>
                            <span>나의 멤버쉽 등급</span>
                        </div>
                        <div><strong>VIP</strong></div>
                        
                    </div>
                    <div class="sub_info">
                        <div>
                            <h2>CGV POINT</h2>
                            <span>사용가능 포인트</span>
                        </div>
                        <div><strong>2,707</strong> 점</div>
                    </div>
                </div>
            </div>
            <div class="wish box_container">
                <div class="description_box">
                    <h3>기대되는 영화</h3>
                    <a href="mycgv/wish">더보기</a>
                </div>
                <ul class="inner_box">
                    <li class="empty">찜한 영화가 존재하지 않습니다.</li>
                    <li class="content_box">
                        <a href="/user/movies/detail-view">
                            <h4>특송</h4>
                            <img src="/images/poster2.jpg" alt="" class="poster_img">
                            <img src="/images/grade-12.png" alt="" class="grade_img">
                            <span>2022.01.12 개봉</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="watched box_container">
                <div class="description_box">
                    <h3>내가 본 영화</h3>
                    <a href="/user/mycgv/watched">더보기</a>
                </div>
                <ul class="inner_box">
                    <li class="empty">관람한 영화가 존재하지 않습니다.</li>
                    <li class="content_box" >
                        <a href="#">
                            <h4>웨스트 사이드 스토리</h4>
                            <img src="/images/poster2.jpg" alt="" class="poster_img">
                            <img src="/images/grade-12.png" alt="" class="grade_img">
                            <span>2022.01.12 개봉</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="my_review box_container">
                <!-- TODO : 내가 관람한 영화 만 리뷰작성 가능 -->
                <div class="description_box">
                    <h3>내가 쓴 평점</h3>
                    <a href="/user/mycgv/review">더보기</a>
                </div>
                <ul class="inner_box">
                    <li class="empty">작성한 리뷰가 존재하지 않습니다.</li>
                    <li class="content_box">
                        <a href="/movies/detail-view">
                            <h4>스파이더맨-노웨이홈</h4>
                            <img src="/images/poster2.jpg" alt="" class="poster_img">
                            <img src="/images/grade-12.png" alt="" class="grade_img">
                            <span>2022-01-14 관람</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>