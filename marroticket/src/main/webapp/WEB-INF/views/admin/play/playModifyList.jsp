<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="next" value="${pagination.endPage +1}"/>
<c:set var="pre" value="${pagination.startPage - 1}"/>

<h2>연극 수정 승인 목록</h2>


<form:form method="post" modelAttribute="playVO"
	action="/admin/playModifyList">

	<table border="1">
		<tr>
			<th align="center" width="120">극단회원번호</th>
			<th align="center" width="100">연극번호</th>
			<th align="center" width="150">연극명</th>
			<th align="center" width="100">극장명</th>
			<th align="center" width="120">수정승인여부</th>
			<th align="center" width="100">정상등록</th>
		</tr>
		<c:choose>
			<c:when test="${empty playModifyList}">
				<tr>
					<td colspan="7">승인 요청한 연극이 없습니다.</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach items="${playModifyList}" var="playVO">
					<tr>
						<td align="center">${playVO.tnumber}</td>

						<td align="center">${playVO.pnumber}</td>


						<td align="center"><a
							href='/admin/playDetail?pnumber=${playVO.pnumber}'>${playVO.pname}</a></td>


						<td align="center">${playVO.ptheaterName}</td>

						<td align="center">${playVO.pmodifyApproval}</td>

						<td align="center"><a
							href="/admin/playModify?pnumber=${playVO.pnumber}">정상등록</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

</form:form>
<!-- 페이징 네비게이션 -->
<div>
	<c:if test="${pagination.prev}">
		<a href="/admin/playModifyList${pagination.makeQuery(pre)}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">

		<a href="/admin/playModifyList${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="/admin/playModifyList${pagination.makeQuery(next)}">&raquo;</a>
	</c:if>
</div>
<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
	$(".header_gnb_link.tmember_manage").css({
		'color' : '#EB0000',
		'font-weight' : 'bold'
	});
</script>


