<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 아이디찾기</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/find.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
    <section id="find">
        <div class="contents">
            <div class="find_container">
                <div class="tab_wrap">
                    <div class="tab">아이디 찾기</div>
                    <div class="tab off">비밀번호 찾기</div>
                </div>
                <div class="find_wrap">
                    <div class="description">
                        <h3>아이디 찾기</h3>
                        <span>아이디가 기억나지 않으세요? 원하시는 방법을 선택하여 아이디를 확인하실 수 있습니다.</span><br>
                        <span>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</span>
                    </div>
                    <div class="find_box">
                        <div class="box_title"><h3>아이디 찾기</h3></div>
                        <div class="box_content">
                            <h3>휴대폰 인증을 통해 본인인증 후 아이디 찾기를 할 수 있습니다.</h3>
                            <div class="inner_box">
                                <h4>휴대폰으로 찾기</h4>
                                <div>
                                    <input type="text" placeholder="010" readonly> -
                                    <input type="text" id="phone_middle"> - 
                                    <input type="text" id="phone_end">
                                    <button type="button" class="certification_btn">인증하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact_wrap">
                    <dl>
                        <dt><h3>이용문의</h3></dt>
                        <dd>
                            <span>CGV 고객센터 : 1544-1122</span>
                            <span>문의 가능 시간 : 월~금 09:00~18:00 (이 외 시간은 자동응답 안내 가능)</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </section>
</body>
</html>