package com.java.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.test.domain.MemberVO;
import com.java.test.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	
	 @Autowired
	 private JavaMailSender mailSender;
	 
	
//	@RequestMapping("signIn.do")
//	public String signIn() {
//		return "/login/signIn";
//	}
	
	@RequestMapping(value="login/signUp.do")
	public void signUp() {
		System.out.println("회원가입켜져라");
	}
	
	@RequestMapping(value="login/logOut.do")
	public void logOut() { //로그아웃 버튼 클릭스 
		System.out.println("로그아웃");
	}
	
	@RequestMapping(value="login/signIn.do")
	public String userInsert(MemberVO vo) { //회원가입 후에 로그인 페이지로 넘어가기
		
		
		if(vo.getUserId() == null ) {
			System.out.println("로그인페이지");
			
		}else {
			loginService.userInsert(vo);
			System.out.println("회원가입 진행중!");
		}
		return "/login/signIn"; 
		
		
	
	}
	@RequestMapping(value="mainpage/mainpage.do") 
	 public void mainPage(MemberVO vo , Model model) {
		
		model.addAttribute("mainList",loginService.mainList()); // 글 가져오기
		model.addAttribute("CountList",loginService.CountList()); //방문횟수 가져오기
		 
	  System.out.println("메인페이지");
	  
	 }
	
	@RequestMapping(value="login/LoginChk.do")
	public String LoginChk(MemberVO vo,HttpSession session) {
		MemberVO result  = loginService.loginChk(vo);
		
		if(result != null ) { //로그인성공
			session.setAttribute("userName", result.getUserName());
			session.setAttribute("userId", result.getUserId());
			session.setAttribute("userNick", result.getUserNick());
			session.setAttribute("userEmail", result.getUserEmail());
			session.setAttribute("userPhone", result.getUserPhone());
			session.setAttribute("userPhoto", result.getUserPhoto());
		
			
			
			MemberVO result2  = loginService.truckadd(vo);
			session.setAttribute("userChk", result2.getUserChk());
			session.setAttribute("truckName", result2.getTruckName());
			session.setAttribute("truckNum", result2.getTruckNum());
			
			loginService.userCount(vo); // 로그인할때마다 방문횟수 1 카운터
			System.out.println("로그인 성공");
			return "redirect:../mainpage/mainpage.do";
		}//else if(result == null) {
			//return "/login/LoginChk"; 
			
		//}
		return "/login/LoginChk"; 
	}
	
//	@RequestMapping(value="mainpage/mainpage.do")
//	public String login(MemberVO vo,HttpSession session) {  // 로그인창에서 메인페이지로 넘어가기 
//		MemberVO result  = loginService.loginChk(vo);
//		System.out.println(result);
//		
//		
//		System.out.println("메인페이지가자");
//		return "/login/singIn";
//	}
	
	
	
	@RequestMapping(value="login/pwdFind.do")
	public void pwdFind() {
		System.out.println("비밀번호찾기");
	}
	
	/*
	 * @RequestMapping(value="login/pwdAuth.do") 
	 * public void pwdAuth() {
	 * System.out.println("인증번호 받기"); }
	 */
	
	
	//-------------------------------------------------------------------------------------------------
	
	
	
	  @RequestMapping(value="login/pwdAuth.do") 
	  public ModelAndView pwdAuth(MemberVO vo,HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException { 

		  String userEmail =(String)request.getParameter("userEmail"); //입력한 값들
		  String userId =(String)request.getParameter("userId");
	  
		  MemberVO result = loginService.emailChk(vo); // db값 가져오기 
	  
			  if (result != null || vo.getUserId().equals(userId)) { 
				  session.setAttribute("email", vo.getUserEmail());
				  
				  Random r = new Random(); 
			  	  int num = r.nextInt(999999); //랜덤난수설정
				  	
				  String setfrom = "rhkstns6849@gmail.com"; // naver 
				  String tomail = vo.getUserEmail(); //받는사람
				  String title = "비밀번호변경 인증 이메일 입니다"; 
				  String content = System.getProperty("line.separator") + "안녕하세요 회원님" +
				  System.getProperty("line.separator") + "비밀번호찾기(변경) 인증번호는 " + num +
				  " 입니다." + System.getProperty("line.separator"); //
			  
				  try { 
					  MimeMessage message = mailSender.createMimeMessage(); 
					  MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
				 
					  messageHelper.setFrom(setfrom);
					  messageHelper.setTo(tomail);
					  messageHelper.setSubject(title);
					  messageHelper.setText(content);
				  
					  mailSender.send(message); 
				  } catch (Exception e) {
					  System.out.println(e.getMessage()); 
			  } 
				  ModelAndView mv = new ModelAndView();
				  mv.setViewName("login/pwdAuth");
				  mv.addObject("num", num); 
				  return mv; 
			  }else {
				  ModelAndView mv = new ModelAndView(); 
				  mv.setViewName("login/pwdFind");
				  return mv; 
			  }
			 
	  }
	  
	  //-----------------------------------------------------------------------
	  
	  @RequestMapping(value = "login/pwdSearch.do")
	  public String pwdSearch(MemberVO vo ,HttpServletRequest request,Model model) {   //인증번호와 입력값 비교 후 로그인 비번알려주기
		  String userCode =request.getParameter("userCode"); //입력한 값들
		  String comCode =request.getParameter("comCode");
		  
		  if(userCode.equals(comCode)) {
			  model.addAttribute("pwdSearch",loginService.emailChk(vo));
			  System.out.println(vo.getUserPass());
			  return "login/pwdSearch";
		  }
		  return "login/pwdAuth";
	  }
	
	
	
	  //--------------------------------------------------------------------------
	  @RequestMapping(value="/login/idCheck.do", produces = "application/text; charset=utf8")
		@ResponseBody //화면이 전환되지않고 비동기동신이 가능하도록 하는 어노테이션
		public String idCheck(MemberVO vo) {
		  System.out.println("컨트롤"+vo.getUserId());
			MemberVO resultVO = loginService.loginChk(vo);
			
			
			String text ="";
			if(vo.getUserId() != null) {
				text = "ID";
			}else if(vo.getUserNick() != null) {
				text = "닉네임";
			}else if(vo.getUserEmail() !=null) {
				text = "Email";
			}
			
			String result ="사용가능한 "+text+ " 입니다.";
			if(resultVO != null) result = "중복된 "+text+" 입니다.";
			
			
			return result;
		}
	  //--------------------------------------------------------------------------
	  @RequestMapping(value="/myProfile/idCheck.do", produces = "application/text; charset=utf8")
	  @ResponseBody //화면이 전환되지않고 비동기동신이 가능하도록 하는 어노테이션
	  public String addCheck(MemberVO vo) {
		  System.out.println("컨트롤"+vo.getUserId());
		  MemberVO resultVO = loginService.loginChk(vo);
		 
		  
		  
		  String text ="";
		  if(vo.getUserId() != null) {
			  text = "ID";
		  }else if(vo.getUserNick() != null) {
			  text = "닉네임";
		  }else if(vo.getUserEmail() !=null) {
			  text = "Email";
		  }
		  
		  String result ="사용가능한 "+text+ " 입니다.";
		  if(resultVO != null) result = "중복된 "+text+" 입니다.";
		  
		  
		  return result;
	  }
	  
	  
	
		
		
	
	
	
	
	
	
	
	
	 
	 
	
	/*@RequestMapping(value="/test.do")
	public void test() {
		System.out.println("테스트켜져라");
	}*/
}
