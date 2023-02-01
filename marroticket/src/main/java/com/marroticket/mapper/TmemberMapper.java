package com.marroticket.mapper;

import com.marroticket.tmember.member.domain.TmemberVO;

public interface TmemberMapper {

	//회원등록
	public void signUp( TmemberVO tmember) throws Exception;
	
	//아이디 중복체크
	public  int tIdCheck (TmemberVO tmember) throws Exception;
	
	//
}
