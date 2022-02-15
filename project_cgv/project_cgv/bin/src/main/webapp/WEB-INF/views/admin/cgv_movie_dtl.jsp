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
    <title>CGV ADMIN | CGV 영화 상세정보</title>
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
                        <li><a href="/admin/cgv-movie-list" class="on">CGV 영화 목록</a></li>
                        <li><a href="/admin/latest-movie-list?page=1">최신 영화 목록</a></li>
                        <li><a href="/admin/add-movie">영화 등록</a></li>
                    </ul>
                </nav>
                <article>
                    <h3>cgv에 등록된 영화 <strong>"${movieData.movie_title_kor }"</strong> 의 정보 입니다.</h3>
                    <form>
	                    <div class="table_wrap">	                    			
                            <dl>
                                <dt>영화코드</dt>
                                <dd><input type="text" name="movie_code" value="${movieData.movie_code }" readonly="readonly"></dd>
                            </dl>
                            <dl>
                                <dt>영화명(국문)</dt>
                                <dd><input type="text" name="movie_title_kor" class="item_ip" value="${movieData.movie_title_kor}" ></dd>
                            </dl>
                            <dl>
                                <dt>영화명(영문)</dt>
                                <dd><input type="text" name="movie_title_eng" class="item_ip" value="${movieData.movie_title_eng }"></dd>
                            </dl>
                            <dl>
                                <dt>장르</dt>
                                <dd><input type="text" name="movie_genre" value="${movieData.movie_genre }"></dd>
                            </dl>
                            <dl>
                            	<dt>제작국가</dt>
                            	<dd><input type="text" name="movie_nation" value="${movieData.movie_nation }"></dd>
                            </dl>
                            <dl>
                                <dt>감독</dt>
                                <dd><input type="text" name="movie_director" value="${movieData.movie_director }"></dd>
                            </dl>
                            <dl>
                                <dt>배우</dt>
                                <dd>
                                	<textarea name="movie_actors" class="movie_actors">${movieData.movie_actors }</textarea>
                                </dd>
                            </dl>
                            <dl>
                                <dt>개봉일</dt>
                                <dd><input type="text" name="movie_release_date" value="${movieData.movie_release_date }"></dd>
                            </dl>
                            <dl>
                                <dt>상영종료일</dt>
                                <dd><input type="text" name="movie_close_date" class="date_item" value="${movieData.movie_close_date }"></dd>
                            </dl>
                            <dl>
                                <dt>시청연령</dt>
                                <dd class="radio_limited_age">
                                	<input type="hidden" class="watchGradeNm" value="${movieData.movie_limited_age }">
                                    <input type="radio" class="radio_age" name="movie_limited_age" id="11" value="all" checked><label for="11">전체</label>
                                    <input type="radio" class="radio_age" name="movie_limited_age" id="12" value="12"><label for="12">12세</label>
                                    <input type="radio" class="radio_age" name="movie_limited_age" id="15" value="15"><label for="15">15세</label>
                                    <input type="radio" class="radio_age" name="movie_limited_age" id="19" value="19"><label for="19">청소년 관람 불가</label>
                                    <input type="radio" class="radio_age" name="movie_limited_age" id="00" value="00"><label for="00">미정</label>
                                </dd>
                            </dl>
                            <dl>
                                <dt>상영시간</dt>
                                <dd>
                                    <input type="text" name="movie_runtime" value="${movieData.movie_runtime }" >
                                    <span>ex) 120분 -> 120</span>
                                </dd>
                            </dl>
                            <dl>
                                <dt>영화 설명</dt>
                                <dd><textarea name="movie_description" class="ip_item" maxlength="500" required>${movieData.movie_description }</textarea></dd>
                            </dl>
                            <dl>
                                <dt>포스터</dt>
                                <dd class="file_box">
                                    <img src="/image/${movieData.movie_poster_img }" alt="" class="poster_img">
                                    <input type="file" name="movie_poster_img" class="img_item" onchange="loadImg()">
                                </dd>
                            </dl>
                            <dl>
                                <dt>트레일러</dt>
                                <dd class="file_box">
                                	<video src="/image/${movieData.movie_trailer_mp4 }" class="trailer" autoplay="autoplay" controls="controls"></video>
                                    <input type="file" name="movie_trailer_mp4" class="media_item">
                                </dd>
                            </dl>
                        </div>
                        <div class="btn_wrap">
                            <button type="button" onclick="updateMovieSubmit()">수정하기</button>
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