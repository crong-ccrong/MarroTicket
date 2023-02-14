package com.marroticket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marroticket.admin.notice.domain.NoticeVO;
import com.marroticket.umember.play.domain.PlayVO;

@Mapper
public interface PlayMapper {
	
	public List<PlayVO> playCurrentList() throws Exception;

	public List<PlayVO> playPassList() throws Exception;

	public List<PlayVO> playExpectedList() throws Exception;

	public String getPposter(Integer pnumber) throws Exception;

	// 등록한 연극 목록
	public List<PlayVO> playlist(Integer tNumber) throws Exception;
	
	// 등록한 연극 상세보기
	public PlayVO read(int pNumber) throws Exception;
	
	// 등록한 연극 수정
	public void update(PlayVO playVO) throws Exception;


	
	/*
	 * public List<PlayVO> quickReserve() throws Exception;
	 */
}
