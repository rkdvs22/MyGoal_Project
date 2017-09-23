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
</head>
<body>

    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box" action="join" method="post" enctype="multipart/form-data">
                    <header class="sign-title">Sign Up</header>
                    <div class="form-group">
                        <input type="text" class="form-control" id="userid" name="userid" placeholder="ID"/>
                        <button type="button" class="btn btn-rounded btn-inline btn-success btn-sm" id="checkId" name="checkId">중복확인</button>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="password" placeholder="Password" onchange="check()"/>
                        <input type="password" class="form-control" id="pwdCheck" placeholder="Repeat password"  onchange="check()"/>
                        <font name="check" size="2"></font>
                        <!-- <p id="same"></p> -->
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="email" placeholder="E-Mail"/>
                    </div>
                    <div class="form-group">
						<select class="select2-arrow manual select2-no-search-arrow" id="tel1" name="tel1">
							<option id="0" value="010" selected="selected">010</option>
							<option id="1" value="02">02</option>
							<option id="2" value="031">031</option>
							<option id="3" value="032">032</option>
							<option id="4" value="041">041</option>
							<option id="5" value="043">043</option>
						</select>
                        <input type="text" class="form-control" id="tel2" name="tel2" placeholder="Tel2"/>
                        <input type="text" class="form-control" id="tel3" name="tel3" placeholder="Tel3"/>
                    </div>
                    <div>
                    	<input type="file" multiple accept='image/*' id="imgUpload" name="uploadFile"> 
                    	<img onclick="document.getElementById('imgUpload').click()" id="showImg" style="width:100px ; height:120px;">
                    	<!-- <input type="image" id="showImg" onclick="document.getElementById('imgUpload').click()" > -->
                    </div>
                    <button type="submit" class="btn btn-rounded btn-success sign-up">Sign up</button>
                    <p class="sign-note">Already have an account? <a href="/goal/member/loginForm">Sign in</a></p>
                    <!--<button type="button" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>-->
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
	
	
    </script>
<script src="/goal/resources/js/app.js"></script>

</body>
</html>