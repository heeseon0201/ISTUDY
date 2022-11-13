<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>I-Study</title>
    <script src="https://kit.fontawesome.com/88d879a5c8.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
	    var mHtml = $("html");
	    var page=1;
	
	    mHtml.animate({scrollTop : 0}, 10);
	
	    $(window).on("wheel", function(e) {
	        if(mHtml.is(":animated")) return;
	        if(e.originalEvent.deltaY > 0) {
	            if(page == 3) return;
	            page++;
	        } else if(e.originalEvent.deltaY < 0) {
	            if(page == 1) return;
	            page--;
	        }
	    	var posTop =(page-1) * $(window).height();
	    	mHtml.animate({scrollTop : posTop});
	    })
    </script>
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');/* font-family: 'Hahmlet', serif; */
@import url('https://fonts.googleapis.com/css2?family=Courgette&display=swap');

html{
    overflow: hidden;
}

html, body{
    display: block;
    width: 100%;
    height: 100%;
    margin: 0;
}

.section {
    width: 100%;
    height: 100vh;
    position: relative;
}

#section1 {
    background-color: aliceblue;
}
#section2 {
    background-color:#E6E6E6;
}
#section3 {
    background-color: #f1f1f1;
}

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
	height: 60px;
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
header{position:fixed; width: 100%; height: 60px;}

.item-bg{
    background: url("https://images.unsplash.com/photo-1512580770426-cbed71c40e94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1507&q=80");
	background-size: 100% ;
	height: 100vh;
}

#main {
	padding-top: 25%;
    padding-left: 5%;
	height: 100%;
    color: #EBE5E5;
}

.linkTitle>a{
	color:black;
    font-size: 5rem;
    /*-webkit-占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 크占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙*/
    -webkit-background-clip: text;
    height: 5rem;
}
.linkTitle{
	text-align: center;
    padding-top: 50px;
}
.link{
	font-family:'courgette', cursive;
    margin-top: 25px;
}

