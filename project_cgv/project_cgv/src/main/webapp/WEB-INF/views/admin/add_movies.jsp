<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ADMIM')"></sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV ADMIN | 영화 추가</title>
    <link rel="stylesheet" href="/css/add_movies.css">
    <link rel="stylesheet" href="/css/admin_nav.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
   	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="admin">
        <div class="contents">
            <div class="container">
                <nav>
                    <h2>영화 관리</h2>
                    <ul>
                        <li><a href="/admin/cgv-movie-list">CGV 영화 목록</a></li>
                        <li><a href="/admin/latest-movie-list?page=1">최신 영화 목록</a></li>
                        <li><a href="/admin/add-movie" class="on">영화 등록</a></li>
                    </ul>
                </nav>
                <article>
                    <h3>상영할 영화의 정보를 등록합니다.</h3>
                    <form>
	                    <c:choose>
	                    	<c:when test="${not empty movieDetailData }">
	                    		<div class="table_wrap">	                    			
		                            <dl>
		                                <dt>영화코드</dt>
		                                <dd><input type="text" name="movie_code" value="${movieDetailData.movieCd }"></dd>
		                            </dl>
		                            <dl>
		                                <dt>영화명(국문)</dt>
		                                <dd><input type="text" name="movie_title_kor" value="${movieDetailData.movieNm }"></dd>
		                            </dl>
		                            <dl>
		                                <dt>영화명(영문)</dt>
		                                <dd><input type="text" name="movie_title_eng" value="${movieDetailData.movieNmEn }"></dd>
		                            </dl>
		                            <dl>
		                                <dt>장르</dt>
		                                <dd><input type="text" name="movie_genre" value="${movieDetailData.genreNm }"></dd>
		                            </dl>
		                            <dl>
		                            	<dt>제작국가</dt>
		                            	<dd><input type="text" name="movie_nation" value="${movieDetailData.nationNm }"></dd>
		                            </dl>
		                            <dl>
		                                <dt>감독</dt>
		                                <dd><input type="text" name="movie_director" value="${movieDetailData.directorNm }"></dd>
		                            </dl>
		                            <dl>
		                                <dt>배우</dt>
		                                <dd>
		                                	<textarea name="movie_actors" class="movie_actors">${movieDetailData.actorsNm }</textarea>
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>개봉일</dt>
		                                <dd><input type="text" name="movie_release_date" value="${movieDetailData.openDt }"></dd>
		                            </dl>
		                            <dl>
		                                <dt>상영종료일</dt>
		                                <dd><input type="text" name="movie_close_date" class="date_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>시청연령</dt>
		                                <dd class="radio_limited_age">
		                                	<input type="hidden" class="watchGradeNm" value="${movieDetailData.watchGradeNm }">
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="all" checked>전체
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="12">12세
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="15">15세
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="19">청소년 관람 불가
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="undefined">미정
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>상영시간</dt>
		                                <dd>
		                                    <input type="text" name="movie_runtime" value="${movieDetailData.showTm }" >
		                                    <span>ex) 120분 -> 120</span>
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>영화 설명</dt>
		                                <dd><textarea name="movie_description" class="ip_item" maxlength="500" required></textarea></dd>
		                            </dl>
		                            <dl>
		                                <dt>포스터</dt>
		                                <dd class="file_box">
		                                    <img src="/image/movie_poster/default_poster.png" alt="" class="poster_img">
		                                    <input type="file" name="movie_poster_img" class="img_item" onchange="loadImg()">
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>트레일러</dt>
		                                <dd class="file_box">
		                                    <input type="file" name="movie_trailer_mp4" class="media_item">
		                                </dd>
		                            </dl>
		                        </div>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<div class="table_wrap">
		                            <dl>
		                                <dt>영화코드</dt>
		                                <dd><input type="text" name="movie_code" class="ip_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>영화명(국문)</dt>
		                                <dd><input type="text" name="movie_title_kor" class="ip_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>영화명(영문)</dt>
		                                <dd><input type="text" name="movie_title_eng" class="ip_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>장르</dt>
		                                <dd><input type="text" name="movie_genre" class="ip_item"></dd>
		                            </dl>
		                            <dl>
		                            	<dt>제작국가</dt>
		                            	<dd><input type="text" name="movie_nation"></dd>
		                            </dl>
		                            <dl>
		                                <dt>감독</dt>
		                                <dd><input type="text" name="movie_director" class="ip_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>배우</dt>
		                                <dd><textarea name="movie_actors" class="ip_item"></textarea></dd>
		                            </dl>
		                            <dl>
		                                <dt>개봉일</dt>
		                                <dd><input type="text" name="movie_release_date" class="date_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>상영종료일</dt>
		                                <dd><input type="text" name="movie_close_date" class="date_item"></dd>
		                            </dl>
		                            <dl>
		                                <dt>시청연령</dt>
		                                <dd class="radio_limited_age">
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="all" checked>전체
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="12">12세
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="15">15세
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="19">청소년 관람 불가
		                                    <input type="radio" class="radio_age" name="movie_limited_age" value="undefined">미정
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>상영시간</dt>
		                                <dd>
		                                    <input type="text" name="movie_runtime" class="ip_item">
		                                    <span>ex) 120분 -> 120</span>
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>영화 설명</dt>
		                                <dd><textarea type="text" name="movie_description" class="ip_item"></textarea></dd>
		                            </dl>
		                            <dl>
		                                <dt>포스터</dt>
		                                <dd class="file_box">
		                                    <img src="/image/movie_poster/default_poster.png" alt="" class="poster_img">
		                                    <input type="file" name="movie_poster_img" class="img_item" onchange="loadImg()" >
		                                </dd>
		                            </dl>
		                            <dl>
		                                <dt>트레일러</dt>
		                                <dd class="file_box">
		                                    <input type="file" name="movie_trailer_mp4" class="media_item">
		                                </dd>
		                            </dl>
		                        </div>
	                    	</c:otherwise>
                        </c:choose>
                        <div class="btn_wrap">
                            <button type="button" onclick="addMovieSubmit()">등록하기</button>
                        </div>
                    </form>
                </article>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/add_movies.js"></script>
</body>
</html>