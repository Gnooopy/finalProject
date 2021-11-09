package com.java.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.test.dao.ApplyDAO;
import com.java.test.domain.MemberVO;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	private ApplyDAO applyDAO;

	@Override
	public List<MemberVO> foodTruckZone3() {
		return applyDAO.foodTruckZone3();
	}

	@Override
	public void insertReservation(MemberVO vo) {
		applyDAO.insertReservation(vo);
	}

	@Override
	public List<MemberVO> weather() {
		// TODO Auto-generated method stub
		return applyDAO.weather();
	}

	@Override
	public List<MemberVO> chartC(MemberVO vo) {
		// TODO Auto-generated method stub
		return applyDAO.chartC(vo);
	}

	@Override
	public List<MemberVO> chartW(MemberVO vo) {
		// TODO Auto-generated method stub
		return applyDAO.chartW(vo);
	}

	
	

	
}
