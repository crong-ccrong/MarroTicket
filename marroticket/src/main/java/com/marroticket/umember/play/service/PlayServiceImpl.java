package com.marroticket.umember.play.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.PlayMapper;
import com.marroticket.umember.play.domain.PlayVO;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	private PlayMapper mapper;

	@Override
	public List<PlayVO> playCurrentList() throws Exception {
		return mapper.playCurrentList();
	}

	@Override
	public List<PlayVO> playPassList() throws Exception {
		return mapper.playPassList();
	}

	@Override
	public List<PlayVO> playExpectedList() throws Exception {
		return mapper.playExpectedList();
	}

	@Override
	public PlayVO read(Integer pNumber) throws Exception {
		return mapper.read(pNumber);
	}

	public String getPposter(Integer pnumber) throws Exception {
		return mapper.getPposter(pnumber);
	}
}
