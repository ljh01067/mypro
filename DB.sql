DROP DATABASE IF EXISTS `price`;
CREATE DATABASE `price`;
USE `price`;

CREATE TABLE business(
       id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      `name` CHAR(20) NOT NULL
);

CREATE TABLE region(
       id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      `name` CHAR(20) NOT NULL
);

CREATE TABLE category(
       id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      `name` CHAR(20) NOT NULL
);
CREATE TABLE detailitem(
      categoryid INT(10) NOT NULL,
      detailid INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      `name` CHAR(20) NOT NULL,
      goodSmlclsCode INT(10) NOT NULL
);
CREATE TABLE product(
      detailid INT(10) NOT NULL,
      `name` CHAR(20) NOT NULL
);
INSERT INTO business
SET `name` = '대형마트';
INSERT INTO business
SET `name` = '백화점';
INSERT INTO business
SET `name` = '슈퍼마켓';
INSERT INTO business
SET `name` = '전통시장';
INSERT INTO business
SET `name` = '편의점';

INSERT INTO region
SET `name` = '서울특별시';
INSERT INTO region
SET `name` = '부산광역시';
INSERT INTO region
SET `name` = '대구광역시';
INSERT INTO region
SET `name` = '대전광역시';
INSERT INTO region
SET `name` = '광주광역시';
INSERT INTO region
SET `name` = '울산광역시';
INSERT INTO region
SET `name` = '인천광역시';
INSERT INTO region
SET `name` = '강원특별자치도';
INSERT INTO region
SET `name` = '경기도';
INSERT INTO region
SET `name` = '경상남도';
INSERT INTO region
SET `name` = '경상북도';
INSERT INTO region
SET `name` = '전라남도';
INSERT INTO region
SET `name` = '전북특별자치도';
INSERT INTO region
SET `name` = '충청남도';
INSERT INTO region
SET `name` = '충청북도';
INSERT INTO region
SET `name` = '제주특별자치도';
INSERT INTO region
SET `name` = '세종특별자치시';

INSERT INTO category
SET `name` = '곡물가공품';
INSERT INTO category
SET `name` = '정육·난류';
INSERT INTO category
SET `name` = '수산가공품';
INSERT INTO category
SET `name` = '낙농·축산가공품';
INSERT INTO category
SET `name` = '조미료·장류·식용유';
INSERT INTO category
SET `name` = '채소';
INSERT INTO category
SET `name` = '과자·빙과류';
INSERT INTO category
SET `name` = '차·음료·주류';
INSERT INTO category
SET `name` = '미용품';
INSERT INTO category
SET `name` = '세탁·주방·가사용품';
INSERT INTO category
SET `name` = '생선류';
INSERT INTO category
SET `name` = '기타 가공식품';
INSERT INTO category
SET `name` = '곡물';

INSERT INTO detailitem
SET categoryid =1,
`name` = '견과류',
goodSmlclsCode = 30201021;
INSERT INTO detailitem
SET categoryid =1,
`name` = '국수',
goodSmlclsCode = 30201009;
INSERT INTO detailitem
SET categoryid =1,
`name` = '냉동만두',
goodSmlclsCode = 30201005;
INSERT INTO detailitem
SET categoryid =1,
`name` = '당면',
goodSmlclsCode = 30201015;
INSERT INTO detailitem
SET categoryid =1,
`name` = '두부',
goodSmlclsCode = 30201008;
INSERT INTO detailitem
SET categoryid =1,
`name` = '라면',
goodSmlclsCode = 30201011;
INSERT INTO detailitem
SET categoryid =1,
`name` = '밀가루',
goodSmlclsCode = 30201007;
INSERT INTO detailitem
SET categoryid =1,
`name` = '부침가루',
goodSmlclsCode = 30201012;
INSERT INTO detailitem
SET categoryid =1,
`name` = '빵',
goodSmlclsCode = 30201001;
INSERT INTO detailitem
SET categoryid =1,
`name` = '스프',
goodSmlclsCode = 30201019;
INSERT INTO detailitem
SET categoryid =1,
`name` = '식빵',
goodSmlclsCode = 30201013;
INSERT INTO detailitem
SET categoryid =1,
`name` = '시리얼',
goodSmlclsCode = 30201010;
INSERT INTO detailitem
SET categoryid =1,
`name` = '즉석국',
goodSmlclsCode = 30201002;
INSERT INTO detailitem
SET categoryid =1,
`name` = '즉석덮밥',
goodSmlclsCode = 30201004;
INSERT INTO detailitem
SET categoryid =1,
`name` = '즉석밥',
goodSmlclsCode = 30201014;
INSERT INTO detailitem
SET categoryid =1,
`name` = '즉석죽',
goodSmlclsCode = 30201020;
INSERT INTO detailitem
SET categoryid =1,
`name` = '컵라면',
goodSmlclsCode = 30201024;
INSERT INTO detailitem
SET categoryid =1,
`name` = '컵밥',
goodSmlclsCode = 30201025;
INSERT INTO detailitem
SET categoryid =1,
`name` = '탕',
goodSmlclsCode = 30201026;

