<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	
<title>SIGN UP</title>

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

<style>
	/* 배경 이미지 */
	#background {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-image: url('/goal/resources/img/pattern2.png');
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-size: 100%;
		/* opacity: 0.5;
		filter:alpha(opacity=30); */
	}
</style>

</head>
<body>

    <div class="page-center" id="background">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box" action="join" method="post" enctype="multipart/form-data">
                    <header class="sign-title">Sign Up</header>
                    <div class="form-group">
                        <input type="text" class="form-control" id="userid" name="userid" placeholder="ID" required="required"/>
                        <button type="button" class="btn btn-rounded btn-inline btn-success btn-sm" id="checkId" name="checkId">중복확인</button>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="password" placeholder="Password" required="required"/>
                        <input type="password" class="form-control" id="pwdCheck" placeholder="Repeat password"/>
                        <font name="check" size="2"></font>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="email" name="email" placeholder="E-Mail" required="required"/>
                    </div>
                    <div class="form-group">
						<select class="select2-arrow manual select2-no-search-arrow" id="tel1" name="tel1">
							<option value="010" selected="selected">010</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="041">041</option>
							<option value="043">043</option>
						</select>
                        <input type="text" class="form-control" id="tel2" name="tel2" placeholder="Tel2"/>
                        <input type="text" class="form-control" id="tel3" name="tel3" placeholder="Tel3"/>
                    </div>
                    <div>
                    	<input type="file" multiple accept='image/*' id="imgUpload" name="uploadFile"> 
                    	<img onclick="document.getElementById('imgUpload').click()" id="showImg" style="width:100px ; height:120px;">
                    	<!-- <input type="image" id="showImg" onclick="document.getElementById('imgUpload').click()" > -->
                    </div>
                    <button type="submit" class="btn btn-rounded btn-success sign-up" id="signup">Sign up</button>
                    <p class="sign-note">Already have an account? <a href="/goal/member/loginForm">Sign in</a></p>
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
            
            
         // 중복확인
            $("#checkId").click(function() {
    			$.ajax({
    				url:"/goal/member/idCheck",
    				type: "post",
    				data: {"userid":$("#userid").val()},
    				success: function(result) {
    					if(result == false) {
    						alert("사용 가능한 ID입니다.");
    					} else {
    						alert("이미 사용중인 ID입니다.");
    					}
    				}
    			});
    		}); // 중복확인 ajax
    		
    		// 이미지 업로드
    		$("#imgUpload").change(function() {
    			readURL(this);
    		});
    		
        });
    
    
    // 이미지 업로드, 미리보기
    function readURL(input) {
    	if(input.files && input.files[0]) {
    		var reader = new FileReader();
    		
    		reader.onload = function(e) {
    			$("#showImg").attr('src', e.target.result);
    		}
    		reader.readAsDataURL(input.files[0]);
    	}
    }
	
	// 비밀번호 확인
	$(function() {
		
		$('#pwd').keyup(function() {
			$('font[name=check]').text('');
		}); // #pwd.keyup
		
		$('#pwdCheck').keyup(function() {
			if($('#pwd').val() != $('#pwdCheck').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호가 일치하지 않습니다.");
				$('font[name=check]').css('color','red');
			} else{
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호가 일치합니다.");
				$('font[name=check]').css('color','green');
			}
		});
	});
	
	// 유효성 검사
	$('#signup').click(function() {
		var userid = $("#userid").val();
		var pwd = $("#pwd").val();
		var email = $("#email").val();
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		
		if(userid == "") {
			alert("ID를 입력해 주세요.");
			userid.focus();
			return false;
		} else if(pwd == "") {
			alert("password를 입력해 주세요.");
			pwd.focus();
			return false;
		} else if(email == "") {
			alert("email를 입력해 주세요.");
			email.focus();
			return false;
		} else if(tel1 == "") {
			alert("tel1를 입력해 주세요.");
			tel1.focus();
			return false;
		} else if(tel2 == "") {
			alert("tel2를 입력해 주세요.");
			tel2.focus();
			return false;
		} else if(tel3 == "") {
			alert("tel3를 입력해 주세요.");
			tel3.focus();
			return false;
		}
		
		
		/* $.ajax({
			url: "/goal/member/emailCheck",
			type: "post",
			data: {"email":$("#email").val()},
			success: function(result) {
				if(result == false) {
					alert("사용 가능한 email입니다.");
				} else {
					alert("이미 사용중인 email입니다.");
				}
			}
		}); */
	});
	
    </script>
<script src="/goal/resources/js/app.js"></script>

</body>
</html>