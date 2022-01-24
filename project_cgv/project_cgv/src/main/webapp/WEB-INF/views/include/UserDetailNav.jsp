<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
    
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
    <div class="nav_box active">
        <a href="/user/my-cgv/watched">
            <span class="movie_count">31</span>
            <span class="nav_title">내가 본 영화</span>
        </a>
    </div>
    <div class="nav_box">
        <a href="/user/my-cgv/review">
            <span class="movie_count">1</span>
            <span class="nav_title">내가 쓴 평점</span>
        </a>
    </div>
</article>