INSERT INTO detailitem
SET categoryid =2,
`name` = '계란',
goodSmlclsCode = 30101001;
INSERT INTO detailitem
SET categoryid =2,
`name` = '닭고기',
goodSmlclsCode = 30101003;
INSERT INTO detailitem
SET categoryid =2,
`name` = '돼지고기',
goodSmlclsCode = 30101004;
INSERT INTO detailitem
SET categoryid =2,
`name` = '소고기',
goodSmlclsCode = 30101002;

INSERT INTO detailitem
SET categoryid =3,
`name` = '맛김',
goodSmlclsCode = 30202005;
INSERT INTO detailitem
SET categoryid =3,
`name` = '맛살',
goodSmlclsCode = 30202003;
INSERT INTO detailitem
SET categoryid =3,
`name` = '어묵',
goodSmlclsCode = 30202002;
INSERT INTO detailitem
SET categoryid =3,
`name` = '참치캔',
goodSmlclsCode = 30202004;
INSERT INTO detailitem
SET categoryid =3,
`name` = '젓갈',
goodSmlclsCode = 30202008;
INSERT INTO detailitem
SET categoryid =3,
`name` = '미역',
goodSmlclsCode = 30202009;

INSERT INTO detailitem
SET categoryid =4,
`name` = '마가린',
goodSmlclsCode = 30203002;
INSERT INTO detailitem
SET categoryid =4,
`name` = '발효유',
goodSmlclsCode = 30203008;
INSERT INTO detailitem
SET categoryid =4,
`name` = '분유',
goodSmlclsCode = 30203006;
INSERT INTO detailitem
SET categoryid =4,
`name` = '소시지',
goodSmlclsCode = 30203003;
INSERT INTO detailitem
SET categoryid =4,
`name` = '우유',
goodSmlclsCode = 30203005;
INSERT INTO detailitem
SET categoryid =4,
`name` = '치즈',
goodSmlclsCode = 30203007;
INSERT INTO detailitem
SET categoryid =4,
`name` = '햄',
goodSmlclsCode = 30203004;
INSERT INTO detailitem
SET categoryid =4,
`name` = '베이컨',
goodSmlclsCode = 30203009;
INSERT INTO detailitem
SET categoryid =4,
`name` = '훈제오리',
goodSmlclsCode = 30203010;
INSERT INTO detailitem
SET categoryid =4,
`name` = '버터',
goodSmlclsCode = 30203011;

