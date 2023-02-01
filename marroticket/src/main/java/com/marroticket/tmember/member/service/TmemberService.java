package com.marroticket.tmember.member.service;


import org.springframework.web.multipart.MultipartFile;

import com.marroticket.tmember.member.domain.TmemberVO;

public interface TmemberService {
	
	//극단 회원 가입
	public void signUp( TmemberVO tmember , MultipartFile file) throws Exception;
	
	//극단 아이디 중복 체크
	public int tIdCheck(TmemberVO tmember) throws Exception;
	
	

}
