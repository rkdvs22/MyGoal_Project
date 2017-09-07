package com.test.goal.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.CalendarVO;
import com.test.goal.vo.DayRecordVO;
import com.test.goal.vo.FindMemberColor;
import com.test.goal.vo.InsertDayRecord;
import com.test.goal.vo.MidGoalVO;

@Repository
public class MindMapDaoImpl implements MindMapDAO{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<BTMSectionVO> findBTMSection(int sectionNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findBTMSection(sectionNum);
	}

	@Override
	public ArrayList<BTMGoalVO> findBTMGoal(int mGoalNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findBTMGoal(mGoalNum);
	}

	@Override
	public MidGoalVO findMidGoal(int mGoalNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findMidGoal(mGoalNum);
	}

	@Override
	public String findSysdate() {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findSysdate();
	}

	@Override
	public BTMRecordVO findBtmRecord(int bGoalNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper. findBtmRecord(bGoalNum);
	}

	@Override
	public String sendMemberColor(FindMemberColor key) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.sendMemberColor(key);
	}

	@Override
	public ArrayList<DayRecordVO> getDayRecordList(int btmRecordNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.getDayRecordList(btmRecordNum);
	}

	@Override
	public int insertBTMRecord(BTMRecordVO vo) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		int SEQ = mapper.findBTMRecordSEQ();
		vo.setbRecordNum(SEQ);
		mapper.insertBTMRecord(vo);
		return SEQ;
	}

	@Override
	public CalendarVO findCalendar(String memberId) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findCalendar(memberId);
	}

	@Override
	public BTMGoalVO findBtmGoal(BTMGoalVO vo) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findBtmGoal(vo);
	}

	@Override
	public void insertDayRecord(InsertDayRecord recordKey) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		// 첫번째는 sysdate , 2번째부터 +1일씩 증가해서 기간내에 까지 날림.
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

		for(int i = 0; i < recordKey.getPeriod(); i++){
			Calendar cal = Calendar.getInstance();
			String startDate = "";
			cal.add(Calendar.DATE, i);
			startDate = dateFormat.format(cal.getTime());
			recordKey.setStartDate(startDate);
			if(i ==0){
				mapper.insertDayRecordFirstDay(recordKey);
			}else{
				mapper.insertDayRecord(recordKey);
			}
		}
	}

	@Override
	public ArrayList<DayRecordVO> findDayRecordList(int bRecordNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findDayRecordList(bRecordNum);
	}

	@Override
	public int isProgressing(int btmRecordNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.isProgressing(btmRecordNum);
	}

	@Override
	public String getStartDate(int dayRecordNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.getStartDate(dayRecordNum);
	}

	@Override
	public int isStatusY() {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.isStatusY();
	}

	@Override
	public String getSysdate() {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.getSysdate();
	}

	@Override
	public int isSuccess(int bRecordNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.isSuccess(bRecordNum);
	}

	@Override
	public ArrayList<DayRecordVO> getSuccessDayRecordList(BTMRecordVO bRecord) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.getSuccessDayRecordList(bRecord);
	}

	@Override
	public BTMRecordVO findBtmRecordNotFormatting(int bGoalNum) {
		MindMapMapper mapper = sqlsession.getMapper(MindMapMapper.class);
		return mapper.findBtmRecordNotFormatting(bGoalNum);
	}

}
