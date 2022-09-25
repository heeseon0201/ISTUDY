<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
	<style>
	@charset "utf-8";

/*폰트 임포트*/
@import url('https://fonts.googleapis.com/css2?family=Courgette&family=Hahmlet&display=swap');
/* 
font-family: 'Courgette', cursive;
font-family: 'Hahmlet', serif;
 */

/*메인페이지 상단의 로고, 회원가입, 로그인*/
header {
	height: 30px;
	padding: 1rem;
	color: white;
	font-weight: bold;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0;
}
.whiteColor{
	color:white;
}
/*lecture, study 설명 테이블*/
table {
	margin-top: 50px;
	width: 90%;
	height: 400px;
	border: 1px solid black;
	max-width: 100%;

}
/*메인로고*/
.title {
	background: url("https://images.unsplash.com/photo-1512580770426-cbed71c40e94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1507&q=80");
	background-size: 100% ;
	height: 100vh;
}

/*메인페이지 페이지 상세 설명*/
#main {
	margin-top: 150px;
	line-height: 10px;
	color:white;
	
}
/*메인페이지*/
main {
	padding: 1rem;
	height: 100%;
}
a {
	text-decoration: none;
	color: black;
}
body, html {
	height: 200%;
	font-family: 'Hahmlet', serif;
	font-weight: bold;
}

/*Lecture, groupstudy의 폰트 조정*/

.linkTitle>a{
	color:black;
    font-size: 5rem;
    /*-webkit-의 경우 브라우저가 크롬일 때를 고려*/
    -webkit-background-clip: text;
    height: 5rem;
}
.linkTitle{
	text-align: center;
}
.link{
	font-family:'courgette', cursive;
}
th>a{
	color:black;
}
td{
    text-align: center;
}
a.info{
	color: black;
}

/* 로그인페이지 가운데정렬 적용 */
.loginDiv{
    text-align: center;
	margin:auto;
	width:50%;
	padding:0.5rem;
}
.findid>div{
	text-align:center;
}


/*로그인페이지*/


/*로그인로고*/
.loginlogo{
	font-family: 'Hahmlet', serif;
	font-size: 2rem;
	color:black;
    /*-webkit-의 경우 브라우저가 크롬일 때를 고려*/
    -webkit-background-clip: text;
}
/*로그인페이지의 안에 테이블*/
#logintable{
	width: 30%;
	margin: auto;
	height: 30px;
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
}

 
/*로그인페이지*/
.title{
	margin:auto;
	z-index: 1;
}
/*투명한 배경*/
.title::after{
	width:100%;
	height:100%;
	content: "";
	position: absolute;
	top:0;
	left:0;
	background-color: white;
	z-index: -1;
	opacity:0.5;
}
.findid>div>a{
	color:black;
}

    .loginDiv .gobackBtn, .loginDiv .in2{
    margin: 0px auto;
    width:100px;
    border:0px;
    background:#495057;
    outline:none;
    color:#e9ecef;}
	</style>

</head>
<body class="title">
	<div class="linkTitle">
            <h1>
                <a href = "main.jsp" class = "h_logo">
                    <span> I-Study </span>
                </a>
            </h1>
	</div>
    <form action="sing.do" method="get" style="position: relative;">
        <div class="loginDiv">
            <h2 class="loginlogo">로그인</h2>
        </div>
        <table id="logintable">
            <tr>
                <td class="loginDiv">아이디</td>
                <td class="loginDiv"><input type="text" class="in" name="userId"></td>
            </tr>
            <tr>
                <td class="loginDiv">비밀번호</td>
                <td class="loginDiv"><input type="password" class="in" name="userPw"></td>
            </tr>
            <tr>
                <td colspan="2" class="findid">
                    <div ><a href="#">아이디찾기</a></div>
                    <div ><a href="#">비밀번호찾기</a></div>
                </td>
                
            </tr>
        </table>
        <div class="loginDiv" style="margin-top: 30px;">
            <input type="submit" class="in2" value="로그인" >
            <button type="button" class="gobackBtn" onclick="${cpath}/main.do" style="position:relative; display: inline-block; margin: auto;">뒤로 가기</button>
        </div>    
    </form>
</body>
</html>