<!-- 이유정 : 9/7 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/goal/resources/js/jquery-3.2.1.min.js"></script>
<script>
	jQuery(document).ready(function() {
	    jQuery('.tabs .tab-links a').on('click', function(e)  {
	        var currentAttrValue = jQuery(this).attr('href');
	        jQuery('.tabs ' + currentAttrValue).show().siblings().hide();
	        jQuery(this).parent('li').addClass('active').siblings().removeClass('active');
	        e.preventDefault();
	    });
	});

	//받은 메시지 출력
	function receivedMsgList(id) {
		$.ajax({
			url: "/goal/message/msgList",
			type: "post",
			data: {"id": id},
			dataType: "json",
			success: function(msgList) {
				$("#tab1_right").empty();
				$(msgList).each(function(index, item) {
					var str = "";
					var receivedMsg = item.sender;
					
					if (receivedMsg == id) {
						str += "<div class='receivedBubble bubble'>"
					} else {
						str += "<div class='sentBubble bubble'>"
					}
					str += "<table class='msg'>";
					str += "<tr><td class='msgTitle'> 제목 : " + item.msgTitle + "</td>";
					str += "<td> 날짜 : " + item.msgDate;
					str += "</td></tr>";
					//str += "<tr><td colspan='2'><hr></td></tr>";
					str += "<tr><td colspan='2' class='msgContent'>";
					str += item.msgContent;
					str += "</td></tr>";
					str += "</table>";
					str += "</div><br>";
					
					$("#tab1_right").append(str);
				});
			},
			error: function(e) {
				console.log(e);
				alert(e);
			}
		});
	}
	
	//보낸 메시지 출력
	function sentMsgList(id) {
		$.ajax({
			url: "/goal/message/msgList",
			type: "post",
			data: {"id": id},
			dataType: "json",
			success: function(msgList) {
				$("#tab2_right").empty();
				$(msgList).each(function(index, item) {
					var str = "";
					var sentMsg = item.receiver;
					
					if (sentMsg == id) {
						str += "<div class='sentBubble bubble'>"
					} else {
						str += "<div class='receivedBubble bubble'>"
					}
					str += "<table class='msg'>";
					str += "<tr><td class='msgTitle'> 제목 : " + item.msgTitle + "</td>";
					str += "<td> 날짜 : " + item.msgDate;
					str += "</td></tr>";
					str += "<tr><td colspan='2' class='msgContent'>";
					str += item.msgContent;
					str += "</td></tr>";
					str += "</table>";
					str += "</div>";
					
					$("#tab2_right").append(str);
				});
			},
			error: function(e) {
				console.log(e);
				alert(e);
			}
		});
	}
</script>
<link rel="stylesheet" href="/goal/resources/css/main.css?version=1">
<link rel="stylesheet" href="/goal/resources/css/message/message.css">
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="page-content">
<header class="page-content-header">
	<div class="container-fluid">
		<div class="tbl">
			<div class="tbl-row">
				<div class="tbl-cell">
					<h3>Message <small class="text-muted">${sessionScope.userid}</small></h3>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="box-typical box-typical-padding">
	<!-- 탭 메뉴 생성 -->
	<div class="tabs">
	<ul class="tab-links">
        <li class="active"><a href="#tab1">받은 쪽지함</a></li>
        <li><a href="#tab2">보낸 쪽지함</a></li>
	</ul>
    <div class="tab-content">
        <div id="tab1" class="tab active">
        <!-- 받은 쪽지함 -->
			<!-- Sender List -->
			<div id="tab1_left">
				<table id="senderList">
					<c:forEach items="${slist}" var="slist">
						<tr>
						<!-- 프로필 사진 -->
						<td class="profileImg">
						<c:if test="${slist.image != null}">
						<img src="/goal/resources/img/profileImg/${slist.image}">
						</c:if>
						<c:if test="${slist.image == null}">
						<img src="/goal/resources/img/avatar-2-48.png">
						</c:if>
						</td>
						<!-- 발신자 이름 -->
						<td class="senderName"><a href="#" onclick="receivedMsgList('${slist.userid}')">${slist.userid}</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- Received Messages -->
			<div id="tab1_right">
				<!-- 받은 쪽지 채팅 형식으로 출력 -->
			</div>
        </div>
        <!-- 받은 쪽지함 끝 -->
		<!-- 보낸 쪽지함 -->
		<div id="tab2" class="tab">
			<div id="tab2_left">
	        	<table id="receiverList">
	        		<c:forEach items='${rlist}' var='rlist'>
	        			<tr>
        				<!-- 프로필 사진 -->
						<td class="profileImg">
						<c:if test="${rlist.image != null}">
						<img src="/goal/resources/img/profileImg/${rlist.image}">
						</c:if>
						<c:if test="${rlist.image == null}">
						<img src="/goal/resources/img/avatar-2-48.png">
						</c:if>
						</td>
						<!-- 수신자 이름 -->
						<td class="receiverName"><a href="#" onclick="sentMsgList('${rlist.userid}')">${rlist.userid}</a></td>
						</tr>
					</c:forEach>
	        	</table>
        	</div>
        	<div id="tab2_right">
        		<!-- 보낸 쪽지 채팅 형식으로 출력 -->
        		<table class="sentMsgList"></table>
        	</div>
        </div>
        <!-- 보낸 쪽지함 끝 -->
    </div>
    <!-- tab-content 끝 -->
	</div>
	<!-- tabs 끝 -->
	</div>
	<!-- msgList 끝 -->
</div>
</body>
</html>