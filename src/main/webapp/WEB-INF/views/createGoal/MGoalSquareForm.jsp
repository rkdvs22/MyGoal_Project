<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../menu.jsp" %>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/goal/resources/css/main.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link rel="/goal/resources/css/lib/clockpicker/jquery.datetimepicker.css">

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="/goal/resources/js/jquery.datetimepicker.full.min.js"></script>
<style>
	/* 마방진 전체 크기 및 위치 지정 */
	.squares {
		width: 540px;
		height: 540px;
		position: relative;
		top: 200px;
		left: 200px;
	}
	
	/* 각 마방진 버튼 크기 지정 */
	.btn-group > input {
		height: 180px;
		width: 180px;
	}
	
	/* 최종목표 버튼색 지정 */
	#topGoalBtn {
		background-color: #FFC81E;
		color: black;
	}
	
	/* modal창의 스크롤 지정 */
	#dialog {
		position: relative;
		overflow-y: auto;
	}
	
	/* 에러표시를 할 div 지정 */
	#error_div {
		display: none;
	}
	
	aside {
		position: absolute;
		top: 200px;
		left: 900px;
	}
	
	footer {
		position: absolute;
		top: 700px;
		left: 900px;
	}
</style>

</head>

<body>
<script>

var ok_flag = true;
var m_eDate = "";
var m_sDate = "";
var b_sDate = new Array();
var b_eDate = new Array();

var mGoal_modals = new Array();

var bGoal_modals = new Array();

// modal 창에서 사용자가 입력하는 값에 따라 가능여부를 판단하고 날짜를 계산하는 함수이다.
function createGoalModals() {
	var goalCount = $("#bGoalcount option:selected").val();
	$(".bg_content").empty();
	$(".hr").remove();
	
	for(var i=0; i<goalCount; i++) {
		var row = '<div class="bg_content">세부목표 ' + (i+1) + 
		'<input type="text" name="b_goal' + (i+1) + 
		'" id="b_goal' + (i+1) + '"><br>예정 진행기간(일)<br><input type="text" name="b_progressday' + (i+1) +
		'" id=b_progressday' + (i+1) +
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
		if($("#startMpicker").val() != "") {
			m_eDate = $("#endMpicker").datepicker("getDate");
			m_sDate = $("#startMpicker").datepicker("getDate");
			if(m_eDate - m_sDate < 0) {
				alert("종료일이 시작일보다 이전일 수 없습니다");
				ok_flag = false;
				return false;
			} else ok_flag = true;
		}
		
		var second = (m_eDate - m_sDate)/1000;
		var minuate = second / 60;
		var hour = minuate / 60;
		var progressDay = hour / 24;
		$("#m_eventdays").text("진행기간 : " + progressDay + "일");
	});
	
	
	// 중간목표의 시작일을 종료일보다 뒤의 날짜로 선택했을 경우 사용자에게 알린다.
	$("#startMpicker").on("change", function() {
		if($("#endMpicker").val() != "") {
			m_sDate = $("#startMpicker").datepicker("getDate");
			m_eDate = $("#endMpicker").datepicker("getDate");
			if (m_sDate > m_eDate) {
				alert("시작일이 종료일보다 이후일 수 없습니다");
				ok_flag = false;
				return;
			} ok_flag = true;
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
			alert("숫자를 입력 해 주세요.");
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

$(function() {
	
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
					ok_flag = false;
				}
				
				// 사용자가 입력하지 않은 세부목표 항목에 대해 체크한다.
				for(var i=0; i<goalCount; i++) {
					if($("#b_progressday" + (i+1)).val() == ""
					|| $("#b_goal" + (i+1)).val() == "") {
						ok_flag = false;
					}
				}
				
				if(ok_flag == false) {
					alert("입력하지 않은 항목이 있거나 작성한 부분에 문제가 있습니다");
					return false;
				}
				
				// 사용자가 작성한 중간목표를 저장한다.
				mGoal_modals[catchNum-1] = {
					mGoalNum: catchNum,
					mGoal: $("#Mgoal").val(),
					sDate: $("#startMpicker").val(),
					eDate: $("#endMpicker").val()
				};
				
				var bGTotalLength = Number(goalCount) + Number(bGoal_modals.length);
				
				var bGoalNum = 0;
				// 사용자가 작성한 세부목표를 저장한다.
				for(var i=0; i<bGTotalLength; i++) {
					bGoalNum += 1;
					if(catchNum == 1) {
						bGoal_modals[i] = {
							m_b_GoalNum: catchNum + "-" + (i+1),
							bGoal: $("#b_goal"+(i+1)).val()
						};
					} else {
						bGoalNum = 0;
						for(var j=bGoal_modals.length; j<bGTotalLength; j++) {
							bGoalNum += 1;
							bGoal_modals[j] = {
								m_b_GoalNum: catchNum + "-" + (bGoalNum),
								bGoal: $("#b_goal"+(i+1)).val()
							};
						}
					}
				}
				
				if(click_flag == true) {
					inputMbtnValue(bBtn_num);
					$("#m_eventdays").text("");
// 					$(".midgoal > input").val("");
// 					$("#bGoalcount").val("");
// 					$(".bg_content > input").val("");
// 					$("#m_eventdays").val("");
				} else {
					updateMbtnValue(bBtn_num);
				}
				
				$(this).dialog("close");
			},
			
			// modal의 취소버튼을 눌렀을 경우, 사용자가 입력했던 중간목표 및 세부목표와 관련된 값들을 지운다.
			"취소":function() {
				cancel_flag = true;
				$("#m_eventdays").text("");
				$(".midgoal > input").val("");
				$("#bGoalcount").val("");
				$(".bg_content > input").val("");
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
				$("#mBtn"+(i+1)).attr("value", mGoal_modals[i].mGoal);
				break;
			}
		}
	}
	
	// 중간목표 및 세부목표를 불러온다.
	function callModal() {
		$("#dialog").dialog("open");
		createGoalModals();
	}
	
	var clickCount_btn1 = 0;
	var clickCount_btn2 = 0;
	var clickCount_btn3 = 0;
	var clickCount_btn4 = 0;
	var clickCount_btn5 = 0;
	var clickCount_btn6 = 0;
	var clickCount_btn7 = 0;
	var clickCount_btn8 = 0;
	
	if($("#mBtn8").val() == "8") {
		
		var bBtn_num = "";
		var inputMgoalVal = "";
		
		// 1번버튼 : 마방진 버튼을 클릭했을 때 중간, 세부목표 관련 modal창이 뜬다.
		$("#mBtn1").click(function() {
			clickCount_btn1 += 1;
			bBtn_num = 1;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn1 > 1) {
				click_flag = false;
			}
			
			$("#mBtn2").removeAttr("disabled");
		});
		
		// 2번버튼
		$("#mBtn2").click(function() {
			clickCount_btn2 += 1;
			bBtn_num = 2;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn2 > 1) {
				click_flag = false;
			}
			
			$("#mBtn3").removeAttr("disabled");
		});
		
		// 3번버튼
		$("#mBtn3").click(function() {
			clickCount_btn3 += 1;
			bBtn_num = 3;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn3 > 1) {
				click_flag = false;
			}
			$("#mBtn4").removeAttr("disabled");
		});
		
		// 8번버튼
		$("#mBtn8").click(function() {
			clickCount_btn8 += 1;
			bBtn_num = 8;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn8 > 1) {
				click_flag = false;
			}
		});
		
		// 4번버튼
		$("#mBtn4").click(function() {
			clickCount_btn4 += 1;
			bBtn_num = 4;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn4 > 1) {
				click_flag = false;
			}
			
			$("#mBtn5").removeAttr("disabled");
		});
		
		// 7번버튼
		$("#mBtn7").click(function() {
			clickCount_btn7 += 1;
			bBtn_num = 7;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn7 > 1) {
				click_flag = false;
			}
			
			$("#mBtn8").removeAttr("disabled");
		});
		
		// 6번버튼
		$("#mBtn6").click(function() {
			clickCount_btn6 += 1;
			bBtn_num = 6;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn6 > 1) {
				click_flag = false;
			}
			
			$("#mBtn7").removeAttr("disabled");
		});
		
		// 5번버튼
		$("#mBtn5").click(function() {
			clickCount_btn5 += 1;
			bBtn_num = 5;
			catchbBtnNum(bBtn_num);
			callModal();
			if(clickCount_btn5 > 1) {
				click_flag = false;
			}
			
			$("#mBtn6").removeAttr("disabled");
		});
		
		// 레디 버튼 클릭
		$("#readyBtn").click(function() {
			$("#player2").attr("src", "/goal/resources/img/ready.png");
			$("#player2").attr("opacity", "0.2");
		});
		
		// option 태그의 숫자가 달라질 때 마다 세부목표 개수를 조정한다.
		$("#bGoalcount").change(function() {
			createGoalModals();
		});
			
	}
	
	// 해당하는 버튼의 value값을 사용자가 입력한 중간목표로 수정하는 함수.
	function updateMbtnValue(bBtn_num) {
		$("#mBtn"+bBtn_num).attr("value", mGoal_modals[bBtn_num-1].mGoal);
	}
});
	
