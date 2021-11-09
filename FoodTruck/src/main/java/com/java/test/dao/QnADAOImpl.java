package com.java.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("QnADAO")
public class QnADAOImpl implements QnADAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// qna 
	
	@Override
	public void insertQnA(MemberVO vo) {
		 mybatis.insert("QnADAO.insertQnA",vo);
	}

	@Override
	public List<MemberVO> getQnAList() {
		return mybatis.selectList("QnADAO.getQnAList");
		
	}
	
	@Override
	public void updateQnA(MemberVO vo) {
		mybatis.update("QnADAO.updateQnA",vo);
	}
	
	@Override
	public void deleteQnA(MemberVO vo) {
		mybatis.delete("QnADAO.deleteQnA",vo);
	}
	@Override
	public MemberVO getQnA(MemberVO vo) {
		
		return mybatis.selectOne("QnADAO.getQnA", vo);
	}
	@Override
	public void insertQnAComment(MemberVO vo) {
//		System.out.println("다오댓글 넘어오니?"+vo.getQnaComment());
//		System.out.println("다오시컨스 넘어오니?"+vo.getQnaSeq());
		 mybatis.update("QnADAO.insertQnAComment",vo);
	}

	
	
	
	
	

	@Override
	public void insertBall(MemberVO vo) {
		
		mybatis.insert("QnADAO.insertBall",vo);
	}

	@Override
	public List<MemberVO> getBallList() {
		return mybatis.selectList("QnADAO.getBallList");
	}
	
	@Override
	public void updateBall(MemberVO vo) {
		mybatis.update("QnADAO.updateBall",vo);
		
	}

	@Override
	public void deleteBall(MemberVO vo) {
		mybatis.delete("QnADAO.deleteBall",vo);
		
	}

	@Override
	public MemberVO getBall(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("QnADAO.getBall", vo);
	}
	@Override
	public void insertBallComment(MemberVO vo) {
		 mybatis.update("QnADAO.insertBallComment",vo);
		
	}

	
	
	
	
	
	
	
	
	
	@Override
	public void insertPromotion(MemberVO vo) {
		mybatis.insert("QnADAO.insertPromotion",vo);
		
	}

	@Override
	public List<MemberVO> getPromotionList() {
		return mybatis.selectList("QnADAO.getPromotionList");
	}

	@Override
	public void updatePromotion(MemberVO vo) {
		mybatis.update("QnADAO.updatePromotion",vo);
		
	}

	@Override
	public void deletePromotion(MemberVO vo) {
		mybatis.delete("QnADAO.deletePromotion",vo);
		
	}

	@Override
	public MemberVO getPromotion(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("QnADAO.getPromotion", vo);
	}

	@Override
	public void insertPromotionComment(MemberVO vo) {
		 mybatis.update("QnADAO.insertPromotionComment",vo);
		
	}

	

	

	

	

	

	
	
	

}
