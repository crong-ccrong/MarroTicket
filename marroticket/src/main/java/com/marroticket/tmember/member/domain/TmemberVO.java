package com.marroticket.tmember.member.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TmemberVO {
   private int tNumber; // 극단 회원번호

   @NotBlank(message = "아이디는 필수 입력 값입니다.")
   private String tId; // 아이디

   @NotBlank(message = "비밀번호는 필수 입력 값입니다.")
   @Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
   private String tPassword; // 비밀번호

   @NotBlank(message = "극단명은 필수 입력 값입니다.")
   private String tName; // 극단명

   @NotBlank(message = "주소는 필수 입력 값입니다.")
   private String tAddress; // 극단주소

   @NotBlank(message = "이름은 필수 입력 값입니다.")
   @Size(max = 6, message = "이름은 6자 이내로 작성해주세요.")
   private String tOwnerName; // 대표자명

   @NotBlank(message = "휴대폰 번호는 필수 입력 값입니다.")
   @Pattern(regexp = "(01[016789])(\\d{3,4})(\\d{4})", message = "올바른 휴대폰 번호를 입력해주세요.")
   private String tOwnerPhoneNumber; // 대표자 휴대폰 번호

   @NotBlank(message = "이메일은 필수 입력 값입니다.")
   @Email(message = "이메일 형식이 올바르지 않습니다.")
   private String tOwnerEmail; // 대표자 이메일

	@NotBlank(message = "사업자 등록번호는 필수 입력 값입니다.")
	@Size(max = 10, message = "10자 이내로 작성해주세요.")
	private String tBusinessRegistrationNumber; // 사업자 등록 번호 
	
   private String tBusinessRegistration; // 사업자 등록 구분(개인/기업)

   @Pattern(regexp = "(19|20)\\d{2}\\-((10|11|12)|(0?(\\d)))\\-(30|31|((0|1|2)?\\d))", message = "올바른 년월일 입력해주세요.")
   @DateTimeFormat(pattern = "YYYY-MM-dd")
   private String tEstablishmentDate; // 설립일

   private String tBank; // 거래 은행
   @NotBlank(message = "계좌 정보 입력은 필수입니다.")
   private String tBankNumber; // 계좌 번호
   @NotBlank(message = "예금주 성명 입력은 필수입니다.")
   private String tBankOwner; // 예금주

   private MultipartFile tBusinessRegistrationImage; // 사업자등록증 사본 파일
   private String tBusinessRegistrationImageUrl; // 사업자등록증

   private String tAuth;// 극단 가입 승인 여부
   private String tAgree; // 약관 동의 여부


   private List<TmemberAuth> tmemberAuthList; // 권한

   // JSON
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

	public void settOwnerEmail(String tOwnerEmail) {
		this.tOwnerEmail = tOwnerEmail;
	}

	public String gettAddress() {
		return tAddress;
	}

	public void settAddress(String tAddress) {
		this.tAddress = tAddress;
	}

	public String gettOwnerName() {
		return tOwnerName;
	}

	public void settOwnerName(String tOwnerName) {
		this.tOwnerName = tOwnerName;
	}

	public String gettOwnerPhoneNumber() {
		return tOwnerPhoneNumber;
	}

	public void settOwnerPhoneNumber(String tOwnerPhoneNumber) {
		this.tOwnerPhoneNumber = tOwnerPhoneNumber;
	}

	public String gettBank() {
		return tBank;
	}

	public void settBank(String tBank) {
		this.tBank = tBank;
	}

	public String gettBankNumber() {
		return tBankNumber;
	}

	public void settBankNumber(String tBankNumber) {
		this.tBankNumber = tBankNumber;
	}

	public String gettBankOwner() {
		return tBankOwner;
	}

	public void settBankOwner(String tBankOwner) {
		this.tBankOwner = tBankOwner;
	}

   public String gettOwnerEmail() {
      return tOwnerEmail;
   }

}
