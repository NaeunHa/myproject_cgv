<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 내가 쓴 평점</title>
    <link rel="stylesheet" href="/css/mypage_dtl.css">
    <link rel="stylesheet" href="/css/modal.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="mypage_dtl">
        <div class="contents">

            <!-- 왼쪽 세부 메뉴 -->
            <article class="nav_container">
			    <div class="user_box">
			        <img src="/images/default_profile.gif" alt="">
			        <div class="name_box"><strong class="user_name">${principal.user.username }</strong>님</div>
			    </div>
			    <div class="nav_box">
			        <a href="/user/my-cgv/wish">
			            <span class="movie_count">1</span>
			            <span class="nav_title">기대되는 영화</span>
			        </a>
			    </div>
			    <div class="nav_box">
			        <a href="/user/my-cgv/watched">
			            <span class="movie_count">31</span>
			            <span class="nav_title">내가 본 영화</span>
			        </a>
			    </div>
			    <div class="nav_box active">
			        <a href="/user/my-cgv/review">
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
                        <div class="img_wrap"><a href="/movies/detail-view"><img src="/images/spiderman.jpg" alt=""></a></div>
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
                                    <img src="/images/ico_point_default.png" alt="">
                                    <span>0</span>
                                </div>
                            </div>
                        </div>
                        <button class="delete_btn" type="button"></button>
                    </li>
                </ul> 
            </article>
        </div>
        
        <!-- 모달창 -->
        <div id="modal" class="">
	        <div class="window">
	            <div class="popup">
	                <div class="modal_title">평점수정</div>
	                <div class="modal_content">
	                    <div class="modal_content_title">보이스</div>
	                    <div class="modal_content_wrap">
	                        <div class="modal_content_top">
	                            <div class="left goodbad_box on">
	                                <div class="good_img"></div>
	                                <span>좋았어요~^^</span>
	                            </div>
	                            <div class="middle">
	                                <img src="/images/default_profile.gif" alt="">
	                                <div class="middle_content">
	                                    <div class="watche_user">실관람객</div>
	                                    <span>nanee0706</span>
	                                </div>
	                            </div>
	                            <div class="right goodbad_box">
	                                <div class="bad_img"></div>
	                                <span>흠~좀 별로였어요;;;</span>
	                            </div>
	                        </div>
	                        <div class="modal_content_bottom">
	                            <textarea class="review_txt" maxlength="280"></textarea>
	                            <div class="submit_box">
	                                <div class="length_wrap"><strong class="text_length">0</strong>/280(byte)</div>
	                                <button type="button" class="ok_btn">작성완료!</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <button class="close_btn" type="button"></button>
	            </div>
	        </div>
	    </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script src="/js/review_dtl.js"></script>
</body>
</html>