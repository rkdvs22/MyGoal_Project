<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../menu.jsp" %>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/goal/resources/css/lib/lobipanel/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/widgets.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">

	<link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/goal/resources/css/main.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<link rel="/goal/resources/css/lib/clockpicker/jquery.datetimepicker.css">
	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/lobipanel/lobipanel.min.js"></script>
	<script src="/goal/resources/js/jquery.datetimepicker.full.min.js"></script>
	<script src="/goal/resources/js/app.js"></script>
	
<style>
	/* 마방진 전체 크기 및 위치 지정 */
	.squares {
		width: 540px;
		height: 540px;
		position: relative;
		top: 200px;
		left: 300px;
	}
	
	/* 방제 표시 */
	.subject {
		position: absolute;
		top: 120px;
		left: 300px;
	}
	
	/* 각 마방진 버튼 크기 지정 */
	.btn-group > input {
		height: 180px;
		width: 180px;
	}
	
	/* 최종목표 옵션 및 색상 지정 */
	#topGoalBtn {
		background-color: #46AA46;
		color: black;
		white-space: normal;
	}
	
	/* modal창의 스크롤 지정 */
	#dialog {
		position: relative;
		overflow-y: auto;
	}
	
	/* 에러표시를 할 div 지정 */
	.card.mb-4 {
		position: absolute;
		top: 0%;
		left: 40%;
		display: none;
		width: 350px;
		z-index: 1100;
	}
	
	/* 입장한 유저, 초대, 진행상황 */
	aside {
		position: absolute;
		top: 200px;
		left: 1000px;
	}
	
	/* 레디, 시작, 나가기 */
	footer {
		position: absolute;
		top: 710px;
		left: 1000px;
	}
	
	/* modal in colorpicker 지정 */
	.box-typical.box-typical-padding {
		z-index: 1100;
		overflow-y: visible;
	}
	
	/* 각 색상이 부여된 div */
	.color-row1 > div, .color-row2 > div {
		display: inline-block;
		width: 50px;
		height: 20px;
	}
	
	/* 색상 선택창의 각 색상 지정 */
	#color_lightgray {
		background-color: #D3D3D3;
	}
	
	#color_red {
		background-color: #FF0000;
	}
	
	#color_orange {
		background-color: #FFA500;
	}
	
	#color_green {
		background-color: #00FF00;
	}
	
	#color_purple {
		background-color: #A020F0;
	}
	
	#color_pink {
		background-color: #FFC0CB;
	}
	
	#color_gold {
		background-color: #FFD700;
	}
	
	#color_aquamarine {
		background-color: #7FFFD4;
	}
	
	#color_blue {
		background-color: #0000FF;
	}
	
	#color_skyblue {
		background-color: #87CEEB;
	}
	
	/* 사용자가 선택한 색상을 확인시켜주는 div */
	.color-result {
		display: inline-block;
		position: absolute;
		width: 200px;
		height: 200px;
		left: 50px;
	}
	
	/* 사용자가 지정한 색을 ID 옆에 표시 */
	.pickcolor {
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	
	/* 친구목록 table 내에 선 긋기 */
	tr.bordered {
		border-bottom: 1pt solid #000;
	}
	
	/* 초대할 사람의 체크박스 */
	.checkList {
		text-align: center;
	}
	
	/* 유저 입장불가 칸에 대한 이미지 크기 조정 */
	.empty-user {
		width: 292px;
		height: 64px;
	}
	
	/* 배경 이미지 */
	#background {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-image: url('/goal/resources/img/Goals.jpg');
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-size: 100%;
		opacity: 0.2;
		filter:alpha(opacity=40);
	}
</style>

</head>

<body>
<script>

// 처음 페이지 이동 시 중간목표 타이틀 출력
function mGoalTitle() {
	<c:forEach items="${midGoal}" var="midGoal" varStatus="status">
		$("#mBtn" + ${status.index + 1}).attr("value", "${midGoal.mGoalTitle}");
	</c:forEach>	
}

// 새로고침 시 같은 목표 중복 생성 방지
function noEvent() {
	if (event.keyCode == 116) {
		event.keyCode= 2;
		return false;
	} else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) {
		return false;
	}
}
document.onkeydown = noEvent;

var m_eDate = "";
var m_sDate = "";
var b_sDate = new Array();
var b_eDate = new Array();
var progressDay = "";

var bGoal_modals = new Array();
var bGoalCounts = new Array();
var btnsClickCount = new Array(8);
var tGoal_days = "";

for(var i=0; i<btnsClickCount.length; i++) {
	btnsClickCount[i] = 0;
}