INSERT INTO detailitem
SET categoryid =5,
`name` = '간장',
goodSmlclsCode = 30204011;
INSERT INTO detailitem
SET categoryid =5,
`name` = '고추장',
goodSmlclsCode = 30204009;
INSERT INTO detailitem
SET categoryid =5,
`name` = '된장',
goodSmlclsCode = 30204010;
INSERT INTO detailitem
SET categoryid =5,
`name` = '잼',
goodSmlclsCode = 30204015;
INSERT INTO detailitem
SET categoryid =5,
`name` = '마요네즈',
goodSmlclsCode = 30204012;
INSERT INTO detailitem
SET categoryid =5,
`name` = '꿀',
goodSmlclsCode = 30204002;
INSERT INTO detailitem
SET categoryid =5,
`name` = '설탕',
goodSmlclsCode = 30204007;
INSERT INTO detailitem
SET categoryid =5,
`name` = '소금',
goodSmlclsCode = 30204006;
INSERT INTO detailitem
SET categoryid =5,
`name` = '식용유',
goodSmlclsCode = 30204005;
INSERT INTO detailitem
SET categoryid =5,
`name` = '식초',
goodSmlclsCode = 30204001;
INSERT INTO detailitem
SET categoryid =5,
`name` = '쌈장',
goodSmlclsCode = 30204016;
INSERT INTO detailitem
SET categoryid =5,
`name` = '참기름',
goodSmlclsCode = 30204004;
INSERT INTO detailitem
SET categoryid =5,
`name` = '카레',
goodSmlclsCode = 30204014;
INSERT INTO detailitem
SET categoryid =5,
`name` = '케첩',
goodSmlclsCode = 30204013;
INSERT INTO detailitem
SET categoryid =5,
`name` = '혼합조미료',
goodSmlclsCode = 30204008;
INSERT INTO detailitem
SET categoryid =5,
`name` = '드레싱',
goodSmlclsCode = 30204019;
INSERT INTO detailitem
SET categoryid =5,
`name` = '고춧가루',
goodSmlclsCode = 30204020;
INSERT INTO detailitem
SET categoryid =5,
`name` = '물엿',
goodSmlclsCode = 30204021;
INSERT INTO detailitem
SET categoryid =5,
`name` = '까나리액젓',
goodSmlclsCode = 30204022;
INSERT INTO detailitem
SET categoryid =5,
`name` = '고추냉이',
goodSmlclsCode = 30204023;
INSERT INTO detailitem
SET categoryid =5,
`name` = '멸치액젓',
goodSmlclsCode = 30204024;

INSERT INTO detailitem
SET categoryid =6,
`name` = '감자',
goodSmlclsCode = 30102009;
INSERT INTO detailitem
SET categoryid =6,
`name` = '고구마',
goodSmlclsCode = 30102010;
INSERT INTO detailitem
SET categoryid =6,
`name` = '깻잎',
goodSmlclsCode = 30102017;
INSERT INTO detailitem
SET categoryid =6,
`name` = '당근',
goodSmlclsCode = 30102008;
INSERT INTO detailitem
SET categoryid =6,
`name` = '대파',
goodSmlclsCode = 30102015;
INSERT INTO detailitem
SET categoryid =6,
`name` = '마늘',
goodSmlclsCode = 30102016;
INSERT INTO detailitem
SET categoryid =6,
`name` = '무',
goodSmlclsCode = 30102003;
INSERT INTO detailitem
SET categoryid =6,
`name` = '배추',
goodSmlclsCode = 30102001;
INSERT INTO detailitem
SET categoryid =6,
`name` = '버섯',
goodSmlclsCode = 30102011;
INSERT INTO detailitem
SET categoryid =6,
`name` = '상추',
goodSmlclsCode = 30102018;
INSERT INTO detailitem
SET categoryid =6,
`name` = '시금치',
goodSmlclsCode = 30102007;
INSERT INTO detailitem
SET categoryid =6,
`name` = '양배추',
goodSmlclsCode = 30102020;
INSERT INTO detailitem
SET categoryid =6,
`name` = '양파',
goodSmlclsCode = 30102002;
INSERT INTO detailitem
SET categoryid =6,
`name` = '오이',
goodSmlclsCode = 30102012;
INSERT INTO detailitem
SET categoryid =6,
`name` = '쪽파',
goodSmlclsCode = 30102021;
INSERT INTO detailitem
SET categoryid =6,
`name` = '콩나물',
goodSmlclsCode = 30102005;
INSERT INTO detailitem
SET categoryid =6,
`name` = '풋고추',
goodSmlclsCode = 30102013;
INSERT INTO detailitem
SET categoryid =6,
`name` = '호박',
goodSmlclsCode = 30102014;

