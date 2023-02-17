package com.marroticket.umember.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.umember.member.domain.UmemberAuth;
import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.mapper.ReservationMapper;
import com.marroticket.mapper.UmemberMapper;

@Service
public class UmemberServiceImpl implements UmemberService {
	@Autowired
	private UmemberMapper umembermapper;
	@Autowired
	private ReservationMapper reservationmapper;

	@Override
	public String findId(UmemberVO umember) throws Exception {
		return umembermapper.findId(umember);
	}

	// 임시비밀번호로 업데이트
	public int passwordUpdate(UmemberVO umember) throws Exception {
		return umembermapper.updatePassword(umember);
	}

	// 아이디 중복 체크
	@Override
	public int uIdCheck(UmemberVO umember) throws Exception {
		return umembermapper.uIdCheck(umember);
	}

	// 회원가입
	public void register(UmemberVO umember) throws Exception {
		umembermapper.create(umember);

		// auth
		UmemberAuth auth = new UmemberAuth();
		auth.setUmemberAuth("ROLE_UMEMBER");
		umembermapper.createAuth(auth);
	}

	// 마이페이지
	// 정보조회
	@Override
	public UmemberVO getUmemberByUId(String uId) throws Exception {
		return umembermapper.getUmemberByUId(uId);
	}

	// 정보수정
	@Override
	public void modify(UmemberVO vo) throws Exception {
		umembermapper.updateInfo(vo);
	}
	// 회원탈퇴

	@Override
	public void remove(UmemberVO umember) throws Exception {
		// 순서 : 예매 내역 정리 - auth 권한 - 멤버삭제
		reservationmapper.withdrawalStatus(umember.getuNumber());
		umembermapper.deleteAuth(umember.getUmemberAuthList().get(0).getUNumber());
		umembermapper.deleteMember(umember);
	}

	// **************************관리자 추가************************//
	// 회원 목록 페이지
	@Override
	public List<UmemberVO> list(PageRequest pageRequest) throws Exception {
		return umembermapper.list(pageRequest);
	}

	// 가입자 전체 인원 수 반환
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return umembermapper.count();
	}

}
