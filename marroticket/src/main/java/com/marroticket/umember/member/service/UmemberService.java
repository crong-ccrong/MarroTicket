package com.marroticket.umember.member.service;


import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberService {
	// 아이디찾기
	public String findId(UmemberVO umember) throws Exception;

	// 아이디 중복 체크
	public int uIdCheck(UmemberVO umember) throws Exception;

	// 회원 등록
	public void register( UmemberVO umember) throws Exception;

	
	

}
