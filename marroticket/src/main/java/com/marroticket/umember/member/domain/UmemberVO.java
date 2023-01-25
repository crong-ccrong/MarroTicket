package com.marroticket.umember.member.domain;

import java.sql.Date;

import javax.validation.constraints.Pattern;
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

	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	@Size(min = 8, max = 20, message = "아이디를 8~20자 이내로 입력해주세요.")
	private String uId; //아이디

	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
	private String uPassword; //비밀번호

	@NotBlank(message = "이름을 입력해주세요.")
	@Size(min = 2, max = 6, message = "이름을 2~6자 사이로 입력해주세요.")
	private String uName; //이름

	@NotBlank(message = "휴대폰번호를 입력해주세요.")
	@Size(max = 11)
	@Pattern(regexp = "[0-9]", message = "형식에 맞게 입력해주세요")
	private String uPhoneNumber; //휴대폰 번호

	private String uBirthday; //생년월일

	private String uGender; //성별

	@Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
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
