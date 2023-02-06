package com.marroticket.umember.member.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.umember.member.service.UmemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/umember")
@MapperScan(basePackages = "com.marroticket.mapper")
@Slf4j
public class UmemberController {
	@Autowired
	private UmemberService umemberService;

	// 아이디 찾기
	@PostMapping("/findId")
	public ResponseEntity<String> findId(@Validated @RequestBody UmemberVO umember, BindingResult result)
			throws Exception {
		// 입력값이 하나라도 null일 때
		System.out.println(umember.getuName());
		if ((umember.getuName() == null || umember.getuName().length() == 0)
				|| (umember.getuPhoneNumber() == null || umember.getuPhoneNumber().length() == 0)) {
			return new ResponseEntity<String>("none", HttpStatus.OK);
		}

		// 입력값이 있을 때
		String uId = umemberService.findId(umember);
		// 입력값이 유효하지 않을 때
		if (result.hasErrors()) {
			return new ResponseEntity<String>("novalid", HttpStatus.OK);
		}
		// 정상적으로 입력했을 때
		if (uId != null && uId.length() > 0) {
			return new ResponseEntity<String>(uId, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		}
	}

	// 마이페이지
	/* 1) 일반 회원 정보 */
	@GetMapping("/umembermypage")
	public String umemberInfo() {
		return "mypage.umemberInfo"; // 일반 회원의 마이페이지 default 페이지
	}

	/* 2) 일반회원 예매 정보 */
	@GetMapping("/umemberReserveInfo")
	public String umemberReserveInfo() {
		return "mypage.umemberReserveInfo";
	}

	/* 3) 일반 회원 예매 취소 정보 */
	@GetMapping("/umemberCancelInfo")
	public String umemberCancelInfo() {
		return "mypage.umemberCancelInfo";
	}

	// 일반회원 가입 이용약관
	@GetMapping("/umemberAgreement")
	public String umemberAgreement() {
		System.out.println("umemberAgreement 호출 완료");
		return "uMemberJoin.umemberAgreement";
	}

	// 일반 회원가입 페이지
	@GetMapping("/umemberJoinForm")
	public String umemberJoinForm() {
		System.out.println("umemberJoinForm 호출 완료");
		return "uMemberJoin.umemberJoinForm";
	}

	// 일반 사용자 아이디 중복 체크

	// 스프링 시큐리티의 비밀번호 암호처리기
//			@Autowired
//			private PasswordEncoder passwordEncoder;

}