section.MOD_FEATURE > div {
    padding-top: 80px;
}
body {
    font-size: 100%;
}
* {
    box-sizing: border-box;
}
body,
html {
    margin: 0;
}
[data-layout^="_r"] {
    display: flex;
    flex-wrap: wrap;
    flex: 1 1 auto;
}
[data-layout^="_r"][data-layout*=end] {
    justify-content: flex-end;
}
@media (min-width:31.25em) {
    [data-layout^="_r"] [data-layout*=ch1] {
        flex: 0 0 6.25%;
    }
    [data-layout^="_r"] [data-layout*=ch2] {
        flex: 0 0 12.5%;
    }
    [data-layout^="_r"] [data-layout*=ch3] {
        flex: 0 0 18.75%;
    }
    [data-layout^="_r"] [data-layout*=ch4] {
        flex: 0 0 25%;
    }
    [data-layout^="_r"] [data-layout*=ch5] {
        flex: 0 0 31.25%;
    }
    [data-layout^="_r"] [data-layout*=ch-third] {
        flex: 0 0 33.333%;
    }
    [data-layout^="_r"] [data-layout*=ch6] {
        flex: 0 0 37.5%;
    }
    [data-layout^="_r"] [data-layout*=ch7] {
        flex: 0 0 43.75%;
    }
    [data-layout^="_r"] [data-layout*=ch8],
    [data-layout^="_r"] [data-layout*=ch-half] {
        flex: 0 0 50%;
    }
    [data-layout^="_r"] [data-layout*=ch9] {
        flex: 0 0 56.25%;
    }
    [data-layout^="_r"] [data-layout*=ch10] {
        flex: 0 0 62.5%;
    }
    [data-layout^="_r"] [data-layout*=ch11] {
        flex: 0 0 68.75%;
    }
    [data-layout^="_r"] [data-layout*=ch12] {
        flex: 0 0 75%;
    }
    [data-layout^="_r"] [data-layout*=ch13] {
        flex: 0 0 81.25%;
    }
    [data-layout^="_r"] [data-layout*=ch14] {
        flex: 0 0 87.5%;
    }
    [data-layout^="_r"] [data-layout*=ch15] {
        flex: 0 0 93.75%;
    }
    [data-layout^="_r"] [data-layout*=ch16] {
        flex: 0 0 100%;
    }
    [data-layout^="_r"] [data-layout*=ch-o1] {
        order: 1;
    }
    [data-layout^="_r"] [data-layout*=ch-o2] {
        order: 2;
    }
    [data-layout^="_r"] [data-layout*=ch-o3] {
        order: 3;
    }
    [data-layout^="_r"] [data-layout*=ch-o4] {
        order: 4;
    }
    [data-layout^="_r"] [data-layout*=ch-o5] {
        order: 5;
    }
    [data-layout^="_r"] [data-layout*=ch-o6] {
        order: 6;
    }
    [data-layout^="_r"] [data-layout*=ch-o7] {
        order: 7;
    }
    [data-layout^="_r"] [data-layout*=ch-o8] {
        order: 8;
    }
    [data-layout^="_r"] [data-layout*=ch-o9] {
        order: 9;
    }
    [data-layout^="_r"] [data-layout*=ch-o10] {
        order: 10;
    }
    [data-layout^="_r"] [data-layout*=ch-o11] {
        order: 11;
    }
    [data-layout^="_r"] [data-layout*=ch-o12] {
        order: 12;
    }
    [data-layout^="_r"] [data-layout*=ch-o13] {
        order: 13;
    }
    [data-layout^="_r"] [data-layout*=ch-o14] {
        order: 14;
    }
    [data-layout^="_r"] [data-layout*=ch-o15] {
        order: 15;
    }
    [data-layout^="_r"] [data-layout*=ch-o16] {
        order: 16;
    }
    [data-layout^="_r"] [data-layout*=ch-n0] {
        margin-right: 0;
    }
    [data-layout^="_r"] [data-layout*=ch-n1] {
        margin-right: 6.25%;
    }
    [data-layout^="_r"] [data-layout*=ch-n2] {
        margin-right: 12.5%;
    }
    [data-layout^="_r"] [data-layout*=ch-n3] {
        margin-right: 18.75%;
    }
    [data-layout^="_r"] [data-layout*=ch-n4] {
        margin-right: 25%;
    }
    [data-layout^="_r"] [data-layout*=ch-n5] {
        margin-right: 31.25%;
    }
    [data-layout^="_r"] [data-layout*=ch-n6] {
        margin-right: 37.5%;
    }
    [data-layout^="_r"] [data-layout*=ch-n7] {
        margin-right: 43.75%;
    }
    [data-layout^="_r"] [data-layout*=ch-n8] {
        margin-right: 50%;
    }
    [data-layout^="_r"] [data-layout*=ch-n9] {
        margin-right: 56.25%;
    }
    [data-layout^="_r"] [data-layout*=ch-n10] {
        margin-right: 62.5%;
    }
    [data-layout^="_r"] [data-layout*=ch-n11] {
        margin-right: 68.75%;
    }
    [data-layout^="_r"] [data-layout*=ch-n12] {
        margin-right: 75%;
    }
    [data-layout^="_r"] [data-layout*=ch-n13] {
        margin-right: 81.25%;
    }
    [data-layout^="_r"] [data-layout*=ch-n14] {
        margin-right: 87.5%;
    }
    [data-layout^="_r"] [data-layout*=ch-n15] {
        margin-right: 93.75%;
    }
}
@media (min-width:56.25em) {
    [data-layout^="_r"] [data-layout*=ec1] {
        flex: 0 0 6.25%;
    }
    [data-layout^="_r"] [data-layout*=ec2] {
        flex: 0 0 12.5%;
    }
    [data-layout^="_r"] [data-layout*=ec3] {
        flex: 0 0 18.75%;
    }
    [data-layout^="_r"] [data-layout*=ec4] {
        flex: 0 0 25%;
    }
    [data-layout^="_r"] [data-layout*=ec5] {
        flex: 0 0 31.25%;
    }
    [data-layout^="_r"] [data-layout*=ec-third] {
        flex: 0 0 33.333%;
    }
    [data-layout^="_r"] [data-layout*=ec6] {
        flex: 0 0 37.5%;
    }
    [data-layout^="_r"] [data-layout*=ec7] {
        flex: 0 0 43.75%;
    }
    [data-layout^="_r"] [data-layout*=ec8],
    [data-layout^="_r"] [data-layout*=ec-half] {
        flex: 0 0 50%;
    }
    [data-layout^="_r"] [data-layout*=ec9] {
        flex: 0 0 56.25%;
    }
    [data-layout^="_r"] [data-layout*=ec10] {
        flex: 0 0 62.5%;
    }
    [data-layout^="_r"] [data-layout*=ec11] {
        flex: 0 0 68.75%;
    }
    [data-layout^="_r"] [data-layout*=ec12] {
        flex: 0 0 75%;
    }
    [data-layout^="_r"] [data-layout*=ec13] {
        flex: 0 0 81.25%;
    }
    [data-layout^="_r"] [data-layout*=ec14] {
        flex: 0 0 87.5%;
    }
    [data-layout^="_r"] [data-layout*=ec15] {
        flex: 0 0 93.75%;
    }
    [data-layout^="_r"] [data-layout*=ec16] {
        flex: 0 0 100%;
    }
    [data-layout^="_r"] [data-layout*=ec-o1] {
        order: 1;
    }
    [data-layout^="_r"] [data-layout*=ec-o2] {
        order: 2;
    }
    [data-layout^="_r"] [data-layout*=ec-o3] {
        order: 3;
    }
    [data-layout^="_r"] [data-layout*=ec-o4] {
        order: 4;
    }
    [data-layout^="_r"] [data-layout*=ec-o5] {
        order: 5;
    }
    [data-layout^="_r"] [data-layout*=ec-o6] {
        order: 6;
    }
    [data-layout^="_r"] [data-layout*=ec-o7] {
        order: 7;
    }
    [data-layout^="_r"] [data-layout*=ec-o8] {
        order: 8;
    }
    [data-layout^="_r"] [data-layout*=ec-o9] {
        order: 9;
    }
    [data-layout^="_r"] [data-layout*=ec-o10] {
        order: 10;
    }
    [data-layout^="_r"] [data-layout*=ec-o11] {
        order: 11;
    }
    [data-layout^="_r"] [data-layout*=ec-o12] {
        order: 12;
    }
    [data-layout^="_r"] [data-layout*=ec-o13] {
        order: 13;
    }
    [data-layout^="_r"] [data-layout*=ec-o14] {
        order: 14;
    }
    [data-layout^="_r"] [data-layout*=ec-o15] {
        order: 15;
    }
    [data-layout^="_r"] [data-layout*=ec-o16] {
        order: 16;
    }
    [data-layout^="_r"] [data-layout*=ec-n0] {
        margin-right: 0;
    }
    [data-layout^="_r"] [data-layout*=ec-n1] {
        margin-right: 6.25%;
    }
    [data-layout^="_r"] [data-layout*=ec-n2] {
        margin-right: 12.5%;
    }
    [data-layout^="_r"] [data-layout*=ec-n3] {
        margin-right: 18.75%;
    }
    [data-layout^="_r"] [data-layout*=ec-n4] {
        margin-right: 25%;
    }
    [data-layout^="_r"] [data-layout*=ec-n5] {
        margin-right: 31.25%;
    }
    [data-layout^="_r"] [data-layout*=ec-n6] {
        margin-right: 37.5%;
    }
    [data-layout^="_r"] [data-layout*=ec-n7] {
        margin-right: 43.75%;
    }
    [data-layout^="_r"] [data-layout*=ec-n8] {
        margin-right: 50%;
    }
    [data-layout^="_r"] [data-layout*=ec-n9] {
        margin-right: 56.25%;
    }
    [data-layout^="_r"] [data-layout*=ec-n10] {
        margin-right: 62.5%;
    }
    [data-layout^="_r"] [data-layout*=ec-n11] {
        margin-right: 68.75%;
    }
    [data-layout^="_r"] [data-layout*=ec-n12] {
        margin-right: 75%;
    }
    [data-layout^="_r"] [data-layout*=ec-n13] {
        margin-right: 81.25%;
    }
    [data-layout^="_r"] [data-layout*=ec-n14] {
        margin-right: 87.5%;
    }
    [data-layout^="_r"] [data-layout*=ec-n15] {
        margin-right: 93.75%;
    }
}
/* 메인 4개 띄워주는것. 건들지 말것*/
.MOD_FEATURE_Container {
  background: white;
  display: block;
  text-decoration: none;
  border: 1px solid #6E6E6E;
}
.MOD_FEATURE_Container:hover img {
  filter: brightness(1.2);
}

