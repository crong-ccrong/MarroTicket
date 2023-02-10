package com.marroticket.umember.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.ReservationMapper;
import com.marroticket.umember.reservation.domain.ReservationVO;
import com.marroticket.umember.reservation.domain.SeatVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationMapper mapper;

	@Override
	public List<SeatVO> list(String ticketNum) throws Exception {
		return mapper.read(ticketNum);
	}
}
