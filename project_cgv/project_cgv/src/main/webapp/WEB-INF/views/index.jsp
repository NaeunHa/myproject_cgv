<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>영화 그 이상의 감동. CGV</title>
    <link rel="stylesheet" href="/css/index.css">
  
</head>
<body>
    <div id="main_container">
        <jsp:include page="include/header.jsp"></jsp:include>
        <section id="banner">
            <div class="contents">
                <div class="video_wrap">
                    <video autoplay muted>
                        <source type="video/mp4" src="/video/teuksong_1080x608_0104.mp4">
                    </video>
                    <span class="banner_title">특송</span>
                    <span class="banner_description">성공률 100% 드라이버 박소담<br>1월 12일 대개봉</span>
                    <div class="banner_btns">
                        <a href="#" class="detail_btn">상세보기</a>
                        <a href="#" class="play_btn">Stop</a>
                        <a href="#" class="sound_btn">Sound On</a>
                    </div>
                </div>
            </div>
        </section>

        <section id="movie_lists">
            <div class="contents">
                <div class="controller">
                    <div class="ctr_left">무비차트</div>
                    <div class="ctr_right">
                        <a href="#" class="all_btn">전체보기</a>
                    </div>
                </div>
                <div class="slide_container movies_wrap">
                    <div class="slide">
                        <div class="movie">
                            <div class="img_wrap">
                                <div class="movie_poster">
                                    <img src="/images/spiderman.jpg" alt="">
                                </div>
                                <div class="limit_age">
                                    <img src="/images/grade-12.png" alt="">
                                </div>
                                <div class="d_day">
                                    <span>D-</span><span class="d_day_text">1</span>
                                </div>
                                <div class="chart_count">1</div>
                                <div class="movie_hover">
                                    <a href="#" class="movie_detail_btn">상세보기</a>
                                    <a href="#" class="movie_reserve_btn">예약하기</a>
                                </div>
                            </div>
                            <div class="movie_title"><a href="#">스파이더맨-노웨이 홈</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="event_lists">
            <div class="contents">
                <div class="controller">
                    <div class="ctr_left">EVENT</div>
                    <div class="ctr_right">
                        <a href="#" class="all_btn">전체보기</a>
                    </div>
                </div>
                <div class="slide_container event_wrap">
                    <ul class="slide">
                        <li class="event">
                            <div class="img_wrap"><a href="#"> <img src="/images/event2.jpg" alt=""></a></div>
                            <div class="event_title"><a href="#"><strong>PEAKERS 클라이밍짐 오픈</strong></a></div>
                            <div class="event_term"><span class="event_start_date">2022.01.07</span> ~ <span class="event_end_date">2022.01.31</span></div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <section id="shop">
            <div class="contents">
                <ul class="goods_list_wrap">
                    <li>
                        <dl class="goods_list">
                            <dt>영화관람권 <a href="" class="more_btn">더보기</a></dt>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/goods.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>CGV 영화관람권</h4><span>11,000원</span></div>
                                </a>
                            </dd>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/goods.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>CGV 영화관람권</h4><span>11,000원</span></div>
                                </a>
                            </dd>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/goods.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>CGV 영화관람권</h4><span>11,000원</span></div>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl class="goods_list">
                            <dt>기프트카드<a href="" class="more_btn">더보기</a></dt>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/giftcard.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>50000원권</h4><span>50,000원</span></div>
                                </a>
                            </dd>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/giftcard.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>30000원권</h4><span>30,000원</span></div>
                                </a>
                            </dd>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/giftcard.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>10000원권</h4><span>10,000원</span></div>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl class="goods_list">
                            <dt>콤보<a href="" class="more_btn">더보기</a></dt>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/combo.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>CGV 콤보</h4><span>9,000원</span></div>
                                </a>
                            </dd>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/combo.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>더블 콤보</h4><span>12,000원</span></div>
                                </a>
                            </dd>
                            <dd>
                                <a href="#">
                                    <div class="goods_img"><img src="/images/combo.jpg" alt=""></div>
                                    <div class="goods_info_wrap"><h4>스몰세트</h4><span>6,500원</span></div>
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </section>
        <section id="notice">
            <div class="contents">
                <div class="notice_container">
                    <div class="notice_wrap">
                        <div class="notice">
                            <h4>공지사항</h4>
                            <a href="" class="notice_content">[기타]22년 VIP 선정 기준 변경 및 추가 기준 관련 입니다</a>
                            <a class="more_btn" href="#">더보기</a>
                        </div>
                        <div class="client_wrap">
                            <div class="client">
                                <h4>고객센터</h4>
                                <div class="client_content">
                                    <h4>1544-1122</h4>
                                    <span>고객센터 운영시간 (평일 09:00~18:00)</span><br>
                                    <span>업무시간 외 자동응답 안내 가능합니다.</span>
                                </div>
                            </div>
                            <div class="client_btns">
                                <a href="#">FAQ</a>
                                <a href="#">1:1문의</a>
                                <a href="#">분실물 문의</a>
                                <a href="#">대관/단체 문의</a>
                            </div>
                        </div>
                    </div>
                    <div class="qr_container">
                        <h4>앱 다운로드</h4>
                        <span>CGV앱에서 더 편리하게 이용하세요</span>
                        <div class="qr_img"><img src="/images/img_qrcode.gif" alt=""></div>
                        <span>QR코드를 스캔하고</span>
                        <span>앱설치 페이지로 바로 이동하세요</span>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/footer.jsp"></jsp:include>
    </div>
    <script src="/js/index.js"></script>
    
</body>
</html>