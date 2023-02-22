<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="next" value="${pagination.endPage +1}"/>
<c:set var="pre" value="${pagination.startPage - 1}"/>

<h2>
	<spring:message code="member.header.ulist" />
</h2>


<table border="1">
	<tr>
		<th align="center" width="100"><spring:message
				code="member.uNumber" /></th>
		<th align="center" width="80"><spring:message code="member.uId" /></th>
		<th align="center" width="80"><spring:message code="member.uName" /></th>
		<th align="center" width="160"><spring:message
				code="member.uJoinDate" /></th>
	</tr>

	<c:choose>
		<c:when test="${empty umemberList}">
			<tr>
				<td colspan="6"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${umemberList}" var="UmemberVO">
				<tr>
					<td align="center">${UmemberVO.uNumber}</td>
					<td align="center">${UmemberVO.uId}</td>
					<td align="center">${UmemberVO.uName}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${UmemberVO.uJoinDate}" /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<!-- 페이징 네비게이션 -->
<div>

	<c:if test="${pagination.prev}">
		<a href="/admin/umemberList${pagination.makeQuery(pre)}">&laquo;</a>
	</c:if>
	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/admin/umemberList${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="/admin/umemberList${pagination.makeQuery(next)}">&raquo;</a>
	</c:if>
</div>


<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
	$(".header_gnb_link.member_manage").css({
		'color' : '#EB0000',
		'font-weight' : 'bold'
	});
</script>