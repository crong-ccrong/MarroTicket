package com.marroticket.admin.ufaq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.admin.ufaq.domain.UfaqVO;
import com.marroticket.common.domain.PageRequest;
import com.marroticket.mapper.UfaqMapper;

@Service
public class UfaqServiceImpl implements UfaqService {

	@Autowired
	private UfaqMapper mapper;

	// 사용자 FAQ 등록 처리
	@Override
	public void register(UfaqVO ufaqVO) throws Exception {
		// TODO Auto-generated method stub
		mapper.create(ufaqVO);
	}

	// 사용자 FAQ 상세 페이지
	@Override
	public UfaqVO read(Integer ufaqNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(ufaqNo);
	}

	// 사용자 FAQ 수정 처리
	@Override
	public void modify(UfaqVO ufaqVO) throws Exception {
		// TODO Auto-generated method stub
		mapper.update(ufaqVO);

	}

	// 사용자 FAQ 삭제 처리
	@Override
	public void remove(Integer ufaqNo) throws Exception {
		// TODO Auto-generated method stub
		mapper.delete(ufaqNo);

	}

	// 사용자 FAQ 전체 건수 반환
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return mapper.count();
	}
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<UfaqVO> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);

	}


}
