package com.marroticket.umember.reservation.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
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

		System.out.println("예매일 : " + date);

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
			countfirstPlayReserve = countReserveSeatNum(firstPlayReserveList);
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
				countSecondPlayReserve = countReserveSeatNum(secondPlayReserveList);
				System.out.println("예약된 좌석수 2회차 : " + countSecondPlayReserve);
			}
		}

		// Map에 담기
		remainSeat.put("first", Integer.parseInt(vo.getPseatNumber()) - countfirstPlayReserve);
		remainSeat.put("second", Integer.parseInt(vo.getPseatNumber()) - countSecondPlayReserve);

		ResponseEntity<Map<String, Integer>> entity = new ResponseEntity<>(remainSeat, HttpStatus.OK);

		return entity;
	}

	@PreAuthorize("hasRole('ROLE_UMEMBER')")
	@PostMapping("/book")
	public String book(ReservationVO vo, Model model) throws Exception {
		List<SeatVO> playReserveList = null;// 공연 예매된 티켓번호 List
		List<String> playReserveSeatsNumList = new ArrayList<>();// 좌석번호 List
		
		String ticketNumWithoutSeatInfo = getTicketNum(vo.getPdate(), vo.getPnumber(), vo.getPturn(), "");
		playReserveList = getReserveList(ticketNumWithoutSeatInfo);
		
		for (String reserveSeat : getReserveSeats(playReserveList)) {
			reserveSeat = reserveSeat.substring((reserveSeat.length()-2),reserveSeat.length());
			playReserveSeatsNumList.add(reserveSeat);
		}
		System.out.println("예약된 좌석번호 확인 : "+playReserveSeatsNumList); //좌석번호 확인
		
		
		model.addAttribute("reservation", vo);
		
		//직렬화하지 않은 데이터를 jquery가 인식하지 못해서 parse
		model.addAttribute("reserveSeat", new Gson().toJson(playReserveSeatsNumList));
		return "reserve.selectSeat";
	}

	@PostMapping("/checkSeatAvailability")
	public ResponseEntity<Boolean> checkSeatAvailability(@RequestBody String seatName) throws Exception {
		//이선좌 확인
		System.out.println(seatName);
		boolean isReserved = isSeatReserved(seatName);
		return new ResponseEntity<Boolean>(isReserved, HttpStatus.OK);
	}

	private boolean isSeatReserved(String seatName) throws Exception {
		seatName = seatName.substring(9, seatName.length());
		System.out.println("비교하는 티켓번호 : "+seatName);
		if (countReserveSeatNum(getReserveList(seatName))==0) {
			 //r_paystate = 1로 업데이트하는 쿼리문
			return false;
		} else {
			return true;
		}
	}
	
	/* private */

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

	// 예매 좌석 카운트
	private int countReserveSeatNum(List<SeatVO> seats) {
	    int count = 0;
	    for (Object obj : seats) {
	        for (Field field : obj.getClass().getDeclaredFields()) {
	            field.setAccessible(true);
	            try {
	                if (field.getType() == String.class) {
	                    String value = (String) field.get(obj);
	                    if (value != null && !value.equals("0")) { //티켓번호가 null이거나 0인 컬럼은 세지 않는다.
	                        count++;
	                    }
	                }
	            } catch (IllegalAccessException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return count;
	}
	

	// 예매 티켓번호 반환
	private List<String> getReserveSeats(List<SeatVO> seats) {
		List<String> nonZeroStrings = new ArrayList<>();
		for (Object obj : seats) {
			for (Field field : obj.getClass().getDeclaredFields()) {
				field.setAccessible(true);
				try {
					if (field.getType() == String.class) {
						String value = (String) field.get(obj);
						if (value != null && !value.equals("0")) { //티켓번호가 null이거나 0인 컬럼은 가져오지 않는다.
							nonZeroStrings.add(value);
						}
					}
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return nonZeroStrings;
	}
}