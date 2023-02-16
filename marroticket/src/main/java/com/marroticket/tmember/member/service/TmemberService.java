package com.marroticket.tmember.member.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.marroticket.tmember.member.domain.TmemberVO;
import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.umember.play.domain.PlayVO;

public interface TmemberService {
   //아이디찾기
   public String findId(TmemberVO tmember) throws Exception;
   
   //임시비밀번호로 업데이트
   public int passwordUpdate(TmemberVO tmember) throws Exception;
   
   //극단 회원 가입
   public void register( TmemberVO tmember) throws Exception;
   
   //극단 아이디 중복 체크
   public int tIdCheck(TmemberVO tmember) throws Exception;


	//마이페이지 
		//정보 조회
		public TmemberVO getTmemberByTId(String tId) throws Exception;
		//정보 수정
		public void modify(TmemberVO vo) throws Exception;
	
}
