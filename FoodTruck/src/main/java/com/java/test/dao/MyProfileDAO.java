package com.java.test.dao;

import javax.servlet.http.HttpSession;

import com.java.test.domain.MemberVO;

public interface MyProfileDAO {
	void inserttruck(MemberVO vo);
	void ChangeInfo(MemberVO vo);
}
