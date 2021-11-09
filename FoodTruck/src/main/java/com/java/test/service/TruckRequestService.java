package com.java.test.service;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface TruckRequestService {

	// 푸드트럭 요청 게시글 등록(C)
	void insertRequest(MemberVO vo);

	// 푸드트럭 요청 게시글 수정(U)
	void updateRequest(MemberVO vo);

	// 푸드트럭 요청 게시글 삭제(D)
	void deleteRequest(MemberVO vo);

	// 푸드트럭 요청 게시글 조회(R)
	MemberVO getRequest(MemberVO vo);

	// 푸드트럭 요청 게시글 전체 조회(R)
	List<MemberVO> getRequestList();

	// #################################

	// 푸드트럭 모집 게시글 등록(C)
	void insertRecruit(MemberVO vo);

	// 푸드트럭 모집 게시글 수정(U)
	void updateRecruit(MemberVO vo);

	// 푸드트럭 모집 게시글 삭제(D)
	void deleteRecruit(MemberVO vo);

	// 푸드트럭 모집 게시글 조회(R)
	MemberVO getRecruit(MemberVO vo);

	// 푸드트럭 모집 게시글 전체 조회(R)
	List<MemberVO> getRecruitList();

	// #################################

	// 푸드트럭 요청 게시글 댓글 작성(C)
	void insertComment(MemberVO vo);

	// 푸드트럭 요청 게시글 댓글 삭제(D)
	void deleteComment(MemberVO vo);

	// 푸드트럭 요청 게시글 댓글 조회(R)
	List<MemberVO> getCommentList(MemberVO vo);

	// #################################

	// 푸드트럭 모집 게시글 댓글 작성(C)
	void insertComment2(MemberVO vo);

	// 푸드트럭 모집 게시글 댓글 삭제(D)
	void deleteComment2(MemberVO vo);

	// 푸드트럭 모집 게시글 댓글 조회(R)
	List<MemberVO> getCommentList2(MemberVO vo);
	
	// #################################

	// 푸드트럭 요청 게시글 좋아요 수
	void likeCnt(MemberVO vo);
	List<MemberVO> goIntroTruck();

}
