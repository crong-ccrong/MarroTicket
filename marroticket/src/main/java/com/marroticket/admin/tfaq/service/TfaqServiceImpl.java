package com.marroticket.admin.tfaq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.admin.tfaq.domain.TfaqVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.mapper.TfaqMapper;

@Service
public class TfaqServiceImpl implements TfaqService {

	@Autowired
	private TfaqMapper mapper;

	// 극단 FAQ 등록 처리
	@Override
	public void register(TfaqVO tfaqVO) throws Exception {
		// TODO Auto-generated method stub
		mapper.create(tfaqVO);
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<TfaqVO> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);

	}

	// 극단 FAQ 상세 페이지
	@Override
	public TfaqVO read(Integer tfaqNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(tfaqNo);
	}

	// 극단 FAQ 수정 처리
	@Override
	public void modify(TfaqVO tfaqVO) throws Exception {
		// TODO Auto-generated method stub
		mapper.update(tfaqVO);

	}

	// 극단 FAQ 삭제 처리
	@Override
	public void remove(Integer tfaqNo) throws Exception {
		// TODO Auto-generated method stub
		mapper.delete(tfaqNo);

	}

	// 극단 FAQ 전체 건수 반환
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return mapper.count();
	}

}
