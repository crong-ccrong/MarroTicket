<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="tfaq.header.list" />
</h2>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="tfaqRegister"><spring:message code="action.new" /></a>
</sec:authorize>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="tfaq.no" /></th>
		<th align="center" width="320"><spring:message code="tfaq.title" /></th>
		<th align="center" width="180"><spring:message
				code="tfaq.regdate" /></th>
	</tr>

	<c:choose>
		<c:when test="${empty tfaqList }">
			<tr>
				<td colspan="4"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${tfaqList }" var="tfaqVO">
				<tr>
					<td align="center">${tfaqVO.tfaqNo}</td>
					<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
					<td align="left"><a
						href="/tfaq/tfaqRead${pagination.makeQuery(pagination.pageRequest.page)}&tfaqNo=${tfaqVO.tfaqNo}">${tfaqVO.title}</a></td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${tfaqVO.regDate}" /></td>
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

	<!-- 관리자 네비게이션
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<c:forEach begin="${pagination.startPage }"
			end="${pagination.endPage }" var="idx">

			<a href="/tfaq/tfaqList${pagination.makeQuery(idx)}">${idx}</a>
		</c:forEach>
	</sec:authorize> -->


	<!-- 극단 네비게이션
	<sec:authorize access="hasRole('ROLE_TMEMBER')"></sec:authorize> -->


	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">

		<a href="/tfaq/tfaqList${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>


	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage +1}">&raquo;</a>
	</c:if>


</div>

<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
