package com.marroticket.umember.member.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.mapper.UmemberMapper;

@Service
public class UmemberServiceImpl implements UmemberService {
	@Autowired
	private UmemberMapper umembermapper;
	
	@Override
	public String findId(UmemberVO umember) throws Exception {
		return umembermapper.findId(umember);
	}
//아이디 중복 체크
	@Override
	public int uIdCheck(UmemberVO umember) throws Exception {
		return umembermapper.uIdCheck(umember);
	}
	@Override
	public void register(@Valid UmemberVO umember) throws Exception {
		 umembermapper.register(umember);
	}
	


	



	



	
	

	




	


	
}
