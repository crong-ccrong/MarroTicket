package com.marroticket.umember.reservation.domain;

import java.util.Date;
import java.util.Map;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationVO {
	private int rnumber; // 예매번호
	private Date rdate; // 예매일
	private int rpayState; // 예매 진행 중 여부
	private int rfee; // 예매수수료
	private int rcancelState; // 예매취소여부
	private Date rcancelDate; // 예매취소일

	// 예매일 + p_number + 공연회차 + 좌석
	private String rticketFirst; // 티켓1 번호 
	private String rticketSecond; //티켓2 번호
	private String rticketThird; // 티켓3 번호 
	private String rticketFourth; //티켓4 번호
	private List<String> rticketList; //티켓 리스트

	private int rtotalpayment; // 결제총액
	private int rticketcount; //티켓개수
	
	//VO에만 있는 데이터
	//private String rseatNumber; // 좌석정보(번호)
	private String pdate; //공연 일시
	private String rcancelDeadline; //예매취소기한
	private List<String> rseatInfo; // 좌석정보(좌석1, 2, 3, 4)
	private int pturn; // 회차
	
	//일반사용자 정보
	private int unumber; // 일반회원번호
	private int uid; // 일반회원번호
	private String uname; //사용자 이름
	private String uphonenumber; //사용자 전화번호
	
	//연극 정보
	private int pnumber; // 연극번호
	private String pname; // 연극명
	private String ptheaterName; // 극장 이름
	private String ptheaterAddress; // 극장 주소
	private String pfirstStartTime; // 1회차 시작 시간
	private String psecondStartTime; // 2회차 시작 시간
	private String pticketPrice; // 티켓 가격(낱개)
	private String pseatNumber; //좌석 수
}
