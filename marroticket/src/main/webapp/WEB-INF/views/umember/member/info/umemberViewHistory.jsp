<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="umemberSidebar.jsp"%>

<h1>나의 관람 연극 내역</h1>
<hr>

<div class="info_body">

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


<style>
.info_body {
	width: 80%;
	float: right;
	padding: 10px;
}


.footer {
	clear: both;
}
</style>
