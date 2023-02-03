package com.marroticket.admin.ufaq.service;

import java.util.List;

import com.marroticket.admin.ufaq.domain.UfaqVO;
import com.marroticket.common.domain.PageRequest;

public interface UfaqService {

	// 사용자 FAQ 등록 처리
	public void register(UfaqVO ufaqVO) throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<UfaqVO> list(PageRequest pageRequest) throws Exception;

	// 사용자 FAQ 상세 페이지
	public UfaqVO read(Integer ufaqNo) throws Exception;

	//사용자 FAQ 수정 처리
	public void modify(UfaqVO UfaqVO) throws Exception;

	// 사용자 FAQ 삭제 처리
	public void remove(Integer ufaqNo) throws Exception;

	// 게시글 전체 건수를 반환한다.
	public int count() throws Exception;
}
