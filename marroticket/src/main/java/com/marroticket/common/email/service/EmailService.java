package com.marroticket.common.email.service;

import javax.mail.MessagingException;

import com.marroticket.common.email.domain.EmailVO;

public interface EmailService {
	public void sendUmemberEmail(EmailVO email) throws MessagingException;
	public void sendTmemberEmail(EmailVO email) throws MessagingException;
}
