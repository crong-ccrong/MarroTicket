package com.marroticket.common.controller;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marroticket.common.service.CommonService;
import com.marroticket.tmember.member.domain.TmemberVO;

import lombok.extern.java.Log;

@Log
@Controller
@MapperScan(basePackages = "com.marroticket.mapper")
public class CommonController {
	@GetMapping(value = "/error/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied(접근 불가)");
	}

	
	// 기타 문의 목록 페이지
	
	@Autowired
	private CommonService service;
	
	@RequestMapping(value = "/otherInquiries", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		String url = "umember.serviceCenter.otherInquiries";
		System.out.println("기타 문의 : 극단 이메일 목록"+service.list());

		model.addAttribute("list", service.list());
		return url;
	}
}