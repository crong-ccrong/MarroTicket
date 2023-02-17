<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>정산</h2>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="noticeRegister"><spring:message code="action.new" /></a>
</sec:authorize>

<table border="1">
	<tr>
		<th align="center" width="80">정산번호</th>
		<th align="center" width="180">정산일자</th>
		<th align="center" width="180">지급일</th>
		<th align="center" width="180">금액</th>
		<th align="center" width="80">연극번호</th>
	</tr>


	<c:choose>
		<c:when test="${empty theaterPayment}">
			<tr>
				<td colspan="5"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${theaterPayment}" var="theaterPayment">
				<tr>
					<td align="center">${theaterPayment.payNumber}</td>
					<td align="left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${theaterPayment.payCalculateDate}" /></td>

					<td align="left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${theaterPayment.payPayDate}" /></td>

					<td align="right">${theaterPayment.payTheaterPayment}</td>
					<td align="center">${theaterPayment.PNumber}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
