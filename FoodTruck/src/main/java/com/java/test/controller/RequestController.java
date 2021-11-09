package com.java.test.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.test.domain.MemberVO;
import com.java.test.service.TruckRequestService;

@Controller
public class RequestController {

	@Autowired
	private TruckRequestService truckRequestService;

	// Controller에서 RequestMapping(value = "url") : 실제 url에 적히는 주소
	// Controller에서 return에 주소는
	// redirect사용하는 경우 : .do 사용
	// redirect사용하지 않는 경우 : /WEB-INF/views/의 views폴더가 시작점으로 해당 폴더 경로(.do X)

	// 각 페이지 .do 설정 : 해당 파일을 기준으로 이동하려는 페이지의 파일 주소
	// -> Controller 파일에서 Mapping주소인 value은 실제 url에 적히는 주소를 입력하고
	// 각 페이지에서 .do 주소를 설정할 때는 그 해당 파일을 기준으로 이동하려는 페이지의 파일 주소를 입력 -> 약간 상대경로 느낌이야

	// 첫 화면부터 메인페이지 + 상단 로고 클릭하면 메인페이지 이동
	@RequestMapping(value = "/TruckRequest/index.do")
	public void goMain() {

	}

	// #############################################################################

	// 왼쪽 사이드바에서 푸드트럭 모집 게시판 이동
	// 푸드트럭 요청 게시판에서 전체 게시글 보기 (R)
	@RequestMapping(value = "/TruckRequest/TruckRecruit.do")
	public void truckRecruit(Model model) {
		List<MemberVO> controlltxt2 = truckRequestService.getRecruitList();
		
		for(MemberVO txt : controlltxt2) {
			if(txt.getRecruitTitle().length() > 13) {
				String con = txt.getRecruitTitle();
				con = con.substring(0,11) + " ....";
				txt.setRecruitTitle(con);
			}
			
			if(txt.getRecruitLocation().length() > 15) {
				String con = txt.getRecruitLocation();
				con = con.substring(0,13) + " ....";
				txt.setRecruitLocation(con);
			}
			
			if(txt.getRecruitContent().length() > 54) {
				String con = txt.getRecruitContent();
				con = con.substring(0,52) + " ....";
				txt.setRecruitContent(con);
			}
		}
		model.addAttribute("recruitList", controlltxt2);
	}

	// 푸드트럭 모집 게시판에서 선택한 게시글 보기 (R)
	@RequestMapping(value = "/TruckRequest/GetArticle2.do")
	public void getRecruit(MemberVO vo, Model model) {
		System.out.println("TEXT NO : " + vo.getRecruitSeq());
		model.addAttribute("getrecruit", truckRequestService.getRecruit(vo));

		List<MemberVO> commentRecruit = truckRequestService.getCommentList2(vo);
		model.addAttribute("commentList2", commentRecruit);
		model.addAttribute("commentSize2", commentRecruit.size());
	}

	// 푸드트럭 모집 게시판에서 게시글 작성 (C)
	@RequestMapping(value = "/TruckRequest/InsertArticle.do")
	public String insertRecruit(MemberVO vo, HttpSession session) throws IOException {
		vo.setRecruitWriter((String) session.getAttribute("userNick"));
		truckRequestService.insertRecruit(vo);
		return "redirect:/TruckRequest/TruckRecruit.do";
	}

	// 푸드트럭 모집 게시판에서 게시글 수정 (U)
	@RequestMapping(value = "/TruckRequest/UpdateArticle2.do")
	public void updateRecruit(MemberVO vo, Model model) {
		model.addAttribute("recruitSeq", vo.getRecruitSeq());
	}

	@RequestMapping(value = "/TruckRequest/UpdateSave2.do")
	public String saveRecruit(MemberVO vo, Model model) {
		truckRequestService.updateRecruit(vo);
		return "redirect:/TruckRequest/GetArticle2.do?recruitSeq=" + vo.getRecruitSeq();
	}

	// 푸드트럭 모집 게시판에서 게시글 삭제 (D)
	@RequestMapping(value = "/TruckRequest/deleteArticle2.do")
	public String deleteRecruit(MemberVO vo) {
		truckRequestService.deleteRecruit(vo);
		return "redirect:/TruckRequest/TruckRecruit.do";
	}

	// #############################################################################

