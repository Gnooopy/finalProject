package com.java.test.service;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface EventService {
	void insertEvent(MemberVO vo);
	List<MemberVO> getEventList();
	void UpdateEvent(MemberVO vo);
	MemberVO getEvent(MemberVO vo);
	MemberVO getEventList2(MemberVO vo);
	void deleteEvent(MemberVO vo);


	MemberVO getEventvo(MemberVO vo);
	
	void insertEventComment(MemberVO vo);
	void deleteEventComment(MemberVO vo);
	List<MemberVO> getEventCommentList(MemberVO vo);
}
