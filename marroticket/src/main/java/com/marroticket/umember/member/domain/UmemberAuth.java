package com.marroticket.umember.member.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UmemberAuth {

	private int uNumber; //일반회원번호
	
	private String umemberAuth; // 일반회원 권한
}