	// 왼쪽 사이드바에서 푸드트럭 요청 게시판 이동
	// 푸드트럭 요청 게시판에서 전체 게시글 보기 (R)
	@RequestMapping(value = "/TruckRequest/TruckRequest.do")
	public void truckRequest(MemberVO vo, Model model) {
		List<MemberVO> controlltxt = truckRequestService.getRequestList();
		
		for(MemberVO txt : controlltxt) {
			if(txt.getRequestTitle().length() > 13) {
				String con = txt.getRequestTitle();
				con = con.substring(0,11) + " ....";
				txt.setRequestTitle(con);
			}
			
			if(txt.getRequestLocation().length() > 15) {
				String con = txt.getRequestLocation();
				con = con.substring(0,13) + " ....";
				txt.setRequestLocation(con);
			}
			
			if(txt.getRequestContent().length() > 54) {
				String con = txt.getRequestContent();
				con = con.substring(0,52) + " ....";
				txt.setRequestContent(con);
			}
		}
		model.addAttribute("requestList", controlltxt);
	}

	// 푸드트럭 요청 게시판에서 선택한 게시글 보기 (R)
	@RequestMapping(value = "/TruckRequest/GetArticle.do")
	public void getRequest(MemberVO vo, Model model) {
		System.out.println("Text NO : " + vo.getRequestSeq());
		model.addAttribute("request", truckRequestService.getRequest(vo));

		List<MemberVO> commentRequest = truckRequestService.getCommentList(vo);

		model.addAttribute("commentList", commentRequest);
		// 댓글 수 카운트
		model.addAttribute("commentSize", commentRequest.size());
	}

	// 푸드트럭 요청 게시판에서 게시글 작성 (C)
	@RequestMapping(value = "/TruckRequest/TruckRequest2.do")
	public String insertRequest(MemberVO vo, HttpSession session) throws IOException {
		// 객체로 둥둥떠다니는 세션을 잡아오기 (getAttribute는 객체니까 String 무조건쓰기)
		vo.setRequestWriter((String) session.getAttribute("userNick"));
		truckRequestService.insertRequest(vo);
		return "redirect:/TruckRequest/TruckRequest.do";
	}

	// 푸드트럭 요청 게시판에서 게시글 수정 (U)
	@RequestMapping(value = "/TruckRequest/UpdateArticle.do")
	public void updateRequest(MemberVO vo, Model model) {
		// seq를 읽어오기위한 문장
		model.addAttribute("requestSeq", vo.getRequestSeq());
	}

	@RequestMapping(value = "/TruckRequest/UpdateSave.do")
	public String updateSave(MemberVO vo) {
		truckRequestService.updateRequest(vo);
		return "redirect:/TruckRequest/GetArticle.do?requestSeq=" + vo.getRequestSeq();
	}

	// 푸드트럭 요청 게시판에서 게시글 삭제 (D)
	@RequestMapping(value = "/TruckRequest/deleteArticle.do")
	public String deleteRequest(MemberVO vo) {
		truckRequestService.deleteRequest(vo);
		return "redirect:/TruckRequest/TruckRequest.do";
	}

	// ##############################################################################

	// 푸드트럭 요청 게시글 댓글 작성(C)
	@RequestMapping(value = "/TruckRequest/insertComment.do")
	public String insertComment(MemberVO vo, HttpSession session) {
		vo.setCommentWriter((String) session.getAttribute("userNick"));
		truckRequestService.insertComment(vo);
		return "redirect:/TruckRequest/GetArticle.do?requestSeq=" + vo.getRequestSeq();
	}

	// 푸드트럭 요청 게시글 댓글 삭제(D)
	@RequestMapping(value = "/TruckRequest/deleteComment.do")
	public String deleteComment(MemberVO vo) {
		truckRequestService.deleteComment(vo);
		return "redirect:/TruckRequest/GetArticle.do?requestSeq=" + vo.getRequestSeq();
	}

	// ##############################################################################

	// 푸드트럭 모집 게시글 댓글 작성(C)
	@RequestMapping(value = "/TruckRequest/insertComment2.do")
	public String insertComment2(MemberVO vo, HttpSession session) {
		vo.setRecruitcmtWriter((String) session.getAttribute("userNick"));
		truckRequestService.insertComment2(vo);
		return "redirect:/TruckRequest/GetArticle2.do?recruitSeq=" + vo.getRecruitSeq();
	}

	// 푸드트럭 모집 게시글 댓글 삭제(D)
	@RequestMapping(value = "/TruckRequest/deleteComment2.do")
	public String deleteComment2(MemberVO vo) {
		truckRequestService.deleteComment2(vo);
		return "redirect:/TruckRequest/GetArticle2.do?recruitSeq=" + vo.getRecruitSeq();
	}

	// ##############################################################################
	@RequestMapping(value = "/TruckRequest/introTruck.do")
	public void goIntroTruck(Model model) {
		model.addAttribute("goIntroTruck",truckRequestService.goIntroTruck()) ;
	}
}
