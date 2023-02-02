package com.marroticket.umember.member.domain;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;

import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class UmemberVO {
	

	private int uNumber; //일반회원번호
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	private String uId; //아이디
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
            message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String uPassword; //비밀번호
	 
	@NotBlank(message = "이름은 필수 입력 값입니다.")
	@Size(max = 6, message = "이름은 6자 이내로 작성해주세요.")
	private String uName; //이름
	@NotBlank(message = "휴대폰 번호는 필수 입력 값입니다.")
	 @Pattern(regexp = "(01[016789])(\\d{3,4})(\\d{4})", message = "올바른 휴대폰 번호를 입력해주세요.")
	private String uPhoneNumber; //휴대폰	번호
	
	@NotBlank(message = "생일은 필수 입력 값입니다.")
	@Pattern(regexp = "(19|20)\\d{2}\\-((10|11|12)|(0?(\\d)))\\-(30|31|((0|1|2)?\\d))", message = "올바른 생년월일 입력해주세요.")
@DateTimeFormat(pattern = "YYYY-MM-dd")
	private String uBirthday; //생년월일
	private String uGender; //성별
	
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	@Email(message = "이메일 형식이 올바르지 않습니다.")
	private String uEmail; //이메일
	
	
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date uJoinDate ; //가입일
	private String uUnjoin; //탈퇴여부
	
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date uUnjoinDate; //탈퇴일
	private String uGenre; //관심 장르
	private String uAgree; //약관 동의 여부
	private List<UmemberAuth> umemberAuthList; //권한


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
