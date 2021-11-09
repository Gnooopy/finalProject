package com.java.test.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.test.domain.MemberVO;

@Repository("MyfeedDAO")
public class MyfeedDAOImpl implements MyfeedDAO  {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertFeed(MemberVO vo) {
		mybatis.insert("MyfeedDAO.insertFeeed",vo);
		
	}

	@Override
	public List<MemberVO> ListFeed(MemberVO vo) {
		System.out.println("다오에 잘들어갔니?"+vo.getUserId());
		

		return mybatis.selectList("MyfeedDAO.ListFeed",vo);
	}

	@Override
	public void deleteFeed(MemberVO vo) {
		System.out.println("다오에 seq1"+ vo.getFeedSeq());
		mybatis.delete("MyfeedDAO.deleteComment",vo);
		System.out.println("다오에 seq2"+ vo.getFeedSeq());
		mybatis.delete("MyfeedDAO.deleteFeed",vo);
		
	}

	@Override
	public MemberVO selectFeed(MemberVO vo) {
		
		return mybatis.selectOne("MyfeedDAO.selectFeed",vo);
	}

	@Override
	public void updateFeed(MemberVO vo) {
		mybatis.update("MyfeedDAO.updateFeed",vo);
		
	}

	@Override
	public void deletPhoto(MemberVO vo) {
		mybatis.update("MyfeedDAO.deletPhoto",vo);
		
	}

	@Override
	public void feedCommentInsert(MemberVO vo) {
		mybatis.insert("MyfeedDAO.feedCommentInsert",vo);
		mybatis.update("MyfeedDAO.commentcnt",vo);
		
		
	}

	@Override
	public List<List<MemberVO>> Listtest(MemberVO vo) {
		System.out.println("다오에 잘들어갔니?"+vo.getUserId());
		
		// 전체 게시글 번호만 가져오는 쿼리
		List<MemberVO> totalSeq = mybatis.selectList("MyfeedDAO.seqSelect",vo);
		List<List<MemberVO>> feedlist = new ArrayList<List<MemberVO>>(); 
		System.out.println(totalSeq.size());
		
		// for( seq 총 갯수만큼 반복 )
		for(int i = 0; i<totalSeq.size(); i++) {
			System.out.println(totalSeq.get(i).getFeedSeq() );
			int str = totalSeq.get(i).getFeedSeq();
			
			//Map<String, Integer> map = new HashMap<String, Integer>();
			
			//map.put("str",str);
			
//			feedlist.add(mybatis.selectList("MyfeedDAO.Listtest", map));
			feedlist.add(mybatis.selectList("MyfeedDAO.Listtest", str));
			System.out.println("End");
		}
		
		
		return feedlist;
	}

	@Override
	public void deleteOneComm(MemberVO vo) {
		mybatis.delete("MyfeedDAO.deleteOneComm",vo);
		mybatis.update("MyfeedDAO.commentcnt",vo);
		
		
	}


	

}
