package com.marroticket.umember.reservation.service;

import java.util.List;
import java.util.Map;

import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

public interface ReservationService {
	// 예매리스트
	public List<SeatVO> list(String ticketNum) throws Exception;

	// 예매리스트
	public List<SeatVO> reservinglist(String ticketNum) throws Exception;

	// 예매취소
	public int delete(ReservationVO vo) throws Exception;

	// 예매진행중으로 업데이트
	public int advanceReserve(Map paramMap) throws Exception;

	// 새로고침 또는 n분이 지나 세션이 만료되면 예매진행중이었던 이력을 지운다.
	public int deleteHistory(ReservationVO vo) throws Exception;

	// 예매진행중이 6분 후가 되면 삭제
	public int deleteDataAfterTime(Map<String, Object> map) throws Exception;
	
	//예매 확정(예매완료)
	public ReservationVO register(ReservationVO vo) throws Exception;
}
