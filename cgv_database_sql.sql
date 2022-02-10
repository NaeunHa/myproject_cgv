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
DROP DATABASE IF EXISTS `cgv`;
CREATE DATABASE IF NOT EXISTS `cgv` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `cgv`;

-- 테이블 cgv.membership_mst 구조 내보내기
DROP TABLE IF EXISTS `membership_mst`;
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
DROP TABLE IF EXISTS `movie_mst`;
CREATE TABLE IF NOT EXISTS `movie_mst` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_code` varchar(50) NOT NULL,
  `movie_title_kor` varchar(100) NOT NULL,
  `movie_title_eng` varchar(50) NOT NULL,
  `movie_genre` varchar(50) NOT NULL,
  `movie_limited_age` varchar(10) NOT NULL,
  `movie_description` varchar(500) NOT NULL,
  `movie_director` varchar(50) NOT NULL,
  `movie_actors` varchar(200) NOT NULL,
  `movie_runtime` varchar(10) NOT NULL,
  `movie_poster_img` varchar(100) NOT NULL,
  `movie_trailer_mp4` varchar(100) NOT NULL,
  `movie_release_date` varchar(50) NOT NULL,
  `movie_close_date` varchar(50) NOT NULL,
  `movie_create_date` datetime NOT NULL,
  `movie_update_date` datetime NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.movie_mst:~2 rows (대략적) 내보내기
DELETE FROM `movie_mst`;
/*!40000 ALTER TABLE `movie_mst` DISABLE KEYS */;
INSERT INTO `movie_mst` (`movie_id`, `movie_code`, `movie_title_kor`, `movie_title_eng`, `movie_genre`, `movie_limited_age`, `movie_description`, `movie_director`, `movie_actors`, `movie_runtime`, `movie_poster_img`, `movie_trailer_mp4`, `movie_release_date`, `movie_close_date`, `movie_create_date`, `movie_update_date`) VALUES
	(1, '20201965', '해적: 도깨비 깃발', 'The Pirates : The Last Royal Treasure', '어드벤처, 액션, 코미디', '12', '“가자, 보물 찾으러!” \r\n\r\n자칭 고려 제일검인 의적단 두목 ‘무치’(강하늘)와 \r\n바다를 평정한 해적선의 주인 ‘해랑’(한효주).  \r\n한 배에서 운명을 함께하게 된 이들이지만\r\n산과 바다, 태생부터 상극으로 사사건건 부딪히며 바람 잘 날 없는 항해를 이어간다. \r\n\r\n그러던 어느 날, 왜구선을 소탕하던 이들은 \r\n흔적도 없이 사라진 왕실의 보물이 어딘가 숨겨져 있다는 사실을 알게 되고 \r\n해적 인생에 다시없을 최대 규모의 보물을 찾아 위험천만한 모험에 나서기 시작한다. \r\n\r\n하지만 사라진 보물을 노리는 건 이들뿐만이 아니었으니! \r\n원하는 것을 얻기 위해 수단과 방법을 가리지 않는 역적 ‘부흥수’(권상우) 또한 \r\n보물을 차지하기 위해 바다에 뛰어드는데...! \r\n\r\n해적과 의적, 그리고 역적 \r\n사라진 보물! 찾는 자가 주인이다! ', '김정훈', '강하늘, 한효주, 이광수, 권상우, 채수빈, 오세훈, 김성오, 박지환', '125', 'movie_poster/20201965/cc394a9f44004b959c7be18bb20515da_20201965', 'movie_trailer/20201965/dffd30d9022a48d48aeaeff774176951_20201965', '20220126', '20220226', '2022-02-08 20:00:54', '2022-02-08 20:00:54'),
	(2, '20188441', '킹메이커', 'Kingmaker', '드라마', '15', '세상 바뀌는 꼴 좀 보고 싶습니다\r\n\r\n세상을 바꾸기 위해 도전하는 정치인 ‘김운범’ 앞에\r\n그와 뜻을 함께하고자 선거 전략가 ‘서창대’가 찾아온다.\r\n\r\n열세인 상황 속에서 서창대는 아무도 상상하지 못한 선거 전략을 펼치고\r\n‘김운범’은 선거에 연이어 승리하며, 당을 대표하는 대통령 후보까지 올라서게 된다.\r\n\r\n대통령 선거를 향한 본격적인 행보가 시작되고 그들은 당선을 위해 총력을 기울인다. \r\n\r\n그러던 중 ‘김운범’ 자택에 폭발물이 터지는 사건이 발생하고\r\n용의자로 ‘서창대’가 지목되면서 둘의 관계는 새로운 국면을 맞이하게 되는데...\r\n\r\n치열한 선거판,\r\n그 중심에 있던 두 남자의 이야기가 시작된다!', '변성현', '설경구, 이선균, 유재명, 조우진, 박인환, 이해영, 김성오, 전배수, 서은수, 김종수, 윤경호, 김새벽, 정우혁, 이화룡, 배종옥', '123', 'movie_poster/20188441/20188441_0126.jpg', 'movie_trailer/20188441/20188441_0126.mp4', '20220126', '20220226', '2022-02-08 20:16:49', '2022-02-08 20:16:49');
/*!40000 ALTER TABLE `movie_mst` ENABLE KEYS */;

-- 테이블 cgv.persistent_logins 구조 내보내기
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `series` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(64) NOT NULL DEFAULT '',
  `last_used` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.persistent_logins:~2 rows (대략적) 내보내기
DELETE FROM `persistent_logins`;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` (`username`, `series`, `token`, `last_used`) VALUES
	('daniel0888', '1tzLg4FpOQ9lnJEsehYKdg==', '2Rl3isZlO5aTcoP4OGK9YA==', '2022-01-27 14:52:16'),
	('admin', 'Jx6UHwPjSPpkimBNcVV0Ig==', 'qBZ7oEMhDcoAyeGCCiiIjQ==', '2022-02-09 14:37:50');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;

