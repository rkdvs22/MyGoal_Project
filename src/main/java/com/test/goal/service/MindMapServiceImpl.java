package com.test.goal.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.goal.dao.MindMapDAO;
import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.CalendarVO;
import com.test.goal.vo.DayRecordVO;
import com.test.goal.vo.FindMemberColor;
import com.test.goal.vo.InsertDayRecord;
import com.test.goal.vo.MemberRecord;
import com.test.goal.vo.MidGoalVO;

@Service
public class MindMapServiceImpl implements MindMapService{

	@Autowired
	private MindMapDAO dao;

	@Override
	public ArrayList<BTMSectionVO> findBTMSection(int SectionNum) {
		return dao.findBTMSection(SectionNum);
	}

	@Override
	public ArrayList<BTMGoalVO> findBTMGoal(int mGoalNum) {
		return dao.findBTMGoal(mGoalNum);
	}

	@Override
	public MidGoalVO findMidGoal(int mGoalNum) {
		return dao.findMidGoal(mGoalNum);
	}
    
	// 페이지 이동시 현재 진쟁상황에 맞춰 유저를 배치해주는 메서드. + 진행상황이 아닌 목표를 클릭시 DB에 저장하고 진행시켜주는 메서드
	@Override
	public HashMap<String, ArrayList> randomAllocate(HashMap<String, Integer> memberGoalNum,
		                                            int progressNum, String isClick, HttpServletRequest request, String clickedNodeTitle,int clickedNodeNum,int BTMSectionNum){
		MidGoalVO m = null;
		long sysdate = 0;
		long midStartDate = 0;
		long midEndDate = 0;
		long btmStartDate = 0;
		long btmendDate = 0;
		ArrayList<BTMGoalVO> sendBTMGoalList = new ArrayList<>();
		int bGoalNum = 0;
		int progressing = 0;
		// 현재 진행중인 세부 목표에 페이지 마인드맵 페이지 이동과 동시에 유저를 위치 시키기 위해서 필요한 mapping (MemberId/bGoalTitle 맵핑)
		ArrayList<String> memberIdList = new ArrayList<>();
		ArrayList<String> bGoalTitleList = new ArrayList<>();
		ArrayList<String> memberColor = new ArrayList<>();
		ArrayList<BTMGoalVO> btmGoalList = new ArrayList<>();
		HashMap<String, ArrayList> resultMapping = new HashMap<>();
		//클릭한 중간목표가 진행중인지 아닌지를 파악하기 위한 변수(1 = 현재 진행중, 2 = 끝났거나, 아직 하지 않은 목표)
		
		
		// 넘어온 Hash맵에서 member와 해당 mGoalNum을 하나씩 꺼내 검사
		for(Map.Entry<String, Integer> entry : memberGoalNum.entrySet()) {
		    String memberId = entry.getKey();
		    int mGoalNum = entry.getValue();
		   
		    // member의 color를 찾기위한 VO변수
		    FindMemberColor key = new FindMemberColor();
		    sysdate = Long.parseLong(dao.findSysdate());
		    sendBTMGoalList = findBTMGoal(mGoalNum);
		    	
		    	//세부목표의 리스트를 하나씩 꺼내 세부목표별 기록이 있는지 검사
		    	for(int i = 0; i < sendBTMGoalList.size(); i++){
		    		bGoalNum = sendBTMGoalList.get(i).getbGoalNum();
		    		
		    		//bGoalNum을 집어 넣어 해당 세부 목표에 해당하는 btmRecord가 있는지 검사
		    		if(dao.findBtmRecord(bGoalNum) != null){
		    			btmStartDate = Long.parseLong(dao.findBtmRecord(bGoalNum).getStartDate());
		    			btmendDate = Long.parseLong(dao.findBtmRecord(bGoalNum).getEndDate());
		    			
		    			// 그 세부기록인 btmRecord가 시작했는지 그리고 endDate가 null인지를 확인 - 맞으면 현재 진행중인 세부기록임
		    			if(sysdate >= btmStartDate && sysdate <= btmendDate){
		    			  memberIdList.add(memberId);
		    			  bGoalTitleList.add(sendBTMGoalList.get(i).getbGoalTitle());
		    			  
		    			  key.setMemberId(memberId);
		    			  key.setProgressNum(progressNum);
		    			  memberColor.add(dao.sendMemberColor(key));
		    			}else{
		    			}
		    		}else{
		    			//만약 세부목표에 해당하는 btmRecord가 없다면(세부기록이 없다면) - 랜덤으로 배치할 리스트에 세부 목표를 추가
		    			BTMGoalVO vo = new BTMGoalVO();
		    			vo.setbGoalNum(bGoalNum);
		    			btmGoalList.add(dao.findBtmGoal(vo));
		    			key.setMemberId(memberId);
		    			key.setProgressNum(progressNum);
		    		}
		    		
		    	}//end for
		    	/**
		    	 * 세부 목표에 대한 기록이 없을 때,
		    	 * view 페이지에서 클릭했을 경우 현재 로그인한 유저의 아이디와 일치하는지 확인한 다음 넘어온 bGoalNum(key값)과 넘어온 title을 토대로 일치하는 데이터를 생성하고 목표시작.
		    	 */
		    	if(resultMapping.get(memberId) == null && isClick != "" && request.getSession().getAttribute("loginUser").equals(memberId)){
		        			BTMRecordVO vo = new BTMRecordVO();
		        			int resultMessage = 0;
		        			for(int j = 0; j < btmGoalList.size(); j++){
		        				if(btmGoalList.get(j).getbGoalTitle().equals(clickedNodeTitle) && btmGoalList.get(j).getbGoalNum() == clickedNodeNum){
		        					resultMessage = 1;
		        					key.setMemberId(memberId);
		        					key.setProgressNum(progressNum);
		        					memberIdList.add(memberId);
		        					memberColor.add(dao.sendMemberColor(key));
		        					bGoalTitleList.add(btmGoalList.get(j).getbGoalTitle());
		        					//쿼리 날려야 함.(insert 쿼리 생성 된것이므로 - 새로운 세부기록 BTMRecord를 추가하고 거기에 해당하는 dayRecord를 기간에 맞춰 만들어야 함.)
		        					
		        					vo.setbGoalNum(btmGoalList.get(j).getbGoalNum());
		        					vo.setPeriod(btmGoalList.get(j).getPeriod());
		        					vo.setMemberId(memberId);
		        					vo.setBtmSectionNum(BTMSectionNum);
		        					CalendarVO calendar = dao.findCalendar(memberId);
		        					vo.setCalendarNum(calendar.getCalendarNum());
		        					int btmRecordSEQ = dao.insertBTMRecord(vo);
		        					InsertDayRecord recordKey = new InsertDayRecord();
		        					
		        					recordKey.setPeriod(btmGoalList.get(j).getPeriod());
		        					recordKey.setMemberColor(dao.sendMemberColor(key));
		        					recordKey.setCalendarNum(calendar.getCalendarNum());
		        					recordKey.setBtmRecordNum(btmRecordSEQ);
		        					dao.insertDayRecord(recordKey);
		        					
		        					resultMapping.put("memberId", memberIdList);
		        					resultMapping.put("bGoalTitleList", bGoalTitleList);
		        					resultMapping.put("memberColor", memberColor);
		        					return resultMapping;
		        				}
		        			}
	    			memberColor.add(dao.sendMemberColor(key));
	    			if(resultMessage==0){
	    				return null;
	    			}
		    	}
		    	
		   // }//end if
		}//end for
		resultMapping.put("memberId", memberIdList);
		resultMapping.put("bGoalTitleList", bGoalTitleList);
		resultMapping.put("memberColor", memberColor);
		
		return resultMapping;
	}//end method

