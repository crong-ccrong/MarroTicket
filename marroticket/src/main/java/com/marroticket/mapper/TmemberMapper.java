package com.marroticket.mapper;

import com.marroticket.tmember.member.domain.TmemberVO;

import java.util.List;

import com.marroticket.admin.payment.domain.PaymentVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.tmember.member.domain.TmemberAuth;

public interface TmemberMapper {
	// 아이디찾기
	public String findId(TmemberVO tmember) throws Exception;

	// 임시비밀번호 업데이트
	public int updatePassword(TmemberVO tmember) throws Exception;

	// 아이디 읽어오기
	public TmemberVO readByUserId(String userId);

	// 회원가입
	// 아이디 중복체크
	public int tIdCheck(TmemberVO tmember) throws Exception;

	// 회원 create
	public void create(TmemberVO member);

	// 회원 auth create
	public void createAuth(TmemberAuth auth);

	public List<PaymentVO> theaterPayment(String tid) throws Exception;

	// *********************** 관리자 추가 ******************//
	// 회원 목록 페이지
	public List<TmemberVO> list(PageRequest pageRequest) throws Exception;

	// 가입자 전체 수 반환(페이징)
	public int count() throws Exception;

	// 극단회원 상세보기
	public TmemberVO read(Integer TNumber) throws Exception;

	// 극단회원 사업자등록증보기
	public String BusinessRegistration(Integer TNumber) throws Exception;

	// 극단회원 가입 승인
	public void tmemberApprove(TmemberVO tmemberVO) throws Exception;

	// 극단 회원 승인에 따른 권한 업그레이드
	public void tmemberAuthUpgrade(TmemberVO tmemberVO) throws Exception;

	// 극단 회원 계약만료 처리
	public void tmemberExpiration(TmemberVO tmemberVO) throws Exception;

	// 계약만료에 따른 극단회원 권한 다운 그레이드
	public void tmemberAuthDowngrade(TmemberVO tmemberVO) throws Exception;

}
