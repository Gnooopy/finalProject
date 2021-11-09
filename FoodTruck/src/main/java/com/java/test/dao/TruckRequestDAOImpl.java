package com.java.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("requestDAO")
public class TruckRequestDAOImpl implements TruckRequestDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// ==================================================
	// 푸드트럭 요청 게시판 DAO
	@Override
	public void insertRequest(MemberVO vo) {
		int i = mybatis.insert("RequestDAO.insertRequest", vo);
		System.out.println("articleInsert 결과   : " + i);
	}

	@Override
	public void updateRequest(MemberVO vo) {
		mybatis.update("RequestDAO.updateRequest", vo);
	}

	@Override
	public void deleteRequest(MemberVO vo) {
		int i = mybatis.delete("RequestDAO.deleteRequest", vo);
		System.out.println("articledelete 결과 : " + i);
	}

	@Override
	public MemberVO getRequest(MemberVO vo) {
		return mybatis.selectOne("RequestDAO.getRequest", vo);
	}

	@Override
	public List<MemberVO> getRequestList() {
		return mybatis.selectList("RequestDAO.getRequestList");
	}

	// ==================================================
	// 푸드트럭 모집 게시판 DAO
	@Override
	public void insertRecruit(MemberVO vo) {
		int i = mybatis.insert("RequestDAO.insertRecruit", vo);
		System.out.println("insert결과 : " + i);
	}

	@Override
	public void updateRecruit(MemberVO vo) {
		int i = mybatis.update("RequestDAO.updateRecruit", vo);
		System.out.println("update결과 : " + i);
	}

	@Override
	public void deleteRecruit(MemberVO vo) {
		mybatis.delete("RequestDAO.deleteRecruit", vo);
	}

	@Override
	public MemberVO getRecruit(MemberVO vo) {
		return mybatis.selectOne("RequestDAO.getRecruit", vo);
	}

	@Override
	public List<MemberVO> getRecruitList() {
		return mybatis.selectList("RequestDAO.getRecruitList");
	}

	// ==================================================
	// 푸드트럭 요청 게시판 댓글 DAO
	@Override
	public void insertComment(MemberVO vo) {
		int i = mybatis.insert("RequestDAO.insertComment", vo);
		System.out.println("commentInsert 결과 : " + i);
	}

	@Override
	public void deleteComment(MemberVO vo) {
		int i = mybatis.delete("RequestDAO.deleteComment", vo);
		System.out.println("commentDel 결과 : " + i);
	}

	@Override
	public List<MemberVO> getCommentList(MemberVO vo) {
		return mybatis.selectList("RequestDAO.getCommentList", vo);
	}

	// ==================================================
	// 푸드트럭 모집 게시판 댓글 DAO
	@Override
	public void insertComment2(MemberVO vo) {
		int i = mybatis.insert("RequestDAO.insertComment2", vo);
		System.out.println("insertcomment결과 : " + i);
	}

	@Override
	public void deleteComment2(MemberVO vo) {
		int i = mybatis.delete("RequestDAO.deleteComment2", vo);
		System.out.println("delcomment결과 : " + i);
	}

	@Override
	public List<MemberVO> getCommentList2(MemberVO vo) {
		return mybatis.selectList("RequestDAO.getCommentList2", vo);
	}

	// ==================================================
	@Override
	public void likeCnt(MemberVO vo) {

	}

	@Override
	public List<MemberVO> goIntroTruck() {
		return mybatis.selectList("RequestDAO.goIntroTruck");
		
	}

}
