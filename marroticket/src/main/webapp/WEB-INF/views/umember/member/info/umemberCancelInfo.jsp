<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ include file="umemberSidebar.jsp" %> 
<h1>예매 취소 내역</h1>
<hr>
<div class="info_body">
	<table border="1">
		<tr>
			<th>취소일시</th>
			<th>관람일시</th>
			<th>상품명</th>
			<th>매수</th>
			<th>결제취소금액</th>
		</tr>
		<c:forEach var="reservation" items="${reservationList}">
		  <c:if test="${reservation.rcancelState == 1}">
			<tr>
				<td><fmt:formatDate pattern="YYYY-MM-dd" value="${reservation.rcancelDate}" /></td>
				<td>이용일</td>
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