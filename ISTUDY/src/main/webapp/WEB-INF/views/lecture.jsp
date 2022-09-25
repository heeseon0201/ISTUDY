<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>강의모아보기</title>
    <script src="https://kit.fontawesome.com/88d879a5c8.js" crossorigin="anonymous"></script>
    <style>
@charset "utf-8";
/*타이틀의 폰트 변동*/
@import
	url('https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@800&display=swap');
/*lecture, course의 폰트 변동*/
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');/* font-family: 'Hahmlet', serif; */
@import
	url('https://fonts.googleapis.com/css2?family=Courgette&display=swap');
.background{
	background: url("https://images.unsplash.com/photo-1512580770426-cbed71c40e94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1507&q=80");
	background-size: 100% ;
	height: 100vh;
}
header{position:fixed; width: 100%; height: 60px;}

:root{
	--text-color: #f0f4f5;
	--background-color: burlywood;
	--accent-color: black;
}

*{margin: 0; padding: 0;}

.nav > a {
	color: #f0f4f5;
}

a {
text-decoration: none;
color: var(--text-color);
 }

.navbar{
	font-family: 'Noto Sans KR', sans-serif;
	display:flex;
	justify-content: space-between;
	align-items: center;
	padding: 5px 12px;
	width: 100%;
	height: 50px;
    background-color: rgba( 255, 255, 255, 0.5 );
}

.navbar_logo {
	font-size: 25px;
	color: var(--text-color);
	padding-left: 30px;
}

.navbar_logo i {
	color: var(--accent-color);
}

.navbar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
}

.navbar_menu li {
	padding: 8px 45px;
	font-size: 25px;
	color: var(--text-color);
}

.navbar_menu li:hover{
	background-color:#6E6E6E;
	border-radius: 4px;
}

.navbar_account{
	display: flex;
	list-style: none;
	padding-left: 0;
}

.navbar_account li{
	padding: 8px 20px;
	color: var(--text-color);
	font-size: 25px;
}

.navbar_toggleBtn{
	display: none;
	position: absolute;
	right: 32px;
	font-size: 24px;
	color: var(--accent-color);
}

@media screen and (max-width: 768px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
		height: 60%;
	}

	.navbar_menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width:100%;
	}

	.navbar_menu li{
		width: 100%;
		text-align: center;
	}

	.navbar_account{
		display: none;
		justify-content: center;
		width: 100%;
	}

	.navbar_toggleBtn{
		display: block;
	}

	.navbar_menu.active,
	.navbar_account.active {
		display: flex;
	}
}


h1 {
	text-align: center;
	font-size: 5rem;
	text-decoration-line: none;
	/*-webkit-의 경우 브라우저가 크롬일 때를 고려*/
	-webkit-background-clip: text;
	
	font-weight: bold;
}

body {
	background: #EEE;
	font-family: 'Hahmlet', serif;
}

