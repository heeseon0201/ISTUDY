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
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>강의모아보기</title>
    <script src="https://kit.fontawesome.com/88d879a5c8.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="/resources/css/table.css">
    <script>
    let cpath = '<c:out value="${cpath}" />';
    let userId = '<c:out value="${User.userId}" />';
    let lecturePage = 0; //현재페이지
	let searchWord = "";
	let listCount = 0;
	let table;
	let page;
	let pageListCount = 10; //한 페이지에 나타낼 데이터 수
	let pageListIndex = 1;
    $(document).ready(()=>{
    	getLecture();
		getLectureCount(searchWord);
    });   
  //강의정보 가져오기 - 오버로딩 구현(매개변수 있을 때 - 페이지네이션 / 없을 때 - 1페이지)
	function getLecture(){
	  	if(arguments.length == 0){
	  		lecturePage = 1;
	  	}else{
	  		lecturePage = arguments[0];
	  	}
		searchWord = $(".searchInput").val();
		$.ajax({
			url: window.location.origin+"/api/lecture"
			,type:'post'
			,data:{
				'lecturePage': lecturePage,
				'searchWord': searchWord
				}
			,dataType: "json"
			,success: function(data){ 
				showTable(data); 
				//매개변수가 없으면 카운트까지 가져와야 한다.
				if(arguments.length == 0){
					getLectureCount(searchWord); 
				}
			}
			,error: function(){console.error("getLecture error");}
		})
	}
  
    //강의카운트 가져오기-> 페이지네이션까지 변경하도록 진행
	function getLectureCount(searchWord){
		$.ajax({
			url: window.location.origin+"/api/lecture/count"
			,type:'post'
			,data:{
				'searchWord': searchWord
				}
			,dataType:"json"
			,success: function(data){ 
				listCount = data;
				showPagination(Math.ceil(lecturePage/pageListCount), data); }
			,error: function(){console.error("getLectureCount error");}
		})
	}

	function showTable(data){
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
    		table += "<tr class=\"boardList\">";
    		table += "<td class=\"cat\">" + value.lectureCategory + "</td>";
    		table += "<td class=\"name\"><a href="+ value.lectureUrl+">" + value.lectureName + "</a></td>";
    		table += "<td class=\"teach\">" + value.lectureTeach + "</td>";
    		table += "<td class=\"count\">" + value.lectureCount + "</td>";
    		table += "<td class=\"price\">" + value.lecturePrice + "</td>";
    		table += "<td class=\"point\">" + value.lecturePoint + "</td>";
    		table += "<td class=\"review\"><a href=\"\">더보기</a></td>";
    		table += "<td class=\"review\"><a href=\"javascript:addCourse("+value.lectureNo+")\">선택</a></td>";
    		table += "</tr>";
    	});
  		$(".article").append(table);
	}
	function showPagination(pageListIndex, listCount){
		//화면에 보여질 첫번째 페이지
		let firstPage = pageListIndex * pageListCount - (pageListCount - 1);
		//화면에 보여질 마지막 페이지
		let lastPage = pageListIndex * pageListCount;
		//총 페이지 수
		let totalPage = Math.ceil(listCount/pageListCount);
		
		//게시물의 개수가 10개 이하면 pagination을 나타내지 않는다.
		if (listCount <= 10) return;
		
		if(lastPage > totalPage) lastPage = totalPage;
		
		console.log('pageListCount: '+ pageListCount);
		console.log('pageListIndex: '+ pageListIndex);
		console.log('firstPage: '+ firstPage);
		console.log('lastPage: '+ lastPage);
		console.log('totalPage: '+ totalPage);
		$(".pages").empty();
		page = null;
		if(totalPage > 1 && pageListIndex >= 2){	
			page += '<a class="prev"><</a>\t\t';
		}
		for (let i = firstPage; i <= lastPage; i++) {
			  page += '<a href=\"javascript:getLecture('+i+')\">'+ i +'</a>\t';
			}
		if(totalPage > 1 && lastPage != totalPage){
			page += '<a class="next">></a>';
		}
		$(".pages").append(page);
		$(".prev").click(function(){
			pageListIndex--;
			getLecture(pageListIndex*pageListCount+1);
			showPagination(pageListIndex, listCount);
		});
		$(".next").click(function(){
			pageListIndex++;
			getLecture(pageListIndex * pageListCount+1);
			showPagination(pageListIndex, listCount);
		});
	}
	function addCourse(lectureNo){
		if(userId == ""){
			alert('로그인을 하지 않으면 강의를 선택할 수 없습니다.');
		}else{
			location.href = cpath+"/course?userId="+userId+"&lectureNo="+lectureNo;
		}
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
                <button class="searchBtn" name="click" onclick="getLecture()">검색</button>
            </div>
        </div>
	<div class="articleBoard">
        <table class="article" >
        </table>
        <div class="pages">

        </div>
    </div>
    <button class="gobackBtn" onclick="${cpath}/main.do"
    style="width: 80px; height: 25px; font-size: 15px; display: block; margin: 30px auto;">홈으로</button>
    <div class="foot"></div>
</body>
</html>