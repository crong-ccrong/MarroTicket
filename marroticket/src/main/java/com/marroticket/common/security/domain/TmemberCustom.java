package com.marroticket.common.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.marroticket.tmember.member.domain.TmemberVO;

public class TmemberCustom extends User {
	private static final long serialVersionUID = 1L;

	private TmemberVO member;

	public TmemberCustom(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public TmemberCustom(TmemberVO member) {
		super(member.gettId(), member.getTPassword(), member.getTmemberAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getTmemberAuth())).collect(Collectors.toList()));

		this.member = member;	
	}

	public TmemberVO getMember() {
		return member;
	}
	
	public String gettId() {
		return member.gettId();
	}
	
	public String gettname() {
		return member.gettName();
	}
	
	
}
