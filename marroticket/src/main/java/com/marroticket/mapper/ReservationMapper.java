package com.marroticket.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

public interface ReservationMapper {

	public List<SeatVO> read(@Param("ticketNum") String ticketNum) throws Exception;
	public List<SeatVO> readReserving(@Param("ticketNum") String ticketNum) throws Exception;
	public int delete(ReservationVO vo) throws Exception;
	public int advanceReserve(Map paramMap) throws Exception;
	public int deleteHistory(ReservationVO vo) throws Exception;
	public int deleteDataAfterTime(Map<String, Object> map) throws Exception;
	public int create(ReservationVO vo) throws Exception;
	public ReservationVO getReservationById(Integer rnumber) throws Exception;
}
