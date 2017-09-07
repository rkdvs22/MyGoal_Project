<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Friends</title>

	<link href="/goal/resources/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">
	
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/user.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/goal/resources/css/main.css">

</head>
<body class="with-side-menu">

	<%@ include file="../menu.jsp" %>
	
<script>
	$(function() {
		$("#deleteFriend").click(function() {
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url: "/goal/member/deleteFriend",
					type: "post",
					data: {"frdid":frdid},
					success: function() {alert("삭제되었습니다.")}
				});
			}
		});
	});


	/* function delete() {
		var result = confirm("정말로 삭제 하시겠습니까?");
		if(result) {
			location.href = "/goal/member/deleteFriend?frdid=${frd.frdid}";
		}
	} */
</script>
	
<form action="friend" method="post">
<div class="page-content">
		<header class="page-content-header">
			<div class="container-fluid">
				<div class="tbl">
					<div class="tbl-row">
						<div class="tbl-cell">
							<h3>My Friends <small class="text-muted">${userid}</small></h3>
						</div>
						<div class="tbl-cell tbl-cell-action">
							<a href="/goal/member/searchFriend" class="btn btn-rounded btn-success">Add friend</a>
						</div>
					</div>
				</div>
			</div>
		</header><!--.page-content-header-->

		<!-- 친구목록 -->
		<div class="container-fluid">
			<div class="row card-user-grid">
				<c:forEach items="${friend}" var="frd">
					<c:if test="${userid == frd.userid}">
						<div class="col-sm-6 col-md-4 col-xl-3">
							<article class="card-user box-typical">
								<div class="card-user-photo">
									<img src="/goal/resources/img/photo-184-1.jpg" alt="">
								</div>
								<div class="card-user-name">${frd.frdid}</div>
								<%-- <div class="card-user-status">${frd.userid}</div> --%>
								<!-- <a href="#" class="btn btn-rounded btn-success">Follow</a> -->
								<a href="#"><big><i class="font-icon font-icon-mail"></i></big></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/goal/member/deleteFriend?frdid=${frd.frdid}"><big><i class="font-icon font-icon-trash" id="deleteFriend" name="deleteFriend" onclick="delete()"></i></big></a>
							</article><!--.card-user-->
						</div>
					</c:if>
				</c:forEach>
			</div><!--.card-user-grid-->
		</div><!--.container-fluid-->
	</div><!--.page-content-->
</form>
	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>

<script src="/goal/resources/js/app.js"></script>

</body>
</html>