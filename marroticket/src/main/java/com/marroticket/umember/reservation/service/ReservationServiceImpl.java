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

//예매 정보 조회
@Override
public List<ReservationVO> getReservationListByUNumber(int uNumber) throws Exception {
	return mapper.getReservationListByUNumber(uNumber);
}

@Override
public void cancellationOfReservation(int rnumber) throws Exception {
	mapper.deleteTicketInfo(rnumber);
	mapper.updateCancelState(rnumber);
}

@Override
public List<SeatVO> list(String ticketNum) throws Exception {
	return mapper.read(ticketNum);
}

}
