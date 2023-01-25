package com.marroticket.umember.play.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/play")
public class PlayController {
	
	//현재 상연 페이지
	@GetMapping("/playCurrentList")
	public String playCurrentList() {
		return "play.playCurrentList";
	}
	
	//지난 상연 페이지
	@GetMapping("/playPassList")
	public String playPassList() {
		return "play.playPassList";
	}
	
	//상연 예정 페이지
	@GetMapping("/playExpectedList")
	public String playExpectedList() {
		return "play.playExpectedList";
	}
	
	
	//빠른 예매 페이지
	@GetMapping("/quickReserve")
	public String quickReserve() {
		return "play.quickReserve";
	}
}
