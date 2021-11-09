package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.test.dao.FestivalDAO;
import com.java.test.domain.MemberVO;

@Service("festivalService")
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDAO festivalDAO;

	// 축제별 푸드트럭 존 게시판 게시글 전체 조회 (R)
	@Override
	public List<MemberVO> getFestivalList() {
		return festivalDAO.getFestivalList();
	}

	// 축제별 푸드트럭 존 게시판 선택된 게시글 조회 (R)
	@Override
	public MemberVO getFestival(MemberVO vo) {
		return festivalDAO.getFestival(vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 작성 (C)
	@Override
	public void insertFestival(MemberVO vo) {
		festivalDAO.insertFestival(vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 수정 (U)
	@Override
	public void updateFestival(MemberVO vo) {
		festivalDAO.updateFestival(vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 삭제 (D)
	@Override
	public void deleteFestival(MemberVO vo) {
		festivalDAO.deleteFestival(vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 전체 조회 (R)
	@Override
	public List<MemberVO> getCommentList(MemberVO vo) {
		return festivalDAO.getCommentList(vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 작성 (C)
	@Override
	public void insertComment(MemberVO vo) {
		festivalDAO.insertComment(vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 삭제 (D)
	@Override
	public void deleteComment(MemberVO vo) {
		festivalDAO.deleteComment(vo);
	}

}
