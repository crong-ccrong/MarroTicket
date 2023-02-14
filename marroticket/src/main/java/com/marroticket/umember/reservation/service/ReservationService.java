package com.marroticket.umember.reservation.service;

import java.util.Date;
import java.util.List;

import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

public interface ReservationService {

	List<ReservationVO> getReservationListByUNumber(int uNumber) throws Exception;

	public List<SeatVO> list(String ticketNum) throws Exception;

	public void cancelReservation(int rnumber ) throws Exception;
	
	List<ReservationVO> viewingHistory(int uNumber) throws Exception;
}
