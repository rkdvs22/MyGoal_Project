<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
     <head> 
        <link rel="stylesheet" href="/goal/resources/css/lib/mindMap/mindMap.css?version=7">
     </head> 
     <body> 
     	
     	<%@ include file="../menu.jsp" %>
        <script language="javascript" type="text/javascript" src="/goal/resources/js/lib/mindMap/arbor.js"></script> 
        <script language="javascript" type="text/javascript" src="/goal/resources/js/lib/mindMap/graphics.js"></script> 
        <script language="javascript" type="text/javascript" src="/goal/resources/js/lib/mindMap/renderer.js"></script> 
       	<canvas id="viewport" width="1100" height="600"></canvas> 
       	
     	<div id = "playingGoal">
			${sessionScope.userid}님은
		</div>	
		
      	<script language="javascript" type="text/javascript">
       //공통적으로 사용할 sys변수를 바깥에 정의한 후 sendBTMSectionList 함수 실행
	   var sys;
       //현재 유저의 상태를 나타내는 문구를 append 하기 위해 선언한 변수
	   var str = "";
       //새로 시작하는 텍스트를 담는 변수
       var title = "";
       //최초 페이지 이동이 되자마자 시작.
       $(function(){
    		  sendBTMSectionList(); 
    			
    			$("#newStart").dialog({
    				autoOpen: false,
    				position: [440, 150],
    				modal: true,
    				width: 400,
    				height: 200,
    				resizable: false,
    				buttons:{
    						"확인":function() {
    						$(this).dialog("close");
    						}
    				}
    			});
    		    
         });
       
       
		   // 페이지가 시작하면서 가장 먼저 실행되는 함수로 sys변수를 정의하고 랜더링할 캔버스를 연결, 필요한 데이터를 페이지 이동없이 a.jax로 가져옴
	       function sendBTMSectionList(){
	    	   sys = arbor.ParticleSystem(200,400,1);
		       sys.parameters({gravity:true});
		       sys.renderer = Renderer("#viewport"); 
		   
	    	   $.ajax({
					url:"/goal/mind/getBTMSection",
					type:"post",
					data:{"sectionNum":'${requestScope.sectionNum}',"loginUserMGoalNum":'${requestScope.loginUserMGoalNum}'},
					dataType:"json",
					success:startMindMap,
					error: function(){
						alert('실패');
					}
				});
	       }//end sendBTMSection 
	       
	       
	        //마인드맵을 시작하는 함수(랜더링 시작) 
       		function startMindMap(sendInfo){
	    	   
       		   var mTitle = '${requestScope.midGoalVO.mGoalTitle}';
		       var mGoalNum = '${requestScope.midGoalVO.mGoalNum}';
		       sys.addNode('중간목표',{'color':'red','label':mTitle,'shape':'dot',"mapping":mGoalNum});	
       		    
	       	   for(var i =0; i < sendInfo.BTMSectionList.length; i++){
			   	   sys.addNode(sendInfo.BTMGoalList[i].bGoalTitle,{'color':'black','label':sendInfo.BTMGoalList[i].bGoalTitle,
		  		   'shape':'square','BTMSectionNum':sendInfo.BTMSectionList[i].btmsectionNum,'bGoalNum':sendInfo.BTMGoalList[i].bGoalNum});   
		           sys.addEdge('중간목표',sendInfo.BTMGoalList[i].bGoalTitle,{'color':'black'});
		       }
	       	   
	       	   // 여기서 지금 임의로 progressNum을 줬지만 웅희씨에게 넘겨 받아야 함.
	       	   var progressNum = '${requestScope.progressNum}';
		       	$.ajax({
					url:"/goal/mind/getBTMRecord",
					type:"post",
					data:{"progressNum":progressNum,"isClick":"","clickedNodeTitle":"","clickedNodeNum":0,"BTMSectionNum":0,"mGoalNumList":'${requestScope.mGoalNumList}'},
					dataType:"json",
					success:function(resultMapping){
					
			       	   for(var i =0; i < resultMapping.memberId.length; i++){
			       		  sys.addNode(resultMapping.memberId[i],{'color':resultMapping.memberColor[i],'label':resultMapping.memberId[i],
				     	  'shape':'dot'});   
					      sys.addEdge(resultMapping.bGoalTitleList[i],resultMapping.memberId[i],{'color':'black'});
					      if(i == 0){
					        str += " " +resultMapping.bGoalTitleList[i];
					      }else{
					    	str += ", "+ resultMapping.bGoalTitleList[i];
					      }
				       }  
			       	      if(resultMapping.memberId.length !=0){
					      	$("#playingGoal").append(" "+str+" 목표를 진행중입니다..");
			       	      }else{
			       	    	$("#playingGoal").append(" 현재 진행중인 목표가 없습니다 설정해 주세요..");  
			       	      }
					},
					error: function(){
					}
				});
		       	     
       		}//end startMindMap
		           		
		   //유저가 세부목표를 클릭을 함으로써 진행을 하게끔 하는 함수. 클릭시 해당 세부목표에 데이터가 있는지 여부를 확인하고 없으면 insert(데이터 생성) 후 노드 생성 			   
        	function startGoal(clickedNode){
       			
		 	    // 여기서 지금 임의로 progressNum을 줬지만 웅희씨에게 넘겨 받아야 함.
		        var progressNum = 16;	
		 	    
	 			$.ajax({
					url:"/goal/mind/getBTMRecord?progressNum="+progressNum+"&isClick="+"Y"+"&clickedNodeTitle="+clickedNode.name+"&clickedNodeNum="+clickedNode.data.bGoalNum+
							"&BTMSectionNum="
							+clickedNode.data.BTMSectionNum,
					type:"get",
					dataType:"json",
					success:function(resultMapping){
			       	   for(var i =0; i < resultMapping.memberId.length; i++){
			       		  $("#playingGoal").empty();
			       		  str = '${sessionScope.userid}'+'님은';
			       		  sys.addNode(resultMapping.memberId[i],{'color':resultMapping.memberColor[i],'label':resultMapping.memberId[i],
				     	  'shape':'dot'});   
					      sys.addEdge(clickedNode.name,resultMapping.memberId[i],{'color':'black'});
					      
					      if(i == 0){
						        str += " " + clickedNode.name;
						  }else{
						    	str += ", "+ resultMapping.bGoalTitleList[i];
					      }
					      title = resultMapping.bGoalTitleList[i];
				       } // end for
				       
					    if(str != ""){
						    $("#playingGoal").append(" "+str+"을 새롭게 실행합니다..");
				        }else if(resultMapping.memberId[i].length == 0){
				       	    $("#playingGoal").append(" 현재 진행중인 목표가 없습니다 설정해 주세요..");  
				        }
					    $("#startTitle").empty();
			       	    $("#startTitle").append(title + '을 시작합니다.');
			       		
					},
					error: function(){
						$('#danger').modal("show");
						closeSnoAlertBox();
					}
				});
 			 
 		   }//end startGoal  
 		   
       </script>
 	
			<!-- alert모달영역 -->   
				 <!-- Modal -->
				    <a class="btn btn-danger" href = "#danger" data-toggle="modal" id = "alert_button"></a>
				    <!-- Modal -->
				    <div class="modal fade" id="danger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header modal-header-danger">
				                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                    <h1>- 중복 -</h1>
				                </div>
				                <div class="modal-body">
				                	- 이미 진행중이거나 완료된 목표입니다. -
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				                </div>
				            </div><!-- /.modal-content -->
				        </div><!-- /.modal-dialog -->
				    </div><!-- /.modal -->
  				  <!-- Modal -->
			<!-- alert모달영역 -->  

			 <!-- 목표 시작시 뜨는 팝업모달-->
	       		<div id="newStart" title="새로운 목표를 시작해요!">
	       			<div id = "startTitle" align="center">
	       			</div>
				</div>	
				
				 <!-- Modal -->
				<div id = "recordModal">
				    <a class="btn btn-warning" href="#warning" data-toggle="modal"><h4>세부 기록확인</h4></a>
				    <!-- Modal -->
				    <div class="modal fade" id="warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header modal-header-warning">
				                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                    <h1>세부목표별 맴버기록</h1>
				                </div>
				                <div class="modal-body">
				                 <c:forEach items="${requestScope.btmGoalList}" var="title">
									<table class = "memberRecord" border="2">
										<tr class="titleline">
											<td colspan="3" height="40" width="500">세부목표명 : ${title.bGoalTitle}</td>
										</tr>
										<tr height="30" class="th_line" align="center">
											<td align="left"><span style='font-weight:bold;'>아이디</span></td>
											<td align="center"><span style='font-weight:bold;'>기록(시,분단위)</span></td>
											<td align="center"><span style='font-weight:bold;'>완료여부</span></td>
										</tr>	
											<c:forEach items="${requestScope.recordList}" var="record">
											<c:if test="${title.bGoalTitle eq record.bGoalTitle}">
												<tr>
													<td align="left">${record.memberId}</td>
													<td align="center">${record.takeTime}</td>
													<td align="center">${record.isEnd}</td>
												</tr>
											</c:if>	
											</c:forEach>
									</table>
									<hr>
								</c:forEach>		
				                
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				                </div>
				            </div><!-- /.modal-content -->
				        </div><!-- /.modal-dialog -->
				    </div><!-- /.modal -->
				</div>
				
     </body> 
 </html> 
