<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV ADMIN | 최신 영화 리스트</title>
    <link rel="stylesheet" href="/css/latest_movie_list.css">
    <link rel="stylesheet" href="/css/admin_nav.css">
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
                        <li><a href="/admin/latest-movie-list?page=1" class="on">최신 영화 목록</a></li>
                        <li><a href="/admin/add-movie">영화 등록</a></li>
                    </ul>
                </nav>
	            <article class="kobisDataWrap">
	            	<h3>영화진흥위원회에 등록된 최신 영화 정보입니다.</h3>
            		<table border="1">
            			<tr class="listName">
            				<td></td>
            				<td>영화명(국문)</td> 				
            				<td>장르</td>       
            				<td>제작국가</td>     
            				<td>감독</td>  
            				<td>제작사</td>  
            				<td>개봉일</td>       
            				<td>제작상태</td>       
            			</tr>
		            	<c:forEach var="movieList" items="${movieListData }">
		            			<tr>
		            				<td>
		            					<input hidden="hidden" class="curPage" value="${movieList.curPage }">
		            					<input hidden="hidden" class="movieCd" value="${movieList.movieCd }">
		            					<button type="button" class="goAddMovieBtn">등록</button>
		            				</td>
		            				<td>${movieList.movieNm }</td>
		            				<td>${movieList.genreAlt }</td>
		            				<td>${movieList.repNationNm }</td>
		            				<td>${movieList.directorNm }</td>
		            				<td>${movieList.companyNm }</td>
		            				<td>${movieList.openDt }</td>
		            				<td>${movieList.prdtStatNm }</td>
		            			</tr>	            		
		            	</c:forEach>
            		</table>
                    <div class="pageController">
                        <button class="prePage">&lt;</button>
                        <div class="indexWrap">
	                        
                        </div>
                        <button class="nextPage">&gt;</button>
                    </div>
	            </article>
	         </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/js/latest_movie_list.js"></script>
</body>
</html>