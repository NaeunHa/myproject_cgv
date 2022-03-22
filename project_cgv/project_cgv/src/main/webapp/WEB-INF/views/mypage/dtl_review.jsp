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
    <link rel="stylesheet" href="/css/mypage_nav.css">
    <link rel="stylesheet" href="/css/mypage_dtl.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section  id="mypage">
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
		                        <dd><a href="/user/my-cgv/watched">내가 본 영화</a></dd>
		                        <dd class="now"><a href="/user/my-cgv/review">내가 쓴 평점</a></dd>
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
		                        <dt><a href="/user/account/redirect/personal">회원정보</a></dt>
					            <dd><a href="/user/account/redirect/personal">개인정보 변경</a></dd>
					            <dd><a href="/user/account/redirect/withdrawal">회원탈퇴</a></dd>
		                    </dl>
		                    <dl>
		                        <dt><a href="#">나의 문의내역</a></dt>
		                        <dd><a href="#">1:1 문의</a></dd>
		                    </dl>
		                </div>
		            </div>
		        </div>

	            <!-- 오른쪽 세부 페이지 -->
	            <div  class="mypage_content">
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
	            </div>
        	</article>
        </div>
        
        
        <!-- 모달창 -->
        <div class="modal" class="">
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