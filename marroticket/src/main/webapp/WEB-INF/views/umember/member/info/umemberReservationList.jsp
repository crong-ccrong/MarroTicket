<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="umemberSidebar.jsp"%>



<h1>예매 정보</h1>
<hr>

<div class="info_body">
	<table border="1">
		<tr>
			<th>예매일</th>
			<th>예매 번호</th>
			<th>티켓 번호</th>
			<th>상품명</th>
			<th>관람일시</th>
			<th>매수</th>
			<th>결제총액</th>
			<th>디지털 티켓</th>
			<th>예매 취소</th>
		</tr>
		<c:forEach var="reservation" items="${reservationList}">
		  <c:if test="${reservation.rcancelState == 0}">
			<tr>
				<td><fmt:formatDate pattern="YYYY-MM-dd" value="${reservation.rdate}" /></td>
				<td>${reservation.rnumber}</td>
					<td>${reservation.rticketFirst}<br>${reservation.rticketSecond}<br>
					${reservation.rticketThird}<br> ${reservation.rticketFourth}</td>
				<td>${reservation.pname}</td>
				<td>이용일</td>
				<td>${reservation.rticketcount}</td>
				<td>${reservation.rtotalpayment}</td>
				<td><input type="button" value="보기"/></td>
				<td><input type="button" value="취소"  id="cancelReservation"/></td>
			</tr>
			</c:if>
		</c:forEach>

	</table>
</div>

<script>
$(document).ready(function() {
  $("#cancelReservation").on("click", function() {
    if (window.confirm("예매를 취소하시겠습니까?")) {
      // 확인 누르면 umemberCancelInfo 컨트롤러 실행
      window.location.href = '/umember/cancelReservation';
    }
  });
});
</script>


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
