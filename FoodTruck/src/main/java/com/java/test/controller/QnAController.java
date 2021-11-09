package com.java.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.test.domain.MemberVO;
import com.java.test.service.QnAService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/QnA")
public class QnAController {

	@Autowired
	private QnAService qnaService;

	// QnA 페이지
	@RequestMapping("/pages-faqQ&A.do")
	public void getQnAList(Model model) {
		// System.out.println("pages-faqQ&A 출발");
		
		model.addAttribute("QnAList", qnaService.getQnAList());
		
	}

	
	// QnA 페이지 글쓰기
	@RequestMapping("insert.do")
	public String pageMoveQnA(MemberVO vo) {

		qnaService.insertQnA(vo);

		return "redirect:/QnA/pages-faqQ&A.do";

	}

	
	// QnA 페이지 글쓰기 페이지
	@RequestMapping("/insertQ&A.do")
	public ModelAndView insertQnA() {

//	  System.out.println("insertQ&A 출발");

		ModelAndView mv2 = new ModelAndView();

		mv2.setViewName("/QnA/insertQ&A");

		return mv2;
	}
	
	// QnA 페이지 게시판 삭제
	@RequestMapping("/deleteQnA.do")
	public String deleteQnA(MemberVO vo) {
		qnaService.deleteQnA(vo);
		return "redirect:/QnA/pages-faqQ&A.do";
	}

	
	// QnA 페이지 게시판 수정   
	@RequestMapping("/updateQnA.do")
	public String updateQnA(MemberVO vo) {
		System.out.println("잘넘어왔니?"+vo.getQnaSeq());
		qnaService.updateQnA(vo);
		return "redirect:/QnA/pages-faqQ&A.do";
	}
	
	// QnA 페이지 글수정 페이지
	@RequestMapping("/getQ&A.do")
	public void getQnA(MemberVO vo, Model model) {
		
		System.out.println("타이틀 잘 넘어오니?"+vo.getQnaSeq());
		
		model.addAttribute("member",qnaService.getQnA(vo));
	}
	
////	insertQ&AComment
//	// QnA 페이지 답장
//	@RequestMapping("/insertQ&AComment.do")
//	public ModelAndView insertQnAComment() {
//
//	  System.out.println("insertQnAComment 답장 출발");
//
//		ModelAndView mv2 = new ModelAndView();
//
//		mv2.setViewName("/QnA/insertQ&AComment");
//
//		return mv2;
//	}
	
	
	
		// QnA 페이지 답장
		@RequestMapping("/insertQ&AComment.do")
		public String insertQnAComment(MemberVO vo) {

//			System.out.println("댓글 넘어오니?"+vo.getQnaComment());
//			System.out.println("시컨스 넘어오니?"+vo.getQnaSeq());
			qnaService.insertQnAComment(vo);
//			System.out.println("댓글 넘어오니?"+vo.getQnaComment());
//			System.out.println("시컨스 넘어오니?"+vo.getQnaSeq());

			return "redirect:/QnA/pages-faqQ&A.do";

		}
		// QnA 페이지 게시판 수정   
//		@RequestMapping("/updateQnA.do")
//		public String updateQnA(MemberVO vo) {
//			System.out.println("잘넘어왔니?"+vo.getQnaSeq());
//			qnaService.updateQnA(vo);
//			return "redirect:/QnA/pages-faqQ&A.do";
//		}
	
	
	
//	----------------------------------------------------------------
	
	
	
	// 공공기관 협엽 페이지
	
	@RequestMapping("/pages-faqBall.do")
	public void getBallList(Model model) {
		// System.out.println("pages-faqQ&A 출발");
		model.addAttribute("BallList", qnaService.getBallList());
		
	}

	
	// 공공기관 협엽 페이지 글쓰기 페이지
	@RequestMapping("/insertBall.do")
	public ModelAndView insertBall() {

		ModelAndView ball2 = new ModelAndView();
		
//		System.out.println("공공기관 협엽 글쓰기 페이지로 이동");

		ball2.setViewName("/QnA/insertBall");

		return ball2;
	}
	
	// 공공기관 협엽 페이지 글 넘기기
		@RequestMapping("insertB.do")
		public String pageMoveQnABall(MemberVO vo) {

			qnaService.insertBall(vo);
			
//			System.out.println("공공기관 글쓰기 값 이동@");
			
			return "redirect:/QnA/pages-faqBall.do";
		}
	
		
		
