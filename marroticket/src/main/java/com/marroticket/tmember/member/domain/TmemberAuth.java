package com.marroticket.tmember.member.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TmemberAuth {

	private int tNumber; //극단회원번호
	
	private String tmemberAuth; // 극단회원 권한
}
