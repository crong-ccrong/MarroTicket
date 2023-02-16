package com.marroticket.umember.reservation.domain;

import lombok.Setter;
import lombok.ToString;


import lombok.Getter;

@Setter
@Getter
@ToString
public class SeatVO {
	private int rnumber;
	private String rticketFirst;
	private String rticketSecond;
	private String rticketThird;
	private String rticketFourth;
}
