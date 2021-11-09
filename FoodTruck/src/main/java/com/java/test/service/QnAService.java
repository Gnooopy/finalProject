package com.java.test.service;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface QnAService {
	
	// qna 
	void insertQnA(MemberVO vo);
	List<MemberVO> getQnAList();
	void updateQnA(MemberVO vo);
	void deleteQnA(MemberVO vo);
	MemberVO getQnA(MemberVO vo);
	void insertQnAComment(MemberVO vo);
	
	// 공공기관
	void insertBall(MemberVO vo);
	List<MemberVO> getBallList();
	void updateBall(MemberVO vo);
	void deleteBall(MemberVO vo);
	MemberVO getBall(MemberVO vo);
	void insertBallComment(MemberVO vo);
	
	// 홍보 협찬 요청
	void insertPromotion(MemberVO vo);
	List<MemberVO> getPromotionList();
	void updatePromotion(MemberVO vo);
	void deletePromotion(MemberVO vo);
	MemberVO getPromotion(MemberVO vo);
	void insertPromotionComment(MemberVO vo);
}
