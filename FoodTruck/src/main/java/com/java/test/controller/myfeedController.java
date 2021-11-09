package com.java.test.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.test.domain.MemberVO;
import com.java.test.service.LoginService;
import com.java.test.service.MyfeedService;

@Controller

public class myfeedController {
	
	@Autowired
	private MyfeedService myfeedService;

	@Autowired
	private LoginService loginService;
	
	/*

	public void ListFeed(MemberVO vo,Model model,HttpSession session) {
		String SeUserId = (String)session.getAttribute("userId"); //로그인된 아이디 
		System.out.println("파라메터 잘왔니?"+SeUserId);
		vo.setUserId(SeUserId);
		System.out.println("vo에 잘들어갔니?"+vo.getUserId());
		
		
		model.addAttribute("ListFeed",myfeedService.ListFeed(vo));
		
		
	}
	*/
	@RequestMapping(value="myfeed/feed.do")
	public String myfeed(MemberVO vo,Model model,HttpSession session) {
		String SeUserId = (String)session.getAttribute("userId"); //로그인된 아이디 
		String SeUserNick = (String)session.getAttribute("userNick"); //로그인된 닉네임 
		String SeUserPhoto = (String)session.getAttribute("userPhoto"); //로그인된 사진
		
		session.setAttribute("feedNick", SeUserNick);
		session.setAttribute("feedPhoto", SeUserPhoto);
			System.out.println("파라메터 잘왔니?"+SeUserId);
		vo.setUserId(SeUserId);
			System.out.println("vo에 잘들어갔니?"+vo.getUserId());
		model.addAttribute("ListFeed",myfeedService.Listtest(vo));
		return "myfeed/myfeed";
	}
	
	
	@RequestMapping(value="myfeed/myfeed.do")
	public void Listtest(MemberVO vo,Model model,HttpSession session) {


		
		if(vo.getUserNick() != null ) { //남의 피드 들어갈때 
				System.out.println("닉네임 잘들어왔어?" + vo.getUserNick());
				session.setAttribute("feedNick", vo.getUserNick());
				
			MemberVO resultVO = loginService.loginChk(vo); //닉네임를 가지고 아이디 가져오기
			System.out.println("@@@@@@@@@@@"+resultVO.getUserPhoto());
			session.setAttribute("feedPhoto", resultVO.getUserPhoto());
				System.out.println("아이디 잘왔어?"+ resultVO.getUserId());
				vo.setUserId(resultVO.getUserId());
				
			model.addAttribute("ListFeed",myfeedService.Listtest(vo));
			
		
		}else if(session.getAttribute("feedNick") !=null ) {
			String SefeedNick = (String)session.getAttribute("feedNick");  
			vo.setUserNick(SefeedNick);
			MemberVO resultVO = loginService.loginChk(vo); //닉네임를 가지고 아이디 가져오기
			session.setAttribute("feedPhoto", resultVO.getUserPhoto());
			vo.setUserId(resultVO.getUserId());
			model.addAttribute("ListFeed",myfeedService.Listtest(vo));
	
		}
		
		
		
		

		
	}
	
	@RequestMapping(value="/insertFeed.do")
	public String insertFeed(MemberVO vo) throws IOException{
		System.out.println("들어왔니?");
		System.out.println("사진어때?"+ vo.getFeedContent_photo());
		
		myfeedService.insertFeed(vo);
	
		
		return "redirect:myfeed/myfeed.do";
	} 

	/*
	 * @RequestMapping(value="test.do") public void test() {
	 * System.out.println("테스트켜져라"); }
	 */
	
	@RequestMapping(value="/deleteFeed.do")
	public String deleteFeed(Integer feedSeq,MemberVO vo) {
		
		System.out.println(feedSeq);
		System.out.println("댓글seq"+vo.getCommentSeq());
		System.out.println("게시글seq"+vo.getFeedSeq());
		myfeedService.deleteFeed(vo);
		return "redirect:myfeed/myfeed.do";
	}
	
	@RequestMapping(value="/deleteOneComm.do")  
	public String deleteOneComm(MemberVO vo) {  //댓글 삭제
		
		System.out.println("댓글seq"+vo.getCommentSeq());
		System.out.println("게시글seq"+vo.getFeedSeq());
		myfeedService.deleteOneComm(vo);
		return "redirect:myfeed/myfeed.do";
	}
	
	@RequestMapping(value="/myfeed/selectFeed.do")
	public void selectFeed(Integer feedSeq,MemberVO vo,Model model) {
		System.out.println(feedSeq);
		model.addAttribute("selectFeed",myfeedService.selectFeed(vo));
		
		
	}
	
	@RequestMapping(value="/updateFeed.do")
	public String updateFeed(MemberVO vo) {
		System.out.println("업데이트seq"+vo.getFeedSeq());
		System.out.println("업데이트내용"+vo.getFeedContent());
		System.out.println("업데이트사진"+vo.getFeedContent_photo());
		myfeedService.updateFeed(vo);
		
		return "redirect:myfeed/myfeed.do";
	}
	
	@RequestMapping(value="/deletPhoto.do")
	public String deletPhoto(MemberVO vo) {
		myfeedService.deletPhoto(vo);
		return "redirect:myfeed/selectFeed.do?feedSeq="+vo.getFeedSeq();
	}
	
	@RequestMapping(value="/feedcomment.do"  )
	public String feedCommentInsert(MemberVO vo) {
		System.out.println("댓글추가seq"+vo.getFeedSeq());
		System.out.println("댓글추가아이디"+vo.getUserId());
		System.out.println("댓글내용"+vo.getCommentCont());
		myfeedService.feedCommentInsert(vo);
     
		return "redirect:myfeed/myfeed.do";
	}
}
