package com.marroticket.tmember.member.service;

import java.util.List;

import com.marroticket.admin.payment.domain.PaymentVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.tmember.member.domain.TmemberVO;

public interface TmemberService {
	// 아이디찾기
	public String findId(TmemberVO tmember) throws Exception;

	// 임시비밀번호로 업데이트
	public int passwordUpdate(TmemberVO tmember) throws Exception;

	// 극단 회원 가입
	public void register(TmemberVO tmember) throws Exception;

	// 극단 아이디 중복 체크
	public int tIdCheck(TmemberVO tmember) throws Exception;

	public List<PaymentVO> theaterPayment(String tId) throws Exception;

	// ************************* 관리자 추가*********************//
	// 극단 회원목록 리스트
	public List<TmemberVO> list(PageRequest pageRequest) throws Exception;

	// 극단 회원 상세보기
	public TmemberVO read(Integer TNumber) throws Exception;

	// 극단회원 사업자등록증 표시
	public String BusinessRegistration(Integer TNumber) throws Exception;

	// 가입자 전체 인원 수 반환(페이징)
	public int count() throws Exception;

	// 극단회원 가입 승인
	public void tmemberApprove(TmemberVO tmemberVO) throws Exception;

	// 극단 회원 승인에 따른 권한 업그레이드
	public void tmemberAuthUpgrade(TmemberVO tmemberVO) throws Exception;

	// 극단회원 계약만료 처리
	public void tmemberExpiration(TmemberVO tmemberVO) throws Exception;

	// 계약만료에 따른 극단 회원 권한 다운그레이드 서비스
	public void tmemberAuthDowngrade(TmemberVO tmemberVO) throws Exception;

	// 마이페이지
	// 정보 조회
	public TmemberVO getTmemberByTId(String tId) throws Exception;

	// 정보 수정
	public void modify(TmemberVO vo) throws Exception;

}
