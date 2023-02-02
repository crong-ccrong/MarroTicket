package com.marroticket.mapper;

import com.marroticket.umember.member.domain.UmemberAuth;
import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberMapper {
	//아이디찾기
	public String findId(UmemberVO umember) throws Exception;
	

	public int updatePassword(UmemberVO umember) throws Exception;

	// 아이디를 읽어오기
	public UmemberVO read(String userId);
	
	//아이디 중복 체크
	public  int uIdCheck (UmemberVO umember) throws Exception;

	//회원가입
	//1. 회원 create
	public void create(UmemberVO member) throws Exception;
	//1. 회원 auth create
	public void createAuth(UmemberAuth auth) throws Exception;

}
