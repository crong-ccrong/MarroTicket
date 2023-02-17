package com.marroticket.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.admin.notice.domain.NoticeVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	// 공지사항 등록 처리
	@Override
	public void register(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		mapper.create(noticeVO);
	}

	// 공지사항 목록 페이지

	@Override
	public List<NoticeVO> list(PageRequest pageRequest) throws Exception {
		// TODOAuto-generated method stub
		return mapper.list(pageRequest);
	}

	// 공지사항 상세 페이지
	@Override
	public NoticeVO read(Integer noticeNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(noticeNo);
	}

	// 공지사항 수정 처리
	@Override
	public void modify(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		mapper.update(noticeVO);

	}

	// 공지사항 삭제 처리
	@Override
	public void remove(Integer noticeNo) throws Exception {
		// TODO Auto-generated method stub
		mapper.delete(noticeNo);

	}

	// 공지사항 전체 건수 반환
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return mapper.count();
	}


}
