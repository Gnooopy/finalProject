package com.java.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.test.domain.MemberVO;
import com.java.test.service.ApplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ApplyController {

	@Autowired
	private ApplyService applyService;

	@RequestMapping("apply/truckApply.do")
	public void foodTruckZone3(Model model) {

		List<MemberVO> arrayList = applyService.foodTruckZone3();
		String str = "";
		String str2 = "//";
		String zoneTitle = "";
		
		for (int i = 0; i < arrayList.size(); i++) {
			zoneTitle = "\\'" + arrayList.get(i).getApplyTitle() + "\\'";
			str += "'<div class=\"wrap\" style=\"margin-left: -142px\">";
			str += "<div class=\"info\"margin-left:100px\">";
			str += "<div class=\"title\">" + arrayList.get(i).getApplyTitle();
			str += "<div class=\"close\" onclick=\"closeOverlay(" + i + ")\" title=\"닫기\"></div>";
			str += "</div>";
			str += "<div class=\"body\">";
			str += "</div>";
			str += "<div class=\"desc\">";
			str += "<div class=\"ellipsis\">" + arrayList.get(i).getApplyAdd() + "</div>";
			str += "<div><a href=\"https:" + str2 + arrayList.get(i).getApplyWebAddr()
					+ "class=\"link\">주소 자세히보기</a></div>";
			str += "<div><a href=\"\" class=\"nonline\"><button id=\"reservationButton\" class=\"reservationButton\" onclick=\"click_reservation("
					+ zoneTitle + ")\">예약하기</a></button></div>";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "</div>'";

			if (i < arrayList.size() - 1) {
				str += ",";
				zoneTitle += ",";
			}
			model.addAttribute("divStr", str);
		}

	}

	
	
	@RequestMapping(value = "apply/chartC.do")
	@ResponseBody		// 화면 바뀌지 않게 컨트롤돌리기
	public List<MemberVO> chartC(MemberVO vo) {

		System.out.println("ㅇ?");
		System.out.println(vo.getReservationMarkZone());
		
		List<MemberVO> chartC = applyService.chartC(vo);

		return chartC;
	}
}