.MOD_FEATURE_Title {
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 0 1rem 0;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1; /* number of lines to show */
  -webkit-box-orient: vertical;
}

.MOD_FEATURE_TextContainer {
  padding: 1rem;
  height: 350px;/*박스 높이 고정*/

}

.MOD_FEATURE_Description {
  color: black;
  /*줄수 제한하기*/
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 8; /* number of lines to show */
  -webkit-box-orient: vertical;
}

.MOD_FEATURE_Picture {
  display: block;
  transition: filter 0.2s;
}

body {
  font-size: 100%;
  background-color: #f1f1f1;
}


[data-layout=_r] {
  max-width: 1650px;
  margin: 0 auto;
  padding: 2rem 1rem;
}
[data-layout=_r] > div, [data-layout=_r] > article, [data-layout=_r] > aside {
  padding: 0 1rem 1rem 1rem;
}
[data-layout=_r] img {
  width: 100%;
  height: auto;
}

.nopadding {
  padding: 0 1rem;
}

h1 {
  font-size: 4rem;
  margin: 0;
  padding: 0.5rem 0;
}

h2 {
  font-size: 1.8rem;
}

h3 {
  font-size: 1.5rem;
}

p {
  line-height: 1.4;
  font-size: 20px;
}

div#main > p {
  line-height: 8;
  font-size: 30px;
}

