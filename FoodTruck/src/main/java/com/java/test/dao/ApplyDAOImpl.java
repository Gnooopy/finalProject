package com.java.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.test.domain.MemberVO;

@Repository("applyDAO")
public class ApplyDAOImpl implements ApplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<MemberVO> foodTruckZone3() {
		return mybatis.selectList("ApplyDAO.foodTruckZone3");
	}

	@Override
	public void insertReservation(MemberVO vo) {
		mybatis.insert("ApplyDAO.insertReservation", vo);
	}

	@Override
	public List<MemberVO> weather() {
		// TODO Auto-generated method stub
		return mybatis.selectList("ApplyDAO.weather");
	}

	@Override
	public List<MemberVO> chartC(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ApplyDAO.chartC", vo);
	}

	@Override
	public List<MemberVO> chartW(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ApplyDAO.chartW", vo);
	}

	

}
