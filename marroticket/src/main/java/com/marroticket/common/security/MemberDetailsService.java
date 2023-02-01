package com.marroticket.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.marroticket.common.security.domain.TmemberCustom;
import com.marroticket.common.security.domain.UmemberCustom;
import com.marroticket.mapper.TmemberMapper;
import com.marroticket.mapper.UmemberMapper;
import com.marroticket.tmember.member.domain.TmemberVO;
import com.marroticket.umember.member.domain.UmemberVO;

import lombok.extern.java.Log;

@Log
public class MemberDetailsService implements UserDetailsService {

	@Autowired
	private UmemberMapper umapper;
	@Autowired
	private TmemberMapper tmapper;

	// 사용자 정의 유저 상세 클래스 메서드-loadUserByUsername의 Username은 userId이다.
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		System.out.println("MemberDetailsService");
		
		//DB조회
		UmemberVO umember = umapper.read(userId);
		if (umember == null) {
			TmemberVO tmember = tmapper.readByUserId(userId);
			log.info("queried by member mapper: " + umember);
			return tmember == null ? null : new TmemberCustom(tmember);
		} else {
			log.info("queried by member mapper: " + umember);
			return umember == null ? null : new UmemberCustom(umember);
		}
	}

}