package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.test.dao.TruckRequestDAO;
import com.java.test.domain.MemberVO;

@Service("requestService")
public class TruckRequestServiceImpl implements TruckRequestService {

	@Autowired
	private TruckRequestDAO truckRequestDAO;

	// ==================================================
	// 푸드트럭 요청 게시판 Service
	@Override
	public void insertRequest(MemberVO vo) {
		truckRequestDAO.insertRequest(vo);
	}

	@Override
	public void updateRequest(MemberVO vo) {
		truckRequestDAO.updateRequest(vo);
	}

	@Override
	public void deleteRequest(MemberVO vo) {
		truckRequestDAO.deleteRequest(vo);
	}

	@Override
	public MemberVO getRequest(MemberVO vo) {
		return truckRequestDAO.getRequest(vo);
	}

	@Override
	public List<MemberVO> getRequestList() {
		return truckRequestDAO.getRequestList();
	}

	// ==================================================
	// 푸드트럭 요청 게시판 댓글 Service
	@Override
	public void insertComment(MemberVO vo) {
		truckRequestDAO.insertComment(vo);
	}

	@Override
	public void deleteComment(MemberVO vo) {
		truckRequestDAO.deleteComment(vo);
	}

	@Override
	public List<MemberVO> getCommentList(MemberVO vo) {
		return truckRequestDAO.getCommentList(vo);
	}

	// ==================================================
	// 푸드트럭 모집 게시판 Service
	@Override
	public void insertRecruit(MemberVO vo) {
		truckRequestDAO.insertRecruit(vo);
	}

	@Override
	public void updateRecruit(MemberVO vo) {
		truckRequestDAO.updateRecruit(vo);
	}

	@Override
	public void deleteRecruit(MemberVO vo) {
		truckRequestDAO.deleteRecruit(vo);
	}

	@Override
	public MemberVO getRecruit(MemberVO vo) {
		return truckRequestDAO.getRecruit(vo);
	}

	@Override
	public List<MemberVO> getRecruitList() {
		return truckRequestDAO.getRecruitList();
	}

	// ==================================================
	// 푸드트럭 모집 게시판 댓글 Service
	@Override
	public void insertComment2(MemberVO vo) {
		truckRequestDAO.insertComment2(vo);
	}

	@Override
	public void deleteComment2(MemberVO vo) {
		truckRequestDAO.deleteComment2(vo);
	}

	@Override
	public List<MemberVO> getCommentList2(MemberVO vo) {
		return truckRequestDAO.getCommentList2(vo);
	}

	// ==================================================

	@Override
	public void likeCnt(MemberVO vo) {

	}

	@Override
	public List<MemberVO> goIntroTruck() {
		return truckRequestDAO.goIntroTruck();
		
	}

}