-- 테이블 cgv.review_mst 구조 내보내기
DROP TABLE IF EXISTS `review_mst`;
CREATE TABLE IF NOT EXISTS `review_mst` (
  `movie_id` int(11) NOT NULL,
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

-- 테이블 cgv.user_dtl 구조 내보내기
DROP TABLE IF EXISTS `user_dtl`;
CREATE TABLE IF NOT EXISTS `user_dtl` (
  `id` int(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `profile_img` varchar(100) NOT NULL DEFAULT 'profile/default_profile.gif',
  `dtl_create_date` date NOT NULL,
  `dtl_update_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 cgv.user_dtl:~4 rows (대략적) 내보내기
DELETE FROM `user_dtl`;
/*!40000 ALTER TABLE `user_dtl` DISABLE KEYS */;
INSERT INTO `user_dtl` (`id`, `nickname`, `profile_img`, `dtl_create_date`, `dtl_update_date`) VALUES
	(10, NULL, 'profile/default_profile.gif', '2022-01-25', '2022-01-25'),
	(11, '노노', 'profile/11/e1a1d63419264203a9ec7842c2684d48_KakaoTalk_20211208_120941678_01.jpg', '2022-01-25', '2022-01-25'),
	(16, NULL, 'profile/default_profile.gif', '2022-01-26', '2022-01-26'),
	(18, NULL, 'profile/default_profile.gif', '2022-02-07', '2022-02-07');
/*!40000 ALTER TABLE `user_dtl` ENABLE KEYS */;

-- 테이블 cgv.user_mst 구조 내보내기
DROP TABLE IF EXISTS `user_mst`;
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
	(11, 'gurfo1026', '$2a$10$g1ogT6di2I2QQZJivN0x0e/JTtlVjv6DijRrkIIxkMqtqDMNsswaG', '노혁래', '19931026', '01066267197', 'gurfo1026@naver.com', 'ROLE_USER', NULL, '2022-01-25', '2022-01-25'),
	(16, 'daniel0888', '$2a$10$IaEam9gxAwDzzug64N3aF.o0XLUrWAnyg1yRVCJhAiZLelw2M89zy', '하다니엘', '20010313', '01066878679', 'danielha0888@naver.com', 'ROLE_USER', NULL, '2022-01-26', '2022-01-26'),
	(18, 'admin', '$2a$10$bG45k2YuA1P0OHE30CmX7O255fA8bMPpTD6hbXFLj7MbuhhdmxfJO', '관리자', '20220207', '01000000000', 'admin@cgv.com', 'ROLE_ADMIN', NULL, '2022-02-07', '2022-02-07');
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;

-- 트리거 cgv.user_mst_after_insert 구조 내보내기
DROP TRIGGER IF EXISTS `user_mst_after_insert`;
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
