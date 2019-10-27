CREATE DATABASE  IF NOT EXISTS `tagnotedb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tagnotedb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tagnotedb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `memo`
--

DROP TABLE IF EXISTS `memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memo` (
  `MEMO_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NUM` int(11) NOT NULL,
  `MEMO_TEXT` text NOT NULL,
  `MEMO_DATE` datetime NOT NULL,
  `IMPT_MEMO` tinyint(1) NOT NULL DEFAULT '0',
  `DEL_MEMO` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MEMO_NUM`),
  KEY `USER_NUM` (`USER_NUM`),
  FULLTEXT KEY `memoText_FULLTEXT` (`MEMO_TEXT`),
  CONSTRAINT `memo_ibfk_1` FOREIGN KEY (`USER_NUM`) REFERENCES `user` (`USER_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memo`
--

LOCK TABLES `memo` WRITE;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
INSERT INTO `memo` VALUES (1,1,'0903 자바 프로젝트\n변수에 무엇이 들어있는가?\n-값 : 값타입\n-참조: 참조타입\n​\n자바는 call by value다.\n자바에는 call by reference 문법이없다.\n​\nimmutable type은 읽기? 읽,쓰?\nvalue type 왜 읽기로 했나?(String같은 것은 초보자가 참조라는걸 이해하기 어렵기 때문에)\n​\ns1==s2 : identity 비교\ns1.equals(s2) : equals 비교(재정의 필요)\n​\nString 연산은 항상 새로운 String이 생서된다.(원본 변경 X)\n​\n메소드 메모리 공간은 stack segment\n객체 메모리 공간은 heap segment\n​\nString클래스의 메소드 equlas는 내용을 비교\n새로 만든 클래스의 메소드 equlas는 재정의 해주어야 equlas비교로\n새로 만든 클래스의 toString을 구현안하고 그냥 print할 경우 net.skhu.lecture01.Person@15db9742 이런식으로 출력 됨.\n​\nstatic 멤버변수는 클래스 안에 만들어짐 (클래스 당 1개)\n그냥 멤버변수는 객체 안에 만들어짐 (클래스당 여러개)\n​\n4)객체 구조 그리기 실습\n사진 확인\n​\n-------------------------------------\n​\n* instanceof 연산자\nObject s = \"hello\"; (부모 타입 참조변수->자식 객체) 참조 이기 때문에 가능\nsysout(s instanceof String); //(true) ->변수타입을 보는 것이 아닌 객체 타입을 본다.\nsysout(s instanceof Object); //(true)\n​\n------------------------------------------\n*@Override 어노테이션\n​★★★★★★★★★★★★★★★★★★★★★★★★\nequlas 메소드를 재정의 하라.(NullExceptionError)\n★★★★★★★★★★★★★★★★★★★★★★★★★★\n​\nNullExceptionError : 참조변수가 비었을 때 발생, 예를 들어 String 끼리 equals를 하면 NEE가 발생,\nnull null : true/ null x : false/ x null : false/ x x: 값계산\n---------------------------------------------\n​\nString.format->문자열을 만들어 준다.(c의 printf(화면 출력)와 비슷)\n=========================================================================\n=========================================================================\n부모= new 부모 o\n자식 = new 자식 o\n부모 = new 자식 o (up-casting)\n자식 = new 부모 x (down-castion)\n/*\nif(p instanceOf Person)\nif(p.getClass == Person.getClass)  부모타입에 대해서는 false\n*/\n배열도 클래스다. 배열의 equals를 하면 같은 배열인가를 검사 (재정의 불가능)\nObject 클래스는 모든 클래스의 부모 클래스이다\nJava에서 모든 객체는 Object의 자식 클래스의 객체이므로,\n어떤 객체에 대한 참조를 Object 타입의 참조 변수에 저장하는 것은 up-casting 이므로 가능하다\n기본 자료형은 객체가 아니다.\n기본 자료형 int는 클래스가 아니다. int는 Object 클래스의 자식 클래스가 아니다.\na 배열은 객체에 대한 참조만 저장할 수 있기 때문에, 123 같은 정수 값을 a 배열에 그냥 넣을 수는 없다\nvalue type\n기본 자료형을 객체로 변환하기 위해서, 기본 자료형 각각에 대한 클래스가 Java 표준 라이브러리에 포함되어 있다.\n기본 자료형 클래스 이름\nbyte Byte\nshort Short\nint Integer\nlong Long\nfloat Float\ndouble Double\nboolean Boolean\nchar Character\n기본자료형을 참조형처럼 사용하기 위해서\n기본자료형을 객체를 저장하기 위해서는 기본자료형의 클래스가 있어야 한다.\n기본자료형 클래스에는 equals 메소드가 재정의 되어있다.\nautoBoxing : 기본자료형을 객체에 넣을 경우 자동으로 객체로 만들어준다.(객체를 기본자료형에 넣을 경우 obj1.intValue()하면 기본자료형 객체에서 값을 꺼내옴.)\nObject obj = \"hello\";\nobj=3;\nobj=3.14;','2018-09-17 14:29:00',0,1),(2,1,'1. 객체 배열\n1) up-casting & down-casting\n부모 = new 부모; o\n자식 = new 자식; o\n부모 = new 자식; o(up-casting)\n자식 = new 부모; 컴파일 에러x(down-casting)​','2018-10-07 02:21:00',0,1),(3,1,'정리 11 Thread\n방법 1\nclass ThreadA extends Thread {\npublic void run() { }\n}\n​\nThread a = new ThreadA();\na.start();\n​\n방법 2\nclass RunnableA extends Runnable {\npublic void run() { }\n}\n​\nThread a new Thread(new RunnableA());\na.start();\n​\n*각 스레드 별로 1~100까지의 합을 구해 출력\n오류1) 출력문을 main에 배치할 경우\nmain의 실행문맥은 각 스레드들을 start하고 종료된다. 따라서 합의 출력을 main에 배치하게 되면 원하는 답이 나오지 않는다.\n=>1. 각 스레드 실행 후 결과 출력/ 2. main에서 threadOne.join()을 하고 출력\n​\n오류 2) static 즉 공유 변수를 사용할 경우\n동시에 공유 변수를 갱신을 경우 원하는 결과값이 나오지 않는다.\n=>객체 변수 경우 : 해당 부분에 synchronized , static영역(target.class)\nsynchronized (ThreadB.class)\n	​​{\n		sum = sum + i;\n	}​\n=>메소드의 경우: 해당 메소드 \n synchronized void add(int i) { sum = sum + i; } ​\n\n​','2018-10-28 22:52:00',0,1),(4,1,'1112 자바프로젝트\nHashMap : 순서 무의미\nTreeMap : Map->SortedMap(키로 정렬)->TreeMap\n\n정규식\n​\n1.정규식\n1)정규식 특수 문자와 일반 문자\n특수문자 이외에는 정확히 일치해야 한다.\n​\n2) [] 특수문자\n연속하는 문자나 숫자의 경우 [0-9] = [0123456789]\n[0-9A-Z]\n예) [tT]he  => the, The\n​\n3) . 특수문자\n아무 문자 한개와 일치\n예) .he  => ahe, bth...... \n​\n4) [^] 특수 문자\n괄호 안 문자들을 제외한 한개의 아무 문자\n예) [^tT]he = ahe, bhe, ....(the, The 제외)\n​\n5) ? 특수문자\n? 바로 앞 문자가 0~1개\n예) AB?C  => AC, ABC\n​\n6) * 특수문자\n* 바로 앞 문자가 0~여러개\n예) AB*C  => AC, ABC, ABBC, ABBBC, .......\n​\n7) + 특수문자\n+ 바로 앞 문자가 1~여러개\n예) AB+C  => ABC, ABBC, ABBBC,.......\n​\n8) ^ 특수 문자\n선두 부분\n예) ^123  =>1234567....\n​\n9) $ 특수 문자\n끝 부분\n예) 123$  => 21324123\n​\n10) {n} 특수문자\n{} 안 숫자 만큼 앞에 문자가 반복\n예) AB{3}C  =>ABBBC\n​\n11) {n,m} 특수문자\n{이상, 이하}\n예) AB{2,3}C  => ABBC, ABBBC\n​\n12) ( ) 특수문자\n예) A(BC)?D  => AD, ABCD\n​\n13) | 특수문자\n앞이나 뒤 하나와 일치\n예) A(bc)|(def)G  => AbcG, AdefG \n​\n14)  특수 문자\n특수문자를 일반문자로 취급할 때\n예) ABC?  => ABC?\n​\n15) 연습문제\n1. 변수이름\n2. 주민등록번호\n3. 전화번호.....​','2018-11-19 12:10:00',0,1),(5,1,'두 객체를 compare 메소드로 비교한 결과가 0이면 equals메소드로 비교한 결과도 true이어야 한다.\n그 역도 성립해야한다.\n​\n=> compare할 때 모든 변수를 비교해야한다.\n​\n**주어진 객체를 비교하여 찾는 메소드의 경우 equals메소드 재정의 필수\n​\n*Thread synchronized\nex)화장실 객체가 2개 안방화장실 객체, 거실화장실객체가 있을 때 스레드가 안방 화장실 객체를 호출하는 것이 synchronized가 메소드에 써있지만 메소드를 락하는 것이 아닌(이 경우 거실 화장실에서 해당 메소드를 사용 불가능) this객체(안방화장실)을 락한다.\n메소드는 클래스에 하나 갖고 있다.(메소드를 락할 경우 다른 객체가 사용 불가능)\nex)화장실 수도 공사일 경우 화장실 전체를 락해야한다.(그 클래스의 모든 객체가 락)\nsynchronized(클래스이름.class) {\n객체.메소드호출();\n}\n​​','2018-10-29 12:57:00',0,1),(6,2,'튜플(가로 집합)은 같을 수 없다.\n​\n함수종속이라는 것은 학번->이름  이름을 구별하기 위해서 학번이 필요핟.\n{학번, 과목명} -> 성적  성적을 구별하려면 어느과목의 누구라는 정보가 필요하다.\n​\ner 다이어그램 표기법\nISA관계 : 상속, is a 관계\n​\n​카디날리티\n​\n일대 다( 하나의 인스턴스가 여러개의 인스턴스와 관계를 갖고있는것) 한방향\n한예슬   -     영업부\n오지호   -\n사원 n - 소속 - 1 부서\n한예슬 1은 영업부 1\n영업 부 1 는 한예슬, 오지호 n\n=> 1 : n\n​\n다대 다 양방향 일대 다\n다대다는 잘 사용하지 않고\n학생 n - 1  강/학 1 - n 강의\n​\n​\ncrow foot notation\n작대기 한쪽이 일자면 1\n작대기 한쪽이 세갈래면 n\n​\n동그라미면 min 0\n작대기 min 1\n​\n\n다대다 관계를 분리하야한다. (분리하면서 엔티티를 만든다.)\n위치와 같이 다대다 관계이지만 그 조합키로 분리가 가능한 경우 약한 엔티티로 하는것이 더 좋다. (ex location)​\n​​','2018-11-19 15:11:00',0,1),(7,2,'과제 데이터베이스 실습\n\n \n\n회사를 위한 ER 다이어그램을 작성하라. 키, 관계성의 카디날러티(cardinality)가 반드시 표기되어야 한다. 아래에 명기된 애트리뷰트, 관계성은 반드시 표현되어야 한다. 만약 추가적인 애트리뷰트가 필요하거나, 제한조건, 가정이 필요하면 반드시 명시하라.\n\n- 회사에는 다수의 사원들이 재직한다\n\n- 각 사원에 대해서 사원번호(고유함), 이름, 직책, 급여, 주소를 저장한다. 각 시, 구, 동 별로 거주하는 사원들의 정보를 구하기 위해서 주소는 시, 구, 동으로 세분하여 나타낸다.\n\n- 회사는 여러 개의 프로젝트를 진행한다. 각 프로젝트에 대해서 프로젝트 번호(고유함), 이름, 예산, 프로젝트가 진행되는 위치를 나타낸다. 한 프로젝트는 여러 위치에서 진행될 수 있다. 각 프로젝트마다 여러명의 사원들이 일한다. 각 사원은 여러 프로젝트에서 근무할 수 있다. 각 사원이 해당 프로젝트에서 어떤 역할을 수행하고 얼마동안 근무해 왔는가를 나타낸다. 각 프로젝트마다 한 명의 프로젝트 관리자가 있다. 한 사원은 2개 이상의 프로젝트 관리자가 될 수는 없다. 프로젝트 관리자 임무를 시작한 날짜를 기록한다.\n\n- 각 사원은 한 부서에 속한다. 각 부서에 대해서 부서번호(고유함) 이름, 부서가 위치한 층을 나타낸다.\n\n- 각 프로젝트에는 부품들이 필요하다. 한 부품이 두 개 이상의 프로젝트에서 사용될 수 있다. 하나의 부품은 다른 여러 개의 부품으로 이루어질 수 있다. 각 부품에 대해서 부품번호(고유함), 이름, 가격, 그 부품이 다른 부품들을 포함하는 경우에는 그 부품들에 관한 정보도 나타낸다.\n\n- 각 부품을 공급하는 공급자들이 있다. 한 명의 공급자는 여러 가지 부품들을 공급할 수 있고, 각 부품은 여러 공급자들로부터 공급될 수 있다. 각 공급자에 대해서 그 공급자가 어떤 부품을 어떤 프로젝트에 얼마나 공급하는가를 나타낸다.​​​','2018-09-17 15:17:00',0,1),(8,2,'mysql -uroot -p\n비밀번호\n​\ncreate database sqldb; //디비테이블 만들기\nuse sqldb;\nshow tables;\n​\nsource 드래그&드롭\nsource 드래그&드롭​\n​\nshow tables;\nselect * from buytbl;\n​\n처음 로그인시 \nuse sqldb;\n​​\n============================================================================\n​\n데이터베이스 생성  create database sqldb;\n현재 접속중인 데이터베이스  select database();\n현재 사용자  select user();\n현제 서버에 존재하는 데이터베이스  show databases;\n데이터 베이스 체이블 정보 조회  show  table status;\n테이블 이름만 간단히  show  tables;\n테이블의 내부 구조  describe 이름;\n​\nselect/from/where/group by/having/order by\nwhere절에서는 별칭 사용 불가\n​​​​','2018-09-17 16:17:00',0,1),(9,2,'1001 데이터베이스실습\n​\n<>,!= 같음\n​\nNull찾기(=null안됨) is null\n1*null=null\n​\nLIKE 문자열 내용 검색\n​\n* 서브쿼리: 쿼리안 쿼리\n조건이 리터럴?이라면 서브쿼리는 수식을 실행후 조건이 나오는?\n보통은 where salary>5000 이렇게 사용하지만 마이크라는 사람보다 많은 월급을 받는 사람\nwhere salary>(select salary from employees where last_name = \'mike\');\nSELECT Name, height FROM userTBL WHERE height > 177;\n– SELECT Name, height FROM userTbl WHERE height > (SELECT height FROM userTbl WHERE Name = \'김경호\');\n주의)))))서브쿼리의 결과가 둘 이상이 되면 에러\nex>경남에 사는 사람보다 큰사람\nANY : 여러개의 결과(경남에 사는 173,170인 사람) 중 한가지만 만족하면 가능\nSELECT Name, height FROM userTbl WHERE height > ANY(SELECT height FROM userTbl WHERE Name = \'김경호\');​\nIN 사용 가능\nALL : 여러개의 결과 모드 만족하면 가능 (173보다 큰사람)\n​\n*ORDER BY\n오름차순 ASC\n내림차순 DESc\nNULL 우선\n​\n*DISTINCT 중복제거\nSELECT distinct addr FROM userTbl;\n​\n*LIMIT 숫자  출력개수 제한\nLIMIT 1,5 두번째부터 5개​​​​','2018-10-12 00:30:00',0,1),(10,2,'1008 데이터베이스 실습\n​\nGROUP BY / HAVING (having은 집계함수의 조건을 달때 사용)\nWHERE 절 뒤에 나옴\n​\nGROUP BY 할 때 잘 안묶임\ncount(속성)  null포함x 따라서 primary key사용\n다른 집계함수들도 null제외하고 실행\nselect문에서 집계함수를 제외한 속성들은 group by에 포함되어야 한다.\n​\ngroup by 를 했을 때 조건 having\n​\nrollup ','2018-10-11 21:41:00',0,1),(11,2,'1010 데이터베이스 실습\n​\nCREATE table tbl (속성이름 조건, 속성이름 조건);\n*조건 옵션 auto_increment일경우 null입력\n​\nauto_increment\nprimary key일경우 사용\n인경우 null입력\nset @auto_increment_increment=3;​\n​\nINSERT into tbl  [(속성, 속성)] values (값, 값)[,(값, 값) -다중값];\n속성이 있을경우 순서에 맞게 입력\nSELECT문으로 선택해 테이블을 만들 수 있다.\n​\nUPDATE tbl set 속성=값\nWHERE 조건\n​\nmysql 순서는 왼쪽부터 차례대로 진행\n​\nDELETE FROM tbl \nWHERE 조건\n​\n모두지우기 Truncate\n​\n​========================================================================\n​\nJOIN\n공유하는 컬럼은 SELECT문에서 어느 테이블의 속성인지 명시해주어야 한다.\n​\nINNER JOIN \n​\nOUTTER JOIN (한테이블에 값이 null인 경우 그것을 제외하고 join을 하게 된다. 그 값도 출력하고 싶은 경우)\nbuytbl left join usertbl  => buytbl 다 왼쪽 테이블이 모두다\nbuytbl right join usertbl => usertble 다\n​\ncross join X\n​\nunion 조건\n1.개수\n2.타입\n=>첫번째 컬럼으로 생성\n=>엘리어싱 해줘야한다.\n​','2018-10-10 17:48:00',0,1),(12,2,'java mapper의 위치와\r\nxml mapper의 namespace를 꼭 같게 해주어야 한다.\r\n아니면 been 에러가 뜬다.','2019-10-23 16:49:00',0,1),(13,2,'STS에서는 contrller 클래스에 @Controller 어노테이션을 작성해야 한다.\n 또한 액션메소드에 @RequestMapping 어노테이션을 작성해야 한다.\n @RequestMapping 어노테이션으로 url을 인식한다.','2019-10-23 16:50:00',0,1),(15,2,'<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css\" />\r\n<script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js\"></script>','2019-10-25 17:57:47',0,1),(16,2,'패턴 의미 출력 G 연대(BC, AD) AD y 년도 2017 M 월(1~12) 12 w 해당 년도의 몇 번째 주(1~53) 52 W 해당 월의 몇 번째 주(1~5) 5 D 해당 연도의 몇 번째 일(1~366) 364 d 해당 월의 몇 번째 일(1~31) 30 F 해당 월의 몇 번째 요일(1~5) 5 E 요일(월~일) Sat a 오전/오후(AM, PM) PM H 시간(0~23) 21 h 시간(1~12) 9 K 시간(0~11) 9 k 시간(1~24) 21 m 분(0~59) 31 s 초(0~59) 8 S 1/1000초(0~999) 297 Z 타임존 +0900 z 타임존(RFC 822) KST','2019-10-26 22:33:09',0,1);
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `path` (
  `PATH_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `TAG_NUM` int(11) NOT NULL,
  `PATH` varchar(500) NOT NULL,
  PRIMARY KEY (`PATH_NUM`),
  KEY `TAG_NUM` (`TAG_NUM`),
  CONSTRAINT `path_ibfk_1` FOREIGN KEY (`TAG_NUM`) REFERENCES `tag` (`TAG_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
/*!40000 ALTER TABLE `path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `TAG_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NUM` int(11) NOT NULL,
  `TAG_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`TAG_NUM`),
  KEY `USER_NUM` (`USER_NUM`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`USER_NUM`) REFERENCES `user` (`USER_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,1,'#자바플젝'),(2,1,'#autoBoxing'),(3,1,'#immutable'),(4,1,'#up-castring'),(5,1,'#down-casting'),(6,1,'#Thread'),(7,1,'#HashMap'),(8,1,'#TreeMap'),(9,1,'#정규식'),(10,1,'#compare'),(11,1,'#synchronized'),(12,2,'#데이터베이스'),(13,2,'#ERD'),(14,2,'#데이터베이스_실습'),(15,2,'#다대다'),(16,2,'#과제'),(17,2,'#SQL'),(18,2,'#mysql'),(19,2,'#서브쿼리'),(20,2,'#join'),(21,2,'#spring'),(22,2,'#@RequestMapping'),(23,2,'#@Controller'),(24,2,'#디비캡스톤디자인'),(27,2,'#semantic-ui'),(28,2,'#cdn'),(31,2,'#javascript'),(32,2,'#Java'),(33,2,'#시간'),(34,2,'#SimpleDateFormat');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm`
--

DROP TABLE IF EXISTS `tm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm` (
  `TAG_MEMO_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `TAG_NUM` int(11) NOT NULL,
  `MEMO_NUM` int(11) NOT NULL,
  PRIMARY KEY (`TAG_MEMO_NUM`),
  KEY `TAG_NUM` (`TAG_NUM`),
  KEY `MEMO_NUM` (`MEMO_NUM`),
  CONSTRAINT `tm_ibfk_1` FOREIGN KEY (`TAG_NUM`) REFERENCES `tag` (`TAG_NUM`),
  CONSTRAINT `tm_ibfk_2` FOREIGN KEY (`MEMO_NUM`) REFERENCES `memo` (`MEMO_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm`
--

LOCK TABLES `tm` WRITE;
/*!40000 ALTER TABLE `tm` DISABLE KEYS */;
INSERT INTO `tm` VALUES (1,1,1),(2,2,1),(3,3,1),(4,1,2),(5,4,2),(6,5,2),(7,1,3),(8,6,3),(9,1,4),(10,7,4),(11,8,4),(12,9,4),(13,10,5),(14,11,5),(15,1,5),(16,12,6),(17,13,6),(18,14,6),(19,15,6),(20,12,7),(21,13,7),(22,14,7),(23,16,7),(24,12,8),(25,14,8),(26,17,8),(27,18,8),(28,12,9),(29,14,9),(30,17,9),(31,18,9),(32,19,9),(33,12,10),(34,14,10),(35,17,10),(36,18,10),(37,12,11),(38,14,11),(39,17,11),(40,18,11),(41,20,11),(42,21,12),(43,12,12),(44,22,13),(45,23,13),(46,21,13),(58,27,15),(59,31,15),(60,24,15),(61,28,15),(62,32,16),(63,33,16),(64,34,16);
/*!40000 ALTER TABLE `tm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) NOT NULL,
  `USER_PASS` varchar(500) NOT NULL,
  `PASS_FIND_QUST` int(5) NOT NULL,
  `PASS_FIND_ANSR` varchar(50) NOT NULL,
  PRIMARY KEY (`USER_NUM`),
  UNIQUE KEY `userId_UNIQUE` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'cheon','1234',1,'후유'),(2,'jungea','1234',1,'집'),(3,'adamia','1234',5,'화가'),(5,'cing','1234',2,'노란색'),(6,'kamma','1234',2,'검정색'),(7,'raun','1234',3,'놀고 먹어라'),(8,'aeter','1234',3,'이불 밖은 위험해'),(9,'dara','1234',5,'프로그래머'),(10,'lair','1234',1,'닌텐도스위치'),(11,'repens','1234',5,'치과의사'),(12,'zion','1234',4,'서울초등학교'),(13,'radler','1234',4,'고려초등학교'),(14,'teen','1234',5,'뮤지컬배우'),(15,'alle','1234',3,'공부하자'),(16,'comyn','1234',2,'레몬색');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-27 22:42:04
