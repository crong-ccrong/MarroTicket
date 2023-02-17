package com.marroticket.umember.member.service;

import java.util.List;

import com.marroticket.common.domain.PageRequest;

import com.marroticket.umember.member.domain.UmemberVO;

public interface UmemberService {
	// 아이디찾기
	public String findId(UmemberVO umember) throws Exception;

	// 임시비밀번호로 업데이트
	public int passwordUpdate(UmemberVO umember) throws Exception;

	// 아이디 중복 체크
	public int uIdCheck(UmemberVO umember) throws Exception;

	// 회원가입
	public void register(UmemberVO umember) throws Exception;

	// 마이페이지
	// 정보 조회
	public UmemberVO getUmemberByUId(String uId) throws Exception;

	// 정보 수정
	public void modify(UmemberVO vo) throws Exception;

	// 회원탈퇴
	public void remove(UmemberVO umember) throws Exception;

	// ************************* 관리자 추가*********************//
	// 회원목록 리스트
	public List<UmemberVO> list(PageRequest pageRequest) throws Exception;

	// 가입자 전체 인원 수 반환(페이징)
	public int count() throws Exception;

}
