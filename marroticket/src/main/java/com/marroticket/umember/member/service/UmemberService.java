package com.marroticket.umember.member.service;

import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberService {
	//아이디찾기
	public String findId(UmemberVO umember) throws Exception;
	
	//비밀번호 찾기
	public String findPassword(UmemberVO umember) throws Exception;
}
