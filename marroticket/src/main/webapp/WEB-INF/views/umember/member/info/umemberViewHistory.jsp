<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<link rel="stylesheet" type="text/css" href="/css/umember_mypage.css"> 

<div class="wrapper">
  <div class="side">
    <!-- Sidebar content goes here -->
    <ul class="sidebar">
      <li><a href="/umember/umembermypage" data-text="내 정보">내 정보</a></li>
    <li><a href="/umember/umemberReserveInfo" data-text="예약 정보">예약 정보</a></li>
    <li><a href="/umember/umemberCancelInfo" data-text="예약 취소 정보">예약 취소 정보</a></li>
    <li><a href="/umember/umemberViewHistory" data-text="내가 본 연극">내가 본 연극</a></li>
    <li><a href="/umember/umemberCustomPlayList" data-text="나의 맞춤 연극">나의 맞춤 연극</a></li>
</ul> 
    
  </div>
  <div class="content">
		<h1>나의 관람 연극 내역</h1>
		<hr>
		<table border="1">
		<tr>
			<th>예매일</th>
			<th>예매 번호</th>
			<th>관람일시</th>
			<th>상품명</th>
			<th>매수</th>
			<th>결제총액</th>
		</tr>
		
	<c:forEach var="reservation" items="${reservationList}">
<c:if test="${reservation.rcancelState == 0 and reservation.rpayState == 2 }">
<tr>
<td><fmt:formatDate pattern="YYYY-MM-dd" value="${reservation.rdate}" /></td>
<td>${reservation.rnumber}<input type="hidden" name="rnumber" value="${reservation.rnumber}" /></td>
<td>${fn:substring(reservation.pdate, 0, 10)}
<td>${reservation.pname}</td>
<td>${reservation.rticketcount}</td>
<td>${reservation.rtotalpayment}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>



