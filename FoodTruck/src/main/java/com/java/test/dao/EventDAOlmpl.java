package com.java.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("EventDAO")
public class EventDAOlmpl implements EventDAO{

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertEvent(MemberVO vo) {
		 mybatis.insert("EventDAO.insertEvent",vo);
		
	}

	@Override
	public List<MemberVO> getEventList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("EventDAO.getEventList");	
	}

	@Override
	public void UpdateEvent(MemberVO vo) {
		mybatis.update("EventDAO.UpdateEvent",vo);		
	}

	@Override
	public MemberVO getEvent(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("EventDAO.getEvent", vo);
	}

	
	@Override
	public MemberVO getEventList2(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("EventDAO.getEventList2", vo);
	}

	@Override
	public MemberVO getEventvo(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("EventDAO.getEventList2", vo);
	}

	@Override
	public void insertEventComment(MemberVO vo) {
		int i = mybatis.insert("EventDAO.insertEventComment", vo);
		System.out.println("commentInsert 결과 : " + i);
		
	}

	@Override
	public void deleteEventComment(MemberVO vo) {
		int i = mybatis.delete("EventDAO.deleteEventComment", vo);
		System.out.println("commentDel 결과 : " + i);		
	}

	@Override  // 필요 없을 예정 
	public List<MemberVO> getEventCommentList(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("값 넘어가냐" );
		return mybatis.selectList("EventDAO.getEventCommentList", vo);
	}

	@Override
	public void deleteEvent(MemberVO vo) {
		mybatis.delete("EventDAO.deleteEvent",vo);
		
	}

}
