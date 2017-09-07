<!-- 이유정 : 테스트용 파일 9/6 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 제목</title>
</head>
<body>
<table border="1">
	<tr>
		<th>보낸 사람</th>
		<td>${vo.sender}</td>
	</tr>
	<tr>
		<th>받는 사람</th>
		<td>${vo.receiver}</td>
	</tr>
	<tr>
		<th>수신일시</th>
		<td>${vo.msgDate}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${vo.msgTitle}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${vo.msgContent}</td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="답장하기"></td>
	</tr>
</table>
</body>
</html>