	@Override
	public ArrayList<MemberRecord> getRecordList(HashMap<String, Integer> memberGoalNum) {
		ArrayList<MemberRecord> getRecordList = new ArrayList<>();
		ArrayList<BTMGoalVO> sendBTMGoalList = new ArrayList<>();
		ArrayList<DayRecordVO> successDayRecordList = new ArrayList<>();
	      
		// 넘어온 Hash맵에서 member와 해당 mGoalNum을 하나씩 꺼내 검사
				for(Map.Entry<String, Integer> entry : memberGoalNum.entrySet()) {
				    String memberId = entry.getKey();
				    int mGoalNum = entry.getValue();
				    
				    sendBTMGoalList = findBTMGoal(mGoalNum);
				    if(sendBTMGoalList != null){
					    for(int i = 0; i < sendBTMGoalList.size(); i++){
					    	int bGoalNum = 0;
					    	bGoalNum = sendBTMGoalList.get(i).getbGoalNum();
					    	MemberRecord record = new MemberRecord();
					    	String isEnd = "";
					    	ArrayList<DayRecordVO> dayRecordList = new ArrayList<>();
					    	BTMRecordVO bRecord = dao.findBtmRecordNotFormatting(bGoalNum);
					    	
				    		//bGoalNum을 집어 넣어 해당 세부 목표에 해당하는 btmRecord가 있는지 검사
				    		if(bRecord != null){
				    			
				    			// 해당 BTMRecord에 대한 DayRecord를 찾아온다.
				    			dayRecordList = dao.findDayRecordList(bRecord.getbRecordNum());
				    			
				    			//변수 선언부
				    			int achieve = 0; // 성취율 합산 변수
				    			String btmStartDate = ""; // 첫 dayRecord의 startDate(분단위까지 받아옴)
				    			String completeTime = ""; // 완료된 기록을 담는 변수(분단위)
				    			String sysdate = ""; // 현재 시간을 분단위로 받아옴
				    			String sysdate_Day = ""; // 현재 시간을 하루 단위까지
				    			String inputTime = ""; // 최종적으로 MemberRecord vo에 setting할 값
				    			int key = 0; //이미 리스트에 입력했을 경우 패스하게 하는 변수
				    			
				    			for(int j =0; j <dayRecordList.size(); j++){
				    				int isProgressing = 0; // 진행 여부를 체크할 변수
				    				int isSuccess=0; //달성여부를 체크하는 변수
	
				    				isProgressing = dao.isProgressing(dayRecordList.get(j).getBtmRecordNum());
				    				
				    				//진행중인것.
				    				if(isProgressing == 1){
				    					isEnd = "진행중";
				    					//첫번째 DayRecord라면
				    					if(j==0){
				    						btmStartDate = dao.getStartDate(dayRecordList.get(j).getDayRecordNum());
				    						//status가 Y인것 - 즉 데이터가 오늘 날짜
				    						if(dao.isStatusY() != 0){
				    							//findSysdate와 다르다 - 받아오는 형식이 다름 (yyyy-mm-dd-hh24-si)
				    							sysdate = dao.getSysdate();
				    						}
				    						//진행중인것의 데이터를 맵핑(맴버id,기록,완료여부)
				    						if(btmStartDate != null && sysdate != null){
				    							inputTime = doDiffOfDate(btmStartDate,sysdate);
				    							record.setIsEnd(isEnd);
				    							record.setTakeTime(inputTime);
				    							record.setMemberId(memberId);
				    							record.setbGoalTitle(sendBTMGoalList.get(i).getbGoalTitle());
				    							getRecordList.add(record);
				    						}
				    					}//end if
				    					
				    				}else{
				    					//진행중이지 않음(이미 끝난기록. 달성했거나 달성실패거나)
				    					//달성했는지 달성하지 못했는지
				    				     isSuccess = dao.isSuccess(bRecord.getbRecordNum());
				    				     if(key != 1){
				    					//달성 실패
					    					if(isSuccess != 1){
					    						isEnd = "달성실패";
					    						record.setbGoalTitle(sendBTMGoalList.get(i).getbGoalTitle());
					    						record.setIsEnd(isEnd);
					    						record.setMemberId(memberId);
					    						getRecordList.add(record);
					    						key = 1;
					    					}else if(isSuccess == 1){
					    						//달성한 기록
					    					isEnd = "달성완료";
					    					successDayRecordList = dao.getSuccessDayRecordList(bRecord);
					    					for(int r = 0; r < successDayRecordList.size(); r++){
					    						if(r==0){
					    							btmStartDate = dao.getStartDate(successDayRecordList.get(r).getDayRecordNum());
					    						}
					    						if(successDayRecordList.get(r).getCompleteTime() != null){
					    							completeTime = successDayRecordList.get(r).getCompleteTime();
					    							
					    						}//end if
					    					}//end for
					    					inputTime = doDiffOfDate(btmStartDate,completeTime);
					    					record.setIsEnd(isEnd);
					    					record.setTakeTime(inputTime);
					    					record.setMemberId(memberId);
					    					record.setbGoalTitle(sendBTMGoalList.get(i).getbGoalTitle());
					    					getRecordList.add(record);
					    					key = 1;
					    					}//end if
				    				     }	
				    				}//end if
				    			}//end for
				    		}else{
				    			//세부 목표에 대한 해당 유저의 기록이 없는것.(아직 안함)
				    			isEnd = "기록없음";
				    			record.setbGoalTitle(sendBTMGoalList.get(i).getbGoalTitle());
				    			record.setIsEnd(isEnd);
				    			record.setMemberId(memberId);
				    			getRecordList.add(record);
				    		}//end if2
					    	
					    }//end BTMGoalList
				    }//end if1
				}//end for1    
				
		return getRecordList;
	}
	
	public String doDiffOfDate(String startDate, String isEndDate){
		String passTime = "";
	    try {

	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	        Date beginDate = formatter.parse(startDate);
	        Date endDate = formatter.parse(isEndDate);

	        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴

	        long diff = endDate.getTime() - beginDate.getTime();
	        long diffMinutes = diff / (60 * 1000);

	        long hour = (long) Math.floor(diff / (60 * 60 * 1000));
	        long minute = diffMinutes % 60;
	        
	        
	        passTime = Long.toString(hour) +":"+ Long.toString(minute);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    return passTime;
	}//end doDiff

	@Override
	public ArrayList<BTMGoalVO> getBtmGoalList(MidGoalVO midGoalVO) {
		return dao.findBTMGoal(midGoalVO.getmGoalNum());
	}

}
