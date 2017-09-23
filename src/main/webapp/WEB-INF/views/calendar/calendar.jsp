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
		
		var getToday = "";
	 	var btmRecordNum = 0;	
		var dayRecordNum = 0;
	 	
		var clickedDate = "";
		var tbtmRecordNum = 0;
	    var tdayPlanNum = 0;
		var tuid = 0;
	    var trNumber = "";
	    var index = 0;
	    var dayClick = "";
	    //이전에 삭제했던 tr의 넘버를 담버두는 변수(trNumber)
	    var deleteTr = 0;
	    
	    //수정 부분의 number를 담아두는 변수
	    var updateTr = 0;
	    var getTitle = "";
	    var getStarTime = "";
	    var getEndTime = "";
	    
	    
		//클릭한 날짜가 오늘 날짜인지 확인하는 변수 0이면 아님. 1이면 오늘날짜의 것. (1이면 클릭시 모달에서 수정이나 삭제가 가능하도록 (버튼이 보이도록))
		var isToday = 0;
		$(function(){
			$(".update_time input").timepicki();
		});
		
		function openDeleteModal(btmRecordNumber,dayPlanNum,trNum){
			$('#delete').on('click', function(e) { e.stopPropagation(); });
			tbtmRecordNum = btmRecordNumber;
		    tdayPlanNum = dayPlanNum;
		    trNumber = trNum;
			$("#delete").modal("show");
		}
		
		function deleteModal(){
			$('#delete').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
			
			
			var splitCheckNum = trNumber.split("");
			var deleteNum = parseInt(splitCheckNum[1]);
			
			if(deleteTr<deleteNum && deleteTr !=0){
				deleteTr = deleteTr+1 
				deleteNum = deleteNum - deleteTr;
				trNumber = splitCheckNum[0]+deleteNum;
			}
			
			//삭제 내부 로직 작성  필요
		    $('#'+trNumber).html('');
		    
			//trNumber 이후의 모든 fn,ln,mn의 뒤에 넘버를 -1 해줘야함.
			
			
			$.ajax({
				url: '/goal/calendar/deleteDayPlan',
            	type: "POST",
            	data:{"dayPlanNum":tdayPlanNum},
            	dataType: "json",
            	success: function() {
            	
            	}
			});		
					$('#delete').modal('hide');
		}
		
		function openCreateModal(){
			$('#create').on('click', function(e) { e.stopPropagation(); });
			
			//내부로직 작성 필
			if($('#f0').attr('id') != null){
				var trUid = $('#DayRecordTable tr:last').attr('id');
				var trUidCode = trUid.split("");
				index = parseInt(trUidCode[1])+1; 
			}
			 
			$('#tn').val('');
			$('#sn').val('');
			$('#en').val('');
			
			$("#create").modal("show");
		}
		
		function createModal(){
			$('#create').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
			if($('#tn').val() == '' || $('#sn').val() == '' || $('#en').val() == ''){
				alert('빈칸이 있습니다 다시 확인하세요');
				return false;
			}else{
				
				var title = $('#tn').val(); 
				var startTime = $('#sn').val();
				var endTime = $('#en').val();	
				
				var splitStartTime = "";
				var splitEndTime = "";
				
				var splitStart = startTime.split(" ");
				splitStartTime = splitStart[0]; 
				
				var splitEnd = endTime.split(" ");
				splitEndTime = splitEnd[0]; 
				
				//ajax 날리고 해당 dayRecordNum을 받아와야됨 미리 그걸 delete함수에 넣어줘야됨 자바 스크립트에서 클릭한 날짜를 받아와야함..
				// dayRecordNum 시퀀스 역시 미리 dual에서 받아와야 함. (btmRecordNum만 1로 넣으면 됨.)
				  dayClick = dayClick+"";
				
				  var clickDaySplit = dayClick.split("");
	              var year = clickDaySplit[0]+clickDaySplit[1]+clickDaySplit[2]+clickDaySplit[3];
	              var month = clickDaySplit[4]+clickDaySplit[5];
	              var day = clickDaySplit[6]+clickDaySplit[7];
	              
	              var clickDayToString = year + "/" + month + "/" + day;
	              
	              //여기부터시작
	              
	              var splitMn = "";
	              var splitLn = "";
	              var isStartPmAm = splitStart[1];
	              var isEndPmAm = splitEnd[1];
	              var hour = "";
	              var mimute = "";
	              var isStartTime = "";
	              var isEndTime = "";
	              
	              if(isStartPmAm == "PM"){
	            	  var secondSplit  =  splitStartTime.split(":");
	            	  if(parseInt(secondSplit[0]) == 12){
	            		  hour =  parseInt(secondSplit[0])+"";  
	            		  minute = secondSplit[1];
		            	  isStartTime = hour+":"+minute;
	            	  }else{
		            	  hour =  parseInt(secondSplit[0]) + 12 + "";
		            	  minute = secondSplit[1];
		            	  isStartTime = hour+":"+minute;
	            	  }
	              }else{
	            	  var secondSplit  =  splitStartTime.split(":");		            	  
	            	  if(parseInt(secondSplit[0]) == 12){
	            		  hour =  0+"";  
	            		  minute = secondSplit[1];
		            	  isStartTime = hour+":"+minute;
	            	  }else{
		            	  isStartTime = splitStartTime;
	            	  }
	              }
	              
	              if(isEndPmAm == "PM"){
	            	  var secondSplit  =  splitEndTime.split(":");
	            	  if(parseInt(secondSplit[0]) == 12){
	            		  hour =  parseInt(secondSplit[0])+"";  
	            		  minute = secondSplit[1];
		            	  isEndTime = hour+":"+minute;
	            	  }else{
		            	  hour =  parseInt(secondSplit[0]) + 12 + "";
		            	  minute = secondSplit[1];
		            	  isEndTime = hour+":"+minute;
	            	  }
	              }else{
	            	  var secondSplit  =  splitEndTime.split(":");		            	  
	            	  if(parseInt(secondSplit[0]) == 12){
	            		  hour =  0+"";  
	            		  minute = secondSplit[1];
		            	  isEndTime = hour+":"+minute;
	            	  }else{
		            	  isEndTime = splitEndTime;
	            	  }
	              }
	              
	              var sendStartTime = clickDayToString+" "+ isStartTime;
	              var sendEndTime = clickDayToString+" "+isEndTime;
	              
			 	$.ajax({
					url: '/goal/calendar/createDayPlan',
	            	type: "POST",
	            	data:{"dContents":title,"startTime":sendStartTime,"endTime":sendEndTime,"dComplete":"Y","btmRecordNum":btmRecordNum,"dayRecordNum":dayRecordNum,"startDate":clickDayToString,"getToday":getToday},
	            	dataType: "json",
	            	success: function(result) {
	            		 $('#DayRecordTable').append(
	            			'<tr id="d'+index+'">'+
	  		   		            '<td id="n'+index+'">'+(index+1)+'</td>'+
	  		   		            '<td id="f'+index+'">'+title+'</td>'+
	  				            '<td id="l'+index+'">'+isStartTime+'</td>'+
	  		   		            '<td id="m'+index+'">'+isEndTime+'</td>'+
	  		   		            '<td><button type="button" data-toggle="modal" onclick = "openEditModal('+dayClick+','+1+','+result+','+index+','+'\'f'+(index)+'\''+','+'\'l'+(index)+'\''+','+'\'m'+(index)+'\')" data-uid="'+index+'" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
	  		   		            '<td><button type="button" data-toggle="modal" onclick="openDeleteModal('+btmRecordNum+','+result+','+'\'d'+(index)+'\')" data-uid="'+index+'" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>'+
	  		   		        '</tr>'
	     		   	 ); 
	            	}
				});
				
				$('#create').modal('hide');
			}
		}
		
		  function openEditModal(clickedDay,btmRecordNumber,dayPlanNum,uid,title,startTime,endTime){
			  $('#edit').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
			  	 clickedDate = clickedDay+"";
			  	 tbtmRecordNum = btmRecordNumber;
			   	 tdayPlanNum = dayPlanNum;
			   	 
			      getTitle = title;
				  getStarTime = startTime;
				  getEndTime = endTime;
			      
			     
				       var fn = $('#'+title).html();
				       var ln = $('#'+startTime).html();
				       var mn = $('#'+endTime).html();
			           $("#fn").val(fn);
				       $("#mn").val(mn);
				       $("#ln").val(ln);
				           
				$("#edit").modal("show");
			}
		  
		  //클릭한 날짜도 받아와야 함.
		  //업데이트를 실행하는 모달
		  function updateModal(){
			  
			  if($('#fn').val() == '' || $('#ln').val() == '' || $('#mn').val() == ''){
				  alert('빈칸이 있습니다. 확인해주세요!')
				  return false;
			  }else{
				  var fn = $('#fn').val();
	              var mn = $('#ln').val();
	              var ln = $('#mn').val();
	              
	              var splitMn = mn.split("");
	              var splitLn = ln.split("");
	              
	              var intMn = 0;
	              var intLn = 0;
	              
	           	  if(splitMn[6]+splitMn[7] == 'PM'){
	           		  if(splitMn[0]+splitMn[1] == '12'){
	           			  intMn = parseInt(splitMn[0]+splitMn[1]);
	           		  }else{
		           		  intMn = parseInt(splitMn[0]+splitMn[1])+12;
	           		  }
	           	  }else{
	           		  if(splitMn[0]+splitMn[1] == '12'){
	           			 intMn = 0;
	           		  }else{
		           		  intMn = parseInt(splitMn[0]+splitMn[1]);
	           		  }
	           	  }
	           	  
	           	  if(splitLn[6]+splitLn[7] == 'PM'){
	           		if(splitLn[0]+splitLn[1] == '12'){
	           			  intLn = parseInt(splitLn[0]+splitLn[1]);
	           		  }else{
		           		  intLn = parseInt(splitLn[0]+splitLn[1])+12;
	           		  }
	           	  }else{
	           		 if(splitLn[0]+splitLn[1] == '12'){
	           			 intLn = 0;
	           		  }else{
		           		  intLn = parseInt(splitLn[0]+splitLn[1]);
	           		  }
	           	  }
	              
	              var splitedMn = intMn+splitMn[2]+splitMn[3]+splitMn[4];
	              var splitedLn = intLn+splitLn[2]+splitLn[3]+splitLn[4];
	              
	              
				  $('#edit').on('click', '[data-dismiss="modal"]', function(e) { e.stopPropagation(); });
	              $('#'+getTitle).html(fn);
	              $('#'+getStarTime).html(splitedMn);
	              $('#'+getEndTime).html(splitedLn);
	              
	              //클릭한 날짜의 시간을 형식에 맞춰서 넣음
	              
	              var clickDaySplit = clickedDate.split("");
	              var year = clickDaySplit[0]+clickDaySplit[1]+clickDaySplit[2]+clickDaySplit[3];
	              var month = clickDaySplit[4]+clickDaySplit[5];
	              var day = clickDaySplit[6]+clickDaySplit[7];
	              
	              var clickDayToString = year + "/" + month + "/" + day;
	              var startTime = "";
	              var endTime = "";
	              
	              startTime = clickDayToString + " " + splitedMn;
	              endTime = clickDayToString + " " + splitedLn;
	              
	              
	              $.ajax({
					url: '/goal/calendar/updateDayPlan',
	            	type: "POST",
	            	data:{"dContents":fn,"startTime":startTime,"endTime":endTime,"dayPlanNum":tdayPlanNum},
	            	dataType: "json",
	            	success: function() {
	            	}
				});		
	              
	              $("#edit").modal("hide");
				  
			  }
              
		  }
		  
			function closeModal(){
				$('#create').on('click', function(e) { e.stopPropagation(); });
				
				//내부로직 작성 필
				$('#calendar').fullCalendar('removeEvents');
   				$('#calendar').fullCalendar('refetchEvents');
   				btmRecordNum = 0;
   				dayRecordNum = 0;
   				index = 0;
   				deleteTr = 0;
   				updateTr = 0;
   				
   				$('#inputPercent').attr('placeholder','100이내의 숫자');	
				$("#warning").modal("hide");
			}
			
			function updateAchieve(){
				var sendAchieve = 0;
				if($('#inputPercent').val() == ''){
					alert('100이내의 자연수를 입력해 주세요.')
					return false;
				}else{
						if($('#dayPercent').text() !=''){
							var thisDayPercent = $('#dayPercent').text();
							var dayPercentSplit1 = thisDayPercent.split(":");
							var dayPercentSplit2 = dayPercentSplit1[1].split(""); 
							var dayPercent = "";
							
							 if(dayPercentSplit2.length = 4){
								dayPercent = dayPercentSplit2[1]+dayPercentSplit2[2]; 
							}else if(dayPercentSplit2.length = 3){
								dayPercent = dayPercentSplit2[1];
							} 
						}else{
							var dayPercent = "";
						}
						
						var getTextPercent = $('#inputPercent').val();
						var getPercent = $('#currentPercent').text()
						var firstParsing = getPercent.split(":");
						var secondParsing = firstParsing[1].split("%");
						var percent = 0;
						percent = parseInt(getTextPercent);
						
							
						if((100-parseInt(secondParsing[0])) < percent-parseInt(dayPercent)){
							alert('달성률은 100%를 넘길수 없습니다...- 현재 남은 달성률: '+(100-parseInt(secondParsing[0])));
						}else{
							 dayClick = dayClick+"";
							 
							  var clickDaySplit = dayClick.split("");
				              var year = clickDaySplit[0]+clickDaySplit[1]+clickDaySplit[2]+clickDaySplit[3];
				              var month = clickDaySplit[4]+clickDaySplit[5];
				              var day =  clickDaySplit[6]+clickDaySplit[7];
				              var clickDayToString = year + "/" + month + "/" + day;
							
							if(percent > 100){
								alert('달성률은 100을 넘길수 없습니다.');
								return false;
							}else if(percent < 0){
								alert('달성률은 -값이 될 수 없습니다.');
								return false;
							}else{	
								 $.ajax({
									url: '/goal/calendar/updateAchieve',
					            	type: "POST",
					            	data:{"startDate":clickDayToString,"getToday":getToday,"achieve":percent,"dayAchieve":percent},
					            	dataType: "json",
					            	success: function(result) {
					            		$('#currentPercent').html('');
					            		$('#currentPercent').append('달성률:'+" "+ result[0]+"%");
					            		$('#dayPercent').html('');
						            	$('#dayPercent').append('<br>this Day:'+" "+result[1]+"%");
					            		$('#inputPercent').attr('placeholder','');	
					            	}
								});		 
							}
						}		
					           $('#inputPercent').attr('placeholder','100이내의 숫자');					            	
					           
				}
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
										일일계획
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
									    		<td class="col-xs-6"><div><span id = "currentPercent"></span><span id = "dayPercent"></span></div></td>
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
									                  일정명:  <input id="tn" type="text" class="form-control" name="fname" placeholder="일정 제목">
										        시작시간: <div class ="update_time"><input id="sn" type="text" class="form-control" name="time" placeholder="시작시간"></div>
										        종료시간: <div class ="update_time"><input id="en" type="text" class="form-control" name="time" placeholder="종료시간"></div>
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
				                    <button type="button" class="btn btn-default pull-left" onclick = "closeModal()">Close</button>
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
	<script src="/goal/resources/js/lib/fullcalendar/fullcalendar-init.js?version=78"></script>
	<script src="/goal/resources/js/lib/fullcalendar/ko.js"></script>
	<script src="/goal/resources/js/lib/fullcalendar/tableModal.js?version=3"></script>
    <script src="/goal/resources/js/app.js?version=4"></script>
    
</body>
</html>