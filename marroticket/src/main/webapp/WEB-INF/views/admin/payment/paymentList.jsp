<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<h2>연극별 정산 내역</h2>


<table border="1">
	<tr>
		<th align="center" width="100">극단번호</th>
		<th align="center" width="320">극단명</th>
		<th align="center" width="100">연극번호</th>
		<th align="center" width="320">연극명</th>
		<th align="center" width="150">연극종료일자</th>
		<th align="center" width="100">정산내역</th>
	</tr>



	<c:choose>
		<c:when test="${empty paymentList }">
			<tr>
				<td align="center" colspan="6">정산요청이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${paymentList }" var="paymentList">
				<tr>
					<td align="center"><input id="tnumber"
						value="${paymentList.TNumber}" readonly /></td>
					<td align="center"><input id="tName"
						value="${paymentList.TName}" readonly /></td>
					<td align="center"><input id="pNumber"
						value="${paymentList.PNumber}" readonly /></td>
					<td align="center"><input id="pName"
						value="${paymentList.PName}" readonly /></td>
					<td align="center"><input id="PCloseDate"
						value="<fmt:formatDate pattern="YYYY-MM-dd"
							value="${paymentList.PCloseDate}" />"
						readonly /></td>
					<td align="center">
						<button type="submit" id="paymentButton" name="pNumber"
							value="${paymentList.PNumber}"
							onclick="payment(${paymentList.PNumber})">정산확인</button>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</table>


<!-- 페이징 네비게이션 -->
<div>
	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">

		<a href="/admin/paymentList${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next  && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>
</div>

<!-- 정산 버튼 처리 -->
<script>
	function payment(pN) {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		
		$.ajax({
			url : "/admin/payment",
			type : "post",
			data : {
				pNumber : pN
			},
			success : location.href = "/admin/paymentAuthorization?pNumber="
					+ pN

		})
	};
</script>

