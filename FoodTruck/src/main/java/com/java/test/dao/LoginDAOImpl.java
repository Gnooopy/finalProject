package com.java.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void userInsert(MemberVO vo) {
		mybatis.insert("LoginDAO.userInsert", vo);

	}

	@Override
	public MemberVO loginChk(MemberVO vo) {
		return mybatis.selectOne("LoginDAO.loginChk", vo);

	}

	// --------------------------------------------------
	@Override
	public MemberVO emailChk(MemberVO vo) {
		return mybatis.selectOne("LoginDAO.emailChk", vo);
	}

	@Override
	public MemberVO truckadd(MemberVO vo) {
		
		return mybatis.selectOne("LoginDAO.truckadd",vo);
	}

	@Override
	public List<MemberVO> mainList() {
		return mybatis.selectList("LoginDAO.mainList");
		
	}

	@Override
	public void userCount(MemberVO vo) {
		mybatis.update("LoginDAO.userCount",vo);
		
	}

	@Override
	public List<MemberVO> CountList() {
		
		return mybatis.selectList("LoginDAO.CountList");
	}

	
	
}
