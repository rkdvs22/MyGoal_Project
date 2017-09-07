<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>main12</title>
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
	<link rel="stylesheet" href="/goal/resources/css/main.css">
	
	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>
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

<!-- <script>
try {
	$('.panel').lobiPanel({
		sortable: true
	}).on('dragged.lobiPanel', function(ev, lobiPanel){
		$('.dahsboard-column').matchHeight();
	});
} catch (err) {}

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
	var dataTable = new google.visualization.DataTable();
	dataTable.addColumn('string', 'Day');
	dataTable.addColumn('number', 'Values');
	// A column for custom tooltip content
	dataTable.addColumn({type: 'string', role: 'tooltip', 'p': {'html': true}});
	dataTable.addRows([
		['MON',  130, ' '],
		['TUE',  130, '130'],
		['WED',  180, '180'],
		['THU',  175, '175'],
		['FRI',  200, '200'],
		['SAT',  170, '170'],
		['SUN',  250, '250'],
		['MON',  220, '220'],
		['TUE',  220, ' ']
	]);

	var options = {
		height: 314,
		legend: 'none',
		areaOpacity: 0.18,
		axisTitlesPosition: 'out',
		hAxis: {
			title: '',
			textStyle: {
				color: '#fff',
				fontName: 'Proxima Nova',
				fontSize: 11,
				bold: true,
				italic: false
			},
			textPosition: 'out'
		},
		vAxis: {
			minValue: 0,
			textPosition: 'out',
			textStyle: {
				color: '#fff',
				fontName: 'Proxima Nova',
				fontSize: 11,
				bold: true,
				italic: false
			},
			baselineColor: '#16b4fc',
			ticks: [0,25,50,75,100,125,150,175,200,225,250,275,300,325,350],
			gridlines: {
				color: '#1ba0fc',
				count: 15
			}
		},
		lineWidth: 2,
		colors: ['#fff'],
		curveType: 'function',
		pointSize: 5,
		pointShapeType: 'circle',
		pointFillColor: '#f00',
		backgroundColor: {
			fill: '#008ffb',
			strokeWidth: 0,
		},
		chartArea:{
			left:0,
			top:0,
			width:'100%',
			height:'100%'
		},
		fontSize: 11,
		fontName: 'Proxima Nova',
		tooltip: {
			trigger: 'selection',
			isHtml: true
		}
	};

	var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
	chart.draw(dataTable, options);
}
$(window).resize(function(){
	drawChart();
	setTimeout(function(){
	}, 1000);
});
</script>  -->


	<!-- <div class="page-content">
	 <div class="container-fluid">
			<div class="row">
				<div class="col-xl-6">
					<div class="chart-statistic-box">
						<div class="chart-txt">
							<div class="chart-txt-top">
								<p><span class="unit">$</span><span class="number">1540</span></p>
								<p class="caption">Week income</p>
							</div>
							<table class="tbl-data">
								<tr>
									<td class="price color-purple">120$</td>
									<td>Orders</td>
								</tr>
								<tr>
									<td class="price color-yellow">15$</td>
									<td>Investments</td>
								</tr>
								<tr>
									<td class="price color-lime">55$</td>
									<td>Others</td>
								</tr>
							</table>
						</div>
						<div class="chart-container">
							<div class="chart-container-in">
								<div id="chart_div"></div>
								<header class="chart-container-title">Income</header>
								<div class="chart-container-x">
									<div class="item"></div>
									<div class="item">tue</div>
									<div class="item">wed</div>
									<div class="item">thu</div>
									<div class="item">fri</div>
									<div class="item">sat</div>
									<div class="item">sun</div>
									<div class="item">mon</div>
									<div class="item"></div>
								</div>
								<div class="chart-container-y">
									<div class="item">300</div>
									<div class="item"></div>
									<div class="item">250</div>
									<div class="item"></div>
									<div class="item">200</div>
									<div class="item"></div>
									<div class="item">150</div>
									<div class="item"></div>
									<div class="item">100</div>
									<div class="item"></div>
									<div class="item">50</div>
									<div class="item"></div>
								</div>
							</div>
						</div>
					</div>.chart-statistic-box
				</div>.col
				<div class="col-xl-6">
					<div class="row">
						<div class="col-sm-6">
							<article class="statistic-box red">
								<div>
									<div class="number">26</div>
									<div class="caption"><div>Open tickets</div></div>
									<div class="percent">
										<div class="arrow up"></div>
										<p>15%</p>
									</div>
								</div>
							</article>
						</div>.col
						<div class="col-sm-6">
							<article class="statistic-box purple">
								<div>
									<div class="number">12</div>
									<div class="caption"><div>Closes tickets</div></div>
									<div class="percent">
										<div class="arrow down"></div>
										<p>11%</p>
									</div>
								</div>
							</article>
						</div>.col
						<div class="col-sm-6">
							<article class="statistic-box yellow">
								<div>
									<div class="number">104</div>
									<div class="caption"><div>New clients</div></div>
									<div class="percent">
										<div class="arrow down"></div>
										<p>5%</p>
									</div>
								</div>
							</article>
						</div>.col
						<div class="col-sm-6">
							<article class="statistic-box green">
								<div>
									<div class="number">29</div>
									<div class="caption"><div>Here is an example of a long name</div></div>
									<div class="percent">
										<div class="arrow up"></div>
										<p>84%</p>
									</div>
								</div>
							</article>
						</div>.col
					</div>.row
				</div>.col
			</div>.row
		</div>
	</div>.container-fluid -->

</body>
</html>