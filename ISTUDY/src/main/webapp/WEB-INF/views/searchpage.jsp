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
	<title>검색페이지</title>
	<script src="https://kit.fontawesome.com/88d879a5c8.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	function getSearch(){
		let searchWord = $(".searchInput").val();
		$.ajax({
			url: window.location.origin + "/api/search?searchWord="+searchWord,
			type: 'get',
			dataType: 'json',
			success: (data) => {
				$(".article").empty();
				table = null;
				table += "<tr>"
				table += "<th>검색결과</th>";
				table += "</tr>";
				$.each(data, function(index, value){
					table += "<tr class=\"boardList\">";
		    		table += "<td class=\"cat\"><a style='color:black;' href='"+value.link+"'>" + value.title + "</a><br><br>";
		    		table += value.description + "</td>";
		    		table += "</tr>"
				});
				$(".article").append(table);
			}
		})
	}

	</script>
    <link rel="stylesheet" href="/resources/css/table.css">
</head>
</head>
	<!--로고-->
	<header>
		<nav class="navbar">
				<div class="navbar_logo">
					<i class="fas fa-graduation-cap"></i>
					<a href="main.jsp">I-Study</a>
				</div>
				<ul class="navbar_menu">
                    <a href="${cpath}/"><li>홈</li></a>
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
                        <a href="${cpaht}/logout.do"><li>로그아웃</li></a>
                </c:if>
                </ul>
				<a href="#" class="navbar_toggleBtn">
					<i class="fas fa-bars"></i>
				</a>
			</nav>
	</header>
	<div style="text-align: left; margin: 0%" class="title"></div>
<body class="background">
	<div>
	    <h1 class="link"><b>Naver Search</b></h1>
	    <div class="searchOut">
		        <div class="searchOut">
		            <div class="search">
		                <input type="text" placeholder="웹검색" name="search_words" class="searchInput" autocomplete="off" onkeyup="if(window.event.keyCode==13){javascript:getSearch()}">
		                <button class="searchBtn" type="submit" name="click" onclick="getSearch()">검색</button>
		            </div>
		        </div>
	    </div>
	    <div class="articleBoard">
	        <table class="article">
	            <tr>
	                <th>검색결과</th>
	            </tr>
	            <tr class="boardList">
	            </tr>
	        </table>
	    </div>
    </div>
	<button class="gobackBtn" onclick="${cpath}/"
    style="width: 80px; height: 25px; font-size: 15px; display: block; margin: 30px auto;">홈으로</button>
    <div class="foot"></div>
</body>
</html>