<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 내가 쓴 평점</title>
    <link rel="stylesheet" href="css/mypage_dtl.css">
    <link rel="stylesheet" href="css/modal.css">
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
    <section id="mypage_dtl">
        <div class="contents">

            <!-- 왼쪽 세부 메뉴 -->
            <article class="nav_container">
                <div class="user_box">
                    <img src="img/default_profile.gif" alt="">
                    <div class="name_box"><strong class="user_name">하나은</strong>님</div>
                </div>
                <div class="nav_box">
                    <a href="user/mycgv/wish">
                        <span class="movie_count">1</span>
                        <span class="nav_title">기대되는 영화</span>
                    </a>
                </div>
                <div class="nav_box">
                    <a href="user/mycgv/watched">
                        <span class="movie_count">31</span>
                        <span class="nav_title">내가 본 영화</span>
                    </a>
                </div>
                <div class="nav_box active">
                    <a href="user/mycgv/review">
                        <span class="movie_count">1</span>
                        <span class="nav_title">내가 쓴 평점</span>
                    </a>
                </div>
            </article>

            <!-- 오른쪽 세부 페이지 -->
            <article class="detail_container">
                <h1 class="detail_title">내가 쓴 평점</h1>
                <ul id="detail_box1">
                    <li class="content_box">
                        <div class="img_wrap"><a href="#"><img src="img/spiderman.jpg" alt=""></a></div>
                        <div class="content_wrap">
                            <div>
                                <h3 class="movie_title">보이스</h3>
                                <div class="user_wrap">
                                    <span>nanee0706</span>
                                    <span>2022.01.14</span> <!--작성일-->
                                </div>
                                <div class="review_text"><p>잘 봤습니다.</p></div>
                            </div>
                            <div class="content_bottom">
                                <button class="modify_btn">수정하기</button>
                                <div class="like_wrap">
                                    <img src="img/ico_point_default.png" alt="">
                                    <span>0</span>
                                </div>
                            </div>
                        </div>
                        <button class="delete_btn" type="button"></button>
                    </li>
                </ul> 
            </article>
        </div>
        
        <!-- 모달창 include -->
        <jsp:include page="include/modal.jsp"></jsp:include>
    </section>
    <jsp:include page="include/footer.jsp"></jsp:include>
    <script src="js/mypage_dtl.js"></script>
</body>
</html>