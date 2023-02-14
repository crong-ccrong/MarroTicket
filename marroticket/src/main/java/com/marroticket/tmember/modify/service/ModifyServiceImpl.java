package com.marroticket.tmember.modify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.PlayMapper;
import com.marroticket.umember.play.domain.PlayVO;

@Service
public class ModifyServiceImpl implements ModifyService {

	@Autowired
	private PlayMapper mapper;

	/*
	 * @Override public List<PlayVO> playlist() throws Exception {
	 * System.out.println("ModifyServiceImpl 호출"); return mapper.playlist(); }
	 */
	
	// 등록한 연극 목록
	@Override
	public List<PlayVO> playlist(Integer tNumber) throws Exception {
		System.out.println("ModifyServiceImpl 호출");
		return mapper.playlist(tNumber);
	}

}
