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
