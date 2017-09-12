<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Search Friend</title>

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
<body>

	<%@ include file="../menu.jsp" %>

<script>

	function addFriend(listUserid) {
		var result = confirm("친구등록 하시겠습니까?");
		
		if(result) {
			$.ajax({
				url: "/goal/friend/addFriend",
				type: "post",
				data: {"userid":listUserid},
				success: $("#addFriend").attr("disabled", "disabled")
			});
		}
	}
	
</script>

<div class="page-content">
	<header class="page-content-header">
		<div class="container-fluid">
			<div class="tbl-row">
				<br>
					<h3>My Friends <small class="text-muted">${userid}</small></h3>
			</div>
				<!-- 검색 텍스트박스 -->
				<div class="col-lg-6">
					<div class="row">
					<form action="searchFriend" method="post">
						<div class="col-md-10">
						<br>
							<div class="typeahead-container">
								<span class="typeahead-query">
									<input class="form-control" id="searchKeyid" name="searchKeyid" value="${searchKeyid}" type="text" placeholder="ID Search">
								</span>
								<span class="typeahead-button">
									<!-- <a href="#" onclick="search()"><i class="font-icon-search"></i></a> -->
									<button type="submit" class="font-icon-search"></button>
								</span>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</header><!--.page-content-header-->

		<!-- 검색 목록 -->
		<div class="container-fluid">
			<div class="row card-user-grid">
			<c:forEach items="${searchList}" var="list">
				<div class="col-sm-6 col-md-4 col-xl-3">
					<article class="card-user box-typical">
						<div class="card-user-photo">
							<img src="/goal/resources/img/photo-184-1.jpg" alt="">
						</div>
						<div class="card-user-name">${list.userid}</div>
						<input type="button" class="btn btn-rounded btn-success" id="addFriend" value="Add" onclick="addFriend('${list.userid}')">
					</article><!--.card-user-->
				</div>
			</c:forEach>
			</div><!--.card-user-grid-->
		</div><!--.container-fluid-->
	</div><!--.page-content-->

	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>

<script src="/goal/resources/js/app.js"></script>

</body>
</html>