/*
div {
	text-align: center;
}
*/
/* 검색창 시작 */
input:-ms-input-placeholder {	color: #a8a8a8;}
input::-webkit-input-placeholder {	color: #a8a8a8;}
input::-moz-placeholder {	color: #a8a8a8}

.searchOut {
	text-align: center;
	margin: 15px;
}

.search {
	height: 40px;
	width: 400px;
	border: 1px solid #495057;
	background: #e9ecef;
	display: inline-block;
}

.searchInput {
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
	background: #e9ecef;
}

.searchBtn {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #495057;
	outline: none;
	float: right;
	color: #e9ecef;
}

/* 검색창 끝 */

/* 스터디만들기 */

        .create{
            margin-left:10px;
            height:40px;
            width:100px;
            border: 1px solid;
            display:inline-block;
        }
        .createBtn{
            width:100px;
            height:100%;
            border:0px;
            background:#495057;
            outline:none;
            float:right;
            color:#e9ecef;
        }
/* 스터디만들기 끝 */

/* 제목부분 */
.link{
	font-family:"courgette", cursive;
	padding-top: 100px;
}

/* 본문 표 */
table{
	text-align:center;
}
.article {
	width: 80%;
	margin: auto;
	border-collapse: collapse;
	table-layout:fixed;
	z-index:0;
}

.article tr td {

	border-bottom: 1px solid black;
	color: #495057;
	background-color: #e9ecef;
	border-color: #dee2e6;
	padding: 15px; /* 테두리와 내용사이 간격 */
	font-size:1rem;
	
	text-overflow:ellipsis; /* 글자가 넘어갈 경우 생략부호, 적용안되면 display 속성이 block 또는 inline-block에서만 동작하니 확인 */
	overflow:hidden; /* 글자 넘어가는것 숨김처리 */
	/*white-space:nowrap;*/ /* 공백문자 줄바꿈 하지 않고 한줄로 */

}
.cat{
	width:5%;
	line-height:1.2;
	height:3.6rem;
}
.name{
	width:30%;
	line-height:1.2;
	height:3.6rem;
}
td.name>a{
	text-decoration-line:none;
	color:#495057;
	
}

.count{
	width:10%;
	line-height:1.2;
	height:3.6rem;
	
}

.teach{
	width:10%;
	line-height:1.2;
	height:3.6rem;
}
.price{
	width:10%;
	line-height:1.2;
	height:3.6rem;
}
.point{
	width:5%;
	line-height:1.2;
	height:3.6rem;
}
.review{
	width:5%;
	white-space:normal;
	line-height:1.2;
	height:3.6rem;
}

th {
	height: 20px;
	border-top: 1px solid black;
	color: #fff;
	background-color: #343a40;
	border-color: #454d55;
	padding: 15px; /* 테두리와 내용사이 간격 */
}
/* 툴팁 띄우기 */
.help-tip {

    text-align: center;
    background-color: #BCDBEA;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    font-size: 14px;
    line-height: 26px;
    cursor: default;
}
.help-tip:before {
    content: '?';
    font-weight: bold;
    color: #fff;
}
.help-tip:hover p {
    display: block;
    transform-origin: 100% 0%;

    -webkit-animation: fadeIn 0.3s ease-in-out;
    animation: fadeIn 0.3s ease-in-out;
}
.help-tip p {
    display: none;
    text-align: left;
    background-color: #1E2021;
    padding: 20px;
    width: 300px;
    
    border-radius: 3px;
    box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
    
    color: #FFF;
    font-size: 13px;
    line-height: 1.4;
    z-index:1;
}
.help-tip p:before {
    position: absolute;
    content: '';
    width: 0;
    height: 0;
    border: 6px solid transparent;
    border-bottom-color: #1E2021;
    right: 10px;
    top: -12px;
}
.help-tip p:after {
    width: 100%;
    height: 40px;
    content: '';
    position: absolute;
    top: -40px;
    left: 0;
}
@-webkit-keyframes fadeIn {
    0% {
        opacity: 0;
        transform: scale(0.6);
    }

    100% {
        opacity: 100%;
        transform: scale(1);
    }
}

@keyframes fadeIn {
    0% {opacity: 0;}
    100% {opacity: 100%;}
}

/* 위치 지정하기 */
.boardlist{
	z-index:-1;
}


.foot{
	height:100px;
}
/*리뷰테이블의 th*/
.reviewtable{
   matgin:auto;
   border-bottom: 1px solid black;
   color: #fff;
   background-color: #343a40;
   border-color: #454d55;
   padding: 15px; /* 테두리와 내용사이 간격 */
   font-size:1rem;
   /* white-space:normal; */
   /* line-height:1.2;
   border-collapse: collapse;
   table-layout:fixed; */
}
/*후기 더보기*/
.review >a{
	text-decoration-line:none;
	color:#454d55;
	font-weight:bold;
}

/* 강의 목록 밑 페이지 */
.pages{
	text-align:center;

}
.pages a{
	text-decoration-line:none;
	color: white;
	font-weight:bold;
}

/*studycreat.jsp 폼 양식 시작*/
        .tableBasic{
            margin: auto;
            text-align: center;
            border-collapse: collapse;
        }
        .tableTd, .tableTh{
            border-top: 1px solid #495057;
            border-bottom: 1px solid #495057;
        }
        .tableTh{
            background: #495057;
            color: #e9ecef;
            padding: 10px;
        }
        .ta
        .tableTd{
            background-color: #495057;
            color:black;
        }
        .tableTd input{
            border:0px;
            padding: 10px;
            outline: none;
            background: #EEE;
        }
        .mkBtn{
            margin-top:10px;
            width:75px;
            height:30px;
            border:0px;
            background:#495057;
            outline:none;
            color:#e9ecef;
        }
		td.select > a{
            color: #495057;
        }
/*studycreat.jsp 폼 양식 끝*/

#goback{
	display: block;
	margin: 0px auto;
}
.gobackBtn{
	display: block;
	margin: 0px auto;
    width:100px;
    height:100%;
    border:0px;
    background:#495057;
    outline:none;
    color:#e9ecef;
        
}
    </style>
</head>
	<!--로고-->
	<header>
		<nav class="navbar">
               <div class="navbar_logo">
                   <i class="fas fa-graduation-cap"></i>
                   <a href="main.jsp">I-Study</a>
               </div>
               <ul class="navbar_menu">
                   <a href="main.jsp"><li>홈</li></a>
                   <a href="${cpaht}/lecture.do"><li>강의</li></a>
                   <a href=""><li>스터디</li></a>
               </ul>
               <ul class="navbar_account">
                <c:if test="${User == null}">
                        <a href="${cpath}/login.do"><li>로그인</li></a>
                        <a href="join.do"><li>회원가입</li></a>
                </c:if>
                <c:if test="${User != null}">
                        <a href=""><li>${User.userId}의 강의</li></a>
                        <a href=""><li>${User.userId}의 스터디</li></a>
                        <a href="${cpath}/logout.do"><li>로그아웃</li></a>
                </c:if>
                </ul>
               <a href="#" class="navbar_toggleBtn">
                   <i class="fas fa-bars"></i>
               </a>
           </nav>
	</header>
	<div style="text-align: left; margin: 0%" class="title"></div>
<body class="background">
    <h1 class="link"><b>Lecture</b></h1>
    <form class="searchForm" action="LectureSearchService">
        <div class="searchOut">
            <div class="search">
                <input type="text" placeholder="강의 검색" name="search_words" class="searchInput" autocomplete="off">
                <button class="searchBtn" type="submit" name="click">검색</button>
            </div>
        </div>
    </form>
	<div class="articleBoard">

                <table class="article" ><!-- 반복문을 이용하여 테이블을 정의 하였습니다. 나중에 데이터베이스에서 컬럼명을 변수로 가져와서 붙여넣을 것. -->
                <tr>
                    <th class="cat">카테고리</th>
                    <th class="name">강의명</th>
                    <th class="teach">강사명</th>
                    <th class="count">강좌수</th>
                    <th class="price">가격</th>
                    <th class="point">평점</th>
                    <th class="review">후기</th>
                    <th class="review">강의선택</th>
                    <!-- <th>URL</th> -->

                </tr>
			 <c:forEach var="list" items="${LectureList}">
            <tr class="boardList">
            	<td class="cat">${list.lectureCategory}</td>
                <td class="name"><a href="${list.lectureUrl}">${list.lectureName}</a></td>
                <td class="teach">${list.lectureTeach}</td>
				<td class="count">${list.lectureCount}</td>
                <td class="price">${list.lecturePrice}</td>
                <td class="point">${list.lecturePoint}</td>
                <td class="review"><a href="review.jsp?lecture_no=${list.lectureNo}">더보기</a></td>
                <td class="review"><a href="Course_Insert?lecture_no=${list.lectureNo}">선택</a></td>
            </tr>
            </c:forEach>
           
        </table>
        <div class="pages">
        <%
        String words = (String)session.getAttribute("words");
        for(int a =1; a<11;a++){ 
        	
        %>
        <a href="LectureSearchService?pages=<%=a%>&search_words=<%=words%>"><%=a %></a>
        <%} %>
        </div>
    </div>
    <button class="gobackBtn" onclick="${cpath}/main.do"
    style="width: 80px; height: 25px; font-size: 15px; display: block; margin: 30px auto;">홈으로</button>
    <div class="foot"></div>
</body>
</html>