// modal 창에서 사용자가 입력하는 값에 따라 가능여부를 판단하고 중간목표의 기간을 계산하는 함수이다.
function createGoalModals() {
	var goalCount = $("#bGoalcount option:selected").val();
	$(".bg_content").empty();
	$(".hr").remove();
	
	for(var i=0; i<goalCount; i++) {
		var row = '<div class="bg_content">세부목표 ' + (i+1) + 
		'<input type="text" name="b_goal' + (i+1) + 
		'" id="b_goal' + (i+1) + '"><br>예정 진행기간(일)<br><input type="text" name="b_progressday' + (i+1) +
		'" id="b_progressday' + (i+1) +
		'" class="b_progressday"></div><hr class="hr">';
		$(".btmgoal").append(row);
	}
	
	// 동적으로 변경되는 세부목표에도 datepicker가 적용되도록 한다.
	$('.startBPicker').each(function() {
		$(this).datepicker();
	});
	$('.endBPicker').each(function() {
		$(this).datepicker();
	});
	
	m_eDate = "";
	m_sDate = "";
	
	// 사용자가 날짜를 선택했을 경우 자동으로 남는날짜를 계산한다.
	$("#endMpicker").on("change", function() {
		if($("#startMpicker").val() != "" && $("#endMpicker").val() != "") {
			m_eDate = $("#endMpicker").datepicker("getDate");
			m_sDate = $("#startMpicker").datepicker("getDate");
			if(m_eDate - m_sDate < 0) {
				$(".card.mb-4").css("display", "block");
				$(".card-header").text("종료일이 시작일보다 이전일 수 없습니다");
				$(".card.mb-4");
				$("#msg_ok").click(function() {
					$(".card.mb-4").css("display", "none");
				});
				return false;
			}
		}
		
		progressDay = "";
		var second = (m_eDate - m_sDate)/1000;
		var minuate = second / 60;
		var hour = minuate / 60;
		progressDay = (hour / 24)+1;
		if(progressDay > tGoal_days) {
			alert("최종목표 일자보다 중간목표 일자가 많을 수 없습니다");
			return false;
		}
		$("#m_eventdays > b").html("진행기간 : " + progressDay + "일");
	});
	
	
	// 중간목표의 시작일을 종료일보다 뒤의 날짜로 선택했을 경우 사용자에게 알린다.
	$("#startMpicker").on("change", function() {
		if($("#endMpicker").val() != "") {
			m_sDate = $("#startMpicker").datepicker("getDate");
			m_eDate = $("#endMpicker").datepicker("getDate");
			if (m_sDate > m_eDate) {
				alert("시작일이 종료일보다 이후일 수 없습니다");
				return false;
			}
		}
	});
	
	// 예정 진행기간에 특정 기능키 이외의 숫자가 아닌 값들을 입력하지 못하게 한다.
	$(".b_progressday").on("keydown", function(event) {
		var keyId = event.keyCode;
		var event_result = false;
		
		if( (keyId >= 48 && keyId <= 57)
		|| (keyId >= 96 && keyId <= 105) 
		|| keyId == 13
		|| keyId == 8
		|| keyId == 27
		|| keyId == 46) {
			event_result = true;
		}
		
		if(event_result == false) {
			alert("숫자를 입력 해 주세요");
			return false;
		}
	});
}

var catchNum = "";
// 마방진 버튼 번호를 받는 함수.
function catchbBtnNum(bBtn_num) {
	catchNum = "";
	catchNum = bBtn_num;
}

var click_flag = true;

var cancel_flag = false;
var mGoal_modals = "";

