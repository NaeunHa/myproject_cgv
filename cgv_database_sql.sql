-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- cgv 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `cgv` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `cgv`;

-- 테이블 cgv.membership_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership_mst` (
  `id` int(11) NOT NULL,
  `membership_level` varchar(50) NOT NULL,
  `point` int(11) NOT NULL,
  `point_create_date` date NOT NULL,
  `point_update_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.membership_mst:~4 rows (대략적) 내보내기
DELETE FROM `membership_mst`;
/*!40000 ALTER TABLE `membership_mst` DISABLE KEYS */;
INSERT INTO `membership_mst` (`id`, `membership_level`, `point`, `point_create_date`, `point_update_date`) VALUES
	(10, '일반', 1000, '2022-01-25', '2022-01-25'),
	(11, '일반', 1000, '2022-01-25', '2022-01-25'),
	(16, '일반', 1000, '2022-01-26', '2022-01-26'),
	(18, '일반', 1000, '2022-02-07', '2022-02-07');
/*!40000 ALTER TABLE `membership_mst` ENABLE KEYS */;

-- 테이블 cgv.movie_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_mst` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_code` varchar(50) NOT NULL,
  `movie_title_kor` varchar(100) NOT NULL,
  `movie_title_eng` varchar(50) NOT NULL,
  `movie_genre` varchar(50) NOT NULL,
  `movie_nation` varchar(50) NOT NULL,
  `movie_limited_age` varchar(10) NOT NULL,
  `movie_description` varchar(700) NOT NULL,
  `movie_director` varchar(50) NOT NULL,
  `movie_actors` varchar(300) NOT NULL,
  `movie_runtime` varchar(10) NOT NULL,
  `movie_poster_img` varchar(100) NOT NULL,
  `movie_trailer_mp4` varchar(100) DEFAULT NULL,
  `movie_release_date` varchar(50) NOT NULL,
  `movie_close_date` varchar(50) NOT NULL,
  `movie_create_date` datetime NOT NULL,
  `movie_update_date` datetime NOT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE,
  UNIQUE KEY `movie_code` (`movie_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.movie_mst:~9 rows (대략적) 내보내기
DELETE FROM `movie_mst`;
/*!40000 ALTER TABLE `movie_mst` DISABLE KEYS */;
INSERT INTO `movie_mst` (`movie_id`, `movie_code`, `movie_title_kor`, `movie_title_eng`, `movie_genre`, `movie_nation`, `movie_limited_age`, `movie_description`, `movie_director`, `movie_actors`, `movie_runtime`, `movie_poster_img`, `movie_trailer_mp4`, `movie_release_date`, `movie_close_date`, `movie_create_date`, `movie_update_date`) VALUES
	(2, '20188441', '킹메이커', 'Kingmaker', '드라마', '한국', '15', '세상 바뀌는 꼴 좀 보고 싶습니다\r\n\r\n세상을 바꾸기 위해 도전하는 정치인 ‘김운범’ 앞에\r\n그와 뜻을 함께하고자 선거 전략가 ‘서창대’가 찾아온다.\r\n\r\n열세인 상황 속에서 서창대는 아무도 상상하지 못한 선거 전략을 펼치고\r\n‘김운범’은 선거에 연이어 승리하며, 당을 대표하는 대통령 후보까지 올라서게 된다.\r\n\r\n대통령 선거를 향한 본격적인 행보가 시작되고 그들은 당선을 위해 총력을 기울인다. \r\n\r\n그러던 중 ‘김운범’ 자택에 폭발물이 터지는 사건이 발생하고\r\n용의자로 ‘서창대’가 지목되면서 둘의 관계는 새로운 국면을 맞이하게 되는데...\r\n\r\n치열한 선거판,\r\n그 중심에 있던 두 남자의 이야기가 시작된다!', '변성현', '설경구, 이선균, 유재명, 조우진, 박인환, 이해영, 김성오, 전배수, 서은수, 김종수, 윤경호, 김새벽, 정우혁, 이화룡, 배종옥', '123', 'movie_poster/20188441/20188441_0126.jpg', 'movie_trailer/20188441/20188441_0126.mp4', '20220126', '20220226', '2022-02-08 20:16:49', '2022-02-08 20:16:49'),
	(5, '20208006', '인민을 위해 복무하라', 'SERVE THE PEOPLE', '멜로/로맨스, 드라마', '한국', '19', '“저에게, 한 번만 더 기회를 주십시오”\r\n\r\n모범사병으로 사단장 사택의 취사병이 된 ‘무광’\r\n그의 목표는 오직 아내와 아이를 위해 출세의 길에 오르는 것이다\r\n\r\n그러나, 사단장이 출장을 간 사이 시작된 \r\n그의 젊은 아내 ‘수련’의 위험한 유혹에\r\n\r\n‘무광’은 자신의 목표와 신념 그리고\r\n빠져보고 싶은 금기된 사랑 사이에서 갈등을 겪는데…\r\n\r\n2월 23일, 빠져보고 싶은 유혹\r\n스크린에 뜨겁게 피어나다!', '장철수', '연우진, 지안, 조성하', '146', 'movie_poster/20208006/20208006_0223.jpg', 'movie_trailer/20208006/20208006_0223.mp4', '20220223', '20220323', '2022-02-10 16:58:07', '2022-02-10 16:58:07'),
	(6, '20192354', '특송', 'Special Delivery', '범죄, 액션', '한국', '15', '2022년을 여는 가장 짜릿한 범죄 오락 액션의 탄생!\r\n\r\n예상치 못한 배송사고로 걷잡을 수 없는 사건에 휘말린\r\n특송 전문 드라이버 ‘은하’.\r\n어쩌다 맡게 된 반송 불가 수하물에 출처를 알 수 없는 300억까지!\r\n경찰과 국정원의 타겟이 되어\r\n도심 한복판 모든 것을 건 추격전을 벌이게 되는데…\r\n\r\nNO브레이크! FULL엑셀!\r\n성공률 100% 특송 전문 드라이버가 온다!', '박대민', '박소담, 송새벽, 김의성, 정현준, 연우진, 염혜란, 한현민, 허동원, 오륭, 조희봉, 백도겸, 권혁범, 김예은, 윤대열, 박신운, 유지수, 강준규, 박인수, 양희명, 박대원, 신수오, 김한수, 차시원, 김현민, 정승현, 박혜영, 유수정, 김그림, 한규원, 안재현, 이가경, 강민지, 신영훈, 황원규, 김수로, 문성복, 김기정, 오세환, 원진호, 고영수, 전석호, 최덕문, 유승호', '108', 'movie_poster/20192354/20192354_0112.jpg', 'movie_trailer/20192354/20192354_0112.mp4', '20220112', '20220212', '2022-02-10 17:58:52', '2022-02-10 17:58:52'),
	(7, '20201965', '해적: 도깨비 깃발', 'The Pirates : The Last Royal Treasure', '어드벤처, 액션, 코미디', '한국', '12', '“가자, 보물 찾으러!” \r\n\r\n자칭 고려 제일검인 의적단 두목 ‘무치’(강하늘)와 \r\n바다를 평정한 해적선의 주인 ‘해랑’(한효주).  \r\n한 배에서 운명을 함께하게 된 이들이지만\r\n산과 바다, 태생부터 상극으로 사사건건 부딪히며 바람 잘 날 없는 항해를 이어간다. \r\n\r\n그러던 어느 날, 왜구선을 소탕하던 이들은 \r\n흔적도 없이 사라진 왕실의 보물이 어딘가 숨겨져 있다는 사실을 알게 되고 \r\n해적 인생에 다시없을 최대 규모의 보물을 찾아 위험천만한 모험에 나서기 시작한다. \r\n\r\n하지만 사라진 보물을 노리는 건 이들뿐만이 아니었으니! \r\n원하는 것을 얻기 위해 수단과 방법을 가리지 않는 역적 ‘부흥수’(권상우) 또한 \r\n보물을 차지하기 위해 바다에 뛰어드는데...! \r\n\r\n해적과 의적, 그리고 역적 \r\n사라진 보물! 찾는 자가 주인이다! ', '김정훈', '강하늘, 한효주, 이광수, 권상우, 채수빈, 오세훈, 김성오, 박지환', '125', 'movie_poster/20201965/20201965_0126.jpg', 'movie_trailer/20201965/20201965_0126.mp4', '20220126', '20220226', '2022-02-10 18:03:36', '2022-02-10 18:03:36'),
	(8, '20209185', '온 세상이 하얗다', 'And There was Light', '멜로/로맨스, 드라마', '한국', '15', '죽고 싶어하는 한 남자와 한 여자\r\n\r\n한 남자가 있다.\r\n매일 죽음을 다짐하지만 알코올성 치매로 의도치 않게 거짓말을 하며 다짐을 잊고 살고 있다.\r\n\r\n한 여자가 있다.\r\n그냥 습관적으로 거짓말을 하며 우울함과 무력감으로 죽을 결심을 한다.\r\n\r\n김모인과 류화림이 우연히 만났다.\r\n그리고 함께 죽기 위해 태백으로 향했다.\r\n\r\n한 남자와 한 여자는 까마귀숲에 도착했고,\r\n눈이 내리기 시작했다…\r\n\r\n온 세상이 하얗다', '김지석', '강길우, 박가영', '107', 'movie_poster/20209185/20209185_0210.jpg', 'movie_trailer/20209185/20209185_0210.mp4', '20220210', '20220310', '2022-02-10 18:05:17', '2022-02-10 18:05:17'),
	(9, '02100001', '극장판 주술회전 0', 'Jujutsu Kaisen: Zero', '애니메이션', '일본', '15', '어릴 적 소꿉친구인 오리모토 리카를 교통사고로 눈앞에서 잃은 옷코츠 유타.\r\n\r\n“약속해, 리카와 유타는 어른이 되면 결혼하기로”\r\n옷코츠는 원령으로 변한 리카의 저주에 괴로워한 나머지, 자신도 죽기를 바라지만 최강의 주술사인 고죠 사토루에 의해 주술고전에 들어가게 된다. 그리고 동급생인 젠인마키, 이누마키 토게, 판다를 만나면서 굳은 결심을 한다.\r\n\r\n“살아도 된다는 자신감이 필요해”\r\n“나는 주술고전에서 리카의 저주를 풀겠습니다”\r\n한편, 옷코츠와 친구들 앞에 과거에 일반인을 대량으로 학살해서 고전에서 추방된 최악의 주저사인 게토 스구루가 나타난다.\r\n\r\n“12월 24일, 우리는 백귀야행을 결행한다”\r\n주술사만의 낙원을 만들려는 게토는 비술사를 섬멸하겠다면서, 신주쿠와 교토에 천의 저주를 내리는데…과연 옷코츠는 게토를 막을 수 있을까? 그리고리카의 저주를 풀 수 있을까?', '박성후', '오가타 메구미, 하나자와 카나, 코마츠 미카코, 우치야마 코우키, 세키 토모카즈, 나카무라 유이치, 사쿠라이 타카히로', '105', 'movie_poster/02100001/02100001_0217.jpg', 'movie_trailer/02100001/02100001_0217.mp4', '20220217', '20220317', '2022-02-10 18:13:38', '2022-02-10 18:13:38'),
	(10, '02100002', '듄', 'DUNE', 'SF', '미국, 캐나다, 헝가리', '12', '“듄을 지배하는 자가 우주를 지배한다!”\r\n\r\n10191년, 아트레이데스 가문의 후계자인 폴(티모시 샬라메)은 시공을 초월한 존재이자 \r\n전 우주를 구원할 예지된 자의 운명을 타고났다. \r\n그리고 어떤 계시처럼 매일 꿈에서 아라키스 행성에 있는 한 여인을 만난다. \r\n모래언덕을 뜻하는 \'듄\'이라 불리는 아라키스는 물 한 방울 없는 사막이지만 \r\n우주에서 가장 비싼 물질인 신성한 환각제 스파이스의 유일한 생산지로 이를 차지하기 위한 전쟁이 치열하다. \r\n황제의 명령으로 폴과 아트레이데스 가문은 죽음이 기다리는 아라키스로 향하는데…\r\n\r\n위대한 자는 부름에 응답한다, 두려움에 맞서라, 이것은 위대한 시작이다!', '드니 빌뇌브', '티모시 샬라메, 레베카 퍼거슨, 오스카 아이삭, 제이슨 모모아, 조슈 브롤린, 젠데이아 콜먼, 하비에르 바르뎀, 스텔란 스카스가드, 장첸, 샤론 던컨 브루스터, 데이브 바티스타, 데이빗 다스트말치안', '155', 'movie_poster/02100002/02100002_0209.jpg', 'movie_trailer/02100002/02100002_0209.mp4', '20220209', '20220309', '2022-02-10 18:16:46', '2022-02-10 18:16:46'),
	(11, '02100003', '언차티드', 'Uncharted', '액션, 어드벤처', '미국', '12', '모든 것을 걸었다면 세상 누구보다 빠르게 찾아야 한다!\r\n평범한 삶을 살던 ‘네이선’(톰 홀랜드)은 인생을 바꿀 뜻밖의 제안을 받는다.\r\n그의 미션은 위험한 트레져 헌터 ‘설리’(마크 월버그)와 함께 사라진 형과 500년 전 잃어버린 천문학적인 가치를 지닌 트레져를 찾아내는 것.\r\n\r\n그러나 몬카다(안토니오 반데라스)의 위협과 추격 속,\r\n누구보다 빠르게 미지의 세계에 닿기 위해 결단을 내려야만 하는데…', '루벤 플레셔', '톰 홀랜드, 마크 월버그, 소피아 알리, 타티 가브리엘, 안토니오 반데라스', '116', 'movie_poster/02100003/02100003_0216.jpg', 'movie_trailer/02100003/02100003_0216.mp4', '20220216', '20220316', '2022-02-10 18:19:13', '2022-02-10 18:19:13'),
	(12, '02100004', '해리 포터와 불사조 기사단', 'Harry Potter And The Order Of The Phoenix', '환타지, 액션, 어드벤처', '미국, 영국', '11', '호그와트 최대 위기! 볼드모트 그가 돌아왔다!\r\n어둠의 세력에 빠진 호그와트를 구하기 위해 해리포터와 불사조 기사단, 그들이 손을 잡았다!\r\n\r\n호그와트 마법학교에서 5번째 해를 맞이하게 된 해리포터(다니엘 래드클리프). 헤르미온느(엠마 왓슨)와 론(루퍼트 그린트)과의 관계도 소원하고 예언자 일보는 해리에 대해 악의적인 소문을 퍼뜨려 해리를 곤경에 빠뜨린다. 초챙(케이티 렁)과의 로맨스도 힘에 겹다. 게다가 마법부는 볼드모트(랄프 파인즈)가 돌아왔다는 이야기를 애써 모른 체 하려 하고 오히려 호그와트 교장 덤블도어가 헛소문을 퍼트려 마법부의 권위를 실추시킨다며 비난한다. 여기에 마법부 장관 코넬리우스 퍼지는 새로운 어둠의 방어술 교수 자리에 자신의 심복 돌로레스 엄브리지를 임명해 덤블도어와 학생들을 감시하게 한다. 형편없는 그의 수업은 어둠의 마법에 대한 학생들의 방어능력을 한심한 수준으로 격하시킨다.\r\n\r\n이제 해리포터는 호그와트로 다시 돌아온 악의 세력 볼드모트에 대항하기 위해 만들어진 마법사들의 비밀단체 불사조기사단과 함께 볼드모트와 죽음의 대결은 준비한다.\r\n그 와중에 해리는 소중한 사람의 죽음까지 맞이하는 아픔을 겪게 되는데…\r\n\r\n위기에 빠진 호그와트!\r\n해리포터와 불사조 기사단, 모든 것이 그들 손에 달렸다!!', '데이빗 예이츠', '다니엘 래드클리프 ,  엠마 왓슨 ,  루퍼트 그린트', '137', 'movie_poster/02100004/02100004_0209.jpg', NULL, '20220209', '20220309', '2022-02-10 18:54:20', '2022-02-10 18:54:20');
/*!40000 ALTER TABLE `movie_mst` ENABLE KEYS */;

-- 테이블 cgv.movie_reserve 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_reserve` (
  `reserve_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_code` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `amount_of_payment` int(11) NOT NULL DEFAULT 0,
  `teater_id` varchar(50) NOT NULL,
  `theater_num` int(11) NOT NULL,
  `seat_row` int(11) NOT NULL,
  `seat_column` varchar(50) NOT NULL,
  PRIMARY KEY (`reserve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.movie_reserve:~0 rows (대략적) 내보내기
DELETE FROM `movie_reserve`;
/*!40000 ALTER TABLE `movie_reserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_reserve` ENABLE KEYS */;

-- 테이블 cgv.persistent_logins 구조 내보내기
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `series` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(64) NOT NULL DEFAULT '',
  `last_used` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.persistent_logins:~1 rows (대략적) 내보내기
DELETE FROM `persistent_logins`;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` (`username`, `series`, `token`, `last_used`) VALUES
	('daniel0888', '1tzLg4FpOQ9lnJEsehYKdg==', '2Rl3isZlO5aTcoP4OGK9YA==', '2022-01-27 14:52:16');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;

-- 테이블 cgv.review_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_mst` (
  `movie_code` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `review_feeling` varchar(10) NOT NULL,
  `review_text` varchar(280) NOT NULL,
  `like_count` int(11) DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.review_mst:~0 rows (대략적) 내보내기
DELETE FROM `review_mst`;
/*!40000 ALTER TABLE `review_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_mst` ENABLE KEYS */;

-- 테이블 cgv.theater_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `theater_mst` (
  `theater_id` int(10) NOT NULL,
  `city` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `theater_num` int(10) NOT NULL,
  PRIMARY KEY (`theater_id`) USING BTREE,
  UNIQUE KEY `teather_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.theater_mst:~0 rows (대략적) 내보내기
DELETE FROM `theater_mst`;
/*!40000 ALTER TABLE `theater_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `theater_mst` ENABLE KEYS */;

-- 테이블 cgv.theater_time 구조 내보내기
CREATE TABLE IF NOT EXISTS `theater_time` (
  `theater_id` int(10) NOT NULL,
  `movie_code` varchar(50) NOT NULL,
  `show-time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.theater_time:~0 rows (대략적) 내보내기
DELETE FROM `theater_time`;
/*!40000 ALTER TABLE `theater_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `theater_time` ENABLE KEYS */;

-- 테이블 cgv.user_dtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_dtl` (
  `id` int(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `profile_img` varchar(100) NOT NULL DEFAULT 'profile/default_profile.gif',
  `dtl_create_date` date NOT NULL,
  `dtl_update_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.user_dtl:~4 rows (대략적) 내보내기
DELETE FROM `user_dtl`;
/*!40000 ALTER TABLE `user_dtl` DISABLE KEYS */;
INSERT INTO `user_dtl` (`id`, `nickname`, `profile_img`, `dtl_create_date`, `dtl_update_date`) VALUES
	(10, NULL, 'profile/default_profile.gif', '2022-01-25', '2022-01-25'),
	(11, '난이', 'profile/11/739982c448cd4a23a0f34790c57eb221_cgv_project_logo.png', '2022-01-25', '2022-02-11'),
	(16, NULL, 'profile/default_profile.gif', '2022-01-26', '2022-01-26'),
	(18, NULL, 'profile/default_profile.gif', '2022-02-07', '2022-02-07');
/*!40000 ALTER TABLE `user_dtl` ENABLE KEYS */;

-- 테이블 cgv.user_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_mst` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`userid`,`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.user_mst:~4 rows (대략적) 내보내기
DELETE FROM `user_mst`;
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
INSERT INTO `user_mst` (`id`, `userid`, `password`, `username`, `birthday`, `phone`, `email`, `role`, `provider`, `create_date`, `update_date`) VALUES
	(10, 'nanee0706', '$2a$10$StN6x7P4J5oJh8gc7ebwdOhWKwkHfRzfNfrLbSSp77KV8pJyffLrK', '하나은', NULL, '01066704411', 'nanee0706@naver.com', 'ROLE_USER', 'naver', '2022-01-25', '2022-01-25'),
	(11, 'gurfo1026', '$2a$10$g1ogT6di2I2QQZJivN0x0e/JTtlVjv6DijRrkIIxkMqtqDMNsswaG', '하나은', '19931026', '01066267197', 'gurfo1026@naver.com', 'ROLE_USER', NULL, '2022-01-25', '2022-01-25'),
	(16, 'daniel0888', '$2a$10$IaEam9gxAwDzzug64N3aF.o0XLUrWAnyg1yRVCJhAiZLelw2M89zy', '하다니엘', '20010313', '01066878679', 'danielha0888@naver.com', 'ROLE_USER', NULL, '2022-01-26', '2022-01-26'),
	(18, 'admin', '$2a$10$bG45k2YuA1P0OHE30CmX7O255fA8bMPpTD6hbXFLj7MbuhhdmxfJO', '관리자', '20220207', '01000000000', 'admin@cgv.com', 'ROLE_ADMIN', NULL, '2022-02-07', '2022-02-07');
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;

-- 트리거 cgv.user_mst_after_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `user_mst_after_insert` AFTER INSERT ON `user_mst` FOR EACH ROW BEGIN
	INSERT into
		user_dtl(
			id,
			dtl_create_date,
			dtl_update_date
		)
	VALUES(
		NEW.id,
		NOW(),
		NOW()
	);
	
	INSERT Into
	membership_mst(
		id,
		membership_level,
		POINT,
		point_create_date,
		point_update_date
	)
	VALUES(
		NEW.id,
		"일반",
		1000,
		NOW(),
		NOW()
	);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
