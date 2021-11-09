package com.java.test.service;

import java.util.List;

import com.java.test.domain.MemberVO;

public interface ApplyService {
	
	void insertReservation(MemberVO vo);
	
	List<MemberVO> foodTruckZone3();
	
	List<MemberVO> weather();
	
	List<MemberVO> chartC(MemberVO vo);
	
	List<MemberVO> chartW(MemberVO vo);
}