$(function() {
	mGoalTitle();	//중간 목표 타이틀 출력
	
	// datepicker의 날짜 형식을 지정한다.
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		showMonthAfterYear: true
	});
	
	// modal에 포함된 날짜항목에 datepicker를 지정한다.
	$('.dateTimePicker').datepicker({
		beforeShow: function() {
		$(this).css("z-index","1050");
		}
	});
	
	// modal창 설정. modal 창에서 확인 및 취소를 눌렀을때의 로직도 진행.
	$("#dialog").dialog({
		autoOpen: false,
		width: 320,
		height: 620,
		maxHeight: 620,
		position: [500, 200],
		modal: true,
		resizable: false,
		buttons:{
			"확인":function () {
				var goalCount = $("#bGoalcount option:selected").val();
				
				// 사용자가 입력하지 않은 중간목표 항목에 대해 체크한다.
				if($("#Mgoal").val() == ""
				|| $("#startMpicker").val() == ""
				|| $("#endMpicker").val() == "") {
					$("#error_div").css("display", "block");
					alert("중간목표 항목을 입력하지 않았습니다");
					return false;
				}
				
				// 사용자가 입력하지 않은 세부목표 항목에 대해 체크한다.
				for(var i=0; i<goalCount; i++) {
					if($("#b_progressday" + (i+1)).val() == ""
					|| $("#b_goal" + (i+1)).val() == "") {
						alert("세부목표 항목을 입력하지 않았습니다");
						return false;
					}
				}
				
				// 각 세부목표의 기간의 합이 중간목표의 일자와 동일해야 한다.
				var m_eventDays = Number(progressDay);
				var bDays_sum = 0;
				for(var i=0; i<goalCount; i++) {
					var b_eventDays = Number($("#b_progressday" + (i+1)).val());
// 					if($("#b_progressday" + (i+1)).val() > m_eventDays) {
// 						alert((i+1) + "번째 : 세부목표 진행일자는 중간목표 진행일자보다 많을 수 없습니다");
// 						return false;
// 					} else if($("#b_progressday" + (i+1)).val() < m_eventDays) {
// 						alert((i+1) + "번째 : 세부목표 진행일자는 중간목표 진행일자보다 적을 수 없습니다");
// 						return false;
// 					}
					bDays_sum += b_eventDays;
					if(bDays_sum > m_eventDays) {
						alert("세부목표 진행일자들의 합이 중간목표 진행일자보다 많습니다");
						return false;
					}
				}
				if(bDays_sum < m_eventDays) {
					alert("세부목표 진행일자들의 합이 중간목표 진행일자보다 적습니다");
					return false;
				}
				
				// 사용자가 작성한 중간목표를 저장한다.
				mGoal_modals = "";
				mGoal_modals = {
					mGoal: $("#Mgoal").val(),
					sDate: $("#startMpicker").val(),
					eDate: $("#endMpicker").val()
				};
				
				
				// 사용자가 몇 번째 중간목표에서 몇 개의 세부목표를 지정했는지 저장한다.
				bGoalCounts[catchNum-1] = {
					bGoalCount: catchNum + "-" +goalCount
				}
				
				var bGTotalLength = Number(goalCount) + Number(bGoal_modals.length);
				
				var bGoalNum = 0;
				// 사용자가 작성한 세부목표를 저장한다.
				for(var i=0; i<bGTotalLength; i++) {
					bGoalNum += 1;
					if(catchNum == 1) {
						bGoal_modals[i] = {
							m_b_GoalNum: catchNum + "-" + (i+1),
							bGoal: $("#b_goal"+(i+1)).val(),
							bGoalDay: catchNum + "-" + (i+1) + "-" +$("#b_progressday"+(i+1)).val()
						};
					} else {
						bGoalNum = 0;
						for(var j=bGoal_modals.length; j<bGTotalLength; j++) {
							bGoalNum += 1;
							bGoal_modals[j] = {
								m_b_GoalNum: catchNum + "-" + bGoalNum,
								bGoal: $("#b_goal"+(i+1)).val()
							};
						}
					}
				}
				
				// 사용자가 입력한 각 중간목표와 각 세부목표를 데이터베이스에 추가한다.
				var midGoal = new Object();
				midGoal.mGoal = $("#Mgoal").val();
				midGoal.sDate = $("#startMpicker").val();
				midGoal.eDate = $("#endMpicker").val();
				$.ajaxSettings.traditional = true;
				
				$.ajax ({
					url: "/goal/createGoal/inputGoal",
					method: "post",
					dataType: "json",
					contentType: "application/json;charset=UTF-8",
					data: JSON.stringify({"midGoal":{"key1":midGoal}, "btmGoal":{"key2":bGoal_modals}, "tGoalNum":'${b_info.tGoalNum}'}),
					success: function() {
						inputMbtnValue(bBtn_num);
						$("#m_eventdays > b").text("");
						$(".midgoal > input").val("");
						$("#bGoalcount").val("");
						$(".bg_content > input").val("");
					}
				});
				
				if(click_flag == true) {
					inputMbtnValue(bBtn_num);
				} else {
					updateMbtnValue(bBtn_num);
				}
				
				$(this).dialog("close");
			},
			
			// modal의 취소버튼을 눌렀을 경우, 사용자가 입력했던 중간목표 및 세부목표와 관련된 값들을 지운다.
			"취소":function() {
				cancel_flag = true;
				if(btnsClickCount[catchNum] == 0) {
					$("#mBtn" + (catchNum+1)).attr("disabled", true);
				}
				for(var i=0; i<btnsClickCount.length; i++) {
					if(catchNum == (i+1)) {
						btnsClickCount[i] = 0;
						break;
					}
				}
				
				$(this).dialog("close");
			}
		}
	});
	
	$("#topGoalBtn").attr("disabled", "true");
	$("#mBtn2").attr("disabled", "true");
	$("#mBtn3").attr("disabled", "true");
	$("#mBtn8").attr("disabled", "true");
	$("#mBtn4").attr("disabled", "true");
	$("#mBtn7").attr("disabled", "true");
	$("#mBtn6").attr("disabled", "true");
	$("#mBtn5").attr("disabled", "true");
	
	// value가 숫자인 상태에서, 해당하는 버튼의 value 값을 사용자가 작성한 중간목표로 바꾼다.
	function inputMbtnValue(bBtn_num) {
		for(var i=0; i<8; i++) {
			if($("#mBtn"+(i+1)).attr("value") == bBtn_num) {
				$("#mBtn"+(i+1)).attr("value", mGoal_modals.mGoal);
				break;
			}
		}
	}
	
	// 중간목표 및 세부목표를 불러온다.
	function callModal() {
		$("#dialog").dialog("open");
		createGoalModals();
	}
	
	
	if($("#mBtn8").val() == "8") {
		
		var bBtn_num = "";
		var inputMgoalVal = "";
		
		// 1번버튼 : 마방진 버튼을 클릭했을 때 중간, 세부목표 관련 modal창이 뜬다.
		$("#mBtn1").click(function() {
			btnsClickCount[0] += 1;
			bBtn_num = 1;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[0] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			
			$("#mBtn2").removeAttr("disabled");
		});
		
		// 2번버튼
		$("#mBtn2").click(function() {
			btnsClickCount[1] += 1;
			bBtn_num = 2;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[1] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			
			$("#mBtn3").removeAttr("disabled");
		});
		
		// 3번버튼
		$("#mBtn3").click(function() {
			btnsClickCount[2] += 1;
			bBtn_num = 3;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[2] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			$("#mBtn4").removeAttr("disabled");
		});
		
		// 8번버튼
		$("#mBtn8").click(function() {
			btnsClickCount[8] += 1;
			bBtn_num = 8;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[7] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
		});
		
		// 4번버튼
		$("#mBtn4").click(function() {
			btnsClickCount[3] += 1;
			bBtn_num = 4;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[3] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			
			$("#mBtn5").removeAttr("disabled");
		});
		
		// 7번버튼
		$("#mBtn7").click(function() {
			btnsClickCount[6] += 1;
			bBtn_num = 7;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[6] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			
			$("#mBtn8").removeAttr("disabled");
		});
		
		// 6번버튼
		$("#mBtn6").click(function() {
			btnsClickCount[5] += 1;
			bBtn_num = 6;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[5] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			
			$("#mBtn7").removeAttr("disabled");
		});
		
		// 5번버튼
		$("#mBtn5").click(function() {
			btnsClickCount[4] += 1;
			bBtn_num = 5;
			catchbBtnNum(bBtn_num);
			callModal();
			if(btnsClickCount[4] > 1) {
				click_flag = false;
				updateGoals(bBtn_num);
			}
			
			$("#mBtn6").removeAttr("disabled");
		});
		
		// 레디 버튼 클릭시 그림 변경 및 레디 여부를 업데이트한다.
		
		$("#readyBtn").click(function() {
			// 준비를 누른 사람이 이전에 레디를 했는지에 대한 여부를 불러온다.
			$.ajax ({
				url: "/goal/createGoal/getReadyFlag",
				type: "post",
				contentType: "application/json;charset=UTF-8",
				dataType: "json",
				data: JSON.stringify({"id":'${sessionScope.userid}', "tGoalNum":'${b_info.tGoalNum}'}),
				success: function(result) {
					// Ready 상태가 N 일 경우 Y로, Y일 경우 N으로 바꾼다.
					if(result) {
						for(var i=1; i<4; i++) {
							if($("#p"+(i+1)).text() == '${sessionScope.userid}') {
								$("#p"+(i+1)+"_img").html("");
								
								$("#p"+(i+1)+"_img").html('<img src="/goal/resources/img/avatar-2-64.png">');
								
								$.ajax({
									url: "/goal/createGoal/switchReady",
									type: "post",
									contentType: "application/json;charset=UTF-8",
									dataType: "json",
									data: JSON.stringify({"id":'${sessionScope.userid}', "ready":"N"}),
									success: function() {},
									error: function(result) {
										console.log("에러 : " + result)
									}
								});
								break;
							}
						}
					} else {
						for(var i=1; i<4; i++) {
							if($("#p"+(i+1)).text() == '${sessionScope.userid}') {
								$("#p"+(i+1)+"_img").html("");
								
								$("#p"+(i+1)+"_img").html('<img src="/goal/resources/img/user_ready.png">');
								
								$.ajax({
									url: "/goal/createGoal/switchReady",
									type: "post",
									contentType: "application/json;charset=UTF-8",
									dataType: "json",
									data: JSON.stringify({"id":'${sessionScope.userid}', "ready":"Y"}),
									success: function() {},
									error: function(result) {
										console.log("에러 : " + result)
									}
								});
								break;
							}
						}
					}
				}
			})
		});
		
		// option 태그의 숫자가 달라질 때 마다 세부목표 개수를 조정한다.
		$("#bGoalcount").change(function() {
			createGoalModals();
		});
	
	// 해당하는 버튼의 value값을 사용자가 입력한 중간목표로 수정하는 함수.
	function updateMbtnValue(bBtn_num) {
		$("#mBtn"+bBtn_num).attr("value", mGoal_modals.mGoal);
	}
	
	// 중간목표 및 세부목표를 수정할 때 이전에 저장했던 값을 보여주는 함수.
	function updateGoals(bBtn_num) {
		$("#Mgoal").val(mGoal_modals.mGoal);
		$("#startMpicker").val(mGoal_modals.sDate);
		$("#endMpicker").val(mGoal_modals.eDate);
		
		var tempValue = new Date(mGoal_modals.eDate) - new Date(mGoal_modals.sDate);
		var tempSecond = tempValue / 1000;
		var tempMin = tempSecond / 60;
		var tempHour = tempMin / 60;
		var tempDays = (tempHour / 24)+1;
		$("#m_eventdays").html("<b>진행기간 : " + tempDays + "일</b>");
		
		var countArray = bGoalCounts[catchNum-1].bGoalCount.split("-");
		$("#bGoalcount option:selected").val(countArray[1]);
		
		for(var i=0; i<countArray[1]; i++) {
			var bGoal = bGoal_modals[i].bGoal;
			var dayArray = /\d/.exec(bGoal_modals[i].bGoalDay);
			$("#b_goal" + (i+1)).val(bGoal);
			$("#b_progressday" + (i+1)).val(dayArray[0]);
		}
	}
	
	var hex = "";
	
	// 색상 선택을 위한 modal창 설정
	$("#color_modal").dialog({
		autoOpen: false,
		width: 320,
		height: 500,
		maxHeight: 500,
		position: [500, 200],
		modal: true,
		resizable: false,
		buttons:{
			"확인":function () {
				// 사용자가 선택한 색상의 hex값을 테이블에 갱신한다.
				var id = '${sessionScope.userid}';
				for(var i=0; i<4; i++) {
					if(id == $("#p"+(i+1)).text()) {
						$("#p"+(i+1)+ "-tr > .player-color").text("");
						
						$.ajax({
							url: "/goal/createGoal/updateColor",
							type: "post",
							contentType: "application/json;charset=UTF-8",
							dataType: "json",
							data: JSON.stringify({"id":'${sessionScope.userid}', "hex":hex}),
							success: function() {}
						});
						$("#p"+(i+1)+ "-tr > .player-color").html('<div class="pickcolor" style="background-color: '+hex+';"></div>');
						break;
					}
				}
				
				$(this).dialog("close");
			},
			
			"취소":function() {
			
				$(this).dialog("close");
			}
		}
	});
	
	// 색상 선택 버튼을 클릭 시 modal창이 열린다.
	$("#selectcolor").click(function() {
		$("#color_modal").dialog("open");
	});
	
	// 색 목록 중 특정 색을 클릭 시 밑의 div에 그 색상을 표시하도록 한다.
	$(".color-value").click(function() {
		var id = $(this).attr("id");
		var rgb = $("#" + id).css("backgroundColor");
		hex = rgbToHex(rgb);
		$(".color-result").css("background-color", hex);
	});
	
	// 선택된 색상의 rgb값을 hex값으로 변환시킨다.
	function rgbToHex(rgb) {
		if(rgb.search("rgb") == -1) {
			return rgb;
		} else {
			rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
			function hex(x) {
				return ("0" + parseInt(x).toString(16)).slice(-2);
			}
			return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
		}
	}
	
	// 초대 버튼 클릭 시 사용자가 등록중인 친구 목록을 불러온다.
	$("#invitation").click(function() {
		$.ajax ({
			url: "/goal/createGoal/getFriendList",
			type: "get",
			success: function(friendList) {
				$(friendList).each(function(index, item) {
					if('${sessionScope.userid}' == item.userid) {
						var friend_row = '<tr class="friend"><td>' + item.frdid + '</td>';
						friend_row += '<td></td>';
						friend_row += '<th><input style="margin: 0px 3px 1px 30px; width: 13px; HEIGHT: 13px" type="checkbox" name="checkList" class="checkList" value="'+ item.frdid +'"></th></tr>';
						$(".friendList").append(friend_row);
					}
				});
			}
		});
		
		$(".invite-modal").dialog("open");
	});
	
	// 현재 인원수와 최대 인원수를 계산하여 동일할 경우 방장에게 쪽지를 보낸다
	var maxMember = '${b_info.maxMember}';
	var currentMember = 1;
	for(var i=0; i<4; i++) {
		if($("#p"+(i+1)).text() != "Empty") {
			currentMember += 1;
			if(maxMember == currentMember) {
				$.ajax ({
					url: "",
					method: "post",
					data: {},
					success: function() {}
				});
				break;
			}
		}
	}
	
	// 친구초대를 위한 modal창 설정
	$(".invite-modal").dialog({
		autoOpen: false,
		width: 350,
		height: 500,
		maxHeight: 500,
		position: [500, 200],
		modal: true,
		resizable: false,
		buttons:{
			"확인":function () {
				var nameList = new Array();
				var count = 0;
				var progressNum = ${mainProgress.progressNum};
				
				$("input[name=checkList]:checked").each(function() {
					nameList[count] = $(this).val();
					count += 1;
				});

				var currentMembers = ${currentMembers};
				var maxMember = ${mainProgress.maxMember};
				var totalMembers = currentMembers + nameList.length;
				
				if(totalMembers > maxMember) {
					alert("빈 자리가 없어 초대장을 보낼 수 없습니다");
					return false;
				} else {
					// 사용자가 체크박스에서 선택한 사람에게 초대 메시지를 보낸다.
					jQuery.ajaxSettings.traditional = true;
					$.ajax ({
						url: "/goal/createGoal/writeInviteMsg",
						type: "post",
						data: {"nameList":nameList, "progressNum":progressNum},
						success: function(result) {
							alert("초대 메시지를 전송하였습니다");
						},
						error: function() {
							alert("실패");
						}
					});
				}
				
				$(".friendList").html("");
				$(this).dialog("close");
			},
			
			"취소":function() {
				
				$(".friendList").html("");
				$(this).dialog("close");
			}
		}
	});
	
	// 나가기 버튼을 눌렀을 시 방은 지워지고 메인화면으로 이동한다.
	$("#exitBtn").click(function() {
		var result = confirm("정말 나가시겠습니까? 해당하는 정보는 모두 삭제됩니다");
		if(result) {
			if($("#p1-tr").text() == '${sessionScope.userid}') {
				$.ajax ({
					url: "exitCreateGoal",
					type: "post",
					data: {"id":'${sessionScope.userid}'},
					success: function() {
						alert("메인화면으로 이동합니다");
						window.location.replace("/goal");
					},
				});
			}
			// else : HOST가 아니므로 나간 유저에 대한 데이터 삭제 (ajax 처리)
		}
	});
	
	// 초대 modal창 안에서 유저 아이디 검색을 누를때 해당하는 결과를 보여준다.
	$("#searchBtn").click(function() {
		var keyWord = $("#search-id").val();
		if(keyWord == "") {
			alert("찾을 아이디를 입력 해 주세요");
			return false;
		}
		
		$.ajax ({
			url: "/goal/createGoal/findIdinModal",
			type: "post",
			data: {"keyWord" : keyWord},
			success: function(list) {
				if(list.length == 0) {
					alert("존재하는 ID가 없습니다");
					return false;
				}
				$(list).each(function(index, item) {
					$(".friendList").html("");
					$("#switch-th").text("아이디");
					var id_row = '<tr class="id"><td>' + item.userid + '</td>'
					id_row += '<td></td>';
					id_row += '<th><input style="margin: 0px 3px 1px 30px; width: 13px; height: 13px" type="checkbox" name="checkList" class="checkList" value="'+ item.userid +'"></th></tr>';
					$(".friendList").append(id_row);
				});
			}
		});
	});
	
	// 목표 및 진행기간을 표시한다.
	var tStartDate = new Date('${topGoal.tStartDate}');
	var tEndDate = new Date('${topGoal.tEndDate}');
	var tGoal_s = (tEndDate - tStartDate) / 1000;
	var tGoal_m = tGoal_s / 60;
	var tGoal_h = tGoal_m / 60;
	tGoal_days = (tGoal_h / 24) + 1;
	$(".subject > p > b").html("Title : " + '${topGoal.tGoalTitle}' + "  [ Period : " + tGoal_days + "days ]");
	var sDate_sp = tStartDate.toString().split(' ');
	var eDate_sp = tEndDate.toString().split(' ');
	$("#tGoal_date").html("${topGoal.tStartDate} ~ ${topGoal.tEndDate}");
	
	// 목표를 만든 사람일 경우 시작버튼, 참가한 사람일 경우 준비 버튼이 보이도록 한다.
	if($("#p1").text() == '${sessionScope.userid}') {
		$("#readyBtn").hide();
	} else $("#startBtn").hide();
	
	// 사용자가 설정한 인원수를 벗어날 경우 그 만큼 슬롯을 가린다.
	var maxMember = '${b_info.maxMember}';
	switch (maxMember) {
	case "1":
		$(".player2 > td").remove();
		$(".player3 > td").remove();
		$(".player4 > td").remove();
		$(".player2").prepend('<td colspan="6" id="p2_empty" class="user_empty"><img class="empty-user" src="/goal/resources/img/user_close.png"></td>');
		$(".player3").prepend('<td colspan="6" id="p3_empty" class="user_empty"><img class="empty-user" src="/goal/resources/img/user_close.png"></td>');
		$(".player4").prepend('<td colspan="6" id="p4_empty" class="user_empty"><img class="empty-user" src="/goal/resources/img/user_close.png"></td>');
		break;
	case "2":
		$(".player3 > td").remove();
		$(".player4 > td").remove();
		$(".player3").prepend('<td colspan="6" id="p3_empty" class="user_empty"><img class="empty-user" src="/goal/resources/img/user_close.png"></td>');
		$(".player4").prepend('<td colspan="6" id="p4_empty" class="user_empty"><img class="empty-user" src="/goal/resources/img/user_close.png"></td>');
		break;
	case "3":
		$(".player4 > td").remove();
		$(".player4").prepend('<td colspan="6" id="p4_empty" class="user_empty"><img class="empty-user" src="/goal/resources/img/user_close.png"></td>');
		break;
	case "4":
		break;
	default:
		console.log("swicth error");
		break;
	}
	
	// 초대받은 유저가 방에 입장했을 경우 그 유저의 ID를 추가한다.
	if('${newUser.userId}' != "") {
		for(var i=1; i<4; i++) {
			if($("#p" + (i+1)).text() == "Empty") {
				$("#p" + (i+1)).text('${newUser.userId}');
				break;
			}
		}
	}
	
	// 방장 이외에는 중간목표 및 세부목표 편집을 할 수 없다.
	if('${sessionScope.userid}' !=  '${sessionScope.hostId}') {
		$("#dialog").attr("readonly", true);
	}
	
	/* 
	// 시작버튼 클릭 시 참가한 사용자들이 모든 준비를 마쳤는지 확인하고 목표를 시작한다.
	$("#startBtn").click(function() {
		
		// 무결성 처리는 연동이 끝난 후에 진행 ============================================
		// 색 지정 했는지, 레디 했는지..
		var startConfirm = confirm("목표를 시작 하시겠습니까?");
		if(startConfirm) {
			// 유저들의 색상지정 여부와 레디 여부를 확인한다
			$.ajax ({
				url: "/goal/createGoal/checkUsers",
				method: "post",
				data: {"progressNum":'${b_info.progressNum}'},
				success: function(list) {
// 					var idList = new Array();
// 					var pNum = -1;
					
					console.log(list);
					
// 					$(list).each(function(index, item) {
// 						if(item.ready == "N") {
// 							alert("아직 준비하지 않은 유저가 있습니다");
// 							return false;
// 						}
						
// 						if(item.color == null) {
// 							alert("아직 색상지정이 완료되지 않은 유저가 있습니다");
// 							return false;
// 						} else {
// 							console.log(item.color);
// 							alert("색상지정 체크 로.직.오.류~~~~~~~~~~~~~~~~~~~~~~");
// 							return false;
// 						}
						
// 						console.log("is There bBtn num ? : " + bBtn_num);
						
// 						idList[index] = item.userId;
// 						pNum = item.progressNum;
// 					});
// 					console.log(idList);
// 					console.log(pNum);
// 					location.href = '/goal/createGoal/startGoal?sectionNum=' + 1 + '&id_list=' + idList + '&progressNum=' + pNum;
				},
				error: function() { alert("하 진짜 ㅡㅡ 시작에러"); }
			});
		}
	});*/
});
</script>

