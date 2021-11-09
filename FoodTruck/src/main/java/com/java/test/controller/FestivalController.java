package com.java.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.test.domain.MemberVO;
import com.java.test.service.FestivalService;

@Controller
public class FestivalController {

	@Autowired
	private FestivalService festivalService;

	// 왼쪽 사이드 메뉴바에서 '축제별 푸드트럭' 클릭 시 이동
	// 축제별 푸드트럭 구역 전체 글 조회 (R)
	@RequestMapping(value = "/festival/festivalBoard.do")
	public void festivalBoard(MemberVO vo, Model model) {
		
		List<MemberVO> controlltxt = festivalService.getFestivalList();
		
		for (MemberVO txt : controlltxt) {
			if (txt.getFestivalTitle().length() > 20) {
				String con = txt.getFestivalTitle();
				con = con.substring(0,18) + " ....";
				txt.setFestivalTitle(con);
			}
		}
		model.addAttribute("getFestivalList", controlltxt);
		
		// 댓글 수 카운트
		List<MemberVO> fCommentList = festivalService.getCommentList(vo);
		model.addAttribute("fCommentListSize",fCommentList.size());
	}

	// 축제별 푸드트럭 구역 선택 글 조회(R)
	@RequestMapping(value = "/festival/getFestival.do")
	public void getfestival(MemberVO vo, Model model) {
		System.out.println("Article No : " + vo.getFestivalSeq());
		model.addAttribute("newBoard", festivalService.getFestivalList());
		model.addAttribute("getFestival", festivalService.getFestival(vo));
		
		// 축제별 푸드트럭 게시판 댓글 전체 조회 (R) + 댓글 수 카운트
		List<MemberVO> fComment = festivalService.getCommentList(vo);
		model.addAttribute("fCommentList", fComment);
		model.addAttribute("fCommentSize",fComment.size());
	}

	// 축제별 푸드트럭 구역 글 작성 페이지 이동 (C)
	@RequestMapping(value = "/festival/insertFestival.do")
	public void insertFestival() {

	}

	// 축제별 푸드트럭 구역 작성된 글 저장 (C)
	@RequestMapping(value = "/festival/saveFestival.do")
	public String saveFestival(MemberVO vo, HttpSession session) {
		vo.setFestivalWriter((String) session.getAttribute("userNick"));
		festivalService.insertFestival(vo);
		return "redirect:/festival/festivalBoard.do";
	}
	
	// 축제별 푸드트럭 구역 수정 페이지 이동(U)
	@RequestMapping(value = "/festival/updateFestival.do")
	public void updateFestival(MemberVO vo, Model model) {
		model.addAttribute("festivalSeq", vo.getFestivalSeq());
	}

	// 축제별 푸드트럭 구역 작성된 글 수정(U)
	@RequestMapping(value = "/festival/saveUpdate.do")
	public String saveUpdate(MemberVO vo, Model model) {
		festivalService.updateFestival(vo);
		return "redirect:/festival/getFestival.do?festivalSeq=" + vo.getFestivalSeq();
	}

	// 축제별 푸드트럭 구역 작성된 글 삭제(D)
	@RequestMapping(value = "/festival/deleteFestival.do")
	public String deleteFestival(MemberVO vo) {
		festivalService.deleteFestival(vo);
		return "redirect:/festival/festivalBoard.do";
	}
	
	// #######################################################
	// 축제별 푸드트럭 게시판 댓글 작성 (C)
	@RequestMapping(value = "/festival/insertComment.do")
	public String insertComment(MemberVO vo, HttpSession session) {
		vo.setFcommentWriter((String) session.getAttribute("userNick"));
		festivalService.insertComment(vo);
		return "redirect:/festival/getFestival.do?festivalSeq=" + vo.getFestivalSeq();
	}

	// 축제별 푸드트럭 게시판 댓글 삭제 (D)
	@RequestMapping(value="/festival/deleteComment.do")
	public String deleteComment(MemberVO vo) {
		festivalService.deleteComment(vo);
		return "redirect:/festival/getFestival.do?festivalSeq=" + vo.getFestivalSeq();
	}

}
