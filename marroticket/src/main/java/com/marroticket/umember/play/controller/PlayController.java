package com.marroticket.umember.play.controller;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marroticket.umember.play.domain.PlayVO;
import com.marroticket.umember.play.service.PlayService;

//@PreAuthorize("hasRole('ROLE_UMEMBER')")
@RequestMapping("/play")
@Controller
@MapperScan(basePackages = "com.marroticket.mapper")
public class PlayController {

	@Autowired
	private PlayService playService;

	// 현재 상연 페이지
	@GetMapping("/playCurrentList")
	public String playCurrentList(Model model) throws Exception {

		List<PlayVO> playCurrentList = new ArrayList<>();

		playCurrentList = playService.playCurrentList();

		model.addAttribute("playCurrentList", playCurrentList);

		return "play.playCurrentList";
	}

	// 지난 상연 페이지
	@GetMapping("/playPassList")
	public String playPassList(Model model) throws Exception {

		List<PlayVO> playPassList = playService.playPassList();
		model.addAttribute("playPassList", playPassList);

		return "play.playPassList";
	}

	// 상연 예정 페이지
	@GetMapping("/playExpectedList")
	public String playExpectedList(Model model) throws Exception {

		List<PlayVO> playExpectedList = playService.playExpectedList();
		model.addAttribute("playExpectedList", playExpectedList);

		return "play.playExpectedList";
	}

	// 빠른 예매 페이지
	@GetMapping("/quickReserve")
	public String quickReserve() {
		return "play.quickReserve";
	}
	// 연극 공연 정보 상세 페이지
	@GetMapping("/playDetail")
	public String playDetail(Model model) {
		model.addAttribute("test", "test");
		return "playDetail";
	}
}
