package com.marroticket.umember.play.domain;

import java.util.Date;

import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlayVO {

	private int pnumber; // 연극 번호

	/*
	 * @NotBlank
	 * 
	 * @Size(max = 50) private String pname; // 연극 명
	 * 
	 * @NotNull
	 * 
	 * @Min(1)
	 * 
	 * @Size(max = 3) private int prunningTime; // 연극 소요시간(러닝타임)
	 * 
	 * @NotBlank
	 * 
	 * @Size(max = 50) private String ptheaterName; // 극장 이름
	 * 
	 * @NotBlank
	 * 
	 * @Size(max = 100) private String ptheaterAddress; // 극장 주소 private String
	 * ptheaterMap; // 극장 약도 이미지 private String pposter; // 연극 포스터
	 * 
	 * @NotBlank
	 * 
	 * @Size(max = 20) private String pagency; // 기획사 정보
	 * 
	 * @NotBlank
	 * 
	 * @Size(max = 2000) private String pcasting; // 캐스팅 데이터
	 * 
	 * @NotBlank
	 * 
	 * @Size(max = 4000) private String pplot; // 공연 줄거리
	 * 
	 * @NotNull
	 * 
	 * @Min(0)
	 * 
	 * @Size(max = 20) private int pseatNumber; // 좌석 개수
	 * 
	 * @NotNull
	 * 
	 * @Min(0)
	 * 
	 * @Size(max = 7) private int pticketPrice; // 티켓 가격
	 * 
	 * @NotBlank private String pratings; // 관람 등급 private String pseatType; // 좌석
	 * 종류 private String pgenre; // 장르 정보
	 * 
	 * @Min(1)
	 * 
	 * @Size(max = 2) private int pseatColumn; // 좌석 세로 열 private int pseatRow; //
	 * 좌석 가로행
	 * 
	 * private int tnumber; // 극단 회원 번호 private String pagree;// 약관 동의 여부 private
	 * String pregistrationApproval;// 공연 등록 승인 여부 private String
	 * pamendmentApproved;// 공연 수정 승인 여부
	 * 
	 * @DateTimeFormat(pattern = "yyyy-MM-dd (E)")
	 * 
	 * @Future private Date pstartDate; // 연극 시작일 private Date pcloseDate; // 연극 종료일
	 * private Date pticketOpenDate; // 예매 오픈 희망일
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date peachDateOne;// 상연 날짜 1
	private Date peachDateTwo;// 상연 날짜 2
	private Date peachDateThree;// 상연 날짜 3
	private Date peachDateFour;// 상연 날짜 4
	private Date peachDateFive;// 상연 날짜 5
	private Date peachDateSix;// 상연 날짜 6
	private Date peachDateSeven;// 상연 날짜 7
	private Date peachDateEight;// 상연 날짜 8
	private Date peachDateNine;// 상연 날짜 9
	private Date peachDateTen;// 상연 날짜 10
	private Date peachDateEleven;// 상연 날짜 11
	private Date peachDateTwelve;// 상연 날짜 12
	private Date peachDateThirteen;// 상연 날짜 13
	private Date peachDateFourteen;// 상연 날짜 14
	private Date peachDateFifteen;// 상연 날짜 15
	private Date peachDateSixteen;// 상연 날짜 16
	private Date peachDateSeventeen;// 상연 날짜 17
	private Date peachDateEighteen;// 상연 날짜 18
	private Date peachDateNineteen;// 상연 날짜 19
	private Date peachDateTwenty;// 상연 날짜 20
	private Date peachDateTwentyOne;// 상연 날짜 21
	private Date peachDateTwentyTwo;// 상연 날짜 22
	private Date peachDateTwentyThree;// 상연 날짜 23
	private Date peachDateTwentyFour;// 상연 날짜 24
	private Date peachDateTwentyFive;// 상연 날짜 25
	private Date peachDateTwentySix;// 상연 날짜 26
	private Date peachDateTwentySeven;// 상연 날짜 27
	private Date peachDateTwentyEight;// 상연 날짜 28
	private Date peachDateTwentyNine;// 상연 날짜 29
	private Date peachDateThirty;// 상연 날짜 30
	private Date peachDateThirtyOne;// 상연 날짜 31
	private Date peachDateThirtyTwo;// 상연 날짜 32
	private Date peachDateThirtyThree;// 상연 날짜 33
	private Date peachDateThirtyFour;// 상연 날짜 34
	private Date peachDateThirtyFive;// 상연 날짜 35
	private Date peachDateThirtySix;// 상연 날짜 36
	private Date peachDateThirtySeven;// 상연 날짜 37
	private Date peachDateThirtyEight;// 상연 날짜 38
	private Date peachDateThirtyNine;// 상연 날짜 39
	private Date peachDateForty;// 상연 날짜 40
	private Date peachDateFortyOne;// 상연 날짜 41
	private Date peachDateFortyTwo;// 상연 날짜 42
	private Date peachDateFortyThree;// 상연 날짜 43
	private Date peachDateFortyFour;// 상연 날짜 44
	private Date peachDateFortyFive;// 상연 날짜 45
	private Date peachDateFortySix;// 상연 날짜 46
	private Date peachDateFortySeven;// 상연 날짜 47
	private Date peachDateFortyEight;// 상연 날짜 48
	private Date peachDateFortyNine;// 상연 날짜 49
	private Date peachDateFifty;// 상연 날짜 50
	private Date peachDateFiftyOne;// 상연 날짜 51
	private Date peachDateFiftyTwo;// 상연 날짜 52
	private Date peachDateFiftyThree;// 상연 날짜 53
	private Date peachDateFiftyFour;// 상연 날짜 54
	private Date peachDateFiftyFive;// 상연 날짜 55
	private Date peachDateFiftySix;// 상연 날짜 56
	private Date peachDateFiftySeven;// 상연 날짜 57
	private Date peachDateFiftyEight;// 상연 날짜 58
	private Date peachDateFiftyNine;// 상연 날짜 59
	private Date peachDateSixty;// 상연 날짜 60

	private Date pfirstStartTimeOne;// 1회차 상연 시작 시각 1
	private Date pfirstStartTimeTwo;// 1회차 상연 시작 시각 2
	private Date pfirstStartTimeThree;// 1회차 상연 시작 시각 3
	private Date pfirstStartTimeFour;// 1회차 상연 시작 시각 4
	private Date pfirstStartTimeFive;// 1회차 상연 시작 시각 5
	private Date pfirstStartTimeSix;// 1회차 상연 시작 시각 6
	private Date pfirstStartTimeSeven;// 1회차 상연 시작 시각 7
	private Date pfirstStartTimeEight;// 1회차 상연 시작 시각 8
	private Date pfirstStartTimeNine;// 1회차 상연 시작 시각 9
	private Date pfirstStartTimeTen;// 1회차 상연 시작 시각 10
	private Date pfirstStartTimeEleven;// 1회차 상연 시작 시각 11
	private Date pfirstStartTimeTwelve;// 1회차 상연 시작 시각 12
	private Date pfirstStartTimeThirteen;// 1회차 상연 시작 시각 13
	private Date pfirstStartTimeFourteen;// 1회차 상연 시작 시각 14
	private Date pfirstStartTimeFifteen;// 1회차 상연 시작 시각 15
	private Date pfirstStartTimeSixteen;// 1회차 상연 시작 시각 16
	private Date pfirstStartTimeSeventeen;// 1회차 상연 시작 시각 17
	private Date pfirstStartTimeEighteen;// 1회차 상연 시작 시각 18
	private Date pfirstStartTimeNineteen;// 1회차 상연 시작 시각 19
	private Date pfirstStartTimeTwenty;// 1회차 상연 시작 시각 20
	private Date pfirstStartTimeTwentyOne;// 1회차 상연 시작 시각 21
	private Date pfirstStartTimeTwentyTwo;// 1회차 상연 시작 시각 22
	private Date pfirstStartTimeTwentyThree;// 1회차 상연 시작 시각 23
	private Date pfirstStartTimeTwentyFour;// 1회차 상연 시작 시각 24
	private Date pfirstStartTimeTwentyFive;// 1회차 상연 시작 시각 25
	private Date pfirstStartTimeTwentySix;// 1회차 상연 시작 시각 26
	private Date pfirstStartTimeTwentySeven;// 1회차 상연 시작 시각 27
	private Date pfirstStartTimeTwentyEight;// 1회차 상연 시작 시각 28
	private Date pfirstStartTimeTwentyNine;// 1회차 상연 시작 시각 29
	private Date pfirstStartTimeThirty;// 1회차 상연 시작 시각 30
	private Date pfirstStartTimeThirtyOne;// 1회차 상연 시작 시각 31
	private Date pfirstStartTimeThirtyTwo;// 1회차 상연 시작 시각 32
	private Date pfirstStartTimeThirtyThree;// 1회차 상연 시작 시각 33
	private Date pfirstStartTimeThirtyFour;// 1회차 상연 시작 시각 34
	private Date pfirstStartTimeThirtyFive;// 1회차 상연 시작 시각 35
	private Date pfirstStartTimeThirtySix;// 1회차 상연 시작 시각 36
	private Date pfirstStartTimeThirtySeven;// 1회차 상연 시작 시각 37
	private Date pfirstStartTimeThirtyEight;// 1회차 상연 시작 시각 38
	private Date pfirstStartTimeThirtyNine;// 1회차 상연 시작 시각 39
	private Date pfirstStartTimeForty;// 1회차 상연 시작 시각 40
	private Date pfirstStartTimeFortyOne;// 1회차 상연 시작 시각 41
	private Date pfirstStartTimeFortyTwo;// 1회차 상연 시작 시각 42
	private Date pfirstStartTimeFortyThree;// 1회차 상연 시작 시각 43
	private Date pfirstStartTimeFortyFour;// 1회차 상연 시작 시각 44
	private Date pfirstStartTimeFortyFive;// 1회차 상연 시작 시각 45
	private Date pfirstStartTimeFortySix;// 1회차 상연 시작 시각 46
	private Date pfirstStartTimeFortySeven;// 1회차 상연 시작 시각 47
	private Date pfirstStartTimeFortyEight;// 1회차 상연 시작 시각 48
	private Date pfirstStartTimeFortyNine;// 1회차 상연 시작 시각 49
	private Date pfirstStartTimeFifty;// 1회차 상연 시작 시각 50
	private Date pfirstStartTimeFiftyOne;// 1회차 상연 시작 시각 51
	private Date pfirstStartTimeFiftyTwo;// 1회차 상연 시작 시각 52
	private Date pfirstStartTimeFiftyThree;// 1회차 상연 시작 시각 53
	private Date pfirstStartTimeFiftyFour;// 1회차 상연 시작 시각 54
	private Date pfirstStartTimeFiftyFive;// 1회차 상연 시작 시각 55
	private Date pfirstStartTimeFiftySix;// 1회차 상연 시작 시각 56
	private Date pfirstStartTimeFiftySeven;// 1회차 상연 시작 시각 57
	private Date pfirstStartTimeFiftyEight;// 1회차 상연 시작 시각 58
	private Date pfirstStartTimeFiftyNine;// 1회차 상연 시작 시각 59
	private Date pfirstStartTimeSixty;// 1회차 상연 시작 시각 60

	private Date psecondStartTimeOne;// 2회차 상연 시작 시각 1
	private Date psecondStartTimeTwo;// 2회차 상연 시작 시각 2
	private Date psecondStartTimeThree;// 2회차 상연 시작 시각 3
	private Date psecondStartTimeFour;// 2회차 상연 시작 시각 4
	private Date psecondStartTimeFive;// 2회차 상연 시작 시각 5
	private Date psecondStartTimeSix;// 2회차 상연 시작 시각 6
	private Date psecondStartTimeSeven;// 2회차 상연 시작 시각 7
	private Date psecondStartTimeEight;// 2회차 상연 시작 시각 8
	private Date psecondStartTimeNine;// 2회차 상연 시작 시각 9
	private Date psecondStartTimeTen;// 2회차 상연 시작 시각 10
	private Date psecondStartTimeEleven;// 2회차 상연 시작 시각 11
	private Date psecondStartTimeTwelve;// 2회차 상연 시작 시각 12
	private Date psecondStartTimeThirteen;// 2회차 상연 시작 시각 13
	private Date psecondStartTimeFourteen;// 2회차 상연 시작 시각 14
	private Date psecondStartTimeFifteen;// 2회차 상연 시작 시각 15
	private Date psecondStartTimeSixteen;// 2회차 상연 시작 시각 16
	private Date psecondStartTimeSeventeen;// 2회차 상연 시작 시각 17
	private Date psecondStartTimeEighteen;// 2회차 상연 시작 시각 18
	private Date psecondStartTimeNineteen;// 2회차 상연 시작 시각 19
	private Date psecondStartTimeTwenty;// 2회차 상연 시작 시각 20
	private Date psecondStartTimeTwentyOne;// 2회차 상연 시작 시각 21
	private Date psecondStartTimeTwentyTwo;// 2회차 상연 시작 시각 22
	private Date psecondStartTimeTwentyThree;// 2회차 상연 시작 시각 23
	private Date psecondStartTimeTwentyFour;// 2회차 상연 시작 시각 24
	private Date psecondStartTimeTwentyFive;// 2회차 상연 시작 시각 25
	private Date psecondStartTimeTwentySix;// 2회차 상연 시작 시각 26
	private Date psecondStartTimeTwentySeven;// 2회차 상연 시작 시각 27
	private Date psecondStartTimeTwentyEight;// 2회차 상연 시작 시각 28
	private Date psecondStartTimeTwentyNine;// 2회차 상연 시작 시각 29
	private Date psecondStartTimeThirty;// 2회차 상연 시작 시각 30
	private Date psecondStartTimeThirtyOne;// 2회차 상연 시작 시각 31
	private Date psecondStartTimeThirtyTwo;// 2회차 상연 시작 시각 32
	private Date psecondStartTimeThirtyThree;// 2회차 상연 시작 시각 33
	private Date psecondStartTimeThirtyFour;// 2회차 상연 시작 시각 34
	private Date psecondStartTimeThirtyFive;// 2회차 상연 시작 시각 35
	private Date psecondStartTimeThirtySix;// 2회차 상연 시작 시각 36
	private Date psecondStartTimeThirtySeven;// 2회차 상연 시작 시각 37
	private Date psecondStartTimeThirtyEight;// 2회차 상연 시작 시각 38
	private Date psecondStartTimeThirtyNine;// 2회차 상연 시작 시각 39
	private Date psecondStartTimeForty;// 2회차 상연 시작 시각 40
	private Date psecondStartTimeFortyOne;// 2회차 상연 시작 시각 41
	private Date psecondStartTimeFortyTwo;// 2회차 상연 시작 시각 42
	private Date psecondStartTimeFortyThree;// 2회차 상연 시작 시각 43
	private Date psecondStartTimeFortyFour;// 2회차 상연 시작 시각 44
	private Date psecondStartTimeFortyFive;// 2회차 상연 시작 시각 45
	private Date psecondStartTimeFortySix;// 2회차 상연 시작 시각 46
	private Date psecondStartTimeFortySeven;// 2회차 상연 시작 시각 47
	private Date psecondStartTimeFortyEight;// 2회차 상연 시작 시각 48
	private Date psecondStartTimeFortyNine;// 2회차 상연 시작 시각 49
	private Date psecondStartTimeFifty;// 2회차 상연 시작 시각 50
	private Date psecondStartTimeFiftyOne;// 2회차 상연 시작 시각 51
	private Date psecondStartTimeFiftyTwo;// 2회차 상연 시작 시각 52
	private Date psecondStartTimeFiftyThree;// 2회차 상연 시작 시각 53
	private Date psecondStartTimeFiftyFour;// 2회차 상연 시작 시각 54
	private Date psecondStartTimeFiftyFive;// 2회차 상연 시작 시각 55
	private Date psecondStartTimeFiftySix;// 2회차 상연 시작 시각 56
	private Date psecondStartTimeFiftySeven;// 2회차 상연 시작 시각 57
	private Date psecondStartTimeFiftyEight;// 2회차 상연 시작 시각 58
	private Date psecondStartTimeFiftyNine;// 2회차 상연 시작 시각 59
	private Date psecondStartTimeSixty;// 2회차 상연 시작 시각 60

	@NotBlank(message = "연극명은 필수 입력 값입니다.")
	@Size(max = 50, message = "50자 이내로 입력해주세요.")
	private String pname; // 연극 명

	@Pattern(regexp = "[1-9]{1}[0-9]{0,2}", message = "숫자만 입력 가능하며 최대999분까지 입력가능합니다.")
	private String prunningTime; // 연극 소요시간(러닝타임)

	@NotBlank(message = "극장 이름은 필수 입력 값입니다.")
	@Size(max = 50, message = "50자 이내로 입력해주세요.")
	private String ptheaterName; // 극장 이름

	@NotBlank(message = "극장 주소는 필수 입력 값입니다.")
	@Size(max = 100, message = "100자 이내로 입력해주세요.")
	private String ptheaterAddress; // 극장 주소

	private MultipartFile ptheaterMap;// 극장 약도 파일
	private String ptheaterMapUrl; // 약도url

	private MultipartFile pposter; // 연극 포스터 파일
	private String pposterUrl; // 포스터url

	@NotBlank(message = "기획사 정보는 필수 입력 값입니다.")
	@Size(max = 20, message = "20자 이내로 입력해주세요.")
	private String pagency; // 기획사 정보

	@NotBlank(message = "캐스팅 데이터는 필수 입력 값입니다.")
	@Size(max = 2000, message = "2000자 이내로 입력해주세요.")
	private String pcasting; // 캐스팅 데이터

	@NotBlank(message = "공연 줄거리는 필수 입력 값입니다.")
	@Size(max = 4000, message = "4000자 이내로 입력해주세요.")
	private String pplot; // 공연 줄거리

	@Pattern(regexp = "[1-9]{1}[0-9]{0,20}", message = "좌석 개수는 필수 입력값입니다.")
	private String pseatNumber; // 좌석 개수

	@Pattern(regexp = "[1-9]{1}[0-9]{0,6}", message = "숫자만 입력 가능하며 최대 7자리까지 입력할 수 있습니다.")
	private String pticketPrice; // 티켓 가격

	@NotNull(message = "관람 등급은 필수 입력값입니다.")
	private String pratings; // 관람 등급

	@NotNull(message = "장르 정보는 필수 입력값입니다.")
	private String pgenre; // 장르 정보

	private int tnumber; // 극단 회원 번호
	private int pagree;// 약관 동의 여부

	private String pregistrationApproval;// 공연 등록 승인 여부
	private String pamendmentApproved;// 공연 수정 승인 여부

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pstartDate; // 연극 시작일

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pcloseDate; // 연극 종료일

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pticketOpenDate; // 예매 오픈 희망일

	@NotNull(message = "1회차 상연 시작 시각은 필수 입력값입니다.")
	private String pfirstStartTime;// 1회차 상연 시작 시각

	private String psecondStartTime;// 2회차 상연 시작 시각

}