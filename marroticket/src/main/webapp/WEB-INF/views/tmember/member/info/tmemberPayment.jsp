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
		<c:when test="${empty 정산리스트}">
			<tr>
				<td colspan="5"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${정산리스트}" var="정산VO">
				<tr>
					<td align="center">${정산VO.정산번호}</td>
					<td align="left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${정산VO.정산일자}" /></td>

					<td align="left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${정산VO.지급일}" /></td> 지급일은 정산일의 다음달 20일로 일괄적용됩니다. 처리해주세요~

					<td align="right">${정산VO.금액}</td>
					<td align="center">${정산VO.연극번호}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
