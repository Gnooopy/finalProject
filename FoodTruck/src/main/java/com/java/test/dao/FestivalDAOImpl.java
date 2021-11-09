package com.java.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("festivalDAO")
public class FestivalDAOImpl implements FestivalDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 축제별 푸드트럭 존 게시판 게시글 전체 조회 (R)
	@Override
	public List<MemberVO> getFestivalList() {
		return mybatis.selectList("FestivalDAO.getFestivalList");
	}

	// 축제별 푸드트럭 존 게시판 선택된 게시글 조회 (R)
	@Override
	public MemberVO getFestival(MemberVO vo) {
		return mybatis.selectOne("FestivalDAO.getFestival", vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 작성 (C)
	@Override
	public void insertFestival(MemberVO vo) {
		int i = mybatis.insert("FestivalDAO.insertFestival", vo);
		System.out.println("insert작동 : " + i);
	}

	// 축제별 푸드트럭 존 게시판 게시글 수정 (U)
	@Override
	public void updateFestival(MemberVO vo) {
		int i = mybatis.update("FestivalDAO.updateFestival", vo);
		System.out.println("update작동 : " + i);
	}

	// 축제별 푸드트럭 존 게시판 게시글 삭제 (D)
	@Override
	public void deleteFestival(MemberVO vo) {
		int i = mybatis.delete("FestivalDAO.deleteFestival", vo);
		System.out.println("delete작동 : " + i);
	}

	// 축제별 푸드트럭 존 게시판 게시글 전체 조회 (R)
	@Override
	public List<MemberVO> getCommentList(MemberVO vo) {
		return mybatis.selectList("FestivalDAO.getCommentList", vo);
	}

	// 축제별 푸드트럭 존 게시판 게시글 작성 (C)
	@Override
	public void insertComment(MemberVO vo) {
		int i = mybatis.insert("FestivalDAO.insertComment", vo);
		System.out.println("inserCom작동 : " + i);
	}

	// 축제별 푸드트럭 존 게시판 게시글 삭제 (D)
	@Override
	public void deleteComment(MemberVO vo) {
		int i = mybatis.delete("FestivalDAO.deleteComment", vo);
		System.out.println("deleteCom작동 : " + i);
	}

}
