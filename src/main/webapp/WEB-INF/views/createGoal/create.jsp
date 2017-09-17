<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Create Goal</title>

	<link href="/goal/resources/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="/goal/resources/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="/goal/resources/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="/goal/resources/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="/goal/resources/img/favicon.png" rel="icon" type="image/png">
	<link href="/goal/resources/img/favicon.ico" rel="shortcut icon">
	
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/bootstrap-daterangepicker.min.css">
	<link rel="stylesheet" href="/goal/resources/css/lib/clockpicker/bootstrap-clockpicker.min.css">
	<link rel="stylesheet" href="/goal/resources/css/separate/vendor/bootstrap-select/bootstrap-select.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="/goal/resources/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/goal/resources/css/main.css">

<style>
	table.create01 {
		margin: auto !important;
	}
	
	table.create01 th {
		width: 250px !important;
		padding: 20px;
		font-size: 110%;
	}
		
</style>

</head>
<body>

<%@ include file="../menu.jsp" %>

<div class="page-content">
	<div class="container-fluid">
		<header class="section-header">
			<div class="tbl">
				<div class="tbl-row">
					<div class="tbl-cell">
						<h3>Create Goal</h3>
					</div>
				</div>
			</div>
		</header>
		
		<div class="box-typical box-typical-padding">
			<form action="create" method="post">
			<table class="create01">
				<tr>
					<th>Goal Title</th>
					<td colspan="3">
						<input type="text" class="form-control" name="tGoalTitle" placeholder="Goal Title" required="required">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td  colspan="3">
						<input type="text" class="form-control" name="userid" placeholder="${sessionScope.userid}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>인원</th>
					<td colspan="3">
						<select name="maxMember">
							<option value = "1" selected="selected">1</option>
							<option value = "2">2</option>
							<option value = "3">3</option>
							<option value = "4">4</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>시작일 ~ 종료일</th>
					<td>
						<div class='input-group date'>
							<input type="text" class="form-control" id="daterange3" name="tStartDate">
							<span class="input-group-addon">
								<i class="font-icon font-icon-calend"></i>
							</span>
						</div>
					</td>
					<td> ~ </td>
					<td>
						<div class='input-group date'>
							<input type="text" class="form-control" id="daterange4" name="tEndDate">
							<span class="input-group-addon">
								<i class="font-icon font-icon-calend"></i>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>공개여부</th>
					<td class="btn-group" data-toggle="buttons" colspan="3">
						<label class="btn btn-success btn-sm active">
							<input type="radio" name="openStatus" id="open" value="Y" checked> 공개
						</label>
						<label class="btn btn-success btn-sm">
							<input type="radio" name="openStatus" id="close" value="N"> 비공개
						</label>
					</td>
				</tr>
				<tr>
					<td class="createBtn" colspan="4">
						<button type="submit" class="btn btn-rounded btn-success">CREATE</button>
					</td>
				</tr>	
			</table>
			</form>
				<input type="hidden" name="tGoalNum" value="${tGoalNum}">
		       	<input type="hidden" name="progressNum" value="${progressNum}">
		       		<%-- <input type="hidden" name="calendarNum" value="${calendarNum}"> --%>
		</div>
		
	</div><!--.container-fluid-->
</div><!--.page-content-->

	<script src="/goal/resources/js/lib/jquery/jquery.min.js"></script>
	<script src="/goal/resources/js/lib/tether/tether.min.js"></script>
	<script src="/goal/resources/js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="/goal/resources/js/plugins.js"></script>

	<script type="text/javascript" src="/goal/resources/js/lib/moment/moment-with-locales.min.js"></script>
	<script type="text/javascript" src="/goal/resources/js/lib/eonasdan-bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="/goal/resources/js/lib/clockpicker/bootstrap-clockpicker.min.js"></script>
	<script src="/goal/resources/js/lib/clockpicker/bootstrap-clockpicker-init.js"></script>
	<script src="/goal/resources/js/lib/daterangepicker/daterangepicker.js"></script>
	<script src="/goal/resources/js/lib/bootstrap-select/bootstrap-select.min.js"></script>
	<script>
		$(function() {
			function cb(start, end) {
				$('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
			}
			cb(moment().subtract(29, 'days'), moment());

			$('#daterange').daterangepicker({
				"timePicker": true,
				ranges: {
					'Today': [moment(), moment()],
					'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
					'Last 7 Days': [moment().subtract(6, 'days'), moment()],
					'Last 30 Days': [moment().subtract(29, 'days'), moment()],
					'This Month': [moment().startOf('month'), moment().endOf('month')],
					'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
				},
				"linkedCalendars": false,
				"autoUpdateInput": false,
				"alwaysShowCalendars": true,
				"showWeekNumbers": true,
				"showDropdowns": true,
				"showISOWeekNumbers": true
			});

			$('#daterange2').daterangepicker();

			$('#daterange3').daterangepicker({
				singleDatePicker: true,
				showDropdowns: true
			});

			$('#daterange4').daterangepicker({
				singleDatePicker: true,
				showDropdowns: true
			});
			
			$('#daterange').on('show.daterangepicker', function(ev, picker) {
				/* $('.daterangepicker select').selectpicker({
					size: 10
				}); */
			});

			/* ==========================================================================
			 Datepicker
			 ========================================================================== */

			/* $('.datetimepicker-1').datetimepicker({
				widgetPositioning: {
					horizontal: 'right'
				},
				debug: false
			});

			$('.datetimepicker-2').datetimepicker({
				widgetPositioning: {
					horizontal: 'right'
				},
				format: 'LT',
				debug: false
			}); */
		});
		
		
	</script>

<script src="/goal/resources/js/app.js"></script>

</body>
</html>