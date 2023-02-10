package com.marroticket.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.marroticket.umember.reservation.domain.ReservationVO;


public interface ReservationMapper {

	List<ReservationVO> getReservationListByUNumber(int uNumber) throws Exception;
	
	public void updateCancelState(@Param("rnumber") int rnumber) throws Exception;

	public void deleteTicketInfo(@Param("rnumber")int rnumber) throws Exception;

	
	
}