<!-- 배경화면 -->
<div id="background"></div>

<!-- 최종목표, 중간목표 마방진 버튼 -->
<article>
	<section>
		<div class="subject">
			<p><b></b></p>
			<p id="tGoal_date"></p>
		</div>
		
		<div class="squares">
		
			<div class="btn-group">
				<input type="button" value="1" id="mBtn1" name="1" class="btn btn-default-outline">
				<input type="button" value="2" id="mBtn2" name="2" class="btn btn-default-outline">
				<input type="button" value="3" id="mBtn3" name="3" class="btn btn-default-outline">
			</div>
			<div class="btn-group">
				<input type="button" value="8" id="mBtn8" name="8" class="btn btn-default-outline">
				<input type="button" value="${topGoal.tGoalTitle}" id="tGoalTitle" name="tGoalTitle" class="btn btn-default-outline">
				<input type="button" value="4" id="mBtn4" name="4" class="btn btn-default-outline">
			</div>
			<div class="btn-group">
				<input type="button" value="7" id="mBtn7" name="7" class="btn btn-default-outline">
				<input type="button" value="6" id="mBtn6" name="6" class="btn btn-default-outline">
				<input type="button" value="5" id="mBtn5" name="5" class="btn btn-default-outline">
			</div>
			
		</div>
	</section>
