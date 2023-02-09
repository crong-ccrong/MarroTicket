package com.marroticket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

public interface ReservationMapper {

	public List<SeatVO> read(@Param("ticketNum") String ticketNum) throws Exception;

}
