package com.java.test.dao;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface EventDAO {
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
	
// 푸드트럭 요청 게시글 댓글 작성(C)
//	void insertComment(MemberVO vo);

	// 푸드트럭 요청 게시글 댓글 삭제(D)
//	void deleteComment(MemberVO vo);

	// 푸드트럭 요청 게시글 댓글 조회(R)
//	List<MemberVO> getCommentList(MemberVO vo);

}
