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
	<link rel="stylesheet" href="/goal/resources/css/main.css?version=3">
  
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" media="all">   -->
	
	
	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/jqueryui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/lobipanel/lobipanel.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/match-height/jquery.matchHeight.min.js"></script>
	<script src="/goal/resources/js/app.js"></script>
<!-- 	<script src="https://www.gstatic.com/charts/loader.js"></script> -->

<style>
	/* 메인 이미지 슬라이드 크기지정 */
	.box{
    width:100%;
    height:300px;
    background-color:rgb(41, 128, 185);
}
</style>

</head>
<body class="with-side-menu-compact dark-theme dark-theme-green">

	<%@ include file="menu.jsp" %>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
    

    function drawVisualization(BTMGoalList) {
        // Some raw data (not necessarily accurate)
        
        $('#chart_div').show();
        
        var bGoalTitle = [];
        var achieve = [];
        
    	$(BTMGoalList).each(function(index,item) {
			
    		var title  = item.bGoalTitle;
    		var achi = item.achieve;
    		bGoalTitle.push(
            	 title
        	)
    		
    		achieve.push(
            	 achi
        	);
	  		
   		 });
    	
        
        var data = google.visualization.arrayToDataTable([
        
      ]);
        
        data.addColumn('string', '세부목표명');
        data.addColumn('number', '달성률');
        data.addColumn('number', '달성률변화');
        
          for(i = 0; i < bGoalTitle.length; i++){
        	 data.addRow([bGoalTitle[i], achieve[i], achieve[i]]);
         } 

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
      
      $(function(){
    	  $('#chart_div').hide();
    	  $('#topGoalSelected').on("change",function(){
    		  
    			var tGoalNum = $( "#topGoalSelected option:selected" ).val();
    			
    			$.ajax({
					url:"/goal/member/getMGoalList",
					type:"POST",
					data:{"tGoalNum":tGoalNum},
					dataType:"json",
					success:function(MidGoalList){
						$('#midGoalSelected').html('');
						$('#midGoalSelected').append(
								'<option value = 0 selected="selected">-중간목표를 선택-</option>'
			              	);
						$(MidGoalList).each(function(index,item) {
							
			    	  		$('#midGoalSelected').append(
			              		'<option value ='+item.mGoalNum+'>'+item.mGoalTitle+'</option>'
			              	);
			       		 });
					},
					error: function(){
					}
				});
    	  });
    	  
    	  $('#midGoalSelected').on("change",function(){
    		  
    		  var mGoalNum = $( "#midGoalSelected option:selected" ).val();
    		  
    		  $.ajax({
					url:"/goal/member/getBTMGoalList",
					type:"POST",
					data:{"mGoalNum":mGoalNum},
					dataType:"json",
					success:function(BTMGoalList){
						if(BTMGoalList.length != 0){
							drawVisualization(BTMGoalList);
						}else{
							$('#chart_div').hide();
						}
					},
					error: function(){
					}
				});
    	  });
    	  
      });
      
      
 /* 메인페이지 이미지 slider */
	 $('.carousel').carousel({
		interval: 3000
	});
      
    </script>


<div class="page-content">
    <div class="container-fluid">
    	<!-- 메인 이미지 슬라이드 -->
		<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="true">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		        <li data-target="#carousel" data-slide-to="0" class="active"></li>
		        <li data-target="#carousel" data-slide-to="1"></li>
		        <!-- <li data-target="#carousel" data-slide-to="2"></li> -->
		    </ol>
		   <!-- Carousel items -->
		    <div class="carousel-inner">
		        <div class="item active">
		        	<img class="box" src="/goal/resources/img/city.jpg">
		          <div class="carousel-caption">
		            <h2>みんなのゴール</h2>
		            <p>Description</p>
		          </div>
		        </div>
		        <div class="item">
		        	<img class="/goal/resources/img/tree.jpg">
	       		  <div class="box">
		            <h2>Title</h2>
		            <p>Description</p>
		          </div>
		        </div>
		       <!--  <div class="item"><img class="img-responsive" src="https://images.unsplash.com/photo-1445462657202-a0893228a1e1?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
		          <div class="carousel-caption">
		            <h2>Title</h2>
		            <p>Description</p>
		          </div>
		        </div>  -->
		    </div>
		   <!-- Carousel nav -->
		    <a class="left carousel-control" href="#carousel" data-slide="prev">
		    	<span class="glyphicon glyphicon-chevron-left"></span>
		    </a>
		    <a class="right carousel-control" href="#carousel" data-slide="next">
		    	<span class="glyphicon glyphicon-chevron-right"></span>
		    </a>
		</div>
		    
		    
		    <!-- 차트 -->
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
	                            <c:if test = "${sessionScope.userid != null}">
	                            <tr>    
	                                <td>
		                                <select name = "topGoalSelected" id = "topGoalSelected" style="width: 150px;">
		                                	<option value = 0 selected="selected">-전체목표를 선택-</option>
		                                	<c:if test = "${sessionScope.topGoalList != null}">
												<c:forEach items="${sessionScope.topGoalList}" var="topGoal">
													<option value = "${topGoal.tGoalNum}">${topGoal.tGoalTitle}</option>
												</c:forEach>		                                	
		                                	</c:if>
		                                </select>
	                                </td>
	                            </tr>
	                            
	                            <!-- 여기서부터 받아온걸 체인지 이벤트가 발생할 때 처리 -->
	                            <tr>
	                                <td class="price color-yellow">중간목표</td>
	                            </tr>
	                            <tr>    
	                                <td>
		                                <select  id = "midGoalSelected" name = "midGoalSelected" style="width: 150px;">
		                                	<option value = 0 selected="selected">-중간목표를 선택-</option>
		                                </select>
	                                </td>
	                            </tr>
	                            </c:if>
	                        </table>
	                    </div>
	                    	<c:if test = "${sessionScope.userid != null}">
	                    		<div id="chart_div" class="chart-container"  style="width: 450px; height: 316px; display:none;"></div>	
	                    	</c:if>
	                </div><!--.chart-statistic-box-->
	            </div><!--.col-->
	            
	            <c:if test = "${sessionScope.userid == null}">
	            	<div class="col-xl-6">
	                <div class="row">
	                
	                	<div class="col-sm-6">
	                        <article class="statistic-box yellow">
	                            <div>
	                                <div class="number">0</div>
	                                <div class="caption"><div>로그인해 주세요</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    
	                     <div>
	                        <article class="statistic-box red">
		                            <div>
		                                <div class="number"></div>
		                                <div class="caption"><pre>                  </pre></div>
		                                <div class="percent">
		                                </div>
		                            </div>
	                        </article>
	                    </div><!--.col-->
	                
	                    <div class="col-sm-6">
	                        <article class="statistic-box red">
		                            <div>
		                                <div class="number">0</div>
		                                <div class="caption"><div>로그인해 주세요</div></div>
		                                <div class="percent">
		                                </div>
		                            </div>
	                        </article>
	                    </div><!--.col-->
	                    
	                     <div class="col-sm-6">
	                        <article class="statistic-box blue">
	                            <div>
	                                <div class="number">0</div>
	                                <div class="caption"><div>로그인해 주세요</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    
	                </div><!--.row-->
	            </div><!--.col-->
	            </c:if>
	            
	            <c:if test = "${sessionScope.userid != null}">
	            <div class="col-xl-6">
	                <div class="row">
	                	 <div class="col-sm-6">
	                        <article class="statistic-box yellow">
	                            <div>
	                                <div class="number">${sessionScope.totalNum}</div>
	                                <div class="caption"><div>Total</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    
	                      <div>
	                        <article class="statistic-box red">
		                            <div>
		                                <div class="number"></div>
		                                <div class="caption"><pre>                  </pre></div>
		                                <div class="percent">
		                                </div>
		                            </div>
	                        
	                        </article>
	                    </div><!--.col-->
	                
	                    <div class="col-sm-6">
	                        <article class="statistic-box red">
		                            <div>
		                                <div class="number">${sessionScope.failNum-1}</div>
		                                <div class="caption"><div>Fail</div></div>
		                                <div class="percent">
		                                </div>
		                            </div>
	                        
	                        </article>
	                    </div><!--.col-->
	                    
	                     <div class="col-sm-6">
	                        <article class="statistic-box blue">
	                            <div>
	                                <div class="number">${sessionScope.clearNum}</div>
	                                <div class="caption"><div>Success</div></div>
	                                <div class="percent">
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                   
	                </div><!--.row-->
	            </div><!--.col-->
	            </c:if>
	            
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
							<c:if test="${sessionScope.userid == null}">
	                    	<p style="text-align:center; line-height:242px;">로그인 후에 이용하실 수 있습니다.</p>
	                    	</c:if>
	                    	<c:if test="${sessionScope.userid != null}">
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
							</c:if>
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
	                    	<c:if test="${sessionScope.userid == null}">
	                    	<p style="text-align:center; line-height:242px;">로그인 후에 이용하실 수 있습니다.</p>
	                    	</c:if>
	                    	<c:if test="${sessionScope.userid != null}">
                       		<table id="table-edit" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>ID</th>
									<th>제목</th>
									<th width="100">시작일</th>
									<th width="100">종료일</th>
									<th width="55">인원</th>
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
							</c:if>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	            </div><!--.col-->
	        </div>
	    </div><!--.container-fluid-->
	</div><!--.page-content-->
</body>
</html>