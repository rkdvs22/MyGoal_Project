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
			<div class="cards-grid" data-columns>
				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
							<%-- <c:forEach items="${boardList}" var="list"> --%>
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/photo-64-2.jpg" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">작성자(userid)</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read(게시시간??)</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star active"></a>
									</div>
								</div>
							<%-- </c:forEach> --%>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<!-- <div class="photo">
								<img src="img/gall-img-1.jpg" alt="">
							</div> -->
							<header class="title"><h5><a href="#">T Goal Title</a></h5></header>
							<p>기간(시작 ~ 끝)<br>
								단추 추가 -> 마방진? 골트리?
							</p>
							<%-- <p>
								기간		 ~ ${list.tenddate}
							</p> --%>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">인원(현인원/총인원)</div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								좋아요
							</a>
						</div>
					</article><!--.card-typical-->
				</div><!--.card-grid-col-->

				<!-- <div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/avatar-1-64.png" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/avatar-2-64.png" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star active"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<div class="photo">
								<img src="img/gall-img-4.jpg" alt="">
							</div>
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow!</p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/photo-64-3.jpg" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/photo-64-4.jpg" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star active"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/avatar-3-64.png" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<div class="photo">
								<img src="img/gall-img-5.jpg" alt="">
							</div>
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow!</p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/photo-64-2.jpg" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star active"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/avatar-1-64.png" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/photo-64-2.jpg" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star active"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<div class="photo">
								<img src="img/gall-img-6.jpg" alt="">
							</div>
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow!</p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/avatar-2-64.png" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/photo-64-3.jpg" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star active"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow! </p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col

				<div class="card-grid-col">
					<article class="card-typical">
						<div class="card-typical-section">
							<div class="user-card-row">
								<div class="tbl-row">
									<div class="tbl-cell tbl-cell-photo">
										<a href="#">
											<img src="img/avatar-3-64.png" alt="">
										</a>
									</div>
									<div class="tbl-cell">
										<p class="user-card-row-name"><a href="#">Tim Colins</a></p>
										<p class="color-blue-grey-lighter">3 days ago - 23 min read</p>
									</div>
									<div class="tbl-cell tbl-cell-status">
										<a href="#" class="font-icon font-icon-star"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-typical-section card-typical-content">
							<div class="photo">
								<img src="img/gall-img-7.jpg" alt="">
							</div>
							<header class="title"><a href="#">The Jacobs Ladder of coding</a></header>
							<p>That’s a great idea! I’m sure we could start this project as soon as possible. Let’s meet tomorow!</p>
						</div>
						<div class="card-typical-section">
							<div class="card-typical-linked">in <a href="#">Coders Life</a></div>
							<a href="#" class="card-typical-likes">
								<i class="font-icon font-icon-heart"></i>
								123
							</a>
						</div>
					</article>.card-typical
				</div>.card-grid-col-->
			</div><!--.card-grid-->
			<div class="clear"></div>

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
	</script>

<script src="/goal/resources/js/app.js"></script>

</body>
</html>