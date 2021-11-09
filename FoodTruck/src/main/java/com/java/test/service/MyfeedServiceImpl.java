package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.dao.MyfeedDAO;
import com.java.test.domain.MemberVO;

@Repository("MyfeedService")
public class MyfeedServiceImpl implements MyfeedService{

	@Autowired
	private MyfeedDAO myfeedDAO;

	@Override
	public void insertFeed(MemberVO vo) {
		myfeedDAO.insertFeed(vo);
		
	}


	@Override
	public List<MemberVO> ListFeed(MemberVO vo) {
		System.out.println("서비스에 잘들어갔니?"+vo.getUserId());
		return myfeedDAO.ListFeed(vo);
	}

	


	@Override
	public void deleteFeed(MemberVO vo) {
		System.out.println("서비스에 seq?"+vo.getFeedSeq());
		myfeedDAO.deleteFeed(vo);
	}

	@Override
	public MemberVO selectFeed(MemberVO vo) {
		
		return myfeedDAO.selectFeed(vo);
	}

	@Override
	public void updateFeed(MemberVO vo) {
		myfeedDAO.updateFeed(vo);
		
	}

	@Override
	public void deletPhoto(MemberVO vo) {
		myfeedDAO.deletPhoto(vo);
		
	}

	@Override
	public void feedCommentInsert(MemberVO vo) {
		myfeedDAO.feedCommentInsert(vo);
		
	}
	
	@Override
	public List<List<MemberVO>> Listtest(MemberVO vo) {
		System.out.println("서비스에 잘들어갔니?"+vo.getUserId());
		
	
		return myfeedDAO.Listtest(vo);
	}


	@Override
	public void deleteOneComm(MemberVO vo) {
		myfeedDAO.deleteOneComm(vo);
		
	}


	
	
}
