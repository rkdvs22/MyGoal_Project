<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../menu.jsp" %>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/goal/resources/css/square/square.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/lobipanel/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/widgets.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">

	<link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/goal/resources/css/main.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/clockpicker/jquery.datetimepicker.css">

	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/lobipanel/lobipanel.min.js"></script>
	<script src="/goal/resources/js/jquery.datetimepicker.full.min.js"></script>
	<script src="/goal/resources/js/app.js"></script>
	
</head>

<body>
<script>

// 처음 페이지 이동 시 중간목표 타이틀 출력
function mGoalTitle() {
	<c:forEach items="${midGoal}" var="midGoal" varStatus="status">
		$("#mBtn" + ${status.index + 1}).attr("value", "${midGoal.mGoalTitle}");
		$("#mBtn" + ${status.index + 1}).attr("name", "${midGoal.mGoalNum}");
	</c:forEach>	
}


$(function() {
	mGoalTitle();	//중간 목표 타이틀 출력
	
	$('.btn-group > input').on("click",function(){
		var mGoalNum = $(this).attr('name');
		var mGoalTitle = $(this).attr('value');
		location.href = "/goal/createGoal/openMindMap?mGoalNum="+mGoalNum+"&mGoalTitle="+mGoalTitle;
	});
});
	
	
</script>

<!-- 배경화면 -->
<div id="background"></div>

<!-- 최종목표, 중간목표 마방진 버튼 -->
<article>
	<section id="subject">
		<header id="title" style="font-size: 28px">Title : ${topGoal.tGoalTitle}</header>
		<div>
			<p class="card-text" id="tGoal_date">${topGoal.tStartDate} ~ ${topGoal.tEndDate}</p>
		</div>
	</section>

	<section>
		<div class="squares">
		
			<div class="btn-group">
				<input type="button" value="1" id="mBtn1" name="1" class="btn btn-default-outline" style="background-color: blue;">
				<input type="button" value="2" id="mBtn2" name="2" class="btn btn-default-outline" style="color: black;">
				<input type="button" value="3" id="mBtn3" name="3" class="btn btn-default-outline">
			</div>
			<div class="btn-group">
				<input type="button" value="8" id="mBtn8" name="8" class="btn btn-default-outline">
				<input type="button" value="${topGoal.tGoalTitle}" id="tGoalTitle" name="tGoalTitle" class="btn btn-default-outline" style="background-color: #FBB137">
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
<table class="table table-bordered table-hover" style="content: "."; visibility: hidden; display: block; height: 0; clear: both;">
	<tr>
		<th colspan="2" align="center" style="background-color: #042006; color: white">참여자</th>
		<th align="center" style="background-color: #042006; color: white">색상</th>
	</tr>
	<c:forEach items="${memberList}" var="memberList">
		<tr>
			<!-- 프로필 사진 -->
			<c:if test="${memberList.image != null}">
			<td><img src="/goal/resources/img/profileImg/${memberList.image}" alt=""></td>
			</c:if>
			<c:if test="${memberList.image == null}">
			<td><img src="/goal/resources/img/avatar-2-48.png"></td>
			</c:if>
			<td>${memberList.userid}</td>
			<td><div class="pickcolor" style="background-color:${memberList.color};"></div></td>
		</tr>
	</c:forEach>
</table>

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

</body>
</html>
