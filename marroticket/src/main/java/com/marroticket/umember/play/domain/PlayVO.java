package com.marroticket.umember.play.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
public class PlayVO {

	private int pNumber; // 연극 번호

	@NotBlank(message = "연극명은 필수 입력 값입니다.")
	@Size(max = 50, message = "50자 이내로 입력해주세요.")
	private String pName; // 연극 명

	@Pattern(regexp = "[1-9]{1}[0-9]{0,2}", message = "숫자만 입력 가능하며 최대999분까지 입력가능합니다.")
	private String pRunningTime; // 연극 소요시간(러닝타임)

	@NotBlank(message = "극장 이름은 필수 입력 값입니다.")
	@Size(max = 50, message = "50자 이내로 입력해주세요.")
	private String pTheaterName; // 극장 이름

	@NotBlank(message = "극장 주소는 필수 입력 값입니다.")
	@Size(max = 100, message = "100자 이내로 입력해주세요.")
	private String pTheaterAddress; // 극장 주소

	private MultipartFile pPoster; // 연극 포스터 파일
	private String pPosterUrl; // 포스터url

	@NotBlank(message = "기획사 정보는 필수 입력 값입니다.")
	@Size(max = 20, message = "20자 이내로 입력해주세요.")
	private String pAgency; // 기획사 정보

	@NotBlank(message = "캐스팅 데이터는 필수 입력 값입니다.")
	@Size(max = 2000, message = "2000자 이내로 입력해주세요.")
	private String pCasting; // 캐스팅 데이터

	@NotBlank(message = "공연 줄거리는 필수 입력 값입니다.")
	@Size(max = 4000, message = "4000자 이내로 입력해주세요.")
	private String pPlot; // 공연 줄거리

	@Pattern(regexp = "[1-9]{1}[0-9]{0,20}", message = "좌석 개수는 필수 입력값입니다.")
	private String pSeatNumber; // 좌석 개수

	@Pattern(regexp = "[1-9]{1}[0-9]{0,6}", message = "숫자만 입력 가능하며 최대 7자리까지 입력할 수 있습니다.")
	private String pTicketPrice; // 티켓 가격

	@NotNull(message = "관람 등급은 필수 입력값입니다.")
	private String pRatings; // 관람 등급

	@NotNull(message = "장르 정보는 필수 입력값입니다.")
	private String pGenre; // 장르 정보

	private int tNumber; // 극단 회원 번호
	private int pAgree;// 약관 동의 여부

	private String pRegistrationApproval;// 공연 등록 승인 여부
	private String pModifyApproval;// 공연 수정 승인 여부

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pStartDate; // 연극 시작일

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pCloseDate; // 연극 종료일

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pTicketOpenDate; // 예매 오픈 희망일

	@NotNull(message = "1회차 상연 시작 시각은 필수 입력값입니다.")
	private String pFirstStartTime;// 1회차 상연 시작 시각

	private String pSecondStartTime;// 2회차 상연 시작 시각
	
	private String tId;

	//
	public int getTNumber() {
		return tNumber;
	}
	
	public int gettNumber() {
		return tNumber;
	}

	public void setTNumber(Integer tNumber) {
		this.tNumber = tNumber;
	}
	
	public void settNumber(int tNumber) {
		this.tNumber = tNumber;
	}

	public int getPNumber() {
		return pNumber;
	}
	
	public int getpNumber() {
		return pNumber;
	}

	public void setPNumber(int pNumber) {
		this.pNumber = pNumber;
	}
	
	public void setpNumber(int pNumber) {
		this.pNumber = pNumber;
	}

	public String getPName() {
		return pName;
	}
	
	public String getpName() {
		return pName;
	}

	public void setPName(String pName) {
		this.pName = pName;
	}
	
	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getPRegistrationApproval() {
		return pRegistrationApproval;
	}
	
	public String getpRegistrationApproval() {
		return pRegistrationApproval;
	}

	public void setPRegistrationApproval(String pRegistrationApproval) {
		this.pRegistrationApproval = pRegistrationApproval;
	}
	
	public void setpRegistrationApproval(String pRegistrationApproval) {
		this.pRegistrationApproval = pRegistrationApproval;
	}

	public String getPModifyApproval() {
		return pModifyApproval;
	}
	
	public String getpModifyApproval() {
		return pModifyApproval;
	}

	public void setPModifyApproval(String pModifyApproval) {
		this.pModifyApproval = pModifyApproval;
	}
	
	public void setpModifyApproval(String pModifyApproval) {
		this.pModifyApproval = pModifyApproval;
	}

	public Date getPStartDate() {
		return pStartDate;
	}
	
	public Date getpStartDate() {
		return pStartDate;
	}

	public void setPStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}
	
	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}

	public Date getPTicketOpenDate() {
		return pTicketOpenDate;
	}
	
	public Date getpTicketOpenDate() {
		return pTicketOpenDate;
	}

	public void setPTicketOpenDate(Date pTicketOpenDate) {
		this.pTicketOpenDate = pTicketOpenDate;
	}
	
	public void setpTicketOpenDate(Date pTicketOpenDate) {
		this.pTicketOpenDate = pTicketOpenDate;
	}

	public String getpSecondStartTime() {
		return pSecondStartTime;
	}
	
	public String getPSecondStartTime() {
		return pSecondStartTime;
	}

	public void setpSecondStartTime(String pSecondStartTime) {
		this.pSecondStartTime = pSecondStartTime;
	}
	
	public void setPSecondStartTime(String pSecondStartTime) {
		this.pSecondStartTime = pSecondStartTime;
	}

}