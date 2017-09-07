<!-- 유정 : 테스트용 파일 9/6 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<script>
	function send() {
		var receiver = document.getElementById("receiver");
		var msgTitle = document.getElementById("msgTitle");
		
		if (receiver.value == "") {
			alert("수신인은 1명 이상이어야 합니다.");
			return false;
		}
		
		if (msgTitle.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if ("${result} == true") {
			alert("쪽지를 성공적으로 보냈습니다.");
		} else if ("${result} == false") {
			alert("쪽지 보내기에 실패하였습니다.");
			return false;
		}
	}
</script>
</head>
<body>
<!-- 쪽지 쓰기 -->
<h1>[ 쪽지 보내기 ]</h1>
<div class="msgSendDiv">
<form id="msgFm" action="/goal/message/writeMsg" method="post">
<table class="msgSendTable" border="1">
	<tr>
		<td>수신인</td>
		<td><input type="text" id="receiver" name="receiver" style="width:500px"></td>
		<!-- <td><input type="button" id="receiver" value="회원검색"></td> -->
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" id="msgTitle" name="msgTitle" style="width:500px"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea id="msgContent" name="msgContent" style="width:500px; height:400px"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="전송" onclick="send()"></td>
	</tr>
</table>
<%-- <input type="hidden" name="sender" value="${sessionScope.userid}"> --%>
</form>
</div>
</body>
</html>