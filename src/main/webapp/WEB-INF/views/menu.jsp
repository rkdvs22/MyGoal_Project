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
	<link rel="stylesheet" href="/goal/resources/css/main.css?version=8">
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/lobipanel/lobipanel.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js"></script>
	<script src="/goal/resources/js/app.js"></script>
<!-- 	<script src="https://www.gstatic.com/charts/loader.js"></script> -->

</head>
<body class="with-side-menu-compact dark-theme dark-theme-green">
<script>
	$(document).ready(function() {
		//프로필 사진 클릭시 드롭다운 메뉴
		$(".dropdown-toggle").on("click", function() {
			var currentValue = $(this).attr("aria-expanded");
			if (currentValue == "true") {
				$(this).attr("aria-expanded", "false");
				$(this).parent().removeClass("show");
			} else {
				$(this).attr("aria-expanded", "true");
				$(this).parent().addClass("show");
			}
		});
		
		//
	})
	
	// 로그인 화면으로 이동
	function loginForm() {
		location.href = "/goal/member/loginForm";
	}
	
	// 회원가입 화면으로 이동
	function joinForm() {
		location.href = "/goal/member/joinForm";
	}
</script>

<!--헤더(상단메뉴)-->
<header class="site-header">
	<div class="container-fluid">
		<a href="/goal" class="site-logo-text"><img src="/goal/resources/img/logo.png" style="width:200px"></a>
		<button class="hamburger hamburger--htla">
			<span>toggle menu</span>
		</button>
		<!-- 로그인 버튼, 로그인 후의 메뉴 -->
		<div class="site-header-content">
			<div class="site-header-content-in">
				<div class="site-header-shown">
				<c:if test="${empty userid eq true}">
				<!-- 헤더 로그인/회원가입 버튼 -->
	                 <button type="button" class="btn btn-rounded btn-success-outline btn-sm" onclick="loginForm()">LOGIN</button>
	                 <button type="button" class="btn btn-rounded btn-success-outline btn-sm" onclick="joinForm()">SIGN UP</button>
                </c:if>
                
				<!-- 헤더 메시지 알람 부분 -->
				<c:if test="${empty userid eq false}">
				<span style="color:#E7E7E7">${sessionScope.userid} 님이 로그인 중입니다.</span>
					
					<!-- 헤더 개인정보부분 -->
					<div class="dropdown user-menu" style="float:right;">
					<c:if test="${image == null}">
						<button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<img src="/goal/resources/img/avatar-2-64.png" alt="" >
						</button>
					</c:if>
					<c:if test="${image != null}">
						<button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<img src="/goal/resources/img/profileImg/${image}" alt="" >
						</button>
					</c:if>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
							<a class="dropdown-item" href="/goal/member/updateMemberForm"><span class="font-icon glyphicon glyphicon-user"></span>회원정보수정</a>
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
				<a href="/goal/board/boardList">
					<i class="font-icon font-icon-notebook"></i>
					<span class="lbl">Board</span>
				</a>
			</li>
			<li class="calendar">
				<a href="/goal/calendar/calendar">
					<i class="font-icon font-icon-event"></i>
					<span class="lbl">Calendar</span>
				</a>
			</li>
			<li class="pink">
				<a href="/goal/goalTree/goalList?key=0">
					<i class="glyphicon glyphicon-tree-conifer"></i>
					<span class="lbl">Goal Tree</span>
				</a>
			</li>
			<li class="red">
				<a href="/goal/createGoal/createForm">
					<i class="glyphicon glyphicon-pencil"></i>
					<span class="lbl">Create Goal</span>
				</a>
			</li>
			<li class="green">
				<a href="/goal/createGoal/MGoalSquareForm">
					<i class="font-icon font-icon-cart"></i>
					<span class="lbl">My Goal List</span>
				</a>
			</li>
			
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