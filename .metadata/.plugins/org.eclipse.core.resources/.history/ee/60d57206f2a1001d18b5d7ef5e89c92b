package com.marroticket.admin.notice.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.marroticket.admin.notice.domain.NoticeVO;
import com.marroticket.admin.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
@MapperScan(basePackages = "com.marroticket.mapper")
public class NoticeController {

	@Autowired
	private NoticeService service;

	// 공지사항 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) throws Exception {

		NoticeVO noticeVO = new NoticeVO();

		model.addAttribute(noticeVO);

	}

	// 공지사항 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(NoticeVO noticeVO, RedirectAttributes rttr) throws Exception {
		service.register(noticeVO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/list";
	}

	// 공지사항 목록 페이지

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		model.addAttribute("list", service.list());
		return "admin.notice.noticeList";
	}

	// 공지사항 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(int N_number, Model model) throws Exception {
		model.addAttribute(service.read(N_number));
	}

	// 공지사항 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void modifyForm(int n_number, Model model) throws Exception {
		model.addAttribute(service.read(n_number));
	}

	// 공지사항 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(NoticeVO noticeVO, RedirectAttributes rttr) throws Exception {
		service.modify(noticeVO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/list";
	}

	// 공지사항 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(int n_number, RedirectAttributes rttr) throws Exception {
		service.remove(n_number);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/list";
	}
}