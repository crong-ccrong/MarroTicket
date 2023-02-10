package com.marroticket.common.service;

import java.util.List;

import com.marroticket.tmember.member.domain.TmemberVO;

public interface CommonService {

	//기타 문의 목록 페이지 
	public List<TmemberVO> list() throws Exception;
}
