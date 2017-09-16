<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/goal/resources/css/lib/fullcalendar/calendarModal.css?version=18">
</head>
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
	<link rel="stylesheet" href="/goal/resources/css/lib/fullcalendar/fullcalendar.min.css?version=18">
	<link rel="stylesheet" href="/goal/resources/css/lib/fullcalendar/timepicki.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/calendar.min.css?version=6">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css?version=4">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css?version=4">
    <link rel="stylesheet" href="/goal/resources/css/main.css?version=4">
    <link rel="stylesheet"
  	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<body>
   <%@ include file="../menu.jsp" %>
	<script>
		//클릭한 날짜가 오늘 날짜인지 확인하는 변수 0이면 아님. 1이면 오늘날짜의 것. (1이면 클릭시 모달에서 수정이나 삭제가 가능하도록 (버튼이 보이도록))
		var isToday = 0;
		$(function(){
			$(".update_time input").timepicki();
		});
	</script>
	
	
<div class="page-content">
		<div class="container-fluid">

			<div class="box-typical">
				<div class="calendar-page">
					<div class="calendar-page-content">
						<div class="calendar-page-title">${sessionScope.userid}님의 Calendar</div>
						<div class="calendar-page-content-in">
							<div id='calendar'></div>
						</div><!--.calendar-page-content-in-->
					</div><!--.calendar-page-content-->

					<div class="calendar-page-side">

						<section class="calendar-page-side-section">
							<header class="box-typical-header-sm">진행중인 세부목표</header>
							<div class="calendar-page-side-section-in">
								<ul class="exp-timeline">
									<!-- 반복문을 사용해서 꺼냄 -->
									<c:if test="${requestScope.isProcessingRecordList != null}">
										<c:forEach items="${requestScope.isProcessingRecordList}" var = "isProcessingRecord">
											<li class="exp-timeline-item">
												<div>목표명: ${isProcessingRecord.BGoalTitle}</div>
												<div>해당 중간목표 : ${isProcessingRecord.mGoalTitle}</div>
												<div class="dot">예상 진행기간</div>
												<div>${isProcessingRecord.startDate} ~ ${isProcessingRecord.endDate}</div> 
												<div class="color-blue-grey">현재진행률: ${isProcessingRecord.achievePercent}%</div>
												<br>
													 <div class="progress">
													  	 <div class="progress-bar progress-bar-success" style="width: ${isProcessingRecord.achievePercent}%;">${isProcessingRecord.achievePercent}%</div>
											        </div>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</section>

						<section class="calendar-page-side-section" >
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
	
	
			<!-- Modal -->
				    <!-- Modal -->
				    <div id = "DayRecord">
				    <div class="modal fade" id="warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header modal-header-warning">
				                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                    <h1>ToDay - DayPlan</h1>
				                </div>
				                <div class="modal-body">
											<table class="table table-hover table-responsive">
											    <thead id = "table_thead">
											        <tr>
											            <th class="col-xs-2">번호</th>
											            <th class="col-xs-3">계획명</th>
											            <th class="col-xs-3">startTime</th>
											            <th class="col-xs-5">endTime</th>
											            <th class="col-xs-2">Edit</th>
											            <th class="col-xs-2">Delete</th>
											        </tr>
											    </thead>
											    <tbody>
											        <tr id="d1">
											            <td>1</td>
											            <td id="f1">John</td>
											            <td id="l1">10:56</td>
											            <td id="m1">11:30</td>
											            
															
											            <td><button type="button" data-toggle="modal" data-target="#edit" data-uid="1" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>
											            <td><button type="button" data-toggle="modal" data-target="#delete" data-uid="1" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>
											        </tr>
											        <tr id="d2">
											            <td>2</td>
											            <td id="f2">Jane</td>
											            <td id="l2">Wick</td>
											            <td id="m2">Doe</td>
											            <td><button type="button" data-toggle="modal" data-target="#edit" data-uid="2" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>
											            <td><button type="button" data-toggle="modal" data-target="#delete" data-uid="2" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>
											        </tr>
											    </tbody>
											</table>
									
									<div id="edit" class="modal" role="dialog">
									  <div class="modal-dialog">
									    <div class="modal-updatePopup" >
									      <div class="modal-header modal-header-danger">
									        <button type="button" class="close" data-dismiss="modal">×</button>
									        <h4 class="modal-title">Update Data</h4>
									      </div>
									      <div class="modal-body" style="background-color: white;">
									           일정명: <input id="fn" type="text" class="form-control" name="fname" placeholder="First Name">
									        시작시간: <div class ="update_time"><input id="ln" type="text" class="form-control" name="time" placeholder="Last Name"></div>
									        종료시간: <div class ="update_time"><input id="mn" type="text" class="form-control" name="time" placeholder="Middle Name"></div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" id="up" class="btn btn-warning" data-dismiss="modal">Update</button>
									        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>
									
									
									<div id="delete" class="modal fade" role="dialog">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal">×</button>
									        <h4 class="modal-title">Delete Data</h4>
     								 	</div>
     								 	
								      <div class="modal-body">
								        <strong>Are you sure you want to delete this data?</strong>
								      </div>
								      <div class="modal-footer">
								        <button type="button" id="del" class="btn btn-danger" data-dismiss="modal">Delete</button>
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								  	</div>
								</div>
								
				                </div> <!-- end body -->
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				                </div>
				            </div><!-- /.modal-content -->
				        </div><!-- /.modal-dialog -->
				    </div><!-- /.modal -->
					</div>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script src="/goal/resources/js/lib/fullcalendar/timepicki.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js?version=4"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js?version=4"></script>
	<script src="/goal/resources/js/plugins.js?version=2"></script>
	
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js?version=4"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/moment/moment-with-locales.min.js?version=4"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/eonasdan-bootstrap-datetimepicker/bootstrap-datetimepicker.min.js?version=4"></script>
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar.min.js?version=7"></script>
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar-init.js?version=10"></script>
	<script src="/goal/resources/js/lib/fullcalendar/ko.js"></script>
	<script src="/goal/resources/js/lib/fullcalendar/tableModal.js"></script>
    <script src="/goal/resources/js/app.js?version=4"></script>
    
</body>
</html>