</article>

<!-- 플레이 할 유저 목록, 초대, 색상지정, 진행상황을 표시한다. -->
<aside>
<table class="table table-bordered table-hover">
	<tr>
		<th colspan="2" align="center">참여자</th>
		<th align="center">색상</th>
	</tr>
	<c:forEach items="${memberList}" var="memberList">
		<tr>
			<td><img src="/goal/resources/img/avatar-2-48.png"></td>
			<td>${memberList.userid}</td>
			<td><div class="pickcolor" style="background-color:${memberList.color};"></div></td>
		</tr>
	</c:forEach>
</table>

		<div id = "footButtonLine">
			<div><input type="button" value="초대" id="invitation"></div>
			<div><input type="button" value="색상지정" id="selectcolor"></div>
		</div>
</aside>


<!-- 레디, 시작, 나가기 버튼
<footer>
	<div>
		<input type="button" value="레디" id="readyBtn">
		<input type="button" value="시작" id="startBtn">
		<input type="button" value="나가기" id="exitBtn">
	</div>
</footer>
 -->

<!-- 중간목표 및 세부목표를 설정하는 modal 창 -->
<div id="dialog" title="목표설정">
	<div class="midgoal">
		중간목표<br>
		<input type="text" id="Mgoal"><br>
		중간목표 시작일<br>
		<input type="text" id="startMpicker" class="dateTimePicker"><br>
		중간목표 종료일<br>
		<input type="text" id="endMpicker" class="dateTimePicker">
		<!-- 종료일 - 시작일 = 진행날짜 계산 -->
		<div id="m_eventdays">
			<b></b>
		</div>
	</div>
	<hr>
	<div class="btmgoal">
		세부목표 개수
		<select id="bGoalcount">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
		</select><br><br>
		<!-- 세부목표 개수를 선택한 만큼 세부목표 입력란이 생긴다. -->
	</div>
