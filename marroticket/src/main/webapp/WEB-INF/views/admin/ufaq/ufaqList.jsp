<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="common_ufaqList">
	<h2>
		<spring:message code="ufaq.header.list" />
	</h2>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a href="ufaqRegister"><spring:message code="action.new" /></a>
	</sec:authorize>
	
	<table border="1">
		<tr>
			<th align="center" width="80"><spring:message code="ufaq.no" /></th>
			<th align="center" width="320"><spring:message code="ufaq.title" /></th>
			<th align="center" width="180"><spring:message
					code="ufaq.regdate" /></th>
		</tr>
	
	
		<c:choose>
			<c:when test="${empty ufaqList }">
				<tr>
					<td colspan="4"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${ufaqList }" var="ufaqVO">
					<tr>
						<td align="center">${ufaqVO.ufaqNo}</td>
						<td align="left"><a
							href="/ufaq/ufaqRead${pagination.makeQuery(pagination.pageRequest.page)}&ufaqNo=
	${ufaqVO.ufaqNo}">${ufaqVO.title}</a></td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ufaqVO.regDate}" /></td>
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
	
			<a href="/ufaq/ufaqList${pagination.makeQuery(idx)}">${idx}</a>
		</c:forEach>
	
		<c:if test="${pagination.next && pagination.endPage > 0}">
			<a href="${pagination.endPage +1}">&raquo;</a>
		</c:if>
	</div>
</div>
<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
<style>
	.common_ufaqList {
		width : 1120px;
		margin : 0 auto;
		font-family: 'Nanum Gothic ', sans-serif;
	}
</style>