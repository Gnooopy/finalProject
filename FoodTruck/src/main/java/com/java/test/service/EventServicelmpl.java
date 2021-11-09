package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.dao.EventDAO;
import com.java.test.domain.MemberVO;

@Repository("EventService")
public class EventServicelmpl implements EventService{

	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public void insertEvent(MemberVO vo) {
		eventDAO.insertEvent(vo);
		
	}

	@Override
	public List<MemberVO> getEventList() {
		// TODO Auto-generated method stub
		return eventDAO.getEventList();	
	}

	@Override
	public void UpdateEvent(MemberVO vo) {
		eventDAO.UpdateEvent(vo);		
	}

	@Override
	public MemberVO getEvent(MemberVO vo) {
		// TODO Auto-generated method stub
		return eventDAO.getEvent(vo);
	}

	

	@Override
	public MemberVO getEventList2(MemberVO vo) {
		// TODO Auto-generated method stub
		return eventDAO.getEventList2(vo);
	}

	@Override
	public MemberVO getEventvo(MemberVO vo) {
		// TODO Auto-generated method stub
		return eventDAO.getEventvo(vo);
	}

	@Override
	public void insertEventComment(MemberVO vo) {
		eventDAO.insertEventComment(vo);
		
	}

	@Override
	public void deleteEventComment(MemberVO vo) {
		eventDAO.deleteEventComment(vo);
		
	}

	@Override
	public List<MemberVO> getEventCommentList(MemberVO vo) {
		// TODO Auto-generated method stub
		return eventDAO.getEventCommentList(vo);
	}

	@Override
	public void deleteEvent(MemberVO vo) {
		eventDAO.deleteEvent(vo);
		
	}

}
