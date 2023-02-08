package com.marroticket.umember.reservation.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationVO {
	private int rnumber; //예매번호
	private Date rdate; //예매일
	private int rpayState; //예매 진행 중 여부
	private int rfee; //예매수수료
	private int rcancelState; //예매취소여부
	private Date rcancelDate; //예매취소일
	private int rticketFirst; //티켓1 번호
	private int rticketSecond; //티켓2 번호
	private int rticketThird; //티켓3 번호
	private int rticketFourth; //티켓4 번호
	private int rtotalpayment; //결제총액
	private String rseatNumber; //좌석정보(번호)
	private int unumber; //일반회원번호
	private int tnumber; //극단회원번호
}
