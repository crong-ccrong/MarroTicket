package com.marroticket.common.login.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController { // 로그인 관련 controller

	@RequestMapping("/memberlogin")
	public String loginForm(String error, String logout, HttpServletRequest request, Model model) {
		if (error != null) {
			System.out.println("com.marroticket.common.login.controller.LoginController : /login : 에러");
			model.addAttribute("error", "error");
		}
		if (logout != null) {
			System.out.println("com.marroticket.common.login.controller.LoginController : /login : 로그아웃");
			// model.addAttribute("logout", "로그아웃!!!");
			return "redirect:/";
		}
		if (request.getParameter("return_to") != null) { //
			System.out.println(request.getParameter("return_to"));
			HttpSession session = request.getSession();
			session.setAttribute("returnTo", request.getParameter("return_to"));
		}
		return "log.in";
	}

	// 로그인 확인
	@PreAuthorize("isAnonymous()") //비로그인에게 권한
	@PostMapping("/loginCheck")
	public ResponseEntity<String> loginCheck(Principal principal) {
		if (principal == null) {
			return new ResponseEntity<>("loginStatusNull", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("loginStatus", HttpStatus.OK);
		}
	}
}