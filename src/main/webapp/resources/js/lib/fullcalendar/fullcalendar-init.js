$(document).ready(function(){

/* ==========================================================================
    Fullcalendar
    ========================================================================== */
	var btmRecordlist = "";	
	var dayRecordlist = "";
	var nomallist = "";
	
	$('#calendar').fullCalendar('today');
	$('.fc-event').css('font-size', '.6em');
    $('#calendar').fullCalendar({
    	aspectRatio: .1,
    	height: 1000,
        header: {
            left: '',
            center: 'prev, title, next',
            right: 'agendaWeek,month'
        },
        buttonIcons: {
            prev: 'font-icon font-icon-arrow-left',
            next: 'font-icon font-icon-arrow-right',
            prevYear: 'font-icon font-icon-arrow-left',
            nextYear: 'font-icon font-icon-arrow-right'
        },
        lang:"ko",
        editable: true,
        selectable: true,
        eventLimit: true, // allow "more" link when too many events
        events:
        	function(start, end, timezone, callback) {
            	$.ajax({
                	url: '/goal/calendar/getCalendarInfo',
                	type: "POST",
                	dataType: "json",
                	success: function(result) {
                		
                		btmRecordlist = result.BTMRecordlist;
                		dayRecordlist = result.DayRecordlist;
                		nomallist = result.nomallist;
                    	var totalEvents = [];
                    	if(result.BTMRecordlist != null){
                    		
	                    	$(result.BTMRecordlist).each(function(item,index) {
	                    		totalEvents.push({
	                            	title: $(this).attr('bgoalTitle'),
	                            	start: $(this).attr('startDate'), // will be parsed
	                            	end : $(this).attr('endDate'),
	                            	color :  $(this).attr('color'),
	                            	mGoalTitle: $(this).attr('mGoalTitle'),
	                            	BTMRecordNum: $(this).attr('bRecordNum')
	                        	});
	                    	});
                    	}//end if
                    	
                    	if(result.DayRecordlist != null){
	                    	//세부목표가 있는 DayPlan리스트
	                    	$(result.DayRecordlist).each(function(item,index) {
	                    		totalEvents.push({
	                            	title: $(this).attr('dContents'),
	                            	start: $(this).attr('schedulePlanStart'), // will be parsed
	                            	end : $(this).attr('schedulePlanEnd'),
	                            	color : "#F3B600",
	                            	dayPlanNum : $(this).attr('dayPlanNum'),
	                            	btmRecordNum : $(this).attr('btmRecordNum'),
	                            	achieve : $(this).attr('achieve')
	                        	});
	                    	});
                    	}
                    	
                    	if(result.nomallist != null){
	                    	// 세부목표가 없는 DayPlan리스트
	                    	$(result.nomallist).each(function(item,index) {
	                    		totalEvents.push({
	                            	title: $(this).attr('dContents'),
	                            	start: $(this).attr('schedulePlanStart'), // will be parsed
	                            	end : $(this).attr('schedulePlanEnd'),
	                            	color : "#F3B600",
	                            	//dayPlanNum은 무조건 1이됨.
	                            	dayPlanNum : $(this).attr('dayPlanNum'),
	                        	});
	                    	});
                    	}
                    	callback(totalEvents);
                	}
            	});
        	},
        	
        viewRender: function(view, element) {
            if (!("ontouchstart" in document.documentElement)) {
                $('.fc-scroller').jScrollPane({
                    autoReinitialise: true,
                    autoReinitialiseDelay: 100
                });
            }

            $('.fc-popover.click').remove();
        },
        eventClick: function(calEvent,jsEvent,view) {
        	
        	if(calEvent.mGoalTitle != null){
		            var eventEl = $(this);
		            // Add and remove event border class
		            if (!$(this).hasClass('event-clicked')) {
		                $('.fc-event').removeClass('event-clicked');
		                $(this).addClass('event-clicked');
		            }
		            	
			          var time = new Date() 
			  	      
			  	      var year = time.getYear()+1900 
			  	      var month = time.getMonth() +1 
			  	      if((month+"").length <2){
			  	    	  month = "0"+month;
			  	      }
			  	      var day = time.getDate() 
			  	      if((day+"").length <2){
			  	    	  day = "0"+day;
			  	      }
			  	    /*  console.log(jsEvent); 
			  	      console.log(view);*/
			  	      var today = year+""+month+""+day
			  	      
			  	      //calEvaent.start._i 는  DayPlan 이벤트의 해당 날짜 입니다.
			  	      var dateSplit = calEvent.start._i.split("-");
			  	      date_year = dateSplit[0]; 
			  	      date_month = dateSplit[1]; 
			  	      date_day = dateSplit[2]; 
			  	      var dateSplited = date_year + "" + date_month + "" + date_day
		            	  // Add popover
			            $('body').append(
			                '<div class="fc-popover click">' +
			                    '<div class="fc-header">' +
			                      '<p id = "fc-header-title">'+calEvent.title +'</p>' +
			                        '<button type="button" class="cl"><i class="font-icon-close-2"></i></button>' +
			                    '</div>' +
			
			                    '<div class="fc-body main-screen">' +
					                '<p>' +
				                        "중간목표명 : " + calEvent.mGoalTitle + "" +
				                    '</p>' + 
			                        '<p>' +
			                           "진행기간 : " + moment(calEvent.start).format('YYYY-MM-DD') + " ~ " + moment(calEvent.end).format('YYYY-MM-DD') +
			                        '</p>' + '<br>' +'<p id = "dayChartTitle">' +  "<일별 달성률 차트>" + "</p>" +
					                  '<div id="chart_div" style="width: 375px; height: 350px;">'+'</div>'+	
			                    '<div class="fc-body remove-confirm">' +
			                        '<p>Are you sure to remove event?</p>' +
			                        '<div class="text-center">' +
			                            '<button type="button" class="btn btn-rounded btn-sm">Yes</button>' +
			                            '<button type="button" class="btn btn-rounded btn-sm btn-default remove-popover">No</button>' +
			                        '</div>' +
			                    '</div>' +
			
			                    '<div class="fc-body edit-event">' +
			                        '<p>Edit event</p>' +
			                        '<div class="form-group">' +
			                            '<div class="input-group date datetimepicker">' +
			                                '<input type="text" class="form-control" />' +
			                                '<span class="input-group-addon"><i class="font-icon font-icon-calend"></i></span>' +
			                            '</div>' +
			                        '</div>' +
			                        '<div class="form-group">' +
			                            '<div class="input-group date datetimepicker-2">' +
			                                '<input type="text" class="form-control" />' +
			                                '<span class="input-group-addon"><i class="font-icon font-icon-clock"></i></span>' +
			                            '</div>' +
			                        '</div>' +
			                        '<div class="form-group">' +
			                            '<textarea class="form-control" rows="2">Name Surname Patient Surgey ACL left knee</textarea>' +
			                        '</div>' +
			                        '<div class="text-center">' +
			                            '<button type="button" class="btn btn-rounded btn-sm">Save</button>' +
			                            '<button type="button" class="btn btn-rounded btn-sm btn-default remove-popover">Cancel</button>' +
			                        '</div>' +
			                    '</div>' +
			                '</div>'
			            );
			  	    $.ajax({
			  	    	url: '/goal/calendar/getChartRecord?BTMRecordNum='+calEvent.BTMRecordNum,
		                type: "get",
		                dataType: "json",
		                success: function(result) {
			                	google.charts.load('current', {'packages':['corechart']});
			    	            google.charts.setOnLoadCallback(drawVisualization);
			    	            
			    	            var DayRecord = [];
			    	            var achieve = [];
		                    	$(result).each(function(index, item) {
		                    		
		                    		DayRecord.push(
		                    			 $(this).attr('startDate')
		                        	);
		                    		
		                    		achieve.push(
		                   			 	 $(this).attr('achieve')
		                   		    );
		                    	});
		                    	
			    	            function drawVisualization() {
			    	              // Some raw data (not necessarily accurate)
			    	            var data = new google.visualization.DataTable();
			    	            data.addColumn('string', '일별');
			    	            data.addColumn('number', '달성률');
			    	             
			    	             for(i = 0; i < DayRecord.length; i++){
			    	            	 data.addRow([DayRecord[i], achieve[i]]);
			    	             }
			    	              
			    	              
			    	          var options = {
			    	            vAxis: {title: '달성률',viewWindow:{
			    	                max:100,
			    	                min:0
			    	              }},
			    	            hAxis: {title: '일별'},
			    	            seriesType: 'bars',
			    	            series: {5: {type: 'line'}},
			    	            colors : ['#960018'],
			    	            axes: {
			    	                y: {
			    	                    all: {
			    	                        range: {
			    	                            max: 100,
			    	                            min: 0
			    	                        }
			    	                    }
			    	                }
			    	            }
			    	          };
			
			    	          var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			    	          chart.draw(data, options);
			    	        }	
		                	
		               	},
			  	    	error: function(){
			  	    	  alert("실패");
			  	    	}
			  	      });
			  	    
        	}else{
        		 $("#warning").modal("show");
        	}
        	
        	
            // Datepicker init
            $('.fc-popover.click .datetimepicker').datetimepicker({
                widgetPositioning: {
                    horizontal: 'right'
                }
            });

            $('.fc-popover.click .datetimepicker-2').datetimepicker({
                widgetPositioning: {
                    horizontal: 'right'
                },
                format: 'LT',
                debug: true
            });


            // Position popover
            function posPopover(){
                $('.fc-popover.click').css({
                    left: eventEl.offset().left + eventEl.outerWidth()/2,
                    top: eventEl.offset().top + eventEl.outerHeight()
                });
            }

            posPopover();

            $('.fc-scroller, .calendar-page-content, body').scroll(function(){
                posPopover();
            });

            $(window).resize(function(){
               posPopover();
            });


            // Remove old popover
            if ($('.fc-popover.click').length > 1) {
                for (var i = 0; i < ($('.fc-popover.click').length - 1); i++) {
                    $('.fc-popover.click').eq(i).remove();
                }
            }

            // Close buttons
            $('.fc-popover.click .cl, .fc-popover.click .remove-popover').click(function(){
                $('.fc-popover.click').remove();
                $('.fc-event').removeClass('event-clicked');
            });

            // Actions link
            $('.fc-event-action-edit').click(function(e){
                e.preventDefault();

                $('.fc-popover.click .main-screen').hide();
                $('.fc-popover.click .edit-event').show();
            });

            $('.fc-event-action-remove').click(function(e){
                e.preventDefault();

                $('.fc-popover.click .main-screen').hide();
                $('.fc-popover.click .remove-confirm').show();
            });
        },
        
        dayClick: function(date, jsEvent, view, calEvent) {
        	      /*alert('Clicked on: ' + date.format());
        	      alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
        	      alert('Current view: ' + view.name);*/
        	
        	   /*   alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
        	      alert('Current view: ' + view.name);
        	      alert('Clicked on: ' + date.format());
        	   */
        	
          $('#dayPercent').html('');	
         $('#dayAchieve').removeAttr('disabled');	
         $('#inputPercent').removeAttr('readonly');
        var notNomal = 0;
        var notHaveBTM = 0;
        //월에 대한 페이지인가?	
       if(view.name == "month"){
    	   
    	    var dayAchieve = 0; 
        	var time = new Date() 
        	
        	var year = time.getYear()+1900 
        	var month = time.getMonth() +1 
        	if((month+"").length <2){
        		month = "0"+month;
        	}
        	var day = time.getDate() 
        	if((day+"").length <2){
        		day = "0"+day;
        	}
        	
        	var today = year+""+month+""+day
        	getToday = year+"/"+month+"/"+day;
        	
        	var dateSplit = date.format().split("-");
        	date_year = dateSplit[0]; 
        	date_month = dateSplit[1]; 
        	date_day = dateSplit[2]; 
        	var dateSplited = date_year + "" + date_month + "" + date_day
        	var formatDate =  date_year + "/" + date_month + "/" + date_day	
        	// 세부 목표가 잇는 DayPlan을 가공한 후에 각각 배열에 담는 구간 
        
        	dayClick = parseInt(dateSplited);
        	
        	var PlanTitle = [];
        	var PlanStartTime = [];
        	var PlanEndTime = [];
        	var PlanNum = [];
        	var sumAchieve = 0;
        	
        	var NomalTitle = [];
        	var NomalStartTime = [];
        	var NomalEndTime = [];
        	var NomalNum = [];
        	
        	//현재 클릭한 것이 세부목표가 있는지 없는지를 검사한다.
        	if(btmRecordlist != null){
        		$(btmRecordlist).each(function(index,item) {
        			var splitedStartDate = "";
	        		var splitedEndDate = "";
	        		
	        		//startDate 가공
	            	var dateSplitPlan3 = item.startDate.split("-");
	            	date_styear = dateSplitPlan3[0]; 
	            	date_stmonth = dateSplitPlan3[1]; 
	            	date_stday = dateSplitPlan3[2];
	            	
	            	//endDate 가공
	            	var dateSplitPlan4 = item.endDate.split("-");
	            	date_edyear = dateSplitPlan4[0]; 
	            	date_edmonth = dateSplitPlan4[1]; 
	            	date_edday = dateSplitPlan4[2];
	            	
	            	splitedStartDate = date_styear+""+date_stmonth+""+date_stday; // item의 BTMRecord의 시작날짜
	            	splitedEndDate = date_edyear+""+date_edmonth+""+date_edday;
	        		
	            	if(parseInt(dateSplited) <= parseInt(splitedStartDate) || parseInt(dateSplited) > parseInt(splitedEndDate)){
	            		notHaveBTM += 1;
	            	}
	        	});//end each
        	}
        	
        	//리스트를 띄우기 전에 테이블 body를 모두 비운다. 
        	$('#DayRecordTable').html('');
        	
        	if(dayRecordlist != null){
	        	$(dayRecordlist).each(function(index,item) {
	        		var splited = ""; // 클릭한 곳의 날짜를 스플릿해서 가공
	        		var splitedStartTime = ""; //받아온 dayPlanVO의 start타임을 스플릿해서 가공
	        		var splitedEndTime = ""; // dayPlanVO의 end타임을 스플릿해서 가공
	        		var splitedStartDate = "";
	        		var splitedEndDate = "";
	        		
	        		//startTime 가공
	        		var dateSplitPlan1 = item.startTime.split("-");
	            	date_syear = dateSplitPlan1[0]; 
	            	date_smonth = dateSplitPlan1[1]; 
	            	date_sday = dateSplitPlan1[2];
	            	date_shour = dateSplitPlan1[3];
	            	date_sminute = dateSplitPlan1[4];
	            	
	            	//endTime 가공
	            	var dateSplitPlan2 = item.endTime.split("-");
	            	date_eyear = dateSplitPlan2[0]; 
	            	date_emonth = dateSplitPlan2[1]; 
	            	date_eday = dateSplitPlan2[2];
	            	date_ehour = dateSplitPlan2[3];
	            	date_eminute = dateSplitPlan2[4];
	            	
	            	//startDate 가공
	            	var dateSplitPlan3 = item.btmstartDate.split("-");
	            	date_styear = dateSplitPlan3[0]; 
	            	date_stmonth = dateSplitPlan3[1]; 
	            	date_stday = dateSplitPlan3[2];
	            	
	            	//endDate 가공
	            	var dateSplitPlan4 = item.btmendDate.split("-");
	            	date_edyear = dateSplitPlan4[0]; 
	            	date_edmonth = dateSplitPlan4[1]; 
	            	date_edday = dateSplitPlan4[2];
	            	
	            	splited = date_syear + "" + date_smonth + "" + date_sday; // item의 DayPlan의 날짜
	            	splitedStartTime = date_shour +":"+ date_sminute;  //item의 DayPlan의 시작시간
	            	splitedEndTime = date_ehour+":"+date_eminute; //item의 DayPlan의 종료시간
	            	splitedStartDate = date_styear+""+date_stmonth+""+date_stday; // item의 BTMRecord의 시작날짜
	            	splitedEndDate = date_edyear+""+date_edmonth+""+date_edday;
	            		
	            	
	            	//해당 기간에 속한다면
	            	if(parseInt(dateSplited) >= parseInt(splitedStartDate) && parseInt(dateSplited) <= parseInt(splitedEndDate) && item.btmRecordNum != 0){
            			sumAchieve = item.achieve;
            			btmRecordNum = item.btmRecordNum;
            			
            			// 클릭한 날짜에 직접적으로 속한다면 
            			if(splited == dateSplited){
            				dayRecordNum = item.dayRecordNum;
            				PlanTitle.push(item.dContents);
    	            		PlanStartTime.push(splitedStartTime);
    	            		PlanEndTime.push(splitedEndTime);
    	            		PlanNum.push(item.dayPlanNum);
            			}
	            	}	
	        	});//end each
	        	
	        	
	        	
	        	if(PlanTitle.length == 0 && (parseInt(dateSplited) == parseInt(today))){
	        		$.ajax({
						url: '/goal/calendar/getAchieve',
		            	type: "POST",
		            	data:{"startDate":formatDate,"getToday":getToday},
		            	dataType: "json",
		            	success: function(result) {
		            		$('#inputPercent').attr('placeholder','100이내의 숫자');
		            		$('#currentPercent').html('');
		            		$('#currentPercent').append('달성률:'+" "+ result+"%");
		            	}
					});		 
	        		
	        	}else if(PlanTitle.length == 0 && (parseInt(dateSplited) != parseInt(today)) && notHaveBTM+1 == btmRecordlist.length){
	        		notNomal = 1;
	        		$.ajax({
						url: '/goal/calendar/getAchieve',
		            	type: "POST",
		            	data:{"startDate":formatDate,"getToday":getToday},
		            	dataType: "json",
		            	success: function(result) {
		            		$('#inputPercent').attr('placeholder','100이내의 숫자');
		            		$('#currentPercent').html('');
		            		$('#currentPercent').append('달성률:'+" "+ result+"%");
		            	}
					});		 
	        		
	        		$('#inputPercent').attr('placeholder','입력은 가능 - 달성 불가');
	        		$('#currentPercent').html('');
	        	    $('#currentPercent').append('달성률:'+" "+ sumAchieve+"%");
	        	    
	        	}
        
	        	
	        	// 표기만 1부터 시작할 뿐 index 값은 사실 0부터 시작하니 데이터 보낼 때 0을 기준으로 시작해서 보내야 함.
 	        	$(PlanTitle).each(function(index,item) {
 	        		
 	        		//클릭한것이 오늘이라면 readOnly를 하지 않는다.
 	        		if(parseInt(dateSplited) == parseInt(today)){
 	        			$('#inputPercent').attr('placeholder','100이내의 숫자');
 	        			$('#currentPercent').html('');
 	        	        $('#currentPercent').append('달성률:'+" "+ sumAchieve+"%");
 	        	        $('#DayRecordTable').append(
	 	   		            	'<tr id="d'+index+'">'+
	 	   				            '<td id="n'+index+'">'+(index+1)+'</td>'+
	 	   				            '<td id="f'+index+'">'+PlanTitle[index]+'</td>'+
	 	   				            '<td id="l'+index+'">'+PlanStartTime[index]+'</td>'+
	 	   				            '<td id="m'+index+'">'+PlanEndTime[index]+'</td>'+
	 	   				            '<td><button type="button" data-toggle="modal" onclick = "openEditModal('+parseInt(dateSplited)+','+btmRecordNum+','+PlanNum[index]+','+index+1+','+'\'f'+index+'\''+','+'\'l'+index+'\''+','+'\'m'+index+'\')" data-uid="'+index+1+'" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
	 	   				            '<td><button type="button" data-toggle="modal" onclick= "openDeleteModal('+btmRecordNum+','+PlanNum[index]+','+'\'d'+index+'\')" data-uid="'+index+1+'" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>'+
	 	   				        '</tr>'
	 	   		        );
 	        	        
 	        		}else{
 	        			$('#inputPercent').attr('placeholder','입력은 가능 - 달성 불가');
	 	        		$('#currentPercent').html('');
	 	        	    $('#currentPercent').append('달성률:'+" "+ sumAchieve+"%");	
	 	       	        $('#DayRecordTable').append(
	 	   		            	'<tr id="d'+index+'">'+
	 	   				            '<td id="n'+index+'">'+(index+1)+'</td>'+
	 	   				            '<td id="f'+index+'">'+PlanTitle[index]+'</td>'+
	 	   				            '<td id="l'+index+'">'+PlanStartTime[index]+'</td>'+
	 	   				            '<td id="m'+index+'">'+PlanEndTime[index]+'</td>'+
	 	   				            '<td><button type="button" data-toggle="modal" onclick = "openEditModal('+parseInt(dateSplited)+','+btmRecordNum+','+PlanNum[index]+','+index+1+','+'\'f'+index+'\''+','+'\'l'+index+'\''+','+'\'m'+index+'\')" data-uid="'+index+1+'" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
	 	   				            '<td><button type="button" data-toggle="modal" onclick= "openDeleteModal('+btmRecordNum+','+PlanNum[index]+','+'\'d'+index+'\')" data-uid="'+index+1+'" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>'+
	 	   				        '</tr>'
	 	   		        );
 	        		}
 	        	});//end each
        	}//end if (세부목표가 있는 DayPlan 모달 생성 구간 종료)
        	
        
        	// 세부 목표가 없는 DayPlan을 가공한 후에 각각 배열에 담는 구간 
        	
        	if(btmRecordNum == 0){
	        	if(nomallist != null){
		        	$(nomallist).each(function(index,item) {
		        		var splited = ""; // dayPlanVO의 날짜
		        		var splitedStartTime = ""; //받아온 dayPlanVO의 start타임을 스플릿해서 가공
		        		var splitedEndTime = ""; // dayPlanVO의 end타임을 스플릿해서 가공
		        		
		        		//startTime 가공
		        		var dateSplitPlan1 = item.startTime.split("-");
		            	date_syear = dateSplitPlan1[0]; 
		            	date_smonth = dateSplitPlan1[1]; 
		            	date_sday = dateSplitPlan1[2];
		            	date_shour = dateSplitPlan1[3];
		            	date_sminute = dateSplitPlan1[4];
		            	
		            	//endTime 가공
		            	var dateSplitPlan2 = item.endTime.split("-");
		            	date_eyear = dateSplitPlan2[0]; 
		            	date_emonth = dateSplitPlan2[1]; 
		            	date_eday = dateSplitPlan2[2];
		            	date_ehour = dateSplitPlan2[3];
		            	date_eminute = dateSplitPlan2[4];
		            	
		            	splited = date_syear + "" + date_smonth + "" + date_sday
		            	splitedStartTime = date_shour +":"+ date_sminute; 
		            	splitedEndTime = date_ehour+":"+date_eminute;
		            	
		            	if(item.btmRecordNum == 0){
			            	if(splited == dateSplited){
			            		//현재 클릭한 날짜와 받아온 planVO의 날짜가 일치한다면  plan명, 시작시간, 종료시간을 각각 배열에 담는다.
	            				dayRecordNum = item.dayRecordNum;
			            		NomalTitle.push(item.dContents);
			            		NomalStartTime.push(splitedStartTime);
			            		NomalEndTime.push(splitedEndTime);
			            		NomalNum.push(item.dayPlanNum);
			            	}//end outer if
		            	}
		        	});//end each
		        		
		        	
		        		//여기서 부터 이제 새부 목표가 있는지 없는지 확인해야 함(NomalTitle.length =0 이라면) 없다면 key를 사용해서 아래에서 새롭게 만들어줘야됨.
		        	if(NomalTitle.length != 0){
		        		$(NomalTitle).each(function(index,item) {
		        			
			        		$('#inputPercent').attr('placeholder','진행중인 세부목표가 없습니다.');
		 	        		$('#currentPercent').html('');
		 	   	 	        $('#currentPercent').append("세부목표 없음");
		 	   	        	$('#dayAchieve').attr('disabled','disabled');	
		 	        		$('#inputPercent').attr('readonly','readonly');
		 	       	        $('#DayRecordTable').append(
		 	   		            	'<tr id="d'+index+'">'+
		 	   				            '<td id="n'+index+'">'+(index+1)+'</td>'+
		 	   				            '<td id="f'+index+'">'+NomalTitle[index]+'</td>'+
		 	   				            '<td id="l'+index+'">'+NomalStartTime[index]+'</td>'+
		 	   				            '<td id="m'+index+'">'+NomalEndTime[index]+'</td>'+
		 	   				            '<td><button type="button" data-toggle="modal" onclick = "openEditModal('+parseInt(dateSplited)+','+1+','+NomalNum[index]+','+index+1+','+'\'f'+index+'\''+','+'\'l'+index+'\''+','+'\'m'+index+'\')" data-uid="'+index+1+'" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
		 	   				            '<td><button type="button" data-toggle="modal" onclick="openDeleteModal('+btmRecordNum+','+NomalNum[index]+','+'\'d'+index+'\')" data-uid="'+index+1+'" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>'+
		 	   				        '</tr>'
		 	   		        );
		 	        			
		 	        	});
		        	}else if(NomalTitle.length == 0 && notNomal==0){
		        		$('#inputPercent').attr('placeholder','진행중인 세부목표가 없습니다.');
	 	        		$('#currentPercent').html('');
	 	   	 	        $('#currentPercent').append("세부목표 없음");
	 	   	        	$('#dayAchieve').attr('disabled','disabled');	
	 	        		$('#inputPercent').attr('readonly','readonly');
		        	}
	        	}//end if
        	}
        	
        
        	//어팬드 해야됨 배열3개를 가지고(타이틀,스타트,엔드)
           
	        //오늘에 해당하는 것만 달성률을 입력할 수 있어요(여기에 달성률 입력시 100을 넘는지도 검사해야 함 안넘으면 쿼리로 넘기고 딱 100일시 목표달성 성공 모달 출력)	      
        	if(parseInt(today) == parseInt(dateSplited)){
        		alert('오늘이예요');
        	}//end if     
        	
        	$.ajax({
   				url: '/goal/calendar/getDayAchieve',
              	type: "POST",
              	data:{"startDate":formatDate},
              	dataType: "json",
              	success: function(achieve) {
              		 $('#dayPercent').append('<br>this Day:'+" "+achieve+"%");
              	}
   			});	
        	
        	
        	//마지막으로 모달띄워줘요!
        	 $("#warning").modal("show");
       }//end if
       
       },
       
       eventDrop: function(event, delta, revertFunc) {

           alert(event.title + " was dropped on " + event.start.format());

           if (!confirm("Are you sure about this change?")) {
               revertFunc();
           }
           
       }

    });// end full calendar
    
    if(calendar) {
    	  $(window).resize(function() {
    	    var calHeight = $(window).height()*0.83;
    	    $('#calendar').fullCalendar('option', 'height', calHeight);
    	  });
    	};


/* ==========================================================================
    Side datepicker
    ========================================================================== */

    $('#side-datetimepicker').datetimepicker({
        inline: true,
        format: 'DD/MM/YYYY'
    });

/* ========================================================================== */

});


/* ==========================================================================
    Calendar page grid
    ========================================================================== */

(function($, viewport){
    $(document).ready(function() {

        if(viewport.is('>=lg')) {
            $('.calendar-page-content, .calendar-page-side').matchHeight();
        }

        // Execute code each time window size changes
        $(window).resize(
            viewport.changed(function() {
                if(viewport.is('<lg')) {
                    $('.calendar-page-content, .calendar-page-side').matchHeight({ remove: true });
                }
            })
        );
    });
})(jQuery, ResponsiveBootstrapToolkit);