INSERT INTO detailitem
SET categoryid =7,
`name` = '감자칩',
goodSmlclsCode = 30205003;
INSERT INTO detailitem
SET categoryid =7,
`name` = '껌',
goodSmlclsCode = 30205007;
INSERT INTO detailitem
SET categoryid =7,
`name` = '모나카류아이스크림',
goodSmlclsCode = 30205010;
INSERT INTO detailitem
SET categoryid =7,
`name` = '빙과류',
goodSmlclsCode = 30205009;
INSERT INTO detailitem
SET categoryid =7,
`name` = '새우깡',
goodSmlclsCode = 30205004;
INSERT INTO detailitem
SET categoryid =7,
`name` = '아이스크림',
goodSmlclsCode = 30205008;
INSERT INTO detailitem
SET categoryid =7,
`name` = '에너지바',
goodSmlclsCode = 30205011;
INSERT INTO detailitem
SET categoryid =7,
`name` = '초코바',
goodSmlclsCode = 30205012;
INSERT INTO detailitem
SET categoryid =7,
`name` = '초코파이',
goodSmlclsCode = 30205005;
INSERT INTO detailitem
SET categoryid =7,
`name` = '초콜릿',
goodSmlclsCode = 30205006;
INSERT INTO detailitem
SET categoryid =7,
`name` = '사탕',
goodSmlclsCode = 30205001;
INSERT INTO detailitem
SET categoryid =7,
`name` = '비스킷',
goodSmlclsCode = 30205002;
INSERT INTO detailitem
SET categoryid =7,
`name` = '전통과자',
goodSmlclsCode = 30205013;
INSERT INTO detailitem
SET categoryid =7,
`name` = '젤리',
goodSmlclsCode = 30205014;

INSERT INTO detailitem
SET categoryid =8,
`name` = '주스',
goodSmlclsCode = 30206008;
INSERT INTO detailitem
SET categoryid =8,
`name` = '차',
goodSmlclsCode = 30206004;
INSERT INTO detailitem
SET categoryid =8,
`name` = '두유',
goodSmlclsCode = 30206011;
INSERT INTO detailitem
SET categoryid =8,
`name` = '막걸리',
goodSmlclsCode = 30206016;
INSERT INTO detailitem
SET categoryid =8,
`name` = '맥주',
goodSmlclsCode = 30206012;
INSERT INTO detailitem
SET categoryid =8,
`name` = '비타민음료',
goodSmlclsCode = 30206001;
INSERT INTO detailitem
SET categoryid =8,
`name` = '사이다',
goodSmlclsCode = 30206006;
INSERT INTO detailitem
SET categoryid =8,
`name` = '생수',
goodSmlclsCode = 30206007;
INSERT INTO detailitem
SET categoryid =8,
`name` = '소주',
goodSmlclsCode = 30206013;
INSERT INTO detailitem
SET categoryid =8,
`name` = '에너지음료',
goodSmlclsCode = 30206021;
INSERT INTO detailitem
SET categoryid =8,
`name` = '이온음료',
goodSmlclsCode = 30206019;
INSERT INTO detailitem
SET categoryid =8,
`name` = '캔커피',
goodSmlclsCode = 30206002;
INSERT INTO detailitem
SET categoryid =8,
`name` = '커피믹스',
goodSmlclsCode = 30206003;
INSERT INTO detailitem
SET categoryid =8,
`name` = '콜라',
goodSmlclsCode = 30206005;
INSERT INTO detailitem
SET categoryid =8,
`name` = '탄산수',
goodSmlclsCode = 30206022;
INSERT INTO detailitem
SET categoryid =8,
`name` = '포도주',
goodSmlclsCode = 30206023;
INSERT INTO detailitem
SET categoryid =8,
`name` = '단백질음료',
goodSmlclsCode = 30206024;
INSERT INTO detailitem
SET categoryid =8,
`name` = '숙취해소제',
goodSmlclsCode = 30206025;

INSERT INTO detailitem
SET categoryid =9,
`name` = '화장지',
goodSmlclsCode = 30301004;
INSERT INTO detailitem
SET categoryid =9,
`name` = '바디워시',
goodSmlclsCode = 30301002;
INSERT INTO detailitem
SET categoryid =9,
`name` = '로션',
goodSmlclsCode = 30301001;
INSERT INTO detailitem
SET categoryid =9,
`name` = '생리대',
goodSmlclsCode = 30301013;
INSERT INTO detailitem
SET categoryid =9,
`name` = '비누',
goodSmlclsCode = 30301006;
INSERT INTO detailitem
SET categoryid =9,
`name` = '손세정제',
goodSmlclsCode = 30301021;
INSERT INTO detailitem
SET categoryid =9,
`name` = '염색약',
goodSmlclsCode = 30301020;
INSERT INTO detailitem
SET categoryid =9,
`name` = '면도날',
goodSmlclsCode = 30301017;
INSERT INTO detailitem
SET categoryid =9,
`name` = '샴푸',
goodSmlclsCode = 30301010;
INSERT INTO detailitem
SET categoryid =9,
`name` = '종이기저귀',
goodSmlclsCode = 30301012;
INSERT INTO detailitem
SET categoryid =9,
`name` = '치약',
goodSmlclsCode = 30301007;
INSERT INTO detailitem
SET categoryid =9,
`name` = '칫솔',
goodSmlclsCode = 30301024;
INSERT INTO detailitem
SET categoryid =9,
`name` = '구강청결제',
goodSmlclsCode = 30304009;
INSERT INTO detailitem
SET categoryid =9,
`name` = '마스크',
goodSmlclsCode = 30301026;
INSERT INTO detailitem
SET categoryid =9,
`name` = '물티슈',
goodSmlclsCode = 30304029;
INSERT INTO detailitem
SET categoryid =9,
`name` = '반창고',
goodSmlclsCode = 30304030;
INSERT INTO detailitem
SET categoryid =9,
`name` = '립밤',
goodSmlclsCode = 30304031;
INSERT INTO detailitem
SET categoryid =9,
`name` = '미용티슈',
goodSmlclsCode = 30304032;
INSERT INTO detailitem
SET categoryid =9,
`name` = '선크림',
goodSmlclsCode = 30304033;

