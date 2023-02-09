package com.marroticket.umember.reservation.domain;

import lombok.Setter;
import lombok.ToString;

import java.util.Date;

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
	
	/*
	 * private int pnumber; //fk - 공연번호 private int pturn; //회차 private Date pdate;
	 * // 공연 날짜
	 * 
	 * //좌석번호 - 행 1~6 / 열 a~p (6 * 16 max 96) private boolean a1; private boolean
	 * a2; private boolean a3; private boolean a4; private boolean a5; private
	 * boolean a6; private boolean b1; private boolean b2; private boolean b3;
	 * private boolean b4; private boolean b5; private boolean b6; private boolean
	 * c1; private boolean c2; private boolean c3; private boolean c4; private
	 * boolean c5; private boolean c6; private boolean d1; private boolean d2;
	 * private boolean d3; private boolean d4; private boolean d5; private boolean
	 * d6; private boolean e1; private boolean e2; private boolean e3; private
	 * boolean e4; private boolean e5; private boolean e6; private boolean f1;
	 * private boolean f2; private boolean f3; private boolean f4; private boolean
	 * f5; private boolean f6; private boolean g1; private boolean g2; private
	 * boolean g3; private boolean g4; private boolean g5; private boolean g6;
	 * private boolean h1; private boolean h2; private boolean h3; private boolean
	 * h4; private boolean h5; private boolean h6; private boolean i1; private
	 * boolean i2; private boolean i3; private boolean i4; private boolean i5;
	 * private boolean i6; private boolean j1; private boolean j2; private boolean
	 * j3; private boolean j4; private boolean j5; private boolean j6; private
	 * boolean k1; private boolean k2; private boolean k3; private boolean k4;
	 * private boolean k5; private boolean k6; private boolean l1; private boolean
	 * l2; private boolean l3; private boolean l4; private boolean l5; private
	 * boolean l6; private boolean m1; private boolean m2; private boolean m3;
	 * private boolean m4; private boolean m5; private boolean m6; private boolean
	 * n1; private boolean n2; private boolean n3; private boolean n4; private
	 * boolean n5; private boolean n6; private boolean o1; private boolean o2;
	 * private boolean o3; private boolean o4; private boolean o5; private boolean
	 * o6; private boolean p1; private boolean p2; private boolean p3; private
	 * boolean p4; private boolean p5; private boolean p6;
	 */
}
