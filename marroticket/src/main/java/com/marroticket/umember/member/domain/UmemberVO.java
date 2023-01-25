package com.marroticket.umember.member.domain;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class UmemberVO {
	private int uNumber; //일반회원번호
	private String uId; //아이디
	private String uPassword; //비밀번호
	@NonNull
	@Size(max = 6)
	private String uName; //이름
	@NonNull
	@Size(max = 11)
	private String uPhoneNumber; //휴대폰	번호
	private String uBirthday; //생년월일
	private String uGender; //성별
	private String uEmail; //이메일
	
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date uJoinDate ; //가입일
	private String uUnjoin; //탈퇴여부
	
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date uUnjoinDate; //탈퇴일
	private String uGenre; //관심 장르
	private String uAgree; //약관 동의 여부


	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPhoneNumber() {
		return uPhoneNumber;
	}
	public void setuPhoneNumber(String uPhoneNumber) {
		this.uPhoneNumber = uPhoneNumber;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
}
