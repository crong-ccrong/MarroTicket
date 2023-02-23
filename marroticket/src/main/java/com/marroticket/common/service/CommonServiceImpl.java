package com.marroticket.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.TmemberMapper;
import com.marroticket.tmember.member.domain.TmemberVO;

@Service
public class CommonServiceImpl implements CommonService {

	// 기타 문의 : 극단 이메일 목록

	@Autowired
	private TmemberMapper mapper;

	@Override
	public List<TmemberVO> list() throws Exception {
		System.out.println("commonServiceImpl 호출");
		return mapper.emailList();
	}
}
