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
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
    <div id="mypage">
        <div class="contents">
        
            <jsp:include page="../include/mypage_header.jsp"></jsp:include>
            
            <!-- 오른쪽 메뉴 -->
            <article class="mypage_container">   
                <jsp:include page="../include/mypage_nav.jsp"></jsp:include>
                <div class="mypage_content">
		            <div class="wish box_container">
		                <div class="description_box">
		                    <h3>기대되는 영화</h3>
		                    <a href="/user/my-cgv/wish">더보기</a>
		                </div>
		                <ul class="inner_box">
		                    <li class="empty">찜한 영화가 존재하지 않습니다.</li>
		                    <!-- <li class="content_box">
		                    	js로 정보 가공시켜서 innerHTML
		                        <a href="/user/movies/detail-view">
		                            <h4>특송</h4>
		                            <img src="/images/poster2.jpg" alt="" class="poster_img">
		                            <img src="/images/grade-12.png" alt="" class="grade_img">
		                            <span>2022.01.12 개봉</span>
		                        </a>
		                    </li> -->
		                </ul>
		            </div>
		            <div class="watched box_container">
		                <div class="description_box">
		                    <h3>내가 본 영화</h3>
		                    <a href="/user/my-cgv/watched">더보기</a>
		                </div>
		                <ul class="inner_box">
		                    <li class="empty">관람한 영화가 존재하지 않습니다.</li>
		                    <!-- <li class="content_box" >
		                       	js로 정보 가공시켜서 innerHTML
		                        <a href="#">
		                            <h4>웨스트 사이드 스토리</h4>
		                            <img src="/images/poster2.jpg" alt="" class="poster_img">
		                            <img src="/images/grade-12.png" alt="" class="grade_img">
		                            <span>2022.01.12 개봉</span>
		                        </a>
		                    </li> -->
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
		                    <!-- <li class="content_box">
		                    	js로 정보 가공시켜서 innerHTML
		                        <a href="/movies/detail-view">
		                            <h4>스파이더맨-노웨이홈</h4>
		                            <img src="/images/poster2.jpg" alt="" class="poster_img">
		                            <img src="/images/grade-12.png" alt="" class="grade_img">
		                            <span>2022-01-14 관람</span>
		                        </a>
		                    </li> -->
		                </ul>
		            </div>
		       	</div>
		    </article>
        </div>  
    </div>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>