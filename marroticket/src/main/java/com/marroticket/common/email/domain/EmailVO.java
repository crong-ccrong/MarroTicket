package com.marroticket.common.email.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class EmailVO {
	private String address;
	private String title;
	private String password;
	private String id;
	private final String umemberLoginUrl ="http://localhost:8080/auth/memberlogin";
	private final String tmemberLoginUrl ="http://localhost:8080/auth/memberlogin";
}
