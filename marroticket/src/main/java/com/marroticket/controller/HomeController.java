package com.marroticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home(String modalData) {
		return "home";
	}

	// 회원가입
	@GetMapping("/join")
	public String joinChoose() {
		return "joinChoose";
	}

	@GetMapping("/umemberJoinForm")
	public String userJoin() {
		return "uMemberJoin.umemberJoinForm";
	}

	@GetMapping("/tmemberJoinForm")
	public String theaterJoin() {
		return "tMemberJoin.tmemberJoinForm";
	}

	// 회원 관련
	@GetMapping("/loginChoose")
	public String login() {
		return "loginChoose";
	}

	// 아이디 찾기 유형 선택
	@GetMapping("/memberFindId")
	public String idFindChoose() {
		return "memberFind.Id";
	}

	// 비밀번호 찾기 유형 선택
	@GetMapping("/memberFindPassword")
	public String passwordFindChoose() {
		return "memberFind.Password";
	}

	// 일반회원 아이디찾기
	@GetMapping("/umemberFindId")
	public String userFindId() {
		System.out.println("umemberFindId 메세드 호출");
		return "umemberFind.Id";
	}

	// 일반회원 비밀번호찾기
	@GetMapping("/umemberFindPassword")
	public String userFindPassword() {
		System.out.println("logincontroller 호출 완료");
		return "umemberFind.Password";
	}

	// 극단회원 아이디찾기
	@GetMapping("/tmemberFindId")
	public String tmemberFindId() {
		System.out.println("logincontroller 호출 완료");
		return "tmemberFind.Id";
	}

	// 극단회원 비밀번호찾기
	@GetMapping("/tmemberFindPassword")
	public String tmemberFindPassword() {
		System.out.println("logincontroller 호출 완료");
		return "tmemberFind.Password";
	}

	// footer
	@GetMapping("/privacy")
	public String privacy() {
		return "footer.privacy";
	}

	@GetMapping("/companyinfo")
	public String companyinfo() {
		return "footer.companyinfo";
	}

	@GetMapping("/umembertermsofuse")
	public String umembertermsofuse(Model model) {
		model.addAttribute("umember", "umember");
		return "footer.umembertermsofuse";
	}

	@GetMapping("/tmembertermsofuse")
	public String tmembertermsofuse(Model model) {
		model.addAttribute("umember", "umember");
		return "footer.tmembertermsofuse";
	}

	// 고객센터
	// 일반회원 FAQ
	// 목록
	@GetMapping("/ufaqList")
	public String ufaqList() {
		return "serviceCenter.ufaqList";
	}

	// 일반회원 문의 사항
	@GetMapping("/serviceCenter/otherInquiries")
	public String otherInquiries() {
		return "serviceCenter.otherInquiries";
	}
}
