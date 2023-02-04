package com.marroticket.mapper;

import java.util.List;

import com.marroticket.admin.tfaq.domain.TfaqVO;
import com.marroticket.common.domain.PageRequest;

public interface TfaqMapper {

	// 극단 FAQ 등록 처리
	public void create(TfaqVO tfaqVO) throws Exception;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<TfaqVO> list(PageRequest pageRequest) throws Exception;

	// 극단 FAQ 상세 페이지
	public TfaqVO read(Integer tfaqNo) throws Exception;

	// 극단 FAQ 수정 처리
	public void update(TfaqVO tfaqVO) throws Exception;

	// 극단 FAQ 삭제 처리
	public void delete(Integer tfaqNo) throws Exception;

	// 극단 FAQ 전체 건수 반환
	public int count() throws Exception;

}
