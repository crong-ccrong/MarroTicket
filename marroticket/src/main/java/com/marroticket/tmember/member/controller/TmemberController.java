package com.marroticket.tmember.member.controller;


import java.util.List;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.marroticket.tmember.member.domain.TmemberVO;
import com.marroticket.tmember.member.service.TmemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/theater")
@MapperScan(basePackages = "com.marroticket.mapper")
@Slf4j
public class TmemberController {
	
	@Autowired
	private TmemberService tmemberService;
	
	@GetMapping("")
	public String home() {
		return "tmemberhome";
	}

	// 연극 등록
	@GetMapping("/registePlay")
	public String registePlay() {
		return "registe.registeAgree";
	}

	// 등록한 연극
	@GetMapping("/playRegisteInfo")
	public String playRegisteInfo() {
		return "info.tMemberPlayRegisteInfo";
	}

	// 극단 정산
	@GetMapping("/tmemberPayment")
	public String theaterPayment() {
		return "info.tMemberPayment";
	}

	// 극단 정보 관리
	@GetMapping("/tmembermypage")
	public String theaterMemberInfo() {
		return "info.tMemberMemberInfo";
	}

	// 극단 이용약관 페이지
	@GetMapping("/tmemberAgreement")
	public String tmemberAgreement() {
		System.out.println("tmemberAgreement 호출 완료");
		return "tMemberJoin.tmemberAgreement";
	}
	// 극단 회원 가입 페이지
	@GetMapping("/tmemberJoinForm")
	public String tmemberJoinForm(@ModelAttribute("tmember") TmemberVO tmember) {
		System.out.println("tmemberJoinForm 호출 완료");
		return "tMemberJoin.tmemberJoinForm";
	}
	
	//극단 회원 가입
	@PostMapping("/signUp")
	public String signUp(@ModelAttribute("tmember") @Validated TmemberVO tmember, BindingResult result,  @RequestParam(value = "file",required = false) MultipartFile file ) throws Exception {
		log.info("signUp 호출");
		
		
		//극단 회원 가입 실패시 리스트로 나열
		if (result.hasErrors()) {
            List<ObjectError> list = result.getAllErrors();
            for(ObjectError error : list){
                System.out.println(error);
            }
		return "tMemberJoin.tmemberJoinForm";
		}
	
		
		//가입 성공시 등록 성공 페이지로 이동
		tmemberService.signUp(tmember,file);
		System.out.println("등록성공" + tmember.toString());
			return"tMemberJoin.tmemberJoinSuccess";
	}
	
	//극단 회원가입 성공 페이지
	@GetMapping("/tmemberJoinSuccess")
	public String tmemberJoinSuccess() {
		System.out.println("tmemberJoinSuccess호출 완료");
		return "tMemberJoin.tmemberJoinSuccess";
	}
	
	//아이디 중복체크
	@ResponseBody
	@PostMapping("/tIdCheck")
	public int tIdCheck(TmemberVO tmember) throws Exception{
		System.out.println("중복 아이디 체크 컨트롤"+tmember.toString());
		int result = tmemberService.tIdCheck(tmember);
		System.out.println(result);
		return result;
	}
	
	
	
	// 극단 공지사항, faq

	//극단회원 FAQ 
	// 목록
	@GetMapping("/tfaqList")
	public String tfaqList() {
		return "tserviceCenter.tfaqList";
	}
	// 극단회원 Notice
	// 목록
	@GetMapping("/noticeList")
	public String noticeList() {
		return "tserviceCenter.notice";
	}
	//footer 
	@GetMapping("/privacy")
	public String privacy() {
		return "tmember.footer.privacy";
	}
	@GetMapping("/companyinfo")
	public String companyinfo() {
		return "tmember.footer.companyinfo";
	}
	@GetMapping("/termsofuse")
	public String termsofuse() {
		return "tmember.footer.termsofuse";
	}
}
