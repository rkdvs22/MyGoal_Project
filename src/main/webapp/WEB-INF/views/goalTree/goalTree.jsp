<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>목표 트리</title>
<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
<script src="/goal/resources/js/plugins.js"></script>
<script>
	$(function() {
		$(".pop").hide();	//레이어 팝업창 숨김
		$("#noGoalAlert").hide();
		locateGoal();
		getTitle();
		if('${requestScope.key}' == 1){
			$("#" + ${requestScope.goalYear}).attr("selected", "selected");
		}
	});
	
	//목표 개수만큼 열매 달기 feat.조준석 앞으로 하나 남음
	function locateGoal() {
		var result = ${goalNum};
		var str = "";

		<c:forEach var="goalList" items="${goalList}" varStatus="status">
			if ("${goalList.tClear}" == "N") {	//미클리어
				str += '<div class="apple" id="a' + ${status.index + 1} + '" onclick="goSquare(' + ${goalList.tGoalNum} + ')">'
					+ "<img src='/goal/resources/img/goaltree/apple3.png' width='100%'>"
					+ "</div>";
			} else if ("${goalList.tClear}" == "Y") {	//클리어
				str += "<div class='apple' id='a" + ${status.index + 1} + "' onclick='goSquare(" + ${goalList.tGoalNum} + ")'>"
					+ "<img src='/goal/resources/img/goaltree/apple1.png' width='100%'>"
					+ "</div>";
			}
		</c:forEach>
		
		if (result == 0) {
			$("#noGoalAlert").show();
		} else if (result <= 1) {
			$(".smalltree").append(str);
			smallApple();
		} else if (result > 1 && result <= 4) {
			$(".midtree").append(str);
			midApple();
		} else if (result > 4 && result <= 10){
			$(".bigtree").append(str);
			bigApple();
		} else if (result > 10 && result <= 11){
			$(".bigNSmalltree").append(str);
			bigApple();
		} else {
			$(".bigNMidtree").append(str);
			bigNMidApple();
		}
	}	//locateGoal
	
	//작은 나무 열매
	function smallApple() {
		$("#a1").css({
			left: 40,
			top: 90
		});
	}
	
	//중간 나무 열매
	function midApple() {
		$("#a1").css({
			left: 110,
			top: 80
		});
		
		$("#a2").css({
			left: 50,
			top: 100
		});
		
		$("#a3").css({
			left: 200,
			top: 120
		});
		
		$("#a4").css({
			left: 90,
			top: 170
		});
	}
	
	//큰 나무 열매
	function bigApple() {
		$("#a1").css({
			left: 100,
			top: 100
		});
		
		$("#a2").css({
			left: 200,
			top: 170
		});
		
		$("#a3").css({
			left: 300,
			top: 200
		});
		
		$("#a4").css({
			left: 160,
			top: 270
		});
		
		$("#a5").css({
			left: 300,
			top: 120
		});
		
		$("#a6").css({
			left: 80,
			top: 240
		});
		
		$("#a7").css({
			left: 70,
			top: 190
		});
		
		$("#a8").css({
			left: 305,
			top: 255
		});
		
		$("#a9").css({
			left: 210,
			top: 50
		});
		
		$("#a10").css({
			left: 400,
			top: 220
		});
		
		$("#a11").css({
			left: 580,
			top: 420
		});
	}
	
	function bigNMidApple() {
		$("#a1").css({
			left: 100,
			top: 100
		});
		
		$("#a2").css({
			left: 200,
			top: 170
		});
		
		$("#a3").css({
			left: 300,
			top: 200
		});
		
		$("#a4").css({
			left: 160,
			top: 270
		});
		
		$("#a5").css({
			left: 300,
			top: 120
		});
		
		$("#a6").css({
			left: 80,
			top: 240
		});
		
		$("#a7").css({
			left: 70,
			top: 190
		});
		
		$("#a8").css({
			left: 305,
			top: 255
		});
		
		$("#a9").css({
			left: 210,
			top: 50
		});
		
		$("#a10").css({
			left: 400,
			top: 220
		});
		
		$("#a11").css({
			left: 580,
			top: 400
		});
		
		$("#a12").css({
			left: 600,
			top: 320
		})
		
		$("#a13").css({
			left: 680,
			top: 360
		})
		
		$("#a14").css({
			left: 540,
			top: 340
		})
		
		$("#a15").css({
			left: 590,
			top: 250
		})
	}
	
	//해당 마방진으로 이동
	function goSquare(goalNum) {
		location.href = "http://www.daum.net";
		//location.href = "goal/mindMap/square?goalNum=" + goalNum;
	}
	
	//최상위 목표 타이틀 출력
	function getTitle() {
		$("#a1").mouseover(function(e) {
			$("#pop1").show();
			$("#pop1").css("left", e.clientX);
	        $("#pop1").css("top", e.clientY);
		});
		
		$("#a2").mouseover(function(e) {
				$("#pop2").show();
				$("#pop2").css("left", e.clientX);
		        $("#pop2").css("top", e.clientY);
		});
		
		$("#a3").mouseover(function(e) {
			$("#pop3").show();
			$("#pop3").css("left", e.clientX);
	        $("#pop3").css("top", e.clientY);
		});
		
		$("#a4").mouseover(function(e) {
			$("#pop4").show();
			$("#pop4").css("left", e.clientX);
	        $("#pop4").css("top", e.clientY);
		});
		
		$("#a5").mouseover(function(e) {
			$("#pop5").show();
			$("#pop5").css("left", e.clientX);
	        $("#pop5").css("top", e.clientY);
		});
		
		$("#a6").mouseover(function(e) {
			$("#pop6").show();
			$("#pop6").css("left", e.clientX);
	        $("#pop6").css("top", e.clientY);
		});
		
		$("#a7").mouseover(function(e) {
			$("#pop7").show();
			$("#pop7").css("left", e.clientX);
	        $("#pop7").css("top", e.clientY);
		});
		
		$("#a8").mouseover(function(e) {
			$("#pop8").show();
			$("#pop8").css("left", e.clientX);
	        $("#pop8").css("top", e.clientY);
		});
		
		$("#a9").mouseover(function(e) {
			$("#pop9").show();
			$("#pop9").css("left", e.clientX);
	        $("#pop9").css("top", e.clientY);
		});
		
		$("#a10").mouseover(function(e) {
			$("#pop10").show();
			$("#pop10").css("left", e.clientX);
	        $("#pop10").css("top", e.clientY);
		});
		
		$("#a11").mouseover(function(e) {
			$("#pop11").show();
			$("#pop11").css("left", e.clientX);
	        $("#pop11").css("top", e.clientY);
		});
		
		$("#a12").mouseover(function(e) {
			$("#pop12").show();
			$("#pop12").css("left", e.clientX);
	        $("#pop12").css("top", e.clientY);
		});
		
		$("#a13").mouseover(function(e) {
			$("#pop13").show();
			$("#pop13").css("left", e.clientX);
	        $("#pop13").css("top", e.clientY);
		});
		
		$("#a14").mouseover(function(e) {
			$("#pop14").show();
			$("#pop14").css("left", e.clientX);
	        $("#pop14").css("top", e.clientY);
		});
		
		$("#a15").mouseover(function(e) {
			$("#pop15").show();
			$("#pop15").css("left", e.clientX);
	        $("#pop15").css("top", e.clientY);
		});
		
	    $(".apple").mouseleave(function() {
	        //마우스 떼면 : 팝업 사라짐
	        $(".pop").hide();
	    });
	}
	
	//연도별 목표 보기
	function yearList() {
		var year = document.getElementById("year");
		location.href = "/goal/goalTree/goalList?year=" + year.value + "&key="+1;
	}
	
	//목표 0개시 경고창 출력
	 function closeAlert() {
		 $("#noGoalAlert").css("display", "none");
	 }
