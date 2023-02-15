package com.marroticket.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController { // 로그인 관련 controller
	// 일반회원로그인
	@RequestMapping("/memberlogin")
	public String loginForm(String error, String logout, Model model) {
		
		if (error != null) {
			System.out.println("com.marroticket.common.login.controller.LoginController : /login : 에러");
			model.addAttribute("error", "error");
		}
		if (logout != null) {
			System.out.println("com.marroticket.common.login.controller.LoginController : /login : 로그아웃");
			//model.addAttribute("logout", "로그아웃!!!");
			return "redirect:/";
		}
		return "log.in";
	}
}