package com.marroticket.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController { // 로그인 관련 controller
	// 일반회원로그인
	@GetMapping("/umemberlogin")
	public String umemberlogin() {
		System.out.println("umemberLogin logincontroller 호출 완료");
		return "umemberAuth.login";
	}
	//일반회원로그아웃
	@GetMapping("/umemberlogout")
	public String umemberlogout() {
		System.out.println("umemberLogout logoutcontroller 호출 완료");
		return "umemberAuth.logout";
	}
	// 극단회원로그인
	@GetMapping("/tmemberlogin")
	public String tmemberlogin() {
		System.out.println("tMemberLogin logincontroller 호출 완료");
		return "tmemberAuth.login";
	}
	// 극단회원로그인
	@GetMapping("/tmemberlogout")
	public String tmemberlogout() {
		System.out.println("tMemberLogout logoutcontroller 호출 완료");
		return "tmemberAuth.logout";
	}
}
