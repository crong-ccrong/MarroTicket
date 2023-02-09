package com.marroticket.umember.reservation.service;

import java.util.List;

import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

public interface ReservationService {

	public List<SeatVO> list(String ticketNum) throws Exception;

}
