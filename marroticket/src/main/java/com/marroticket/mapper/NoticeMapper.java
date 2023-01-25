package com.marroticket.mapper;

import java.util.List;

import com.marroticket.admin.notice.domain.NoticeVO;

public interface NoticeMapper {
	
	// 공지사항 등록 처리
	public void create(NoticeVO noticeVO) throws Exception;

	// 공지사항 목록 페이지
	public List<NoticeVO> list() throws Exception;

	// 공지사항 상세 페이지
	public NoticeVO read(Integer n_number) throws Exception;

	// 공지사항 수정 처리
	public void update(NoticeVO noticeVO) throws Exception;

	// 공지사항 삭제 처리
	public void delete(Integer n_number) throws Exception;
}
