package com.marroticket.tmember.member.controller;

import java.security.SecureRandom;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marroticket.common.email.domain.EmailVO;
import com.marroticket.common.email.service.EmailService;
import com.marroticket.tmember.member.service.TmemberService;
import com.marroticket.tmember.member.domain.TmemberVO;

@Controller
//@PreAuthorize("hasRole('ROLE_MEMBER')")
@RequestMapping("/theater")
public class TmemberController {

	@Autowired
	TmemberService tmemberService;
	@Autowired
	EmailService emailService;

	@GetMapping("")
	public String home() {
		return "tmemberhome";
	}

	// 연극 등록
	@GetMapping("/registePlay")
	public String registePlay() {
		return "registe.registeAgree";
	}

	// 등록한 연극
	@GetMapping("/playRegisteInfo")
	public String playRegisteInfo() {
		return "info.tMemberPlayRegisteInfo";
	}

	// 극단 정산
	@GetMapping("/tmemberPayment")
	public String theaterPayment() {
		return "info.tMemberPayment";
	}

	// 극단 정보 관리
	@GetMapping("/tmembermypage")
	public String theaterMemberInfo() {
		return "info.tMemberMemberInfo";
	}

	// 극단 이용약관 페이지
	@GetMapping("/tMemberAgreement")
	public String tMemberAgreement() {
		System.out.println("tMemberAgreement 호출 완료");
		return "tMemberJoin.tMemberAgreement";
	}

	// 극단 회원 가입 페이지
	@GetMapping("/tMemberJoinForm")
	public String tMemberJoinForm() {
		System.out.println("tMemberJoinForm 호출 완료");
		return "tMemberJoin.tMemberJoinForm";
	}

	// 극단 공지사항, faq

	// 극단회원 FAQ
	// 목록
	@GetMapping("/tfaqList")
	public String tfaqList() {
		return "tserviceCenter.tfaqList";
	}

	// 극단회원 Notice
	// 목록
	@GetMapping("/noticeList")
	public String noticeList() {
		return "tserviceCenter.notice";
	}

	// footer
	@GetMapping("/privacy")
	public String privacy() {
		return "tmember.footer.privacy";
	}

	@GetMapping("/companyinfo")
	public String companyinfo() {
		return "tmember.footer.companyinfo";
	}

	@GetMapping("/termsofuse")
	public String termsofuse() {
		return "tmember.footer.termsofuse";
	}

	// 극단회원 아이디 찾기
	@PostMapping("/findId")
	public ResponseEntity<String> findId(@RequestBody TmemberVO tmember) throws Exception {
		// 값이 정상적으로 입력됐을 때, db 조회
		String tId = tmemberService.findId(tmember);

		// 응답
		if (tId != null && tId.length() > 0) {
			sendEmail(("아이디" + tId), tmember.gettOwnerEmail()); // 아이디 이메일 발송
			return new ResponseEntity<String>(tId, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		}
	}

	// 비밀번호 찾기 - 임시비밀번호 업데이트
	@PostMapping("/findPassword")
	public ResponseEntity<String> findPassword(@RequestBody TmemberVO tmember) throws Exception {
		ResponseEntity<String> entity;

		// 임시비밀번호 생성(15자리)
		String temporaryPassword = getRamdomPassword(15);
		tmember.setTPassword(temporaryPassword);

		// 임시비밀번호로 업데이트 : 업데이트는 where조건(id, email이 db데이터 조회 시, 부합)에 따라 성공/실패
		int success = tmemberService.passwordUpdate(tmember);

		if (success != 0) { // 업데이트 성공
			sendEmail(temporaryPassword, tmember.gettOwnerEmail()); // 임시비밀번호 발송
			entity = new ResponseEntity<String>("send", HttpStatus.OK);
			// 임시비밀번호 이메일 발송
		} else { // 업데이트 실패
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}

	// 아이디 또는 임시비밀번호 이메일 발송
	public void sendEmail(String idOrTemporaryPassword, String tOwnerEmail) throws Exception {
		String title = null;
		EmailVO email = new EmailVO(); // 이메일 객체

		if (idOrTemporaryPassword.substring(0, 3).equals("아이디")) {// 문자열 끝자리가 '아이디'일때
			title = "마로티켓입니다. 아이디를 확인해주세요"; // 이메일 제목
			idOrTemporaryPassword = idOrTemporaryPassword.substring(3);
			email.setId(idOrTemporaryPassword);
		} else {
			title = "마로티켓입니다. 임시비밀번호를 확인해주세요"; // 이메일 제목
			email.setPassword(idOrTemporaryPassword);
		}

		email.setAddress(tOwnerEmail);
		email.setTitle(title);

		// 이메일 발송
		emailService.sendTmemberEmail(email);
		// console 확인
		System.out.println("idOrTemporaryPassword 이메일 발송 완료");
	}

	// 랜덤한 임시비밀번호 생성
	public String getRamdomPassword(int size) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };

		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());

		int idx = 0;
		int len = charSet.length;
		for (int i = 0; i < size; i++) {
			// idx = (int) (len * Math.random());
			idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
			sb.append(charSet[idx]);
		}

		return sb.toString();
	}
}
