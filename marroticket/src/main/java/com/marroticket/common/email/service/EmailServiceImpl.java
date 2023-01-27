package com.marroticket.common.email.service;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import com.marroticket.common.email.domain.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender emailSender;
	@Autowired
	private SpringTemplateEngine templateEngine;

	@Override
	public void sendUmemberEmail(EmailVO email) throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		// 메일 제목 설정
		helper.setSubject(email.getTitle());

		// 수신자 설정
		helper.setTo(email.getAddress());

		// 발신자 설정
		helper.setFrom("xpsxm617@naver.com");

		// 템플릿에 전달할 데이터 설정
		HashMap<String, String> emailValues = new HashMap<>();
		emailValues.put("password", email.getPassword());
		emailValues.put("url", email.getUmemberLoginUrl());

		Context context = new Context();
		emailValues.forEach((key, value) -> {
			context.setVariable(key, value);
		});

		// 메일 내용 설정 : 템플릿 프로세스
		String html = templateEngine.process("passwordTemplate", context);
		helper.setText(html, true);

		// 메일 보내기
		emailSender.send(message);
	}

	@Override
	public void sendTmemberEmail(EmailVO email) throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		// 메일 제목 설정
		helper.setSubject(email.getTitle());

		// 수신자 설정
		helper.setTo(email.getAddress());

		// 발신자 설정
		helper.setFrom("xpsxm617@naver.com");
		
		if (email.getId()!=null) { //아이디 찾기 일 때
			// 템플릿에 전달할 데이터 설정
			HashMap<String, String> emailValues = new HashMap<>();
			emailValues.put("id", email.getId());
			emailValues.put("url", email.getTmemberLoginUrl());

			Context context = new Context();
			emailValues.forEach((key, value) -> {
				context.setVariable(key, value);
			});

			// 메일 내용 설정 : 템플릿 프로세스
			String html = templateEngine.process("idTemplate", context);
			helper.setText(html, true);
		} else { //임시비밀번호 발급일 때
			// 템플릿에 전달할 데이터 설정
			HashMap<String, String> emailValues = new HashMap<>();
			emailValues.put("password", email.getPassword());
			emailValues.put("url", email.getTmemberLoginUrl());

			Context context = new Context();
			emailValues.forEach((key, value) -> {
				context.setVariable(key, value);
			});

			// 메일 내용 설정 : 템플릿 프로세스
			String html = templateEngine.process("passwordTemplate", context);
			helper.setText(html, true);
		}
		// 메일 보내기
		emailSender.send(message);
	}
	
}
