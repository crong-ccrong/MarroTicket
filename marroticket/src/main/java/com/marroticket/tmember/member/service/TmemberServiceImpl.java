package com.marroticket.tmember.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.admin.payment.domain.PaymentVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.mapper.TmemberMapper;
import com.marroticket.tmember.member.domain.TmemberAuth;
import com.marroticket.tmember.member.domain.TmemberVO;

@Service
public class TmemberServiceImpl implements TmemberService {
	@Autowired
	private TmemberMapper tmembermapper;

	@Override
	public String findId(TmemberVO tmember) throws Exception {
		return tmembermapper.findId(tmember);
	}

	@Override
	public int passwordUpdate(TmemberVO tmember) throws Exception {
		return tmembermapper.updatePassword(tmember);
	}

	// 아이디 중복체크
	@Override
	public int tIdCheck(TmemberVO tmember) throws Exception {
		return tmembermapper.tIdCheck(tmember) + tmembermapper.tIdCheck(tmember);
	}

	// 회원 등록
	@Override
	public void register(TmemberVO tmember) throws Exception {

		// 회원등록
		tmembermapper.create(tmember);

		// auth
		TmemberAuth auth = new TmemberAuth();
		auth.setTmemberAuth("ROLE_GUEST");
		tmembermapper.createAuth(auth);
	}

	@Override
	public List<PaymentVO> theaterPayment(String tId) throws Exception {
		return tmembermapper.theaterPayment(tId);
	}
	// **************************관리자 추가************************//

	// 극단 회원 목록 페이지
	@Override
	public List<TmemberVO> list(PageRequest pageRequest) throws Exception {
		return tmembermapper.list(pageRequest);
	}

	// 극단 회원 상세 보기
	@Override
	public TmemberVO read(Integer TNumber) throws Exception {
		return tmembermapper.read(TNumber);
	}

	// 극단회원 사업자등록증
	@Override
	public String BusinessRegistration(Integer TNumber) throws Exception {
		return tmembermapper.BusinessRegistration(TNumber);
	}

	// 가입자 전체 인원 수 반환
	@Override
	public int count() throws Exception {
		return tmembermapper.count();
	}

	// 극단 회원 가입 승인
	@Override
	public void tmemberApprove(TmemberVO tmemberVO) throws Exception {
		tmembermapper.tmemberApprove(tmemberVO);
	}

	// 극단 회원 승인에 따른 권한 업그레이드
	@Override
	public void tmemberAuthUpgrade(TmemberVO tmemberVO) throws Exception {
		tmembermapper.tmemberAuthUpgrade(tmemberVO);
	}

	// 극단 회원 계약만료 처리
	@Override
	public void tmemberExpiration(TmemberVO tmemberVO) throws Exception {
		tmembermapper.tmemberExpiration(tmemberVO);
	}

	// 계약만료에 따른 극단 회원 권한 다운그레이드 서비스
	@Override
	public void tmemberAuthDowngrade(TmemberVO tmemberVO) throws Exception {
		tmembermapper.tmemberAuthDowngrade(tmemberVO);
	}

	// 마이페이지
	// 정보조회
	@Override
	public TmemberVO getTmemberByTId(String tId) throws Exception {
		return tmembermapper.getTmemberByTId(tId);
	}

	// 정보수정
	@Override
	public void modify(TmemberVO vo) throws Exception {
		tmembermapper.updateInfo(vo);
	}
}
