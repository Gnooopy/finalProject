package com.java.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.dao.MyProfileDAO;
import com.java.test.domain.MemberVO;

@Repository("MyProfileService")
public class MyProfileServiceImpl implements MyProfileService {
	
	@Autowired
	private MyProfileDAO myProfileDAO;
	
	@Override
	public void inserttruck(MemberVO vo) {
		myProfileDAO.inserttruck(vo);
		
	}

	@Override
	public void ChangeInfo(MemberVO vo) {
		System.out.println("서비스");
		myProfileDAO.ChangeInfo(vo);
		
	}

}
 