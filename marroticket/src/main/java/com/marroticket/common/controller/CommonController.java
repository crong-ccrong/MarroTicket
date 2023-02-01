package com.marroticket.common.controller;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class CommonController {	
	@GetMapping(value = "/error/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied(접근 불가)");
	}
}