</script>
<link rel="stylesheet" href="css/lib/font-awesome/font-awesome.min.css">
<link rel="stylesheet" href="css/lib/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/goal/resources/css/main.css">
<link rel="stylesheet" href="/goal/resources/css/goaltree/goaltree.css?version=7">
</head>
<body>
	<div class="page-content">
		<header class="section-header">
			<div class="tbl">
				<div class="tbl-row">
					<div class="tbl-cell">
						<h3>
							Goal Tree <small class="text-muted">${sessionScope.userid}</small>
						</h3>
						<select id="year" name="year" onchange="yearList()">
							<option id="2015" value="2015">2015</option>
							<option id="2016" value="2016">2016</option>
							<option id="2017" value="2017" selected="selected">2017</option>
						</select>
					</div>
				</div>
			</div>
		</header>

		<%@ include file="../menu.jsp"%>

		<!-- 작은 나무(목표 0~1개) -->
		<c:if test="${goalNum <= 1}">
			<div class="smalltree">
				<img src="/goal/resources/img/goaltree/tree1.png" width="180px">
			</div>
		</c:if>

		<!-- 중간 나무(목표 2~4개) -->
		<c:if test="${goalNum > 1 && goalNum < 5}">
			<div class="midtree">
				<img src="/goal/resources/img/goaltree/tree2.png" width="300px">
			</div>
		</c:if>

		<!-- 큰 나무(목표 5~10개) -->
		<c:if test="${goalNum >= 5 && goalNum <= 10}">
			<div class="bigtree">
				<img src="/goal/resources/img/goaltree/tree3.png" width="480px">
			</div>
		</c:if>

		<!-- 여러 나무(목표 11개) -->
		<c:if test="${goalNum > 10 && goalNum <= 11}">
			<div class="bigNSmalltree">
				<img src="/goal/resources/img/goaltree/tree3.png" width="480px">
				<img class="smallTreeImg"
					src="/goal/resources/img/goaltree/tree1.png" width="180px">
			</div>
		</c:if>

		<c:if test="${goalNum > 11}">
			<div class="bigNMidtree">
				<img src="/goal/resources/img/goaltree/tree3.png" width="480px">
				<img class="midTreeImg" src="/goal/resources/img/goaltree/tree2.png"
					width="300px">
			</div>
		</c:if>

		<!-- 대주제 팝업창으로 표시하기 -->
		<c:forEach var="goalList" items="${goalList}" varStatus="status">
			<div class="pop" id="pop${status.index + 1}">
				<div class="poptail"></div>
				${goalList.tGoalTitle}<br> 달성 기간 : ${goalList.tStartDate} ~ ${goalList.tEndDate}
			</div>
		</c:forEach>

		<!-- 아무 목표가 없을 때 메시지 출력 -->
		<div id="noGoalAlert" data-notify="container"
			class="col-xs-11 col-sm-4 alert alert-grey animated fadeInDown fadeOutUp"
			role="alert">
			<button type="button" class="close" onclick="closeAlert()">×</button>
			<span data-notify="icon" class="font-icon font-icon-warning"></span>
			<span data-notify="title"><strong>목표를 설정하세요!</strong></span> <span
				data-notify="message">목표를 설정하여 ${sessionScope.userid}님의 나무에
				열매를 맺어보세요. <a href="/goal/createGoal/createForm">[바로 가기]</a>
			</span>
		</div>

	</div>
	<!-- page-content 끝 -->
</body>
</html>