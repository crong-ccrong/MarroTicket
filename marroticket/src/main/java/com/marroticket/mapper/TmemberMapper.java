package com.marroticket.mapper;

import com.marroticket.tmember.member.domain.TmemberVO;
import com.marroticket.tmember.member.domain.TmemberAuth;
import com.marroticket.tmember.member.domain.TmemberVO;

public interface TmemberMapper {
	//아이디찾기
	public String findId(TmemberVO tmember) throws Exception;
	
	//임시비밀번호 업데이트
	public int updatePassword(TmemberVO tmember) throws Exception;

	//아이디 읽어오기
	public TmemberVO readByUserId(String userId);
	

	//회원가입	
	//아이디 중복체크
	public  int tIdCheck (TmemberVO tmember) throws Exception;
	//회원 create
	public void create(TmemberVO member);
	//회원 auth create
	public void createAuth(TmemberAuth auth);

}
