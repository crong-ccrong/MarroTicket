package com.marroticket.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.marroticket.common.security.domain.TmemberCustom;
import com.marroticket.mapper.TmemberMapper;
import com.marroticket.tmember.member.domain.TmemberVO;

import lombok.extern.java.Log;

@Log
public class TmemberDetailsService implements UserDetailsService {

	@Autowired
	private TmemberMapper mapper;
	
	// 사용자 정의 유저 상세 클래스 메서드-loadUserByUsername의 Username은 userId이다.
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		log.info("Load User By UserId : " + userId);
		TmemberVO member = mapper.readByUserId(userId);
		
		log.info("queried by member mapper: " + member);
		return member == null ? null : new TmemberCustom(member);
	}



}
