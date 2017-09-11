$(document).ready(function(){

/* ==========================================================================
    Fullcalendar
    ========================================================================== */
    
    /*$(function getRecordList(){
	  $.ajax({
   	    type: "POST",
   	    contentType: "application/json; charset=utf-8",
   	    url: "/goal/calendar/getCalendarInfo",
   	    dataType: "json",
   	    success: function (data) {
   	        $.each(data, function (i, li) {
   	        	 var source = 
   	                    {
   	                        title:li.bgoalTitle,start:li.startDate,end:li.endDate
   	                    }
   	             eventlist.push(source);
   	            }); // end for
   	        }
   	    });// end ajax
  });*/
    
 
    $('#calendar').fullCalendar({
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
        events:
        	function(start, end, timezone, callback) {
            	$.ajax({
                	url: '/goal/calendar/getCalendarInfo',
                	type: "POST",
                	dataType: "json",
                	success: function(result) {
                		console.log(result);
                    	var events = [];
                    	$(result).each(function() {
                        	events.push({
                            	title: $(this).attr('bgoalTitle'),
                            	start: $(this).attr('startDate'), // will be parsed
                            	end : $(this).attr('endDate'),
                            	color : "blue"
                        	});
                    	});
                    	callback(events);
                	}
            	});
        	},
        defaultDate: '2016-01-12',
        editable: true,
        selectable: true,
        eventLimit: true, // allow "more" link when too many events
        viewRender: function(view, element) {
            if (!("ontouchstart" in document.documentElement)) {
                $('.fc-scroller').jScrollPane({
                    autoReinitialise: true,
                    autoReinitialiseDelay: 100
                });
            }

            $('.fc-popover.click').remove();
        },
        eventClick: function(calEvent, jsEvent, view) {
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
	  	      
	  	      var today = year+""+month+""+day
	  	      
	  	      //calEvaent.start._i 는  DayPlan 이벤트의 해당 날짜 입니다.
	  	      var dateSplit = calEvent.start._i.split("-");
	  	      date_year = dateSplit[0]; 
	  	      date_month = dateSplit[1]; 
	  	      date_day = dateSplit[2]; 
	  	      var dateSplited = date_year + "" + date_month + "" + date_day
	  	  
            if(parseInt(today) == parseInt(dateSplited) && view.name == "agendaWeek"){
	            // Add popover
	            $('body').append(
	                '<div class="fc-popover click">' +
	                    '<div class="fc-header">' +
	                        moment(calEvent.start).format('dddd • D') +
	                        '<button type="button" class="cl"><i class="font-icon-close-2"></i></button>' +
	                    '</div>' +
	
	                    '<div class="fc-body main-screen">' +
	                        '<p>' +
	                            moment(calEvent.start).format('dddd, D YYYY, hh:mma') +
	                        '</p>' +
	                        '<p class="color-blue-grey">Name Surname Patient<br/>Surgey ACL left knee</p>' +
	                        '<ul class="actions">' +
	                            '<li><a href="#" class="fc-event-action-edit">Edit event</a></li>' +
	                            '<li><a href="#" class="fc-event-action-remove">Remove</a></li>' +
	                        '</ul>' +
	                    '</div>' +
	
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
            }else{
            	  // Add popover
	            $('body').append(
	                '<div class="fc-popover click">' +
	                    '<div class="fc-header">' +
	                        moment(calEvent.start).format('dddd • D') +
	                        '<button type="button" class="cl"><i class="font-icon-close-2"></i></button>' +
	                    '</div>' +
	
	                    '<div class="fc-body main-screen">' +
	                        '<p>' +
	                            moment(calEvent.start).format('YYYY-MM-DD, hh:mma') +
	                        '</p>' +
	                        '<p class="color-blue-grey">Name Surname Patient<br/>Surgey ACL left knee</p>' +
	                    '</div>' +
	
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
        
        dayClick: function(date, jsEvent, view) {
        	      /*alert('Clicked on: ' + date.format());
        	      alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
        	      alert('Current view: ' + view.name);*/
        	
        	   /*   alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
        	      alert('Current view: ' + view.name);
        	      alert('Clicked on: ' + date.format());
        	      */
        	
        		if(view.name == "agendaWeek"){
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
	        	      
	        	      var dateSplit = date.format().split("-");
	        	      date_year = dateSplit[0]; 
	        	      date_month = dateSplit[1]; 
	        	      date_day = dateSplit[2]; 
	        	      var dateSplited = date_year + "" + date_month + "" + date_day
	        	      
	        	      var date_time = date.format().split("T");
	        	      var clickedTime = date_time[1].split(":");
	        	      
	        	      var hour = clickedTime[0];
	        	      var minute = clickedTime[1];
	        	      
	        	      if(parseInt(today) == parseInt(dateSplited)){
	        	    	  isToday = 1;
	        	    	  alert(date_time[0]);
	        	    	  alert(hour);
	              	      alert(minute);
	        	    	  
	        	      }//end if
        	      
        		}//end if        	      
       },
       
       eventDrop: function(event, delta, revertFunc) {

           alert(event.title + " was dropped on " + event.start.format());

           if (!confirm("Are you sure about this change?")) {
               revertFunc();
           }
           
       }

    });
    

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


