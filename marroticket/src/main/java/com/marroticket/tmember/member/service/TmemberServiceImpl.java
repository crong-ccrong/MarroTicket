package com.marroticket.tmember.member.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.marroticket.mapper.TmemberMapper;
import com.marroticket.tmember.member.domain.TmemberAuth;
import com.marroticket.tmember.member.domain.TmemberVO;
import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.umember.play.domain.PlayVO;

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
		return tmembermapper.tIdCheck(tmember);
	}


	@Value("${file.dir}") // 맥용으로 설정했으니 윈도우일땐 프로퍼티에서 설정 바꾸기
	private String uploadDir;

	   //회원 등록
	   @Override
	   public void register(TmemberVO tmember, MultipartFile file) throws Exception {
	      System.out.println(uploadDir);
	      System.out.println(File.separator);
	      System.out.println(file.getOriginalFilename());

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
	      
	      //회원등록 
	      tmembermapper.create(tmember);
	      
	      // auth
	      TmemberAuth auth = new TmemberAuth();
	      auth.setTmemberAuth("ROLE_TMEMBER");
	      tmembermapper.createAuth(auth);
	   }
	   
	 //마이페이지 
		//정보조회
		 @Override
		    public TmemberVO getTmemberByTId(String tId) throws Exception {
		        return tmembermapper.getTmemberByTId(tId);
		    }
		 //정보수정
		@Override
		public void modify(TmemberVO vo) throws Exception {
			tmembermapper.updateTmemberInfo(vo);
		}
}
