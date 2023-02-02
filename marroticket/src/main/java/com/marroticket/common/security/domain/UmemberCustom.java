package com.marroticket.common.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.marroticket.umember.member.domain.UmemberVO;


public class UmemberCustom extends User {
	private static final long serialVersionUID = 1L;

	private UmemberVO member;

	public UmemberCustom(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public UmemberCustom(UmemberVO member) {
		super(member.getuId(), member.getUPassword(), member.getUmemberAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getUmemberAuth())).collect(Collectors.toList()));

		this.member = member;
	}

	public UmemberVO getMember() {
		return member;
	}
}

