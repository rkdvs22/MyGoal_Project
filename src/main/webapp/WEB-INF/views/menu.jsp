<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Menu</title>

<!-- context path 명에 맞게 /goal/ 부분을 고쳐야 합니다 -->
	<link href="/goal/resources/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" href="/goal/resources/css/lib/lobipanel/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/jqueryui/jquery-ui.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/widgets.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/goal/resources/css/main.css">
	
	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/jqueryui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/lobipanel/lobipanel.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js"></script>
	<script src="/goal/resources/js/app.js"></script>
<!-- 	<script src="https://www.gstatic.com/charts/loader.js"></script> -->

</head>
<body>
<script>
	$(function(){
		$(".brown").on("click",function(){
			calendarForm();
		});	
	});
	
	// 로그인 화면으로 이동
	function loginForm() {
		location.href = "/goal/member/loginForm";
	}
	
	// 회원가입 화면으로 이동
	function joinForm() {
		location.href = "/goal/member/joinForm";
	}
	
	function calendarForm(){
		location.href = "/goal/calendar/calendar";
	}
</script>

<!--헤더(상단메뉴)-->
<header class="site-header">
	<div class="container-fluid">
		<a href="/goal" class="site-logo-text">みんなのゴール</a>
		<button class="hamburger hamburger--htla">
			<span>toggle menu</span>
		</button>
		<!-- 로그인 버튼, 로그인 후의 메뉴 -->
		<div class="site-header-content">
			<div class="site-header-content-in">
				<div class="site-header-shown">
				<c:if test="${empty userid eq true}">
				<!-- 헤더 로그인/회원가입 버튼 -->
	                 <button type="button" class="btn btn-rounded btn-inline btn-success-outline btn-sm" onclick="loginForm()">LOGIN</button>
	                 <button type="button" class="btn btn-rounded btn-inline btn-success-outline btn-sm" onclick="joinForm()">SIGN UP</button>
                </c:if>
                
				<!-- 헤더 메시지 알람 부분 -->
				<c:if test="${empty userid eq false}">
					<div class="dropdown dropdown-notification notif">
						<a href="#"
						class="header-alarm dropdown-toggle active"
						id="dd-notification"
						data-toggle="dropdown"
						aria-haspopup="true"
						aria-expanded="false">
							<i class="font-icon-alarm"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-notif" aria-labelledby="dd-notification">
							<div class="dropdown-menu-notif-header">
								Notifications
								<span class="label label-pill label-danger">4</span>
							</div>
							<div class="dropdown-menu-notif-list">
								<div class="dropdown-menu-notif-item">
									<div class="photo">
										<img src="/goal/resources/img/photo-64-1.jpg" alt="">
									</div>
									<div class="dot"></div>
									<a href="#">Morgan</a> was bothering about something
									<div class="color-blue-grey-lighter">7 hours ago</div>
								</div>
								<div class="dropdown-menu-notif-item">
									<div class="photo">
										<img src="/goal/resources/img/photo-64-2.jpg" alt="">
									</div>
									<div class="dot"></div>
										<a href="#">Lioneli</a> had commented on this <a href="#">Super Important Thing</a>
										<div class="color-blue-grey-lighter">7 hours ago</div>
								</div>
								<div class="dropdown-menu-notif-item">
									<div class="photo">
										<img src="/goal/resources/img/photo-64-3.jpg" alt="">
									</div>
									<div class="dot"></div>
									<a href="#">Xavier</a> had commented on the <a href="#">Movie title</a>
									<div class="color-blue-grey-lighter">7 hours ago</div>
								</div>
								<div class="dropdown-menu-notif-item">
									<div class="photo">
										<img src="/goal/resources/img/photo-64-4.jpg" alt="">
									</div>
									<a href="#">Lionely</a> wants to go to <a href="#">Cinema</a> with you to see <a href="#">This Movie</a>
									<div class="color-blue-grey-lighter">7 hours ago</div>
								</div>
							</div>
							<div class="dropdown-menu-notif-more">
								<a href="#">See more</a>
							</div>
						</div>
					</div>
					
					<!-- 헤더 개인정보부분 -->
					<div class="dropdown user-menu">
						<button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<c:if test="${empty image eq true}">
								<img src="/goal/resources/img/avatar-2-64.png" alt="" >
							</c:if>
							<c:if test="${empty image eq false}">
								<img src="${image}" alt="">
							</c:if>
						</button>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
							<a class="dropdown-item" href="/goal/member/updateMember"><span class="font-icon glyphicon glyphicon-user"></span>My Page</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/goal/member/logout"><span class="font-icon glyphicon glyphicon-log-out"></span>Logout</a>
						</div>
					</div>
				</c:if>
	
					<button type="button" class="burger-right">
						<i class="font-icon-menu-addl"></i>
					</button>
				</div><!--.site-header-shown-->
	
				<div class="mobile-menu-right-overlay"></div>
				<div class="site-header-collapsed">
					<div class="site-header-collapsed-in">
						<div class="dropdown dropdown-typical">
						</div>
						<div class="dropdown dropdown-typical">
						</div>
					</div><!--.site-header-collapsed-in-->
				</div><!--.site-header-collapsed-->
			</div><!--site-header-content-in-->
		</div><!--.site-header-content-->
	</div><!--.container-fluid-->
