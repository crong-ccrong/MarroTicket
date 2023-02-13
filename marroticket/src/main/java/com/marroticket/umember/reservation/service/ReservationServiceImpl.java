package com.marroticket.umember.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.ReservationMapper;
import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationMapper mapper;

	//예매리스트
	@Override
	public List<SeatVO> list(String ticketNum) throws Exception {
		return mapper.read(ticketNum);
	}
	
	//예매진행중 리스트
	@Override
	public List<SeatVO> reservinglist(String ticketNum) throws Exception {
		return mapper.readReserving(ticketNum);
	}	
	//예매 취소
	@Override
	public int delete(ReservationVO vo) throws Exception {
		return mapper.delete(vo);
	}

	//예매진행중으로 업데이트
	@Override
	public int advanceReserve(Map paramMap) throws Exception {
		return mapper.advanceReserve(paramMap);
	}
	
	//새로고침되면 예매진행중이었던 이력을 지운다.
	@Override
	public int deleteHistory(ReservationVO vo) throws Exception {
		return mapper.deleteHistory(vo);
	}

	// 구매 전 자리 선점 유효 시간이 지난 좌석 delete
	@Override
	public int deleteDataAfterTime(Map<String, Object> map) throws Exception {
		return mapper.deleteDataAfterTime(map);
	}

	// 예매 확정
	@Override
	public ReservationVO register(ReservationVO vo) throws Exception {
		mapper.create(vo);
		return mapper.getReservationById(vo.getRnumber());
	}
}