</script>


<!-- 최종목표, 중간목표 마방진 버튼 -->
<article>
	<section>
		<div class="subject">
			<p>방제 : ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
		</div>
		<div class="squares">
			<div class="btn-group">
				<input type="button" value="1" id="mBtn1" name="1" class="btn btn-default-outline">
				<input type="button" value="2" id="mBtn2" name="2" class="btn btn-default-outline">
				<input type="button" value="3" id="mBtn3" name="3" class="btn btn-default-outline">
			</div>
			<div class="btn-group">
				<input type="button" value="8" id="mBtn8" name="8" class="btn btn-default-outline">
				<input type="button" value="大" id="topGoalBtn" name="top" class="btn btn-default-outline">
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

<aside>
	<div class="users">
		<div class="host">
			<img src="/goal/resources/img/avatar-2-64.png" id="host">
		</div>
		<div class="user2">
			<img src="/goal/resources/img/avatar-2-64.png" id="player2">
<!-- 			<img src="/goal/resources/img/ready.png" id="p2_ready"> -->
		</div>
		<div class="user3">
			<img src="/goal/resources/img/avatar-2-64.png" id="player3">
<!-- 			<img src="/goal/resources/img/ready.png" id="p3_ready"> -->
		</div>
		<div class="user4">
			<img src="/goal/resources/img/avatar-2-64.png" id="player4">
<!-- 			<img src="/goal/resources/img/ready.png" id="p4_ready"> -->
		</div>
	</div>
	<div>
		<input type="button" value="초대"><br>
		<input type="button" value="진행상황">
	</div>
</aside>

<footer>
	<div>
		<input type="button" value="레디" id="readyBtn">
		<input type="button" value="시작" id="startBtn">
		<input type="button" value="나가기" id="exitBtn">
	</div>
</footer>

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
</body>

</html>
