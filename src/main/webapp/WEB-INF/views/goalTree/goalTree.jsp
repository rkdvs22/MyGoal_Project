<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>목표 트리</title>
<script src="/goal/resources/js/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		$(".pop").hide();	//레이어 팝업창 숨김
		locateGoal();
		getTitle();
	});
	
	//목표 개수만큼 열매 달기
	function locateGoal() {
		var result = ${goalNum};
		var str = "";
		for (var i = 0; i < result; i++) {
			str += "<div class='apple' id='a" + (i+1) + "' onclick='goSquare(" + (i+1) + ")'>"
				+ "<img src='/goal/resources/img/goaltree/apple1.png' width='100%'>"
				+ "</div>";
		}
		
		if (result <= 1) {
			$(".smalltree").append(str);
			$(".apple").css("width", "43px");
			$(".apple").css("height", "43px");
			$(".smalltree").show();
			smallApple();
		} else if (result > 1 && result <= 4) {
			$(".midtree").append(str);
			$(".apple").css("width", "43px");
			$(".apple").css("height", "43px");
			$(".midtree").show();
			midApple();
		} else {
			$(".bigtree").append(str);
			$(".bigtree").show();
			bigApple();
		}
	}
	
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
		
	    $(".apple").mouseleave(function() {
	        //마우스 떼면 : 팝업 사라짐
	        $(".pop").hide();
	    });
	}
</script>
<style>
	/* 배경 */
	body {
		background-image: url("/goal/resources/img/goaltree/background.png");
		background-position: center top;
		background-size: 1300px auto;
		background-repeat: no-repeat;
	}
	
	/* 작은 나무 */
	.smalltree {
		width: 180px;
		position: relative;
		margin: 0 auto;
	}
	
	/* 중간 나무 */
	.midtree {
		width: 300px;
		position: relative;
		margin: 0 auto;
	}
	
	/* 큰 나무 */
	.bigtree {
		width: 480px;
		position: relative;
		margin: 0 auto;
	}
	
	/* 열매 */
	.apple {
		position: absolute;
		width: 45px;
		height: 45px;
		/* background: #e60012;
		border-radius: 50%; */
	}
	
	/* 레이어 팝업 */
	.pop {
		padding-top: 8px;
		padding-bottom: 8px;
		padding-left: 10px;
		padding-right: 10px;
		border-radius: 20px;
		border: solid aquamarine 1px;
	 	background-color: azure;
		opacity: 0.9;
		position: absolute;
	}
	
	.pop.after {
		border-top: 0 solid transparent;
	    border-left: 10px solid transparent;
		border-right: 10px solid transparent; 
		border-bottom:10px solid pink; 
		content: ""; 
		position:absolute;
		top:21px; left:200px;		
	}
</style>
</head>
<body>
<%-- 
<%@ include file="../menu.jsp" %>
 --%>
<!-- 작은 나무(목표 0~1개) -->
<c:if test="${goalNum <= 1}">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div class="smalltree">
	<img src="/goal/resources/img/goaltree/tree1.png" width="180px">
</div>
</c:if>

<!-- 중간 나무(목표 2~4개) -->
<c:if test="${goalNum > 1 && goalNum < 5}">
<br><br><br><br><br><br><br><br><br><br>
<div class="midtree">
	<img src="/goal/resources/img/goaltree/tree2.png" width="300px">
</div>
</c:if>

<!-- 큰 나무(목표 5개 이상) -->
<c:if test="${goalNum >= 5}">
<div class="bigtree">
	<img src="/goal/resources/img/goaltree/tree3.png" width="480px">
</div>
</c:if>

<!-- 대주제 팝업창으로 표시하기 -->
<c:forEach var="goalList" items="${goalList}" varStatus="status">
	<div class="pop" id="pop${status.index + 1}">
		<div class="poptail"></div>
   	${goalList.tGoalTitle}
	</div>
</c:forEach>


</body>
</html>