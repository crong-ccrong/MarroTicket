package com.marroticket.mapper;

import javax.validation.Valid;

import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberMapper {
	//아이디찾기
	public String findId(UmemberVO umember) throws Exception;
	
	//아이디 중복 체크
	public  int uIdCheck (UmemberVO umember) throws Exception;

	//회원등록
	public void register(@Valid UmemberVO umember) throws Exception;
}
