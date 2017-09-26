<!-- 이유정 : 9/7 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
<script src="/goal/resources/js/plugins.js"></script>
<script>
	jQuery(document).ready(function() {
	    jQuery('.tabs .tab-links a').on('click', function(e)  {
	        var currentAttrValue = jQuery(this).attr('href');
	        jQuery('.tabs ' + currentAttrValue).show().siblings().hide();
	        jQuery(this).parent('li').addClass('active').siblings().removeClass('active');
	        e.preventDefault();
	    });
	    
	    $("#tab1_right_bottom").hide();
	    
	    if ("${requestScope.applyResult}") alert("친구 신청이 완료되었습니다.");
	});
	
	function scrollBottom() {
		var scroll = document.getElementById("tab1_right_top");
		scroll.scrollTop = scroll.scrollHeight;
	}
	
	//받은 메시지 출력
	function memberMsgList(id) {
		var senders = new Array();
		
		$.ajax({
			url: "/goal/message/msgList",
			type: "post",
			data: {"id": id},
			dataType: "json",
			success: function(msgList) {
				$("#tab1_right_bottom").show();
				$("#tab1_right_top").empty();
				$(msgList).each(function(index, item) {
					var receivedMsg = item.sender;
					var str = "";
					
					if (receivedMsg == id) {
						str += "<div class='receivedBubble bubble'>"
					} else {
						str += "<div class='sentBubble bubble'>"
					}
					str += "<table class='msg'>";
					str += "<tr><td class='msgTitle'> 제목 : " + item.msgTitle + "</td>";
					str += "<td> 날짜 : " + item.msgDate;
					str += "</td></tr>";
					str += "<tr><td colspan='2' class='msgContent'>";
					if(item.msgContent == "초대하신 목표에 참가하시겠습니까?" && receivedMsg != '${sessionScope.userid}') {
						senders[index] = item.sender;
						item.msgContent += '<br><input type="button" value="승인" id="join-btn' + index + '" class="join-btn" onclick="joinGoal('+ index +')">';
						item.msgContent += ' <input type="button" value="거절" id="notJoin-btn'+ index +'" class="notJoin-btn" onclick="notJoinGoal('+ index +')">';
					}
					if (item.msgTitle == "[SYSTEM] 친구 신청이 도착하였습니다." && receivedMsg != '${sessionScope.userid}') {
						item.msgContent += '<br><input type="button" class="btnFriend" value="승인" onclick=addFriend("' + receivedMsg + '")>&nbsp';
						item.msgContent += '<input type="button" class="btnFriend" value="거절" onclick=rejectFriend("' + receivedMsg + '")>';
					}
					str += item.msgContent;
					str += "</td></tr>";
					str += "</table>";
					str += "</div><br>";
					console.log(str);
					
					$("#tab1_right_top").append(str);
				});
				$("#hiddenrcv").attr("value", id);
				scrollBottom();	//feat.조준석
			},
			error: function(e) {
				console.log(e);
				alert(e);
			}
		});
	}
	
	//즉석 메시지 작성(9/18 작성 feat.우성민)
	function writeMsg() {
		var msgContent = document.getElementById("newMsg");
		var hiddenrcv = document.getElementById("hiddenrcv");
		
		if (msgContent.value == "") {
			alert("내용을 입력해주세요.");
			msgContent.focus();
		} else {
			$.ajax({
				url: "/goal/message/writeMsg",
				type: "post",
				data: {"msgContent":msgContent.value, "receiver":hiddenrcv.value},
				success: function(result) {
					memberMsgList(hiddenrcv.value);
					msgContent.value = '';	//feat.조준석
					msgContent.focus();
				},
				error: function(e) {
					console.log(e);
					alert(e);
				}
			});
		}
	}
	
	//제목 있는 메시지 작성
	function writeMsg2() {
		var receiver = document.getElementById("receiver2");
		var msgTitle = document.getElementById("msgTitle2");
		var msgContent = document.getElementById("msgContent2");
		
		if (receiver.value == "") {
			alert("수신자를 선택해주세요.");
			receiver.focus();
		} else if (msgTitle.value == "") {
			alert("제목을 입력해주세요.");
			msgTitle.focus();
		} else if (msgContent.value == "") {
			alert("내용을 입력해주세요.")
			msgContent.focus();
		} else {
			$.ajax({
				url: "/goal/message/writeMsg",
				type: "post",
				data: {"receiver":receiver.value, "msgTitle":msgTitle.value, "msgContent":msgContent.value},
				success: function(result) {
					if (result == true) {
						alert("쪽지 보내기에 성공했습니다.");
						receiver.value = "";
						msgTitle.value = "";
						msgContent.value = "";
					} else {
						alert("쪽지 보내기에 실패하였습니다");
					}
				},
				error: function() {
					alert("존재하지 않는 사용자입니다.");
				}
			});
		}
	}
	
	//친구 승인 메시지 작성
	function friendMsg(frdid) {
		var userid = "${sessionScope.userid}";
		var msgTitle = "[SYSTEM] " + userid + "님이 친구 신청을 수락하셨습니다.";
		var msgContent = userid + "님과 친구가 되셨습니다.<br>좋은 인연 이어나가세요.";
		
		$.ajax({
			url: "/goal/message/writeMsg",
			type: "post",
			data: {"receiver":frdid, "msgTitle": msgTitle, "msgContent":msgContent},
			success: function(result) {
					memberMsgList(frdid);
			},
			error: function(e) {
				console.log(e);
				alert(e);
			}
		});
	}
	
	//목록에서 아이디 클릭 시 수신자에 추가
	function addReceiver(id) {
		var receiverList = document.getElementById("receiver2");
		var str = ""
		
		if (receiverList.value == "") {
			str += id;
		} else {
			str += "," + id;
		}
		
		receiverList.value += str;
	}
	
	
	// 초대 메시지에 승인을 누를 시 해당하는 목표의 방으로 입장.
	function joinGoal(index) {
		for(var i=0; i<=index; i++) {
			if(senders[i] == senders[index]) {
				$.ajax ({
					url: "/goal/createGoal/findThatGoal",
					type: "post",
					data: {"senderId":senders[i]},
					success: function(vo){
						console.log(vo.userid);
						location.href='/goal/createGoal/joinThatGoal?&id=' + vo.userid;
					}
				});
				break;
			}
		}
	}
	
	function addFriend(senderId) {	//친구 신청 승인
		$.ajax({
			url: "/goal/friend/addFriend",
			type: "post",
			data: {"frdid":senderId},
			success: function() {
				$(".btnFriend").remove();
				friendMsg(senderId);
			},
			error: function(e) {
				console.log(e);
				alert(e);
			}
		});
	}
	
	function rejectFriend(senderId) { //친구 신청 거절
		var userid = "${sessionScope.userid}";
		var msgTitle = "[SYSTEM] " + userid + "님이 친구 신청을 거절하셨습니다.";
		var msgContent = userid + "님이 친구가 되길 원하지 않으십니다.<br>다음 기회를 노려보세요.";
		
		$.ajax({
			url: "/goal/message/writeMsg",
			type: "post",
			data: {"receiver":senderId, "msgTitle":msgTitle, "msgContent":msgContent},
			success: function(result) {
					$(".btnFriend").remove();
					memberMsgList(senderId);
			},
			error: function(e) {
				console.log(e);
				alert(e);
			}
		});
	}
