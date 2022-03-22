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
    <title>CGV | 내가 본 영화</title>
    <link rel="stylesheet" href="/css/mypage_nav.css">
    <link rel="stylesheet" href="/css/mypage_dtl.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="mypage">
        <div class="contents">
        	
        	<jsp:include page="../include/mypage_header.jsp"></jsp:include>
        	
        	<article class="mypage_container">
	        	<!-- 오른쪽 메뉴 -->
	   			<div class="mypage_nav">
		            <div class="mypage_nav_box">
		                <div class="nav_wrap">
		                    <dl class="now">
		                        <dt><a href="/user/my-cgv">나의 영화 기록</a></dt>
		                        <dd><a href="/user/my-cgv/wish">기대되는 영화</a></dd>
		                        <dd class="now"><a href="/user/my-cgv/watched">내가 본 영화</a></dd>
		                        <dd><a href="/user/my-cgv/review">내가 쓴 평점</a></dd>
		                    </dl>
		                    <dl>
		                        <dt><a href="#">CGV 포인트</a></dt>
		                        <dd><a href="#">적립/사용내역</a></dd>
		                    </dl>
		                    <dl>
		                        <dt><a href="#">나의 예매 내역</a></dt>
		                        <dd><a href="#">예매내역</a></dd>
		                    </dl>
		                    <dl>
		                        <dt><a href="#">기프트샵</a></dt>
		                        <dd><a href="#">결제내역</a></dd>
		                    </dl>
		                    <dl>
		                        <dt><a href="/user/account/check/password">회원정보</a></dt>
                                <dd class="now"><a href="/user/account/check/password">개인정보 변경</a></dd>
                                <dd><a href="/user/account/check/password">회원탈퇴</a></dd>
		                    </dl>
		                    <dl>
		                        <dt><a href="#">나의 문의내역</a></dt>
		                        <dd><a href="#">1:1 문의</a></dd>
		                    </dl>
		                </div>
		            </div>
	        	</div>
	
	            <!-- 오른쪽 세부 페이지 -->
	            <div class="mypage_content">
	                <h1 class="detail_title">내가 본 영화</h1>
	                <ul id="detail_box1">
	                    <li class="content_box">
	                        <div class="img_wrap"><a href="#"><img src="/images/spiderman.jpg" alt=""></a></div>
	                        <div class="content_wrap">
	                            <div class="title_wrap">
	                                <h4 class="movie_title">보이스</h4>
	                                <span class="movie_title_eng">On the Line</span>
	                            </div>
	                            <div class="date_wrap">
	                                <span class="watched_date">2021.10.07</span> <!--관람일-->
	                                <span class="watched_day">(목)</span><!--관람요일-->
	                                <span class="watched_time">21:15 ~ 23:14</span> <!--관람시간-->
	                            </div>
	                            <div class="location_wrap">
	                                <span class="theater_name">CGV하단아트몰링 [백신패스관] 4관 14층</span>
	                                <span class="person_count">2명</span>
	                            </div>
	                            <div class="myreview_wrap">
	                                <div class="review_icon good_icon"></div>
	                            </div>
	                        </div>
	                        <button class="delete_btn" type="button"></button>
	                    </li>
	                </ul> 
	            </div>
        	</article>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>