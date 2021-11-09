package com.java.test.service;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface LoginService {

	public void userInsert(MemberVO vo);

	public MemberVO loginChk(MemberVO vo);
	public MemberVO truckadd(MemberVO vo);


	// -----------------------------------------
	public MemberVO emailChk(MemberVO vo);
	public List<MemberVO> mainList();
	public List<MemberVO> CountList();
	public void userCount(MemberVO vo); 
	

}
