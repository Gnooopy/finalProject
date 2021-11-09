package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.dao.QnADAO;
import com.java.test.domain.MemberVO;

@Repository("qnaService")
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADAO qnaDAO;
	
	// qna 
	 
	@Override
	public void insertQnA(MemberVO vo) {
		
	  // 텍스트 엔터 값
	  String temp = vo.getQnaContent().replaceAll("\r\n", "<br>");
//	  String temp = vo.getQnaContent().replaceAll("<br>","\r\n");
	  vo.setQnaContent(temp);
	  
		
		qnaDAO.insertQnA(vo);
	}
	
	

	@Override
	public List<MemberVO> getQnAList() {
		return qnaDAO.getQnAList();
		
	}
	@Override
	public void updateQnA(MemberVO vo) {
		qnaDAO.updateQnA(vo);
		
	}
	

	@Override
	public void deleteQnA(MemberVO vo) {
		qnaDAO.deleteQnA(vo);
	}
	@Override
	public MemberVO getQnA(MemberVO vo) {
//		String temp1 = vo.getQnaContent().replaceAll("<br>","\r\n");
//		  vo.setQnaContent(temp1);
		return qnaDAO.getQnA(vo);
	}
	
	
	@Override
	public void insertQnAComment(MemberVO vo) {
		
		String temp = vo.getQnaComment().replaceAll("\r\n", "<br>");
//		  String temp = vo.getQnaContent().replaceAll("<br>","\r\n");
		  vo.setQnaContent(temp);
//		  System.out.println("서비스댓글 넘어오니?"+vo.getQnaComment());
//			System.out.println("서비스시컨스 넘어오니?"+vo.getQnaSeq());
		qnaDAO.insertQnAComment(vo);
	}
	
	
	
	
	
	


	// 공공기관
	
	
	@Override
	public void insertBall(MemberVO vo) {
		// 텍스트 엔터 값
		  String temp = vo.getBallContent().replaceAll("\r\n", "<br>");
		  
		  vo.setBallContent(temp);
		  
		  qnaDAO.insertBall(vo);
	}

	@Override
	public List<MemberVO> getBallList() {
		return qnaDAO.getBallList();
	}
	
	
	@Override
	public void updateBall(MemberVO vo) {
		qnaDAO.updateBall(vo);		
	}

	@Override
	public void deleteBall(MemberVO vo) {
		qnaDAO.deleteBall(vo);
		
	}

	@Override
	public MemberVO getBall(MemberVO vo) {
		// TODO Auto-generated method stub
		return qnaDAO.getBall(vo);
	}
	@Override
	public void insertBallComment(MemberVO vo) {
		qnaDAO.insertBallComment(vo);
		
	}


	
	
	// 홍보 협찬 
	
	
	@Override
	public void insertPromotion(MemberVO vo) {
		// 텍스트 엔터 값
		  String temp = vo.getPromotionContent().replaceAll("\r\n", "<br>");
		  
		  vo.setPromotionContent(temp);
			
		  qnaDAO.insertPromotion(vo);
	}

	@Override
	public List<MemberVO> getPromotionList() {
		return qnaDAO.getPromotionList();
	}



	@Override
	public void updatePromotion(MemberVO vo) {
		qnaDAO.updatePromotion(vo);		
		
	}



	@Override
	public void deletePromotion(MemberVO vo) {
		qnaDAO.deletePromotion(vo);
		
	}



	@Override
	public MemberVO getPromotion(MemberVO vo) {
		// TODO Auto-generated method stub
		return qnaDAO.getPromotion(vo);
	}



	@Override
	public void insertPromotionComment(MemberVO vo) {
		qnaDAO.insertPromotionComment(vo);
		
	}



	



	



	



	



	



	
	
}
