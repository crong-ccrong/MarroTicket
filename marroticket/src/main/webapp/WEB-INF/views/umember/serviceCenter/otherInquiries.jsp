<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	기타 문의 : 극단 이메일
</h2>

<table border="1">
	<tr>
		<th align="center" width="80">극단명</th>
		<th align="center" width="320">이메일</th>
	</tr>

	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="3"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${list}" var="tmemberVO">
				<tr>
					<td align="center">${tmemberVO.tName}</td>
					<td align="left"><c:out
								value="${tmemberVO.tOwnerEmail}" /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>