<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type='hidden'  name='rticketList' value="${reservation.rticketList}"/><!-- 티켓번호 리스트 -->
	<input type='hidden'  name='pname' value="${reservation.pname}"/><!-- 공연명 -->
	<input type='hidden'  name='ptheaterName' value="${reservation.ptheaterName}"/><!-- 극장명 -->
	<input type='hidden'  name='pdate' value="${reservation.pdate}"/><!-- 공연일시 -->
	<input type='hidden'  name='uname' value="${reservation.uname}"/><!-- 예매자 -->
	<input type='hidden'  name='uphonenumber' value="${reservation.uphonenumber}"/><!-- 예매자 전화번호 -->
	<input type='hidden'  name='pticketPrice' value="${reservation.pticketPrice}"/><!-- 티켓 낱개 가격 -->
	<input type='hidden'  name='rticketcount' value="${reservation.rticketcount}"/><!-- 티켓 개수 -->
	<input type='hidden'  name='rtotalpayment' value="${rtotalpayment}"/><!-- 결제 총액 -->
</form>