</div>

<!-- 색상 지정을 하기 위한 Modal 창 -->
<div id="color_modal" title="${sessionScope.userid}님의 색상선택">
	<div class="color-row1">
		<div id="color_lightgray" class="color-value"></div>
		<div id="color_red" class="color-value"></div>
		<div id="color_orange" class="color-value"></div>
		<div id="color_green" class="color-value"></div>
		<div id="color_purple" class="color-value"></div>
	</div>
	<div class="color-row2">
		<div id="color_pink" class="color-value"></div>
		<div id="color_gold" class="color-value"></div>
		<div id="color_aquamarine" class="color-value"></div>
		<div id="color_blue" class="color-value"></div>
		<div id="color_skyblue" class="color-value"></div>
	</div>
	<hr>
	<div class="color-result"></div>
</div>

<!-- alert창을 띄우기 위한 bootstrap div -->
<div class="card mb-4">
	<div class="card-header">
		
	</div>
	<div class="card-block">
		<p class="card-text">
			<button id="msg_ok" class="btn btn-primary swal-btn-basic">확인</button>
		</p>
	</div>
</div>

<!-- 초대 기능을 위한 modal창 -->
<div class="invite-modal" title="초대하기">
	<table>
		<thead>
			<tr>
				<td colspan="3" class="search-form">
					<input type="text" id="search-id">
					<input type="button" value="ID검색" id="searchBtn"><br>
					<hr>
				</td>
			</tr>
			<tr>
				<th id="switch-th">친구</th>
				<th><pre>     </pre></th>
				<th>초대여부</th>
			</tr>
		</thead>
		<tr class="bordered"></tr>
		<tbody class="friendList">
			<!-- 여기에 동적 추가 -->
		</tbody>
	</table>
</div>
</body>
</html>
