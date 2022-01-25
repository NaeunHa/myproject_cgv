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
    <title>CGV | 마이페이지</title>
    <link rel="stylesheet" href="/css/mypage.css">
    <link rel="stylesheet" href="/css/modal.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="mypage">
        <div class="contents">
            <div class="info_wrap">       
                <div class="my_info info_box">
                    <div class="user_profile"><img class="profile_img" src="/image/${principal.user.profile_img }"></div>
                    <h1>${(empty principal.user.nickname) ? (principal.user.username) : (principal.user.nickname)}님</h1>
                    <span>${principal.user.userid }</span>
                    <button type="button" class="modify_btn"></button>
                </div>
                <div class="sub_info_box info_box">
                    <div class="sub_info">
                        <div>
                            <h2>MEMBERSHIP</h2>
                            <span>나의 멤버쉽 등급</span>
                        </div>
                        <div><strong>${principal.user.membership_level }</strong></div>
                        
                    </div>
                    <div class="sub_info">
                        <div>
                            <h2>CGV POINT</h2>
                            <span>사용가능 포인트</span>
                        </div>
                        <div><strong>${principal.user.point }</strong> 점</div>
                    </div>
                </div>
            </div>
            <div class="wish box_container">
                <div class="description_box">
                    <h3>기대되는 영화</h3>
                    <a href="/user/my-cgv/wish">더보기</a>
                </div>
                <ul class="inner_box">
                    <li class="empty">찜한 영화가 존재하지 않습니다.</li>
                    <li class="content_box">
                    	<!-- js로 정보 가공시켜서 innerHTML -->
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
                    <a href="/user/my-cgv/watched">더보기</a>
                </div>
                <ul class="inner_box">
                    <li class="empty">관람한 영화가 존재하지 않습니다.</li>
                    <li class="content_box" >
                       	<!-- js로 정보 가공시켜서 innerHTML -->
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
                    <a href="/user/my-cgv/review">더보기</a>
                </div>
                <ul class="inner_box">
                    <li class="empty">작성한 리뷰가 존재하지 않습니다.</li>
                    <li class="content_box">
                    	<!-- js로 정보 가공시켜서 innerHTML -->
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
        
        <div id="modal" class="">
            <div class="window">
                <div class="popup">
                    <div class="modal_title">나의 프로필 수정</div>
                    <div id="mp_content" class="modal_content">
                        <div class="user_wrap">
                        	<input type="hidden" class="userid" value="${principal.user.userid }">
                            <h1>${principal.user.username }님</h1>
                            <span>${principal.user.userid }</span>
                        </div>
                        <div class="content_wrap">
                        	<form id="update_form" action="">
	                            <dl>
	                                <dt>닉네임</dt>
	                                <dd>
	                                    <span>한글, 영문, 숫자 혼용 가능(한글기준 10자 이내)</span>
	                                    <div class="input_wrap">
	                                        <input type="text" class="nickname" name="nickname" maxlength="10">
	                                        <button type="button" class="check_btn" onclick="checkNickName()">중복확인</button>
	                                    </div>
	                                </dd>
	                            </dl>
	                            <dl>
	                                <dt>프로필 이미지</dt>
	                                <dd>
	                                   	<div class="img_wrap"><img class="user_img" src="/image/${principal.user.profile_img }" alt=""></div>
	                                   	<span>JPG, GIF, BMP 파일만 등록 가능합니다. (최대 3M)</span>
	                                   	<input type="file" name="file" class="file_btn" onchange="lodaImg()" value="파일 선택">
	                                </dd>
	                            </dl>
                        	</form>
                        </div>
                        <div class="btn_wrap">
                            <button type="button" class="submit_btn" onclick="update_info()">등록하기</button>
                            <button type="button" class="cancle_btn">취소</button>
                        </div>
                    </div>
                    <button class="close_btn" type="button"></button>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/mypage.js"></script>
</body>
</html>