		// 공공기관 협엽 페이지 게시판 삭제
		@RequestMapping("/deleteBall.do")
		public String deleteBall(MemberVO vo) {
//			System.out.println("삭제할게없냐?"+vo.getBallSeq());
			qnaService.deleteBall(vo);
			return "redirect:/QnA/pages-faqBall.do";
		}

		
		// 공공기관 협엽 페이지 게시판 수정   
		@RequestMapping("/updateBall.do")
		public String updateBall(MemberVO vo) {
//			System.out.println("잘넘어왔니?"+vo.getBallSeq());
			qnaService.updateBall(vo);
			return "redirect:/QnA/pages-faqBall.do";
		}
		
		// 공공기관 협엽 페이지 글수정 페이지
		@RequestMapping("/getBall.do")
		public void getBall(MemberVO vo, Model model) {
			
//			System.out.println("타이틀 잘 넘어오니?"+vo.getBallSeq());
			
			model.addAttribute("member",qnaService.getBall(vo));
		}
		
		
		
		
			// QnA 페이지 답장
			@RequestMapping("/insertBallComment.do")
			public String insertBallComment(MemberVO vo) {

//				System.out.println("댓글 넘어오니?"+vo.getQnaComment());
//				System.out.println("시컨스 넘어오니?"+vo.getQnaSeq());
				qnaService.insertBallComment(vo);
//				System.out.println("댓글 넘어오니?"+vo.getQnaComment());
//				System.out.println("시컨스 넘어오니?"+vo.getQnaSeq());

				return "redirect:/QnA/pages-faqBall.do";

			}
		
		
		
		
		
		
		
		
		
		
		// ------------------------------------------------------------------------
		
		// 홍보,협찬 게시판 열기
		@RequestMapping("/pages-faqPromotion.do")
		public void getPromotionList(Model model) {
//			System.out.println("너 실행되니?");
			model.addAttribute("PromotionList", qnaService.getPromotionList());
			
		}
		
		// 홍보,협찬 글쓰기 게시판 열기 		
		@RequestMapping("/insertPromotion.do")
		public ModelAndView insertPromotion() {

			ModelAndView Promotion = new ModelAndView();
			
//			System.out.println("홍보,협찬 글쓰기  페이지로 이동");

			Promotion.setViewName("/QnA/insertPromotion");

			return Promotion;
		}
		
		// 홍보,협찬 글쓰기 게시판 값넘기기 
		@RequestMapping("insertC.do")
		public String pageMoveQnAPromotion(MemberVO vo) {

			qnaService.insertPromotion(vo);
			
//			System.out.println("홍보,협찬 글쓰기  값 이동@");
			
			return "redirect:/QnA/pages-faqPromotion.do";
		}
		
		// 홍보,협찬 페이지 게시판 삭제
		@RequestMapping("/deletePromotion.do")
		public String deletePromotion(MemberVO vo) {
//					System.out.println("삭제할게없냐?"+vo.getPromotionSeq());
			qnaService.deletePromotion(vo);
			return "redirect:/QnA/pages-faqPromotion.do";
		}

		
		// 홍보,협찬 페이지 게시판 수정   
		@RequestMapping("/updatePromotion.do")
		public String updatePromotion(MemberVO vo) {
//					System.out.println("잘넘어왔니?"+vo.getPromotionSeq());
			qnaService.updatePromotion(vo);
			return "redirect:/QnA/pages-faqPromotion.do";
		}
		
		// 홍보,협찬 페이지 글수정 페이지
		@RequestMapping("/getPromotion.do")
		public void getPromotion(MemberVO vo, Model model) {
			
//					System.out.println("타이틀 잘 넘어오니?"+vo.getPromotionSeq());
			
			model.addAttribute("member",qnaService.getPromotion(vo));
		}
		
		
		// Promotion 페이지 답장
			@RequestMapping("/insertPromotionComment.do")
			public String insertPromotionComment(MemberVO vo) {
				System.out.println("댓글 넘어오니?"+vo.getPromotionContent());
				System.out.println("시컨스 넘어오니?"+vo.getPromotionseq());
				qnaService.insertPromotionComment(vo);
//				System.out.println("댓글 넘어오니?"+vo.getPromotionContent());
//				System.out.println("시컨스 넘어오니?"+vo.getPromotionseq());
				return "redirect:/QnA/pages-faqPromotion.do";

			}

		
		
		
		
		
		
		
		
		
	

}