INSERT INTO detailitem
SET categoryid =10,
`name` = '건전지',
goodSmlclsCode = 30302001 ;
INSERT INTO detailitem
SET categoryid =10,
`name` = '고무장갑',
goodSmlclsCode = 30302008;
INSERT INTO detailitem
SET categoryid =10,
`name` = '랩',
goodSmlclsCode = 30302009;
INSERT INTO detailitem
SET categoryid =10,
`name` = '부탄가스',
goodSmlclsCode = 30302015;
INSERT INTO detailitem
SET categoryid =10,
`name` = '살균소독제',
goodSmlclsCode = 30302013;
INSERT INTO detailitem
SET categoryid =10,
`name` = '살충제',
goodSmlclsCode = 30302016;
INSERT INTO detailitem
SET categoryid =10,
`name` = '섬유유연제',
goodSmlclsCode = 30302005;
INSERT INTO detailitem
SET categoryid =10,
`name` = '섬유탈취제',
goodSmlclsCode = 30302003;
INSERT INTO detailitem
SET categoryid =10,
`name` = '세탁세제(가루형)',
goodSmlclsCode = 30302017;
INSERT INTO detailitem
SET categoryid =10,
`name` = '세탁세제(액체형)',
goodSmlclsCode = 30302018;
INSERT INTO detailitem
SET categoryid =10,
`name` = '습기제거제',
goodSmlclsCode = 30302012;
INSERT INTO detailitem
SET categoryid =10,
`name` = '위생백',
goodSmlclsCode = 30302002;
INSERT INTO detailitem
SET categoryid =10,
`name` = '주방세제',
goodSmlclsCode = 30302006;
INSERT INTO detailitem
SET categoryid =10,
`name` = '키친타월',
goodSmlclsCode = 30302007;
INSERT INTO detailitem
SET categoryid =10,
`name` = '호일',
goodSmlclsCode = 30302010;

INSERT INTO detailitem
SET categoryid =11,
`name` = '갈치',
goodSmlclsCode = 30103001;
INSERT INTO detailitem
SET categoryid =11,
`name` = '고등어',
goodSmlclsCode = 30103003;
INSERT INTO detailitem
SET categoryid =11,
`name` = '오징어',
goodSmlclsCode = 30103004;
INSERT INTO detailitem
SET categoryid =11,
`name` = '조기',
goodSmlclsCode = 30103002;
INSERT INTO detailitem
SET categoryid =11,
`name` = '연어',
goodSmlclsCode = 30103006;

INSERT INTO detailitem
SET categoryid =12,
`name` = '포기김치',
goodSmlclsCode = 30102004;
INSERT INTO detailitem
SET categoryid =12,
`name` = '이유식',
goodSmlclsCode = 30202010;
INSERT INTO detailitem
SET categoryid =12,
`name` = '과일가공품',
goodSmlclsCode = 30201027;

INSERT INTO detailitem
SET categoryid =13,
`name` = '쌀(현미)',
goodSmlclsCode = 30102023;
INSERT INTO detailitem
SET categoryid =13,
`name` = '콩',
goodSmlclsCode = 30101005;
INSERT INTO detailitem
SET categoryid =13,
`name` = '팥',
goodSmlclsCode = 30103007;
INSERT INTO detailitem
SET categoryid =13,
`name` = '쌀(백미)',
goodSmlclsCode = 30205015;
