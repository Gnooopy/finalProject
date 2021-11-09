package com.java.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.test.domain.MemberVO;
import com.java.test.service.ApplyService;

@Controller
public class ReservationController {
	
	@Autowired
	private ApplyService applyService;

	@RequestMapping("apply/truckReservation.do")
	public String foodTruckZone() {

		return "/apply/truckReservation";
	}

	@RequestMapping("apply/insertReservation.do")
	public String insertReservation(MemberVO vo) {
//		System.out.println("1");
		System.out.println(vo.getReservationMarkZone());
		applyService.insertReservation(vo);
//		System.out.println("2");
		
		return "/apply/truckApply";
		
	}

}
