package com.marroticket.tmember.member.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TmemberVO {
	private int tNumber; // 극단 회원번호
	private String tId; // 아이디
	private String tPassword; // 비밀번호

	@NonNull
	private String tName; // 극단명 
	private String tAddress; // 극단주소
	@NonNull
	private String tOwnerName; // 대표자명
	private String tOwnerPhoneNumber; // 대표자 휴대폰 번호
	private String tOwnerEmail; // 대표자 이메일
	private String tBusinessRegistration; // 사업자 등록 구분(개인/기업)
	private String tBusinessRegistractionNumber; // 사업자 등록 번호

	@DateTimeFormat(pattern = "YYYY-MM-dd")
	private Date tEstablishmentDate; // 설립일

	@NonNull
	private String tBank; // 거래 은행 
	private String tBankNumber; // 계좌 번호
	private String tBankOwner; // 예금주
	
	@NonNull
	private String tBusinessRegisterationImage; // 사업자등록증 사본
	private String tAgree; // 약관 동의 여부
	
	//JSON
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettOwnerEmail() {
		return tOwnerEmail;
	}
	public void settOwnerEmail(String tOwnerEmail) {
		this.tOwnerEmail = tOwnerEmail;
	}
}
