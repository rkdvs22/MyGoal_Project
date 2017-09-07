<!-- 이유정 : 테스트용 파일 9/6 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 읽기</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<br><br><br><br><br><br>
<div class="message" align="center">
<table border="1" width="500px">
	<tr>
		<th>제목</th>
		<th>보낸이</th>
		<th>날짜</th>
	</tr>
	<c:forEach items="${list}" var="list">
	<tr>
		<td><a href="/goal/message/readMsg?msgNum=${list.msgNum}">${list.msgTitle}</a></td>
		<td>${list.sender}</td>
		<td>${list.msgDate}</td>
	</tr>
	</c:forEach>
</table>
</div>
</body>
</html>


<%-- 
<!DOCTYPE html>
<html>
<head>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>

<script>
	// Get the modal
	var modal = document.getElementById('myModal');
	
	// Get the button that opens the modal
	var title = document.getElementById("title");
	
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	title.onclick = function() {
		var msgNum = ${list.msgNum};
	    $.ajax({
	    	url: "goal/message/readMsg?msgNum=" + msgNum,
	    	type: "post",
	    	data: {"msgNum":msgNum},
	    	success: function() {modal.style.display = "block";},
	    	error: function() {alert("에러 발생");}
	    });
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>

</head>
<body>

<h2>메시지 읽기</h2>

<!-- The Modal -->
<div id="myModal" class="modal">
<table class="message" border="1">
	<tr>
		<th>제목</th>
		<th>보낸이</th>
		<th>날짜</th>
	</tr>
	<c:forEach items="${list}" var="list">
	<tr>
		<td><span id="title">${list.msgTitle}</span></td>
		<td>${list.sender}</td>
		<td>${list.msgDate}</td>
	</tr>
	</c:forEach>
</table>

<!-- Modal content -->
<div class="modal-content">
	<span class="close">&times;</span>
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
	</table>
</div>

</div>
</body>
</html>
 --%>