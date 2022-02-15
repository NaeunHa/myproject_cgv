<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 무비차트</title>
    <link rel="stylesheet" href="/css/movie_chart.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="movie_chart">
        <div class="contents">
            <div class="list_container">
                <h1 class="list_title">무비차트</h1>
                <div class="list_content">
                    <ul class="movie_list">
                        
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/get_movie_chart.js"></script>
</body>
</html>