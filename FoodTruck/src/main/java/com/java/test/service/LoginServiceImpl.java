package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.test.dao.LoginDAO;
import com.java.test.domain.MemberVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO loginDAO;

	@Override
	public void userInsert(MemberVO vo) {
		loginDAO.userInsert(vo);
	}

	@Override
	public MemberVO loginChk(MemberVO vo) {
		System.out.println("서비스"+vo.getUserId());
		return loginDAO.loginChk(vo);
	}

	// ------------------------------
	@Override
	public MemberVO emailChk(MemberVO vo) {
		return loginDAO.emailChk(vo);
	}

	@Override
	public MemberVO truckadd(MemberVO vo) {
		
		return loginDAO.truckadd(vo);
	}

	@Override
	public List<MemberVO> mainList() {
		return loginDAO.mainList();
		
	}

	@Override
	public void userCount(MemberVO vo) {
		loginDAO.userCount(vo);
		
	}

	@Override
	public List<MemberVO> CountList() {
		
		return loginDAO.CountList();
	}


}
