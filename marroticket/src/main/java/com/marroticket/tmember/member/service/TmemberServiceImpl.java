package com.marroticket.tmember.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.tmember.member.domain.TmemberAuth;
import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.mapper.TmemberMapper;
import com.marroticket.tmember.member.domain.TmemberVO;

@Service
public class TmemberServiceImpl implements TmemberService {
	@Autowired
	private TmemberMapper mapper;

	@Override
	public String findId(TmemberVO tmember) throws Exception {
		return mapper.findId(tmember);
	}

	@Override
	public int passwordUpdate(TmemberVO tmember) throws Exception {
		return mapper.updatePassword(tmember);
	}
	

	//회원가입
	public void register(TmemberVO member) throws Exception{
		mapper.create(member);
		
		//auth
		TmemberAuth auth = new TmemberAuth();
		auth.setTmemberAuth("ROLE_TMEMBER");
		mapper.createAuth(auth);
	};
}
