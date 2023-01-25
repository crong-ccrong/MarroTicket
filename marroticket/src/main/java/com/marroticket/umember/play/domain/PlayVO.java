package com.marroticket.umember.play.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	private String pTheaterMap; // 극장 약도 이미지
	private String pAgency; // 기획사 정보
	private String pRatings; // 관람 등급
	private String pCasting; // 캐스팅 데이터
	private String pPlot; // 공연 줄거리
	private String pSeatType; // 좌석 종류
	private int pSeatNumber; // 좌석 개수
	private int pTicketPrice; // 티켓 가격
	private String pGenre; // 장르 정보
	private String pPoster; // 연극 포스터
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

	public String getpTheaterMap() {
		return pTheaterMap;
	}

	public void setpTheaterMap(String pTheaterMap) {
		this.pTheaterMap = pTheaterMap;
	}

	public String getpAgency() {
		return pAgency;
	}

	public void setpAgency(String pAgency) {
		this.pAgency = pAgency;
	}

	public String getpRatings() {
		return pRatings;
	}

	public void setpRatings(String pRatings) {
		this.pRatings = pRatings;
	}

	public String getpCasting() {
		return pCasting;
	}

	public void setpCasting(String pCasting) {
		this.pCasting = pCasting;
	}

	public String getpPlot() {
		return pPlot;
	}

	public void setpPlot(String pPlot) {
		this.pPlot = pPlot;
	}

	public String getpSeatType() {
		return pSeatType;
	}

	public void setpSeatType(String pSeatType) {
		this.pSeatType = pSeatType;
	}

	public int getpSeatNumber() {
		return pSeatNumber;
	}

	public void setpSeatNumber(int pSeatNumber) {
		this.pSeatNumber = pSeatNumber;
	}

	public int getpTicketPrice() {
		return pTicketPrice;
	}

	public void setpTicketPrice(int pTicketPrice) {
		this.pTicketPrice = pTicketPrice;
	}

	public String getpGenre() {
		return pGenre;
	}

	public void setpGenre(String pGenre) {
		this.pGenre = pGenre;
	}

	public String getpPoster() {
		return pPoster;
	}

	public void setpPoster(String pPoster) {
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

	public Date getpCloseDate() {
		return pCloseDate;
	}

	public void setpCloseDate(Date pCloseDate) {
		this.pCloseDate = pCloseDate;
	}

	public Date getpTicketOpenDate() {
		return pTicketOpenDate;
	}

	public void setpTicketOpenDate(Date pTicketOpenDate) {
		this.pTicketOpenDate = pTicketOpenDate;
	}

}
