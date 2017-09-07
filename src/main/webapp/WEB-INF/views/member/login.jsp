<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>login</title>

	<link href="/goal/resources/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">

	<link rel="stylesheet" href="/goal/resources/css/separate/pages/login.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/goal/resources/css/main.css">

</head>
<body>

    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box" action="login" method="post">
                    <div class="sign-avatar">
                        <img src="/goal/resources/img/avatar-2-256.png" alt="">
                    </div>
                    <header class="sign-title">LOGIN</header>
                    <div class="form-group">
                        <input type="text" class="form-control" name="userid" placeholder="ID"/>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="Password"/>
                    </div>
                   
                    <button type="submit" class="btn btn-rounded btn-success">LOGIN</button>
                    <button class="btn btn-rounded btn-success" onclick="home()">Cancel</button>
                    <p class="sign-note"><a href="/goal/member/findForm">ID/Password 찾기</a></p>
                    <c:if test="${sessionScope.userid == false}">ID나 PASSWORD가 일치하지 않습니다.</c:if>
                </form>
            </div>
        </div>
    </div><!--.page-center-->


<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
<script src="/goal/resources/js/plugins.js"></script>
    <script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js"></script>
    <script>
        $(function() {
            $('.page-center').matchHeight({
                target: $('html')
            });

            $(window).resize(function(){
                setTimeout(function(){
                    $('.page-center').matchHeight({ remove: true });
                    $('.page-center').matchHeight({
                        target: $('html')
                    });
                },100);
            });
        });
        
        function home() {
        	location.href = "/goal"
        }
    </script>
<script src="/goal/resources/js/app.js"></script>

</body>
</html>