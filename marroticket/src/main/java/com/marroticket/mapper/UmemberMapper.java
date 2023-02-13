package com.marroticket.mapper;

import org.apache.ibatis.annotations.Param;

import com.marroticket.umember.member.domain.UmemberAuth;
import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberMapper {
	//아이디찾기
	public String findId(UmemberVO umember) throws Exception;
	
	public int updatePassword(UmemberVO umember) throws Exception;
	
	//아이디 중복 체크
	public  int uIdCheck (UmemberVO umember) throws Exception;

	//회원가입
	//1. 회원 create
	public void create(UmemberVO member) throws Exception;
	//1. 회원 auth create
	public void createAuth(UmemberAuth auth) throws Exception;

	//마이페이지 
	//정보조회
	public UmemberVO getUmemberByUId(String uId) throws Exception;
	//정보수정
	public void updateInfo(UmemberVO vo) throws Exception;
	//권한 삭제
	public void deleteAuth(@Param("uNumber") Integer uNumber) throws Exception;
	//회원탈퇴
	public void deleteMember (UmemberVO umember) throws Exception;

	public UmemberVO read(String userId);
	
}
