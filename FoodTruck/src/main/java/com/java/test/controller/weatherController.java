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
public class weatherController {

	@Autowired
	private ApplyService applyService;

	@RequestMapping(value="foodTruckZone/weather.do")
	public void weatherPage(Model model) {

		List<MemberVO> arrayList= applyService.weather();
		
		String str1 = "";

		String str2 = "//";
		
		String zoneTitle = "";
		
		
		for (int i = 0; i < arrayList.size(); i++) {
			
			zoneTitle = "\\'"+arrayList.get(i).getApplyTitle()+"\\'";
			
			str1 += "'<div class=\"wrap\" style=\"margin-left: -142px\">";
			str1 += "<div class=\"info\"margin-left:100px\">";
			str1 += "<div class=\"title\">" + arrayList.get(i).getApplyTitle();
			
			str1 += "<div class=\"close\" onclick=\"closeOverlay(" + i + ")\" title=\"닫기\"></div>";
			str1 += "</div>";
			str1 += "<div class=\"body\">";
//			str += "<div class=\"img\">";
//			str += "<img src=\"#\" width=\"73\" height=\"70\">";
			
//			str += "<img src=\"https:"+str2+"cfile181.uf.daum.net/image/250649365602043421936D\" width=\"73\" height=\"70\">";
			
			str1 += "</div>";
			str1 += "<div class=\"desc\">";
			str1 += "<div class=\"ellipsis\">" + arrayList.get(i).getApplyAdd() + "</div>";
			
			str1 += "<div><a href=\"https:" + str2 + arrayList.get(i).getApplyWebAddr()
					+ "class=\"link\">주소 자세히보기</a></div>";
			str1 += "<div><button id=\"reservationButton\" class=\"reservationButton\" onclick=\"click_reservation2("+zoneTitle+")\"></button></div>";
			str1 += "</div>";
			str1 += "</div>";
			str1 += "</div>";
			str1 += "</div>'";
			
			if (i < arrayList.size() - 1) {
				str1 += ",";
				zoneTitle += ",";
			}
			model.addAttribute("divStr1",str1);
		}
		
	}
	
	@RequestMapping(value = "foodTruckZone/chartW.do")
	@ResponseBody
	public List<MemberVO> chartW(MemberVO vo) {
		
		System.out.println("o");
		
		List<MemberVO> chartW = applyService.chartW(vo);

		return chartW;
	}
	
		
}


