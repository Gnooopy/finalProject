package com.java.test.dao;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface LoginDAO {

	void userInsert(MemberVO vo);

	MemberVO loginChk(MemberVO vo);
	MemberVO truckadd(MemberVO vo);

	// ------------------------------------
	MemberVO emailChk(MemberVO vo);
	List<MemberVO> mainList();
	List<MemberVO> CountList();
	
	void userCount(MemberVO vo);
}