</header><!--.site-header-->


<!-- 사이드 메뉴 -->
<div class="mobile-menu-left-overlay"></div>
<!-- 이웅희 : nav 부분이 side menu의 대시보드 스킨을 변경하는 부분! -->
	<nav class="side-menu side-menu-compact">
	<%-- <c:if test="${empty userid eq false}">
		<div class="side-menu-avatar">
			<div class="avatar-preview avatar-preview-64">
				<img src="/goal/resources/img/avatar-1-128.png" alt="">
			</div>
		</div>
	</c:if> --%>
		<ul class="side-menu-list">
			<li class="brown">
				<a href="/goal">
					<i class="font-icon font-icon-home"></i>
					<span class="lbl">Home</span>
				</a>
			</li>
			<li class="blue-dirty">
				<a href="#">
					<i class="font-icon font-icon-notebook"></i>
					<span class="lbl">Board</span>
				</a>
			</li>
			<li class="brown">
				<a href="/goal/calendar/calendar">
					<i class="font-icon font-icon-event"></i>
					<span class="lbl">Calendar</span>
				</a>
			</li>
			<li class="pink">
				<a href="/goal/goalTree/goalList">
					<i class="glyphicon glyphicon-tree-conifer"></i>
					<span class="lbl">Goal Tree</span>
				</a>
			</li>
			<li class="red">
				<a href="/goal/createGoal/MGoalSquareForm">
					<i class="font-icon font-icon-case-2"></i>
					<span class="lbl">Create Goal</span>
				</a>
			</li>
			<!-- <li class="green">
				<a href="#">
					<i class="font-icon font-icon-cart"></i>
					<span class="lbl">My Goal List</span>
				</a>
			</li> -->
			
			<li class="blue">
				<a href="/goal/friend/openFriend">
					<i class="font-icon font-icon-users"></i>
					<span class="lbl">Friend</span>
				</a>
			</li>
			
			<li class="aquamarine">
				<a href="/goal/message/sendNReceiveList">
					<i class="font-icon font-icon-mail"></i>
					<span class="lbl">Message</span>
				</a>
			</li>
			<!-- <li class="coral">
				<a href="#">
					<i class="font-icon font-icon-chart"></i>
					<span class="lbl">Records</span>
				</a>
			</li>
			<li class="blue-sky">
				<a href="#">
					<i class="font-icon font-icon-question"></i>
					<span class="lbl">Help</span>
				</a>
			</li> -->
		</ul>
	</nav><!--.side-menu-->
	


</body>
</html>