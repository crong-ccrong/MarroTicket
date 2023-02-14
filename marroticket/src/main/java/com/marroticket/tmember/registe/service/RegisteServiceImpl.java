
package com.marroticket.tmember.registe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.RegisteMapper;
import com.marroticket.mapper.TmemberMapper;
import com.marroticket.umember.play.domain.PlayVO;

@Service
public class RegisteServiceImpl implements RegisteService {

	@Autowired
	private RegisteMapper mapper;
	
	@Autowired
	private TmemberMapper tmembermapper;

	@Override
	public void registePlay(PlayVO playVO) throws Exception {
		mapper.registe(playVO);
	}
}