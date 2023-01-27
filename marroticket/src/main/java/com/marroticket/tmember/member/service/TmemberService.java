package com.marroticket.tmember.member.service;

import com.marroticket.tmember.member.domain.TmemberVO;

public interface TmemberService {
	//아이디찾기
	public String findId(TmemberVO tmember) throws Exception;
	
	//임시비밀번호로 업데이트
	public int passwordUpdate(TmemberVO tmember) throws Exception;
}
