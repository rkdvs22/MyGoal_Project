<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>main</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- context path 명에 맞게 /goal/ 부분을 고쳐야 합니다 -->
	<link href="/goal/resources/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" href="/goal/resources/css/lib/lobipanel/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/lobipanel.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/jqueryui/jquery-ui.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/pages/widgets.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/goal/resources/css/main.css?version=1">
	
	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/jqueryui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/lobipanel/lobipanel.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js"></script>
	<script src="/goal/resources/js/app.js"></script>
<!-- 	<script src="https://www.gstatic.com/charts/loader.js"></script> -->

</head>
<body class="with-side-menu-compact dark-theme dark-theme-green">

	<%@ include file="menu.jsp" %>

	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
         ['세부목표명', '달성률', '달성률변화'],
         ['달리기',  15, 15],
         ['점프',  53, 53],
         ['팔굽혀펴기', 81, 81],
         ['스트레칭',  60, 60],
      ]);

    var options = {
      title : '선택한 중간목표: 온몸운동하기',
      vAxis: {title: '달성률(%)',viewWindow:{
	          max:100,
	          min:0
	        }},
      hAxis: {title: '세부목표명'},
      seriesType: 'bars',
      series: {
    	  0: {color: '#FFB900'},	    	  
    	  1: {type: 'line',color: '#e2431e'}
      	},
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
    </script>


<div class="page-content">
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-xl-6">
	                <div class="chart-statistic-box">
	                    <div class="chart-txt">
	                        <div class="chart-txt-top">
	                            <p><span class="number">Achieve Chart</span></p>
	                            <br>
	                            <p class="caption">- 아래 선택 -</p>
	                        </div>
	                        <table class="tbl-data">
	                            <tr>
	                                <td class="price color-purple">목표선택</td>
	                            </tr>
	                            <tr>    
	                                <td>
	                                <select name = "topGoalSelected" style="width: 150px;">
	                                	<option value = 0 selected="selected">-전체목표를 선택-</option>
	                                	<option value = "tGoalNum1">다이어트하기</option>
	                                	<option value = "tGoalNum2">정처기 1달</option>
	                                	<option value = "tGoalNum3">전국 일주하기</option>
	                                	<option value = "tGoalNum4">책 10권읽기</option>
	                                </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="price color-yellow">중간목표</td>
	                            </tr>
	                            <tr>    
	                                <td>
	                                <select name = "btmGoalSelected" style="width: 150px;"s>
	                                	<option value = 0 selected="selected">-중간목표를 선택-</option>
	                                	<option value = "bGoalNum1">온몸운동하기</option>
	                                	<option value = "bGoalNum2">지구력기르기</option>
	                                	<option value = "bGoalNum3">근력향상프로젝트</option>
	                                	<option value = "bGoalNum4">정신력 무장</option>
	                                </select>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div id="chart_div" class="chart-container"  style="width: 450px; height: 316px;">
	                    </div>
	                </div><!--.chart-statistic-box-->
	            </div><!--.col-->
	            <div class="col-xl-6">
	                <div class="row">
	                    <div class="col-sm-6">
	                        <article class="statistic-box red">
	                            <div>
	                                <div class="number">26</div>
	                                <div class="caption"><div>미달성</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    
	                     <div class="col-sm-6">
	                        <article class="statistic-box blue">
	                            <div>
	                                <div class="number">29</div>
	                                <div class="caption"><div>달성</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    
	                      <div class="col-sm-6">
	                            <div>
	                               <div class="statistic-box" id="piechart" style="width: 320px; height: 145px;"></div>
	                            </div>
	                    </div>
	                    
	                    <div class="col-sm-6">
	                        <article class="statistic-box yellow">
	                            <div>
	                                <div class="number">104</div>
	                                <div class="caption"><div>전체 목표</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                   
	                </div><!--.row-->
	            </div><!--.col-->
	        </div><!--.row-->
	
	        <div class="row">
	            <div class="col-xl-6 dahsboard-column">
				 <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <div class="panel-title" style="float:left">최근 받은 메시지</div>
	                        <div class="panel-more" style="float:right">
	                        	<a class="glyphicon glyphicon-plus" href="/goal/message/sendNReceiveList"></a>
	                        </div>
	                    </header>
	                    
	                    <div class="box-typical-body panel-body">

                       		<table id="table-edit" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th width="120">발신인</th>
									<th>제목</th>
									<th>내용</th>
									<th width="120">날짜</th>
								</tr>
								</thead>
								<tbody>
									<c:forEach items="${homeMessage}" var="message">
									<tr>
										<td>${message.sender}</td>
										<td>${message.msgTitle}</td>
										<td>${message.msgContent}</td>
										<td>${message.msgDate}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
	                    </div><!--.box-typical-body-->
	                </section>
				 
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Comments</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <article class="comment-item">
	                            <div class="user-card-row">
	                                <div class="tbl-row">
	                                    <div class="tbl-cell tbl-cell-photo">
	                                        <a href="#">
	                                            <img src="img/photo-64-1.jpg" alt="">
	                                        </a>
	                                    </div>
	                                    <div class="tbl-cell">
	                                        <span class="user-card-row-name"><a href="#">Matt McGill</a></span>
	                                    </div>
	                                    <div class="tbl-cell tbl-cell-date">
	                                        <span class="semibold">Today</span>
	                                        12:45
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="comment-item-txt">
	                                <p>That’s a great idea! I’m sure we could start this project as soon as possible.</p>
	                                <p>Let’s meet tomorow!</p>
	                            </div>
	                            <div class="comment-item-meta">
	                                <a href="#" class="star">
	                                    <i class="font-icon font-icon-star"></i>
	                                </a>
	                                <a href="#">
	                                    <i class="font-icon font-icon-re"></i>
	                                </a>
	                            </div>
	                        </article>
	                        <article class="comment-item">
	                            <div class="user-card-row">
	                                <div class="tbl-row">
	                                    <div class="tbl-cell tbl-cell-photo">
	                                        <a href="#">
	                                            <img src="img/photo-64-2.jpg" alt="">
	                                        </a>
	                                    </div>
	                                    <div class="tbl-cell">
	                                        <span class="user-card-row-name"><a href="#">Tim Collins</a></span>
	                                    </div>
	                                    <div class="tbl-cell tbl-cell-date">
	                                        <span class="semibold">Today</span>
	                                        12:45
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="comment-item-txt">
	                                <p>That’s a great idea! I’m sure we could start this project as soon as possible.</p>
	                                <p>Let’s meet tomorow!</p>
	                            </div>
	                            <div class="comment-item-meta">
	                                <a href="#" class="star active">
	                                    <i class="font-icon font-icon-star"></i>
	                                </a>
	                                <a href="#">
	                                    <i class="font-icon font-icon-re"></i>
	                                </a>
	                            </div>
	                        </article>
	                    </div><!--.box-typical-body-->
	                </section>
	            </div><!--.col-->
	            
	            <div class="col-xl-6 dahsboard-column">
	            <!-- 게시판 -->
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                    	<div class="panel-title" style="float:left">게시판</div>
	                        <div class="panel-more" style="float:right">
	                        	<a class="glyphicon glyphicon-plus" href="/goal/board/boardList"></a>
	                        </div>
	                    </header>
	                    
	                    <div class="box-typical-body panel-body">
                       		<table id="table-edit" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>ID</th>
									<th>제목</th>
									<th width="120">시작일</th>
									<th width="120">종료일</th>
									<th width="70">인원</th>
									<th class="table-icon-cell">
										<i class="font-icon font-icon-heart"></i>
									</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${homeBoard}" var="board">
									<tr>
										<td>${board.userid}</td>
										<td>${board.tGoalTitle}</td>
										<td>${board.startDate}</td>
										<td>${board.endDate}</td>
										<td>${board.currentMemberNumber}/${board.maxMember}</td>
										<td class="table-photo">${board.favorite}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	                
	                
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Contacts</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <div class="contact-row-list">
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-2.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Tim Collins</a></p>
	                                            <p class="user-card-row-mail"><a href="#">timcolins@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Director at Tony’s</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-1.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-3.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Molly Bridjet</a></p>
	                                            <p class="user-card-row-mail"><a href="#">mollybr@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Assistan</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-4.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-2.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Tim Collins</a></p>
	                                            <p class="user-card-row-mail"><a href="#">timcolins@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Director at Tony’s</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-1.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-3.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Molly Bridjet</a></p>
	                                            <p class="user-card-row-mail"><a href="#">mollybr@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Assistan</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-4.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                        </div>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	            </div><!--.col-->
	        </div>
	    </div><!--.container-fluid-->
	</div><!--.page-content-->

	
	 
</body>
</html>