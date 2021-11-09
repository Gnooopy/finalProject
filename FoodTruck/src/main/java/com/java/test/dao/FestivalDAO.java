package com.java.test.dao;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface FestivalDAO {

	// 축제별 푸드트럭 존 게시판 게시글 전체 조회 (R)
	List<MemberVO> getFestivalList();

	// 축제별 푸드트럭 존 게시판 선택된 게시글 조회 (R)
	MemberVO getFestival(MemberVO vo);

	// 축제별 푸드트럭 존 게시판 게시글 작성 (C)
	void insertFestival(MemberVO vo);

	// 축제별 푸드트럭 존 게시판 게시글 수정 (U)
	void updateFestival(MemberVO vo);

	// 축제별 푸드트럭 존 게시판 게시글 삭제 (D)
	void deleteFestival(MemberVO vo);

	// ####################################

	// 축제별 푸드트럭 존 게시판 게시글 전체 조회 (R)
	List<MemberVO> getCommentList(MemberVO vo);

	// 축제별 푸드트럭 존 게시판 게시글 작성 (C)
	void insertComment(MemberVO vo);

	// 축제별 푸드트럭 존 게시판 게시글 삭제 (D)
	void deleteComment(MemberVO vo);

}
