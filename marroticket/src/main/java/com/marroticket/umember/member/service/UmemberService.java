package com.marroticket.umember.member.service;


import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberService {
	// 아이디찾기
	public String findId(UmemberVO umember) throws Exception;

	//임시비밀번호로 업데이트
	public int passwordUpdate(UmemberVO umember) throws Exception;
	// 아이디 중복 체크
	public int uIdCheck(UmemberVO umember) throws Exception;
	//회원가입
	public void register(UmemberVO umember) throws Exception;

}
