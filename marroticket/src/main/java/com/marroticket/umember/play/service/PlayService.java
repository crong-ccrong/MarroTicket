package com.marroticket.umember.play.service;

import java.util.List;

import com.marroticket.umember.play.domain.PlayVO;

public interface PlayService {
	public List<PlayVO> playCurrentList() throws Exception;

	public List<PlayVO> playPassList() throws Exception;

	public List<PlayVO> playExpectedList() throws Exception;
	
	public String getPposter(Integer pnumber) throws Exception;

	/*
	 * public List<PlayVO> quickReserve() throws Exception;
	 */
}
