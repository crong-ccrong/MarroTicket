package com.marroticket.mapper;

import com.marroticket.tmember.member.domain.TmemberVO;

public interface TmemberMapper {
	//아이디찾기
	public String findId(TmemberVO tmember) throws Exception;
	
	//임시비밀번호 업데이트
	public int updatePassword(TmemberVO tmember) throws Exception;

	//아이디 읽어오기
	public TmemberVO readByUserId(String userId);
}