p.MOD_FEATURE_Title {
  color: black;
}
/*메인4개 띄워주는것 끝.*/
    </style>
</head>
<body>
    <div class="section" id="section1">
        <header>
            <nav class="navbar">
                <div class="navbar_logo">
                    <i class="fas fa-graduation-cap"></i>
                    <a href="main.jsp">I-Study</a>
                </div>
                <ul class="navbar_menu">
                    <a href="${cpaht}/"><li>홈</li></a>
                    <a href="${cpaht}/lecture.do"><li>강의</li></a>
                    <a href=""><li>스터디</li></a>
                </ul>
                <ul class="navbar_account">
                <c:if test="${User == null}">
                	<a href="${naverUrl}">네이버 로그인</a>
                        <a href="${cpath}/login.do"><li>로그인</li></a>
                        <a href="join.do"><li>회원가입</li></a>
                </c:if>
                <c:if test="${User != null}">
                        <a href=""><li>${User.userName}의 강의</li></a>
                        <a href=""><li>${User.userName}의 스터디</li></a>
                        <a href="${cpaht}/logout.do"><li>로그아웃</li></a>
                </c:if>
                </ul>
                <a href="#" class="navbar_toggleBtn">
                    <i class="fas fa-bars"></i>
                </a>
            </nav>
        </header>
        <div class="item-bg">
            <div id="main">
				<h1>언택트 시대, 최고의 선택</h1>
				<br>
				<p>최고의 강의 선택을 도와드립니다.</p>
			</div>
		</div>
        
    </div>

</body>
</html>