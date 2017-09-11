<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Calendar</title>

	<link href="/goal/resources/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/bootstrap-datetimepicker.min.css?version=4">
	<link rel="stylesheet" href="/goal/resources/css/lib/fullcalendar/fullcalendar.min.css?version=5">
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/calendar.min.css?version=4">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css?version=4">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css?version=4">
    <link rel="stylesheet" href="/goal/resources/css/main.css?version=4">
    
</head>
<body class="with-side-menu">

	<%@ include file="../menu.jsp" %>
	<script>
		//클릭한 날짜가 오늘 날짜인지 확인하는 변수 0이면 아님. 1이면 오늘날짜의 것. (1이면 클릭시 모달에서 수정이나 삭제가 가능하도록 (버튼이 보이도록))
		var isToday = 0;
	</script>
<div class="page-content">
		<div class="container-fluid">

			<div class="box-typical">
				<div class="calendar-page">
					<div class="calendar-page-content">
						<div class="calendar-page-title">Calendar</div>
						<div class="calendar-page-content-in">
							<div id='calendar'></div>
						</div><!--.calendar-page-content-in-->
					</div><!--.calendar-page-content-->

					<div class="calendar-page-side">

						<section class="calendar-page-side-section">
							<header class="box-typical-header-sm">진행중인 세부목표</header>
							<div class="calendar-page-side-section-in">
								<ul class="exp-timeline">
									<li class="exp-timeline-item">
										<div class="dot"></div>
										<div>10:00</div>
										<div class="color-blue-grey">Name Surname Patient Surgey ACL left knee</div>
									</li>
									<li class="exp-timeline-item">
										<div class="dot"></div>
										<div>10:00</div>
										<div class="color-blue-grey">Name Surname Patient Surgey ACL left knee</div>
									</li>
								</ul>
							</div>
						</section>

						<section class="calendar-page-side-section">
							<header class="box-typical-header-sm">색 범례</header>
							<div class="calendar-page-side-section-in">
								<ul class="colors-guide-list">
									<li>
										<div class="color-double green"><div></div></div>
								        진행중
									</li>
									<li>
										<div class="color-double"><div></div></div>
										달성
									</li>
									<li>
										<div class="color-double red"><div></div></div>
										미달성
									</li>
								</ul>
							</div>
						</section>
					</div><!--.calendar-page-side-->
				</div><!--.calendar-page-->
			</div><!--.box-typical-->
		</div><!--.container-fluid-->
	</div><!--.page-content-->
	

	<script src="/goal/resources/js/lib/jquery/jquery.min.js?version=4"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js?version=4"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js?version=4"></script>
	<script src="/goal/resources/js/plugins.js?version=4"></script>

	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js?version=4"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/moment/moment-with-locales.min.js?version=4"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/eonasdan-bootstrap-datetimepicker/bootstrap-datetimepicker.min.js?version=4"></script>
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar.js?version=6"></script>
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar-init.js?version=12"></script>
	<script src="/goal/resources/js/lib/fullcalendar/ko.js"></script>
    <script src="/goal/resources/js/app.js?version=4"></script>
    
</body>
</html>