package com.marroticket.umember.member.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println(umember.getUName());
		if ((umember.getUName() == null || umember.getUName().length() == 0)
				|| (umember.getUPhoneNumber() == null || umember.getUPhoneNumber().length() == 0)) {
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
	public String umemberJoinForm(@ModelAttribute("umember") UmemberVO umember) {
		System.out.println("umemberJoinForm 호출 완료");
		return "uMemberJoin.umemberJoinForm";
	}

	// 회원가입 성공 페이지
	@GetMapping("/umemberJoinSuccess")
	public String umemberJoinSuccess() {
		System.out.println("umemberJoinSuccess 호출 완료");
		return "uMemberJoin.umemberJoinSuccess";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/uIdCheck", method = RequestMethod.POST)
	public ResponseEntity<String> uIdCheck(UmemberVO umember) throws Exception {
		System.out.println("중복 아이디 체크 컨트롤러 불러옴\numember : "+umember.toString());
		int result = umemberService.uIdCheck(umember);
		ResponseEntity<String> entity = null;
		System.out.println(result);
		if (result==1) {
			entity = new ResponseEntity<>("overlap", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<>("no overlap", HttpStatus.OK);
		}
		return entity;
	}

	// 회원가입 등록
	
	@PostMapping("/register")
	public String register( @ModelAttribute("umember") @Validated  UmemberVO umember, BindingResult result,  ModelMap model) throws Exception {
		log.info("register호출");
		model.addAttribute("umember", umember);
		// 회원 가입 실패시
		if (result.hasErrors()) {
			
	            List<ObjectError> list = result.getAllErrors();
	            for(ObjectError error : list){
	                System.out.println(error);
	            }
			return "uMemberJoin.umemberJoinForm";
			}
	
		// 회원 가입 성공시
		umemberService.register(umember);
		System.out.println("등록 성공" + umember.toString());
	
		return "uMemberJoin.umemberJoinSuccess";
		
		
	}
	

	}
