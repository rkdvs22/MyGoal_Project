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
	function msgList(id) {
		$.ajax({
			url: "/message/msgList",
			type: "post",
			data: {"id": id},
			success: function() {alert("성공");},
			erre: function() {alert("실패");}
		});
	}
</script>
<style>
	.msgList {
		margin: 0 auto;
		border: solid black 1px;
		width: 600px;
		height: 400px;
		top: 500px;
	}
/* 
	.top {
		height: 150px;
		float: top;
	}
	
	.left {
		width: 20%;
		float: left;
	}
	.msgList {
		width: 60%;
		height: 500px;
		margin: 0 auto;
	}
	
	.right {
		width: 20%;
		float: right;
	}
	
	.friendList {
		width: 20%;
		height: 100%;
		float: left;
	}
	
	.msgList {
		width: 60%;
		height: 100%;
		float: right;
	}
 */	
</style>
</head>
<body>
<%@ include file="../menu.jsp"%>
<br><br><br><br><br><br><br><br><br>
<div class="msgList">
	<div class="friendList">
		<table>
			<c:forEach items="${list}" var="list">
			<tr>
				<td><a href="#" onclick="msgList()">${list.sender}</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>