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
	
	<link rel="stylesheet" href="/goal/resources/css/separate/elements/cards.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/goal/resources/css/main.css">
    
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
						<select name="searchSelect">
							<option value="ID">ID</option>
							<option value="TITLE">Goal Title</option>
						</select>
						<input type="text" class="col-md-5" name="searchKeyid">
						<input type="submit" class="font-icon-search">
						<!-- <input type="image" class="glyphicon glyphicon-search" src="" onclikc=""> -->
						
						<!-- <div class="col-md-2">
							<select class="select2-arrow manual select2-no-search-arrow" name="searchSelect">
								<option value="id" selected="selected">ID</option>
								<option value="title">Title</option>
							</select>
							<input class="form-control" type="text" name="searchKeyid"placeholder="Search">
							<input type="submit" class="font-icon-search">
						</div>
 						<div class="col-md-7">
							<a href="#" onclick="search('${searchKeyid}')"><i class="font-icon-search"></i></a>
						</div> -->
					</div>
					</form>
					
				</div>
			</div>
		</header>
		
	<!-- 게시글 목록 -->
		<c:forEach items="${goalList}" var="list">
		<div class="cards-grid c" data-columns>
		<!-- <form action="boardList" method="get"> -->
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
									<button type="button" class="btn btn-rounded btn-inline btn-success btn-sm" name="checkId" onclick="">Start</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card-typical-section card-typical-content">
						<header class="title"><h5>${list.tGoalTitle}</a></h5></header>
						<p>시작날짜</p><p>${list.startDate}</p><br>
						<p>종료날짜</p><p>${list.endDate}</p>
					</div>
					<div class="card-typical-section">
						<div class="card-typical-linked">${list.currentMemberNumber}/4</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" class="card-typical-likes" id="addFovorite" name="addFovorite" onclick="addFovorite('${list.boardnum}')">
							<i class="font-icon font-icon-heart" id="favoriteNum">${list.favorite}</i>
						</a>
					</div>
						<%-- <input type="hidden" name="tGoalNum" value="${tGoalNum}">
						<input type="hidden" name="boardNum" value="${boardNum}"> --%>
				</article><!--.card-typical-->
			</div><!--.card-grid-col-->
			<!-- </form> -->
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

		function pageProc(currentPage, searchCondition, searchKeyword) {
			location.href= "/goal/board/boardList?currentPage=" + currentPage + "&searchCondition=" + searchCondition + "&searchKeyword=" + searchKeyword;
		}
		
	</script>

<script src="/goal/resources/js/app.js"></script>

</body>
</html>