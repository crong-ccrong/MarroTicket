<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="playYear" value="${reservation.pdate.substring(0,4) }" />
<c:set var="playMonth" value="${reservation.pdate.substring(4,6) }" />
<c:set var="playDate" value="${reservation.pdate.substring(6,8) }" />


<div class="goods_info right_lst1">
	 <strong class="goods_tit product_title" style="font-size:17px">${reservation.pname }</strong>
	 <br>
	<c:choose>
		<c:when test="${reservation.pturn == 1 }">1회차&nbsp;&nbsp;${reservation.pfirstStartTime.substring(0,2) }시&nbsp;${reservation.pfirstStartTime.substring(3,5) }분 공연</c:when>
		<c:when test="${reservation.pturn == 2 }">2회차</c:when>
	</c:choose>
</div>
<hr> <br>
<div class="reserve_result">
	<strong> <span>예매정보</span>
	</strong>
<!-- 	<ul class="seat_list" style="height: 150px;">
		<li><span class="seat_level">선택좌석</span> 
		<br>
		<span class="seat_price">14열 18번</span></li>
	</ul> -->
	<table>
		<caption>예매정보</caption><br>
		<colgroup>
			<col width="70px">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th>일시</th>
				<td id="_startDateTime">${playYear }년&nbsp;&nbsp;${playMonth }월&nbsp;&nbsp;${playDate }일  </td>
			</tr>
			<tr>
				<th>티켓금액</th>
				<td id="_price_ticket">${reservation.pticketPrice } 원</td>
			</tr>
			<tr>
				<th>티켓개수</th>
				<td id="_price_count"> 0개</td>
			</tr>
			<tr>
				<th>예매수수료</th>
				<td id="_price_fee" name="">500 원</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>총결제</th>
				<td id="_price_amount" name="price_amount">0원</td>
			</tr>
		</tfoot>
	</table>
	<br>
	<ul class="notice_result">
		<li>취소기한 : <span class="color_point" id="_cancel_time">${playYear }.${playMonth }.${playDate -1}
				23:59까지</span>
		</li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취소수수료 : <span class="color_point">티켓금액의 30%</span>
		</li>
	</ul>
</div>