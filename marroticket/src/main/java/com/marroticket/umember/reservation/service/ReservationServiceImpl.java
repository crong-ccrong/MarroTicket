package com.marroticket.umember.reservation.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.mapper.ReservationMapper;
import com.marroticket.umember.reservation.domain.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
@Autowired
private ReservationMapper reservationMapper;

//예매 정보 조회
@Override
public List<ReservationVO> getReservationListByUNumber(int uNumber) throws Exception {
	return reservationMapper.getReservationListByUNumber(uNumber);
}

@Override
public void cancellationOfReservation(int rnumber) throws Exception {
	reservationMapper.deleteTicketInfo(rnumber);
	reservationMapper.updateCancelState(rnumber);
}


}
