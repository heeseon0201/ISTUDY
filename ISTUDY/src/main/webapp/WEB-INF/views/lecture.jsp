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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="/resources/css/table.css">
    <script>
    let lecturePage = 1;
	let searchWord = "";
	let table;
    $(document).ready(()=>{
		getLecture(lecturePage, searchWord);
    });   
	function getLecture(lecturePage, searchWord){
		$.ajax({
			url: window.location.origin+"/api/lecture"
			,type:'post'
			,data:{
				'lecturePage': lecturePage,
				'searchWord': ""
				}
			,dataType:"json"
			,success: function(data){ setTable(data) }
			,error: function(){console.error("getLecture error");}
		})
	}
	function getLectureSearch(){
		lecturePage = 1;
		searchWord = $(".searchInput").val();
		console.log(searchWord);
		$.ajax({
			url: window.location.origin+"/api/lecture"
			,type:'post'
			,data:{
				'lecturePage': lecturePage,
				'searchWord': searchWord
				}
			,dataType:"json"
			,success: function(data){ setTable(data) }
			,error: function(){console.error("getLectureSearch error");}
		})
	}
	function setTable(data){
		$('.article').empty();
		table = null;
		table += "<tr>"
		table += "<th class=\"cat\">카테고리</th>";
		table += "<th class=\"name\">강의명</th>";
		table += "<th class=\"teach\">강사명</th>";
		table += "<th class=\"count\">강좌수</th>";
		table += "<th class=\"price\">가격</th>";
		table += "<th class=\"point\">평점</th>";
		table += "<th class=\"review\">후기</th>";
		table += "<th class=\"review\">강의선택</th>";
		table += "</tr>";
    	$.each(data, function(index, value){
    		console.log(index);
    		table += "<tr class=\"boardList\">";
    		table += "<td class=\"cat\">" + value.lectureCategory + "</td>";
    		table += "<td class=\"name\"><a href="+ value.lectureUrl+">" + value.lectureName + "</a></td>";
    		table += "<td class=\"teach\">" + value.lectureTeach + "</td>";
    		table += "<td class=\"count\">" + value.lectureCount + "</td>";
    		table += "<td class=\"price\">" + value.lecturePrice + "</td>";
    		table += "<td class=\"point\">" + value.lecturePoint + "</td>";
    		table += "<td class=\"review\"><a href=\"\">더보기</a></td>";
    		table += "<td class=\"review\"><a href=\"\">선택</a></td>";
    		table += "</tr>";
    		console.log('확인');
    	});
  		$(".article").append(table);

	}
    </script>
</head>
	<!--로고-->
	<header>
		<nav class="navbar">
               <div class="navbar_logo">
                   <i class="fas fa-graduation-cap"></i>
                   <a href="main.jsp">I-Study</a>
               </div>
               <ul class="navbar_menu">
                   <li><a href="main.jsp">홈</a></li>
                   <li><a href="${cpaht}/lecture.do">강의</a></li>
                   <li><a href="">스터디</a></li>
               </ul>
               <ul class="navbar_account">
                <c:if test="${User == null}">
                        <li><a href="${cpath}/login.do">로그인</a></li>
                        <li><a href="join.do">회원가입</a></li>
                </c:if>
                <c:if test="${User != null}">
                        <li><a href="">${User.userId}의 강의</a></li>
                        <li><a href="">${User.userId}의 스터디</a></li>
                        <li><a href="${cpath}/logout.do">로그아웃</a></li>
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
        <div class="searchOut">
            <div class="search">
                <input type="text" placeholder="강의 검색" name="search_words" class="searchInput" autocomplete="off">
                <button class="searchBtn" name="click" onclick="getLectureSearch()">검색</button>
            </div>
        </div>
	<div class="articleBoard">

                <table class="article" >
               
            
           
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