</script>
<link rel="stylesheet" href="/goal/resources/css/main.css?version=1">
<link rel="stylesheet" href="/goal/resources/css/message/message.css?version=1">
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="page-content">
<header class="page-content-header">
	<div class="container-fluid">
		<div class="tbl">
			<div class="tbl-row">
				<div class="tbl-cell">
					<h3>Message <small class="text-muted">${sessionScope.userid}</small></h3>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="box-typical box-typical-padding">
	<!-- 탭 메뉴 생성 -->
	<div class="tabs">
	<ul class="tab-links">
        <li class="active"><a href="#tab1">쪽지 읽기</a></li>
        <li><a href="#tab2">쪽지 쓰기</a></li>
	</ul>
    <div class="tab-content">
        <div id="tab1" class="tab active">
        <!-- 멤버별 정렬 -->
			<!-- Sender & Receiver List -->
			<div id="tab1_left">
				<table id="senderList" class="table-hover">
					<c:forEach items="${slist}" var="slist">
						<tr>
						<!-- 프로필 사진 -->
						<td class="profileImg">
						<c:if test="${slist.image != null}">
						<img src="/goal/resources/img/profileImg/${slist.image}">
						</c:if>
						<c:if test="${slist.image == null}">
						<img src="/goal/resources/img/avatar-2-48.png">
						</c:if>
						</td>
						<!-- 발신자 이름 -->
						<td class="senderName"><a href="#" onclick="memberMsgList('${slist.userid}')">${slist.userid}</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- Received Messages -->
			<div id="tab1_right">
				<div id="tab1_right_top">
					<!-- 받은 쪽지 채팅 형식으로 출력 -->
				</div>
				<div id="tab1_right_bottom">
					<!-- 쪽지 답장 폼 -->
					<textarea id="newMsg" name="msgContent" class="form-control" placeholder="Instant Message"></textarea>
					<input type="hidden" id="hiddenrcv" name="receiver">
					<input class="btn btn-rounded btn-success" type="button" value="전송" onclick="writeMsg()">
				</div>
			</div>
        </div>
        <!-- 쪽지 읽기 끝 -->

        <!-- 쪽지 쓰기 -->
        <div id="tab2" class="tab">
        	<!-- 쪽지 작성 폼 -->
			<div id="tab2_left">
				<table class="writeForm">
					<tr>
						<th>발신자</th>
						<td><input type="text" class="form-control" disabled="disabled" value="${sessionScope.userid}"></td>
					</tr>
					<tr>
						<th>수신자</th>
						<td><input type="text" class="form-control" name="receiver" id="receiver2" placeholder="2명 이상에게 쪽지를 보낼 시 콤마(,)를 사용하여 구분하세요"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" name="msgTitle" id="msgTitle2"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea style="width:100%; height:300px" class="form-control" name="msgContent" id="msgContent2"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input class="btn btn-rounded btn-success" type="button" value="전송" onclick="writeMsg2()"></td>
					</tr>
				</table>
			</div>
			<!-- 쪽지 작성 폼 끝 -->
			<!-- 메시지 주고 받은 사람 목록 -->
			<div id="tab2_right">
				<table id="senderList">
					<tr><th colspan="2">최근에 메시지를 주고 받은 사람</th></tr>
					<c:forEach items="${slist}" var="slist">
						<tr>
						<!-- 프로필 사진 -->
						<td class="profileImg">
						<c:if test="${slist.image != null}">
						<img src="/goal/resources/img/profileImg/${slist.image}">
						</c:if>
						<c:if test="${slist.image == null}">
						<img src="/goal/resources/img/avatar-2-48.png">
						</c:if>
						</td>
						<!-- 발신자 이름 -->
						<td class="senderName"><a href="#" onclick="addReceiver('${slist.userid}')">${slist.userid}</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
        </div>
        <!-- 쪽지 쓰기 끝 -->
    </div>
    <!-- tab-content 끝 -->
	</div>
	<!-- tabs 끝 -->
	</div>
	<!-- msgList 끝 -->
</div>
</body>
</html>