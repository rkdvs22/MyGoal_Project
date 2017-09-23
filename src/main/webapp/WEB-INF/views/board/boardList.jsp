<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Board</title>

<link href="img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">
	
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/select2.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/typeahead.min.css">
	
	<link rel="stylesheet" href="/goal/resources/css/separate/elements/cards.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/goal/resources/css/main.css">
    
    <style>
    	.card-typical-content {
    		height: 180px;
    		overflow-y: auto;
    	} 
    </style>
</head>
<body>

<%@ include file="../menu.jsp" %>

<div class="page-content">
	<div class="container-fluid">
		<header class="section-header">
			<div class="tbl">
				<div class="tbl-row">
					<div class="tbl-cell">
						<h3>Board</h3>
					</div>
					
				<!-- 검색 -->
					<form action="boardList" method="get">
					<div class="form-group row">
						<div class="typeahead-container">
							<div class="typeahead-field">
								<select class="" name="searchSelect">
									<option value="ID">ID</option>
									<option value="TITLE">Goal Title</option>
								</select>
								<span class="typeahead-query">
									<input class="form-control" type="text" id="searchKeyid" name="searchKeyid" placeholder="Search">
								</span>
								<span class="typeahead-button">
									<button type="submit"class="font-icon-search"></button>
								</span>
							</div>
						</div>
					</div>
					</form>
					
				</div>
			</div>
		</header>
		
	<!-- 게시글 목록 -->
		<c:forEach items="${goalList}" var="list">
		<div class="cards-grid c" data-columns>
			<div class="card-grid-col">
				<article class="card-typical">
					<div class="card-typical-section">
						<div class="user-card-row">
							<div class="tbl-row">
								<div class="tbl-cell tbl-cell-photo">
									<a href="#"><img src="/goal/resources/img/photo-64-2.jpg" alt=""></a>
								</div>
								<div class="tbl-cell">
									<p class="user-card-row-name">${list.userid}</a></p>
								</div>
								<div class="tbl-cell tbl-cell-status">
									<button type="button" class="btn btn-rounded btn-inline btn-success btn-sm" name="checkId" onclick="start('${list.tGoalNum}')">Start</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card-typical-section card-typical-content">
						<header class="title"><h5>${list.tGoalTitle} </h5></header>
						<p>시작날짜</p><p>${list.startDate}</p><br>
						<p>종료날짜</p><p>${list.endDate}</p>
					</div>
					<div class="card-typical-section">
						<div class="card-typical-linked">${list.currentMemberNumber}/${list.maxMember}</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" class="card-typical-likes" onclick="addFavorite('${list.boardnum}')">
							<i class="font-icon font-icon-heart" data-like="false" data-boardnum="${list.boardnum}" id="favoriteNum">${list.favorite}</i>
						</a>
					</div>
						<%-- <input type="hidden" name="tGoalNum" value="${tGoalNum}">
						<input type="hidden" name="boardNum" value="${boardNum}"> --%>
				</article><!--.card-typical-->
			</div><!--.card-grid-col-->
		</div><!--.card-grid-->
		</c:forEach>
		<div class="clear"></div>
		
	<!-- 페이징 -->
		<nav>
			<div style="text-align: center;">
				<ul class="pagination" id="navigator">
					<li class="page-item disabled">
						<a class="page-link" href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchSelect}', '${searchKeyid}')" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>
					
					<c:forEach begin="${navi.startPageGroup}" end="${navi.endPageGroup}" var="counter">
						<c:if test="${counter == navi.currentPage}"><b></c:if>
							<li class="page-item">
								<a class="page-link" href="javascript:pageProc(${counter}, '${searchSelect}', '${searchKeyid}')">${counter}</a>
							</li>
						<c:if test="${counter == navi.currentPage}"></b></c:if>
					</c:forEach>
					
					<li class="page-item">
						<a class="page-link" href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchSelect}', '${searchKeyid}')" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		
	</div><!--.container-fluid-->
</div><!--.page-content-->

	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>

	<script src="/goal/resources/js/lib/salvattore/salvattore.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js"></script>
	<script>
		$(function() {
			$('.card-user').matchHeight();
		});

		// 페이징
		function pageProc(currentPage, searchSelect, searchKeyid) {
			location.href= "/goal/board/boardList?currentPage=" + currentPage + "&searchSelect=" + searchSelect + "&searchKeyid=" + searchKeyid;
		}
		
		// start 버튼 눌렀을때 (마방진 페이지로 이동)
		function start(tGoalNum) {
			location.href = "/goal/board/toMsquare?tGoalNum="+tGoalNum;
		}
		
		// 좋아요 (이미지 클릭시 숫자 증가)
		function addFavorite(boardnum) {
			//var result = confirm("좋아요");
			var likeit=$("i[data-boardnum='"+boardnum+"']").attr("data-like");
			
			if(likeit=="false"){
				$("i[data-boardnum='"+boardnum+"']").attr("data-like","true");
			
				if(boardnum) {
				$.ajax({
					url: "/goal/board/addFavorite",
					type: "post",
					data: {"boardnum":boardnum},
					success: function() {
						var temp=$("i[data-boardnum='"+boardnum+"']").html();
						$("i[data-boardnum='"+boardnum+"']").text(parseInt(temp)+1);
						}
					});
				}
			}
			else{
				alert("이미 좋아함");
			}
		}
		
	</script>

<script src="/goal/resources/js/app.js"></script>

</body>
</html>