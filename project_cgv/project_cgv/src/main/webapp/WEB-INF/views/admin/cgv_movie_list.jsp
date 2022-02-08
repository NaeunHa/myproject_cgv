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
    <title>CGV ADMIN | CGV 영화 목록</title>
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
                    <h3>CGV에 저장되어있는 영화 목록입니다.</h3>

                </article>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>