<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<<<<<<< HEAD
<!-- 극단 회원 공지사항 목록 페이지 -->
=======
>>>>>>> 79ab777f2a9cad4fbcbb343faff94669788c8f41
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="notice.header.list" />
</h2>
<a href="noticeRegister"><spring:message code="action.new" /></a>
<table border="1">
	<tr>
<<<<<<< HEAD
		<th align="center" width="80"><spring:message
				code="notice.n_number" /></th>
=======
		<th align="center" width="80"><spring:message code="notice.no" /></th>
>>>>>>> 79ab777f2a9cad4fbcbb343faff94669788c8f41
		<th align="center" width="320"><spring:message
				code="notice.title" /></th>
		<th align="center" width="180"><spring:message
				code="notice.regdate" /></th>
	</tr>

	<c:choose>
		<c:when test="${empty noticeList}">
			<tr>
				<td colspan="3"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${noticeList}" var="noticeVO">
				<tr>
					<td align="center">${noticeVO.noticeNo}</td>
					<td align="left"><a
						href="/notice/noticeRead?noticeNo=${noticeVO.noticeNo}"><c:out
								value="${noticeVO.title}" /></a></td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${noticeVO.regDate}" /></td>
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