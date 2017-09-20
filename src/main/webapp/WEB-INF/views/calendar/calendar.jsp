<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/goal/resources/css/lib/fullcalendar/calendarModal.css?version=22">
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
		
		function updateModal(){
			$('#delete').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
			$('#edit').modal('hide');
		}
		
		function deleteModal(){
			$('#delete').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
			$('#delete').modal('hide');
		}
		
		function createModal(){
			$('#create').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
			$('#create').modal('hide');
		}
		
		function openDeleteModal(){
			$('#delete').on('click', function(e) { e.stopPropagation(); });
			$("#delete").modal("show");
		}
		
		function openEditModal(){
			$('#edit').on('click', function(e) { e.stopPropagation(); });
			$("#edit").modal("show");
		}
		
		function openCreateModal(){
			alert('aaaaa');
			$('#create').on('click', function(e) { e.stopPropagation(); });
			$("#create").modal("show");
		}
		
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
									<li>
										<div class="color-double orange"><div></div></div>
										일일목표
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
				    <div class="modal fade" id="warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header modal-header-warning">
				                    <button type="button" class="close" aria-hidden="true" data-dismiss = "modal">×</button>
				                    <h1>ToDay - DayPlan</h1>
				                </div>
				                <div class="modal-body">
				                
				                <div class="container">
								<div class="row">
									<table class="table table-hover table-responsive">
									    <thead>
									    	<tr>
									    		<td class="col-xs-4">오늘의 달성률 </td>
									    		<td class="col-xs-3"><input type= "text" id = "inputPercent" placeholder="100이내의 숫자" size="27px"></td>
									    		<td class="col-xs-1">
									    		<button id = "dayAchieve" class = "success btn btn-success btn-sm" onclick = "updateAchieve()"><span class="glyphicon glyphicon-ok"></span></button></td>
									    		<td class="col-xs-6"><div id = "currentPercent"></div></td>
									    		<td></td>
									    		<td><button type="button" id = "create_Button" data-toggle="modal" class="btn btn-default pull-left" onclick = "openCreateModal()">Create</button></td>
									    	</tr>
									        <tr>
									           <th class="col-xs-1">번호</th>
											   <th class="col-xs-3">계획명</th>
											   <th class="col-xs-2">startTime</th>
											   <th class="col-xs-5">endTime</th>
											   <th class="col-xs-3">Edit</th>
											   <th class="col-xs-3">Delete</th>
									        </tr>
									    </thead>
									    <tbody id = "DayRecordTable">
									        <tr id="d1">
									            <td id="n1">1</td>
									            <td id="f1">John</td>
									            <td id="l1">10:30AM</td>
									            <td id="m1">11:30AM</td>
									            <td><button type="button" data-toggle="modal" onclick = "openEditModal()" data-uid="1" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>
									            <td><button type="button" data-toggle="modal" onclick="openDeleteModal()" data-uid="1" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>
									        </tr>
									        <tr id="d2">
									            <td id="n2">2</td>
									            <td id="f2">Jane</td>
									            <td id="l2">01:00PM</td>
									            <td id="m2">02:00PM</td>
									            <td><button type="button" data-toggle="modal" onclick = "openEditModal()" data-uid="2" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>
									            <td><button type="button" data-toggle="modal" onclick="openDeleteModal()" data-uid="2" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>
									        </tr>
									        
									        <tr id="d3">
									            <td id="n3">3</td>
									            <td id="f3">kane</td>
									            <td id="l3">05:00PM</td>
									            <td id="m3">06:00PM</td>
									            <td><button type="button" data-toggle="modal" onclick = "openEditModal()" data-uid="3" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>
									            <td><button type="button" data-toggle="modal" onclick="openDeleteModal()" data-uid="3" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>
									        </tr>
									    </tbody>
									</table>
								</div>
							</div>
							 
				                
							     <div id="edit" class="modal fade" role="dialog" aria-hidden="true">
								  <div class="modal-dialog">
									  <div class="modal-editContent">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal">×</button>
									        <h4 class="modal-title">일정 수정</h4>
									      </div>
									      <div class="modal-body" style="background-color: white;">
									                  일정명: <input id="fn" type="text" class="form-control" name="fname" placeholder="일정 제목">
										        시작시간: <div class ="update_time"><input id="ln" type="text" class="form-control" name="time" placeholder="시작시간"></div>
										        종료시간: <div class ="update_time"><input id="mn" type="text" class="form-control" name="time" placeholder="종료시간"></div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" id="up" class="btn btn-warning" onclick="updateModal()">Update</button>
									        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									      </div>
									  </div>
								  </div>
								</div>
								
								<div id="delete" class="modal fade" role="dialog" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-deleteContent">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">×</button>
								        <h4 class="modal-title">일정 삭제</h4>
								      </div>
								      <div class="modal-body">
								        <strong>정말로 해당일정을 삭제하겠습니까?</strong>
								      </div>
								      <div class="modal-footer">
								        <button type="button" id="del" class="btn btn-danger" onclick="deleteModal()">Delete</button>
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
								
							     <div id="create" class="modal fade" role="dialog" aria-hidden="true">
								  <div class="modal-dialog">
									  <div class="modal-createContent">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal">×</button>
									        <h4 class="modal-title">일정 생성</h4>
									      </div>
									      <div class="modal-body" style="background-color: white;">
									                  일정명:  <input id="fn" type="text" class="form-control" name="fname" placeholder="일정 제목">
										        시작시간: <div class ="create_time"><input id="ln" type="text" class="form-control" name="time" placeholder="시작시간"></div>
										        종료시간: <div class ="create_time"><input id="mn" type="text" class="form-control" name="time" placeholder="종료시간"></div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" id="createRecord" onclick = "createModal()" class="btn btn-warning" >create</button>
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
								
	
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script src="/goal/resources/js/lib/fullcalendar/timepicki.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js?version=4"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js?version=4"></script>
	<script src="/goal/resources/js/plugins.js?version=2"></script>
	
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js?version=4"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/moment/moment-with-locales.min.js?version=4"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/eonasdan-bootstrap-datetimepicker/bootstrap-datetimepicker.min.js?version=4"></script>
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar.js?version=10"></script>
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar-init.js?version=41"></script>
	<script src="/goal/resources/js/lib/fullcalendar/ko.js"></script>
	<script src="/goal/resources/js/lib/fullcalendar/tableModal.js?version=3"></script>
    <script src="/goal/resources/js/app.js?version=4"></script>
    
</body>
</html>