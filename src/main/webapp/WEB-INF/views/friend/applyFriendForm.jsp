<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
<script src="/goal/resources/js/plugins.js"></script>
<script>
	jQuery(document).ready(function() {
	    jQuery('.tabs .tab-links a').on('click', function(e)  {
	        var currentAttrValue = jQuery(this).attr('href');
	        jQuery('.tabs ' + currentAttrValue).show().siblings().hide();
	        jQuery(this).parent('li').addClass('active').siblings().removeClass('active');
	        e.preventDefault();
	    });
	    
	    $("#tab1_right_bottom").hide();
	});
	
	//친구 신청 전송
	function frdMsg() {
		var receiver = document.getElementById("receiver");
		var msgTitle = document.getElementById("msgTitle");
		var msgContent = document.getElementById("msgContent");
		
		if (msgTitle.value == "") {
			msgTitle.focus();
			alert("제목을 입력해주세요.");
		} else if (msgContent.value == "") {
			alert("내용을 입력해주세요.");
			msgContent.focus();
		} else {
			$.ajax({
				url: "/goal/friend/applyMsg",
				type: "post",
				data: {"receiver":receiver.value, "msgTitle":msgTitle.value, "msgContent":msgContent.value},
				success: function(result) {
					alert("친구 신청이 완료되었습니다.");
					location.href = "/goal/friend/openFriend";
				}
			});
		}
	}
</script>
<link rel="stylesheet" href="/goal/resources/css/main.css?version=1">
<link rel="stylesheet" href="/goal/resources/css/message/message.css?version=1">
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="page-content">
<header class="page-content-header">
	<div class="container-fluid">
		<div class="tbl">
			<div class="tbl-row">
				<div class="tbl-cell">
					<h3>Add Friend <small class="text-muted">${sessionScope.userid}</small></h3>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="box-typical box-typical-padding">
	<!-- 탭 메뉴 생성 -->
	<div class="tabs">
	<ul class="tab-links">
        <li class="active"><a href="#tab1">친구 신청</a></li>
	</ul>
    <div class="tab-content">
         <!-- 쪽지 쓰기 -->
        <div id="tab1" class="tab active">
        	<!-- 쪽지 작성 폼 -->
			<div id="tab2_left">
				<table class="writeForm">
					<tr>
						<th>발신자</th>
						<td><input type="text" class="form-control" name="sender" id="sender" value="${sessionScope.userid}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>수신자</th>
						<td><input type="text" class="form-control" name="receiver" id="receiver" value="${requestScope.frdid}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" name="msgTitle" id="msgTitle" value="[SYSTEM] 친구 신청이 도착하였습니다." readonly="readonly"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea style="width:100%; height:300px" class="form-control" name="msgContent" id="msgContent">${sessionScope.userid}님이 ${requestScope.frdid}님과 친구가 되길 원하세요!
친구 신청을 수락하시겠습니까?</textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input class="btn btn-rounded btn-success" type="button" value="전송" onclick="frdMsg()"></td>
					</tr>
				</table>
			</div>
			<!-- 쪽지 작성 폼 끝 -->
        </div>
        <!-- 쪽지 쓰기 끝 -->
    </div>
    <!-- tab-content 끝 -->
	</div>
	<!-- tabs 끝 -->
	</div>
	<!-- msgList 끝 -->
</div>
</body>
</html>