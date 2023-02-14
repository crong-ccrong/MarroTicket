package com.marroticket.tmember.modify.service;

import java.util.List;

import com.marroticket.umember.play.domain.PlayVO;

public interface ModifyService {

	public List<PlayVO> playlist(Integer tNumber) throws Exception;

}
