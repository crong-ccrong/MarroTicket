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
	private String pName; // 연극 명
	private String pRunningTime; // 연극 소요시간(러닝타임)
	private String pTheaterName; // 극장 이름
	private String pTheaterAddress; // 극장 주소
	private MultipartFile pTheaterMap; // 극장 약도 이미지
	private String pAgency; // 기획사 정보
	private String pRatings; // 관람 등급
	private String pCasting; // 캐스팅 데이터
	private String pPlot; // 공연 줄거리
	private String pSeatType; // 좌석 종류
	private int pSeatNumber; // 좌석 개수
	private int pTicketPrice; // 티켓 가격
	private String pGenre; // 장르 정보
	private MultipartFile pPoster; // 연극 포스터
	private String pFirstPlay;// 1회차 연극 여부
	private String pSecondPlay;// 2회차 연극 여부
	private String pAgree;// 약관 동의 여부
	private String pAmendmentApproved;// 공연 수정 승인 여부
	private String pRegistrationApproval;// 공연 등록 승인 여부
	private int tNumber; // 극단 회원 번호
	private int pdNumber; // 연극상연날짜

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pStartDate; // 연극 시작일
	private Date pCloseDate; // 연극 종료일
	private Date pTicketOpenDate; // 예매 오픈 희망일

	public int getpNumber() {
		return pNumber;
	}

	public void setpNumber(int pNumber) {
		this.pNumber = pNumber;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpRunningTime() {
		return pRunningTime;
	}

	public void setpRunningTime(String pRunningTime) {
		this.pRunningTime = pRunningTime;
	}

	public String getpTheaterName() {
		return pTheaterName;
	}

	public void setpTheaterName(String pTheaterName) {
		this.pTheaterName = pTheaterName;
	}

	public String getpTheaterAddress() {
		return pTheaterAddress;
	}

	public void setpTheaterAddress(String pTheaterAddress) {
		this.pTheaterAddress = pTheaterAddress;
	}

	public MultipartFile getpTheaterMap() {
		return pTheaterMap;
	}

	public void setpTheaterMap(MultipartFile pTheaterMap) {
		this.pTheaterMap = pTheaterMap;
	}

	public String getpAgency() {
		return pAgency;
	}

	public void setpAgency(String pAgency) {
		this.pAgency = pAgency;
	}
	private int pnumber; // 연극 번호

	public String getpRatings() {
		return pRatings;
	}
	@NotBlank(message = "연극명은 필수 입력 값입니다.")
	@Size(max = 50, message = "50자 이내로 입력해주세요.")
	private String pname; // 연극 명

	public void setpRatings(String pRatings) {
		this.pRatings = pRatings;
	}
	@Pattern(regexp = "[1-9]{1}[0-9]{0,2}", message = "숫자만 입력 가능하며 최대999분까지 입력가능합니다.")
	private String prunningTime; // 연극 소요시간(러닝타임)

	public String getpCasting() {
		return pCasting;
	}
	@NotBlank(message = "극장 이름은 필수 입력 값입니다.")
	@Size(max = 50, message = "50자 이내로 입력해주세요.")
	private String ptheaterName; // 극장 이름

	public void setpCasting(String pCasting) {
		this.pCasting = pCasting;
	}
	@NotBlank(message = "극장 주소는 필수 입력 값입니다.")
	@Size(max = 100, message = "100자 이내로 입력해주세요.")
	private String ptheaterAddress; // 극장 주소

	public String getpPlot() {
		return pPlot;
	}
	private MultipartFile ptheaterMap;// 극장 약도 파일
	private String ptheaterMapUrl; // 약도url

	public void setpPlot(String pPlot) {
		this.pPlot = pPlot;
	}
	private MultipartFile pposter; // 연극 포스터 파일
	private String pposterUrl; // 포스터url

	public String getpSeatType() {
		return pSeatType;
	}
	@NotBlank(message = "기획사 정보는 필수 입력 값입니다.")
	@Size(max = 20, message = "20자 이내로 입력해주세요.")
	private String pagency; // 기획사 정보

	public void setpSeatType(String pSeatType) {
		this.pSeatType = pSeatType;
	}
	@NotBlank(message = "캐스팅 데이터는 필수 입력 값입니다.")
	@Size(max = 2000, message = "2000자 이내로 입력해주세요.")
	private String pcasting; // 캐스팅 데이터

	public int getpSeatNumber() {
		return pSeatNumber;
	}
	@NotBlank(message = "공연 줄거리는 필수 입력 값입니다.")
	@Size(max = 4000, message = "4000자 이내로 입력해주세요.")
	private String pplot; // 공연 줄거리

	public void setpSeatNumber(int pSeatNumber) {
		this.pSeatNumber = pSeatNumber;
	}
	@Pattern(regexp = "[1-9]{1}[0-9]{0,20}", message = "좌석 개수는 필수 입력값입니다.")
	private String pseatNumber; // 좌석 개수

	public int getpTicketPrice() {
		return pTicketPrice;
	}
	@Pattern(regexp = "[1-9]{1}[0-9]{0,6}", message = "숫자만 입력 가능하며 최대 7자리까지 입력할 수 있습니다.")
	private String pticketPrice; // 티켓 가격

	public void setpTicketPrice(int pTicketPrice) {
		this.pTicketPrice = pTicketPrice;
	}
	@NotNull(message = "관람 등급은 필수 입력값입니다.")
	private String pratings; // 관람 등급

	public String getpGenre() {
		return pGenre;
	}
	@NotNull(message = "장르 정보는 필수 입력값입니다.")
	private String pgenre; // 장르 정보

	public void setpGenre(String pGenre) {
		this.pGenre = pGenre;
	}
	private int tnumber; // 극단 회원 번호
	private int pagree;// 약관 동의 여부

	public MultipartFile getpPoster() {
		return pPoster;
	}
	private String pregistrationApproval;// 공연 등록 승인 여부
	private String pamendmentApproved;// 공연 수정 승인 여부

	public void setpPoster(MultipartFile pPoster) {
		this.pPoster = pPoster;
	}

	public String getpFirstPlay() {
		return pFirstPlay;
	}

	public void setpFirstPlay(String pFirstPlay) {
		this.pFirstPlay = pFirstPlay;
	}

	public String getpSecondPlay() {
		return pSecondPlay;
	}

	public void setpSecondPlay(String pSecondPlay) {
		this.pSecondPlay = pSecondPlay;
	}

	public String getpAgree() {
		return pAgree;
	}

	public void setpAgree(String pAgree) {
		this.pAgree = pAgree;
	}

	public String getpAmendmentApproved() {
		return pAmendmentApproved;
	}

	public void setpAmendmentApproved(String pAmendmentApproved) {
		this.pAmendmentApproved = pAmendmentApproved;
	}

	public String getpRegistrationApproval() {
		return pRegistrationApproval;
	}

	public void setpRegistrationApproval(String pRegistrationApproval) {
		this.pRegistrationApproval = pRegistrationApproval;
	}

	public int gettNumber() {
		return tNumber;
	}

	public void settNumber(int tNumber) {
		this.tNumber = tNumber;
	}

	public Date getpStartDate() {
		return pStartDate;
	}

	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pstartDate; // 연극 시작일

	public Date getpCloseDate() {
		return pCloseDate;
	}
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pcloseDate; // 연극 종료일

	public void setpCloseDate(Date pCloseDate) {
		this.pCloseDate = pCloseDate;
	}
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pticketOpenDate; // 예매 오픈 희망일

	public Date getpTicketOpenDate() {
		return pTicketOpenDate;
	}
	@NotNull(message = "1회차 상연 시작 시각은 필수 입력값입니다.")
	private String pfirstStartTime;// 1회차 상연 시작 시각

	public void setpTicketOpenDate(Date pTicketOpenDate) {
		this.pTicketOpenDate = pTicketOpenDate;
	}
	private String psecondStartTime;// 2회차 상연 시작 시각

}
