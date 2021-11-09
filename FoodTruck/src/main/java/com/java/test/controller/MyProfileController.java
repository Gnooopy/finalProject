package com.java.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.test.domain.MemberVO;
import com.java.test.service.LoginService;
import com.java.test.service.MyProfileService;

@Controller
public class MyProfileController {

	@Autowired
	private MyProfileService myProfileService;
	@Autowired
	private LoginService loginService;
	
	// 프로필 편집 들어가는 컨트롤러
	@RequestMapping(value="myProfile/myProfile.do")
	public void myProfile() {
		
		
	}
	// 내 프로필 들어가는 컨트롤러
	@RequestMapping(value="myProfile/myProfileEdit.do")
	public void myProfileEdit() {
		
	}
	
	
	// 업체등록하러가기 컨트롤러
	@RequestMapping(value="myProfile/businessPopup.do")
	public void business() {

		
	}
	
	//업체등록 인설트문
	@RequestMapping(value="inserttruck.do")
	public String inserttruck(MemberVO vo,HttpSession session) {
		System.out.println("제발와줘" + vo.getUserId());
		myProfileService.inserttruck(vo);
		MemberVO result  = loginService.loginChk(vo);
		session.setAttribute("userChk", result.getUserChk());
		
		
		session.setAttribute("userChk", result.getUserChk());
		session.setAttribute("truckName", result.getTruckName());
		session.setAttribute("truckNum", result.getTruckNum());
		return "redirect:myProfile/myProfile.do";
	}
	
	@RequestMapping(value="ChangeInfo.do")
	public String ChangeInfo(MemberVO vo ,HttpSession session) {
		System.out.println("아이디"+vo.getUserId());
		System.out.println("전화번호"+vo.getUserPhone());
		System.out.println("닉네임"+vo.getUserNick());
		System.out.println("이멩ㄹ"+vo.getUserEmail());
		System.out.println("이멩ㄹ"+vo.getUserPhoto());
		
		myProfileService.ChangeInfo(vo);
		MemberVO result2  = loginService.truckadd(vo);
		session.setAttribute("userNick", result2.getUserNick());
		session.setAttribute("userEmail", result2.getUserEmail());
		session.setAttribute("userPhone", result2.getUserPhone());
		session.setAttribute("userPhoto", result2.getUserPhoto());
		
		return "redirect:/myProfile/myProfile.do";
	}
	
}











