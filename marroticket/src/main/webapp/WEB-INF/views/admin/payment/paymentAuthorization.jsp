<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<h2>정산내역</h2>

<table border="1">
	<tr>
		<th align="center" width="100">정산번호</th>
		<th align="center" width="100">정산일자</th>
		<th align="center" width="100">지급일자</th>
		<th align="center" width="320">총전산액</th>
		<th align="center" width="150">극단정산액</th>
		<th align="center" width="180">사이트정산액</th>
	</tr>

	<tr>
	</tr>
	<tr>
		<td align="center"><input value="${paymentHistory.payNumber}"
			readonly /></td>
		<td align="center"><input
			value="<fmt:formatDate pattern="YYYY-MM-dd"
							value="${paymentHistory.payCalculateDate}" />"
			readonly /></td>
		<td align="center"><input
			value="<fmt:formatDate pattern="YYYY-MM-dd"
							value="${paymentHistory.payPayDate}" />"
			readonly /></td>
		<td align="center"><input value="${paymentHistory.payPayment}"
			readonly /></td>
		<td align="center"><input
			value="${paymentHistory.payTheaterPayment}" readonly /></td>
		<td align="center"><input
			value="${paymentHistory.paySitePayment}" readonly /></td>
	</tr>
</table>
<div>
	<button id="back">정산 목록으로</button>
</div>

<script>
	$(document).ready(function() {
		$("#back").on("click", function() {

			location.href = "/admin/paymentList";
		});
	});
</script>

