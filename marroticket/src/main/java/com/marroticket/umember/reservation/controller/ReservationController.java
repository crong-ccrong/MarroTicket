package com.marroticket.umember.reservation.controller;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marroticket.umember.play.domain.PlayVO;
import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;
import com.marroticket.umember.reservation.service.ReservationService;

@Controller
@RequestMapping("/reserve")
public class ReservationController {

	@Autowired
	private ReservationService service;

	// 공연 회차 정보
	@PostMapping("/schedule")
	public ResponseEntity<Map<String, Integer>> schedule(@RequestBody PlayVO vo, String date) throws Exception {
		System.out.println(vo.toString());
		
		System.out.println("예매일 : "+date);

		List<SeatVO> firstPlayReserveList = null;// 1회차 List
		List<SeatVO> secondPlayReserveList = null;// 2회차 List
		Map<String, Integer> remainSeat = new HashMap<>();
		int countfirstPlayReserve = 0; // 예약된 1회차 좌석 개수
		int countSecondPlayReserve = 0; // 예약된 2회차 좌석 개수

		// 1회차 잔여 좌석 count
		firstPlayReserveList = getReserveList(getTicketNum(date, vo.getPnumber(), 1, ""));
		if (firstPlayReserveList == null) {
			countfirstPlayReserve = 0;
		} else {
			countfirstPlayReserve = countNonNullStringFields(firstPlayReserveList);
			System.out.println("예약된 좌석수 1회차 : " + countfirstPlayReserve);
		}

		// 2회차 잔여 좌석 count
		if (vo.getPsecondStartTime().equals("없음")) {
			remainSeat.put("first", Integer.parseInt(vo.getPseatNumber()) - countfirstPlayReserve);
			remainSeat.put("second", 100);
			return new ResponseEntity<>(remainSeat, HttpStatus.OK);
		} else {
			secondPlayReserveList = getReserveList(getTicketNum(date, vo.getPnumber(), 2, ""));
			if (secondPlayReserveList == null) {
				countSecondPlayReserve = 0;
			} else {
				countSecondPlayReserve = countNonNullStringFields(secondPlayReserveList);
				System.out.println("예약된 좌석수 2회차 : " + countSecondPlayReserve);
			}
		}

		// Map에 담기
		remainSeat.put("first", Integer.parseInt(vo.getPseatNumber()) - countfirstPlayReserve);
		remainSeat.put("second", Integer.parseInt(vo.getPseatNumber()) - countSecondPlayReserve);

		ResponseEntity<Map<String, Integer>> entity = new ResponseEntity<>(remainSeat, HttpStatus.OK);

		return entity;
	}

	//@PreAuthorize("isAnonymous() or hasRole('ROLE_UMEMBER')")
	@PreAuthorize("hasRole('ROLE_UMEMBER')")
	@PostMapping("/book")
	public String book(ReservationVO vo) {
		System.out.println("호출");
		System.out.println("pnumber : "+vo.getPnumber());
		System.out.println("pticketPrice : "+vo.getPticketPrice());
		System.out.println("pfirstStartTime"+vo.getPfirstStartTime());
		System.out.println("psecondStartTime"+vo.getPsecondStartTime());
		System.out.println("pturn : "+vo.getPturn());
		System.out.println("pdate  : "+vo.getPdate());
		
		return "redirect:/";
	}

	@PostMapping("/checkSeatAvailability")
	public ResponseEntity<Boolean> checkSeatAvailability(@RequestBody String seatName) {
		// Check if the seat is already reserved
		System.out.println(seatName);
		boolean isReserved = isSeatReserved(seatName);
		return new ResponseEntity<Boolean>(isReserved, HttpStatus.OK);
	}

	private boolean isSeatReserved(String seatName) {
		// seat테이블에는 공연번호, 날짜, 회차, 좌석1, 2, 3, ..., 100이 컬럼으로 존재.
		// 공연을 등록하면, 모든 컬럼이 조건에 맞게 채워짐. 그리고 예매가 된 좌석 n 컬럼에 "_ok"문자열이 추가.
		// 예매가 된 좌석인지 조회하는 select문에서 좌석번호_ok가 있는 지 조회. 해당 좌석에 _ok가 없으면 예매가능
		// select * from seat where p_number = ...
		return false;
	}

	// 티켓번호 생성
	private String getTicketNum(String playDate, int pnumber, int turn, String seatInfo) {
		// 티켓번호 == yyyymmdd + p_number + 회차 + 좌석정보(ex-(min)a1, a2, ... , (max)p6 )
		return playDate + pnumber + turn + seatInfo;
	}

	// 예매 리스트 생성
	private List<SeatVO> getReserveList(String ticketNum) throws Exception {
		List<SeatVO> reserveList = service.list(ticketNum);
		return reserveList;
	}

	// 잔여 좌석 카운트
	private int countNonNullStringFields(List<SeatVO> objects) {
		int count = 0;
		for (Object obj : objects) {
			for (Field field : obj.getClass().getDeclaredFields()) {
				field.setAccessible(true);
				try {
					if (field.getType() == String.class && field.get(obj) != null) {
						count++;
					}
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
}