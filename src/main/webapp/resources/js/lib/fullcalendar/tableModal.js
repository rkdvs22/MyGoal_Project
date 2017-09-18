$(document).ready(function(){
	var n = "";
   $(".update").click(function(){
	   n = $(this).data("uid");
       var id = $(this).data("uid");
       var f1 = $("#f1").html();
       var l1 = $("#l1").html();
       var m1 = $("#m1").html();
       var f2 = $("#f2").html();
       var l2 = $("#l2").html();
       var m2 = $("#m2").html();
       if(id==1){
           $("#fn").val(f1);
           $("#mn").val(m1);
           $("#ln").val(l1);
       }else if(id==2){
           $("#fn").val(f2);
           $("#mn").val(m2);
           $("#ln").val(l2);
       }
       alert(id);
       $("#up").click(function(){
           if(id==1){
               var fn = $("#fn").val();
               var mn = $("#mn").val();
               var ln = $("#ln").val();    
               $("#f1").html(fn);
               $("#m1").html(mn);
               $("#l1").html(ln);
           }else if(id==2){
               var fn = $("#fn").val();
               var mn = $("#mn").val();
               var ln = $("#ln").val();    
               $("#f2").html(fn);
               $("#m2").html(mn);
               $("#l2").html(ln);              
           }
           id = "";
       });
   });
   $(".delete").click(function(){
      var id = $(this).data("uid");
      $("#del").click(function(){
          if(id==1){
              $("#d1").html('');
          }else if(id==2){
              $("#d2").html('');
          }
          id = "";
      });
   });
   
   
   
   /*$("#insertTr").click(function(){
	   alert(n);
	   $("#DayRecordTable").append(
		 '<tr>' +
		 '<td id="n'+n+'">'+n+1+'</td>'+
         '<td id="f'+n+'"><input type="text"></td>'+
         '<td id="l'+n+'">'+"00:00AM"+'</td>'+
         '<td id="m'+n+'">'+"10:10PM"+'</td>'+
         '<td><button type="button" data-toggle="modal" onclick = "openEditModal()" data-uid="'+n+'" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
         '<td><button type="button" data-toggle="modal" onclick="openDeleteModal()" data-uid="'+n+'" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button></td>'+
		 '</tr>'	   
	   );
   });*/
});