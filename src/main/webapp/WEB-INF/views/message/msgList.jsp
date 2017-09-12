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
	        // default Show/Hide Tabs
	        jQuery('.tabs ' + currentAttrValue).show().siblings().hide();
	        //fade
	        //jQuery('.tabs ' + currentAttrValue).fadeIn(400).siblings().hide();
	        // slide1 Show/Hide Tabs
	        //jQuery('.tabs ' + currentAttrValue).siblings().slideUp(400);
	        //jQuery('.tabs ' + currentAttrValue).delay(400).slideDown(400);
	        // slide2 Show/Hide Tabs 
	        //jQuery('.tabs ' + currentAttrValue).slideDown(400).siblings().slideUp(400);
	        // Change/remove current tab to active
	        jQuery(this).parent('li').addClass('active').siblings().removeClass('active');
	        e.preventDefault();
	    });
	});

	function msgList(id) {
		$.ajax({
			url: "/goal/message/msgList",
			type: "post",
			data: {"id": id},
			dataType: "json",
			success: function(msgList) {
				$(".receivedMsgList").empty();
				$(msgList).each(function(index, item) {
					var str = "";
					str += "<tr><td class='msgTitle'>";
					str += item.msgTitle;
					str += "</td></tr>";
					str += "<tr><td class='msgContent'>";
					str += item.msgContent;
					str += "</td></tr>";
					
					$(".receivedMsgList").append(str);
				});
			},
			error: function(e) {
				console.log(e);
				alert(e);
				}
		});
	}
</script>
<link rel="stylesheet" href="/goal/resources/css/message/message.css">
<style>
	.msgList {
		margin: 0 auto;
		/* border: solid black 1px; */
		width: 800px;
		height: 600px;
	}
	
	#tab1_left, #tab2_left {
		width: 20%;
		/* height: 100%; */
		float: left;
	}
	
	#tab1_right, #tab2_right {
		width: 80%;
		/* height: 100%; */
		float: right;
	}
</style>
</head>
<body>
<%@ include file="../menu.jsp"%>
<br><br><br><br><br><br>
<div class="msgList">
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
							<td>
								<a href="#" onclick="msgList('${slist.userid}')">${slist.userid}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- Received Messages -->
			<div id="tab1_right">
				<!-- 받은 쪽지 채팅 형식으로 출력 -->
				<table class="receivedMsgList"></table>
			</div>
        </div>
        <!-- 받은 쪽지함 끝 -->
		<!-- 보낸 쪽지함 -->
		<div id="tab2" class="tab">
			<div id="tab2_left">
	        	<table id="receiverList">
	        		<c:forEach items='${rlist}' var='rlist'>
	        			<tr>
							<td>
								<a href="#" onclick="msgList('${rlist.userid}')">${rlist.userid}</a>
							</td>
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
</div>
</div>
</body>
</html>