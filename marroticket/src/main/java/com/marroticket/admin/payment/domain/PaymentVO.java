package com.marroticket.admin.payment.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PaymentVO {

	private int payNumber; // 정산 번호
	private int pNumber; // 연극번호
	private int tNumber; // 극단회원번호

	private int payPayment; // 정산금액
	private int payTheaterPayment; // 극단 정산 금액
	private int paySitePayment; // 사이트 정산 금액

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date payPayDate; // 지급일자

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date payCalculateDate; // 정산일자

	// 다른 테이블 데이터입력받는용도
	private String tName; // 극단명
	private String pName; // 연극명

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pCloseDate; // 연극종료일
	
	
	
}
