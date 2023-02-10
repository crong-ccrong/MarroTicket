package com.marroticket.umember.reservation.service;

import java.util.List;

import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

public interface ReservationService {

	List<ReservationVO> getReservationListByUNumber(int uNumber) throws Exception;

	public void cancellationOfReservation(int rnumber) throws Exception;
	
	public List<SeatVO> list(String ticketNum) throws Exception;

}
