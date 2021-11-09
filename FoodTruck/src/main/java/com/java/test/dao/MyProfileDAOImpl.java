package com.java.test.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("MyProfileDAO")
public class MyProfileDAOImpl  implements MyProfileDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void inserttruck(MemberVO vo) {
			System.out.println("너왔어?");
		mybatis.insert("MyProfileDAO.inserttruck",vo);
			System.out.println("추가했어?");
		mybatis.update("MyProfileDAO.userChk",vo);
			System.out.println("변경했어?");
	}

	@Override
	public void ChangeInfo(MemberVO vo) {
		System.out.println("다오");
		mybatis.update("MyProfileDAO.ChangeInfo",vo);
		System.out.println("다오다녀왔어요");
		
	}	

}
