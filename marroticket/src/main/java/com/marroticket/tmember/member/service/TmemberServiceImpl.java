package com.marroticket.tmember.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return tmembermapper.tIdCheck(tmember);
	}

	// 회원 등록
	@Override
	public void register(TmemberVO tmember) throws Exception {

		// 회원등록
		tmembermapper.create(tmember);

		// auth
		TmemberAuth auth = new TmemberAuth();
		auth.setTmemberAuth("ROLE_TMEMBER");
		tmembermapper.createAuth(auth);
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
