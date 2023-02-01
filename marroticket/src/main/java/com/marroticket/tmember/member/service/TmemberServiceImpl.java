package com.marroticket.tmember.member.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.marroticket.mapper.TmemberMapper;
import com.marroticket.tmember.member.domain.TmemberVO;

@Service
public class TmemberServiceImpl implements TmemberService {
	@Autowired
	private TmemberMapper tmembermapper;



	//아이디 중복체크
	@Override
	public int tIdCheck(TmemberVO tmember) throws Exception {
		return tmembermapper.tIdCheck(tmember);
	}

	//
	@Value("${file.dir}") //맥용으로 설정했으니 윈도우일땐 프로퍼티에서 설정 바꾸기
	private String uploadDir;
	
	@Override
	public void signUp(TmemberVO tmember, MultipartFile file) throws Exception {
		
		Path upload = Paths.get(uploadDir + File.separator + StringUtils.cleanPath(file.getOriginalFilename()));
		
		String Url = uploadDir;
		tmember.setTFileUrl(Url);
		tmember.setTBusinessRegisterationImage(file.getOriginalFilename());
		tmember.setTFileName(file.getName());
		
		try {
			Files.copy(file.getInputStream(), upload, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		tmembermapper.signUp(tmember);
	}

}
