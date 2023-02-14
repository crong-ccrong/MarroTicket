package com.marroticket.admin.controller;

import java.util.Calendar;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marroticket.admin.payment.domain.PaymentVO;
import com.marroticket.admin.payment.service.PaymentService;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.common.domain.Pagination;
import com.marroticket.umember.play.domain.PlayVO;
import com.marroticket.umember.reservation.domain.ReservationVO;

@Controller
@RequestMapping("/admin")
@MapperScan(basePackages = "com.marroticket.mapper")
public class AdminController {

	@Autowired
	PaymentService paymentService;

	// 관리자 로그인시 관리자 메인 페이지로 전환
	@GetMapping("")
	public String admin() {
		return "admin";
	}

	// 정산관리목록 출력
	@GetMapping("/paymentList")
	public String list(PageRequest pageRequest, Model model) throws Exception {

		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		String url = "payment/paymentList";

		List<PaymentVO> paymentVOList;
		paymentVOList = paymentService.payment(pageRequest);
		model.addAttribute("paymentList", paymentVOList);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(paymentService.count());
		model.addAttribute("pagination", pagination);
		// }

		return url;
	}

	// 정산 하기 버튼
	@ResponseBody
	@PostMapping("/payment")
	public String payment(int pNumber) throws Exception {

		System.out.println(pNumber);
		String url = "payment/paymentAuthorization";

		PaymentVO payment = new PaymentVO();

		PlayVO play = paymentService.play(pNumber);

		List<ReservationVO> reservationList = paymentService.reservationList(pNumber);

		// 지급 일자 설정
		Calendar closeDay = Calendar.getInstance();
		closeDay.setTime(play.getPcloseDate());
		closeDay.add(Calendar.MONTH, 1);
		closeDay.set(Calendar.DATE, 20);
		payment.setPayPayDate(closeDay.getTime());

		// 총 정산금액 설정
		int totalPay = 0;// 총 정산금액
		for (ReservationVO reservationVO : reservationList) {
			totalPay += reservationVO.getRtotalpayment();
		}
		payment.setPayPayment(totalPay);

		// 극단 정산금액 설정
		int theaterPay = 0;// 극단 정산금액
		for (ReservationVO reservationVO : reservationList) {

			if (reservationVO.getRcancelState() == 0) {
				theaterPay += reservationVO.getRtotalpayment();
				theaterPay = theaterPay - reservationVO.getRfee() * reservationVO.getRticketcount();
			}
		}
		payment.setPayTheaterPayment(theaterPay);

		// 사이트 정산금액 설정
		int sitePay = 0; // 사이트 정산금액
		for (ReservationVO reservationVO : reservationList) {
			sitePay += reservationVO.getRfee() * reservationVO.getRticketcount();
		}
		payment.setPaySitePayment(sitePay);

		// 연극 번호 설정
		payment.setPNumber(pNumber);

		paymentService.paymentcreate(payment);

		return url;
	}

	// 정산 내역
	@GetMapping("/paymentAuthorization")
	public String history(Model model, int pNumber) throws Exception {
		String url = "payment/paymentAuthorization";

		PaymentVO paymentHistory;
		paymentHistory = paymentService.paymentHistory(pNumber);
		model.addAttribute("paymentHistory", paymentHistory);

		return url;
	}
}
