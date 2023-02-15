package com.marroticket.tmember.member.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.admin.payment.domain.PaymentVO;
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
		return tmembermapper.tIdCheck(tmember)+tmembermapper.tIdCheck(tmember);
	}


	

	   //회원 등록
	   @Override
	   public void register(TmemberVO tmember) throws Exception {
	      
	      //회원등록 
	      tmembermapper.create(tmember);
	      
	      // auth
	      TmemberAuth auth = new TmemberAuth();
	      auth.setTmemberAuth("ROLE_TMEMBER");
	      tmembermapper.createAuth(auth);
	   }

	@Override
	public List<PaymentVO> theaterPayment(String tId) throws Exception {
		return tmembermapper.theaterPayment(tId) ;
	}
}
