<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="next" value="${pagination.endPage +1}"/>
<c:set var="pre" value="${pagination.startPage - 1}"/>

<!--사업자 등록증 호버 처리 -->
<style>
#big:hover {
	width: 400px;
	height: 400px;
}
</style>

<script type="text/javascript">
	$(".header_gnb_link.member_manage").css({
		'color' : '#EB0000',
		'font-weight' : 'bold'
	});
</script>
<h2>
	<spring:message code="member.header.tlist" />
</h2>

<table border="1">
	<tr>
		<th align="center" width="120"><spring:message
				code="member.tNumber" /></th>
		<th align="center" width="150"><spring:message
				code="member.tBusinessRegistractionNumber" /></th>
		<th align="center" width="80"><spring:message
				code="member.tOwnerName" /></th>
		<th align="center" width="100"><spring:message
				code="member.tName" /></th>
		<th align="center" width="130"><spring:message
				code="member.tOwnerEmail" /></th>
		<th align="center" width="130"><spring:message
				code="member.tOwnerPhoneNumber" /></th>
		<th align="center" width="160"><spring:message
				code="member.tBusinessRegisterationImage" /></th>
		<th align="center" width="160"><spring:message
				code="member.tAuth" /></th>


		<th align="center" width="160">가입승인</th>
		<th align="center" width="160">계약만료</th>

	</tr>

	<c:choose>
		<c:when test="${empty tmemberList}">
			<tr>
				<td colspan="8"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${tmemberList}" var="TmemberVO">
				<tr>
					<td align="center">${TmemberVO.TNumber}</td>
					<td align="center">${TmemberVO.TBusinessRegistrationNumber}</td>
					<td align="center">${TmemberVO.tOwnerName}</td>
					<td align="center">${TmemberVO.tName}</td>
					<td align="center">${TmemberVO.tOwnerEmail}</td>
					<td align="center">${TmemberVO.tOwnerPhoneNumber}</td>

					<td align="center"><img alt="..."
						src="tmemberBusinessRegistration?TNumber=${TmemberVO.TNumber}"
						width="100" height="100" id="big" /></td>
						
						<!--새창으로 띄우기 실패...  -->
						<%-- <a
						href="/admin/tmemberBusinessRegistration?TNumber=${TmemberVO.TNumber}"
						target="_blank ">파일보기</a> --%> 

					<td align="center">${TmemberVO.TAuth}</td>

					<td align="center"><a
						href="/admin/tmemberApprove?tNumber=${TmemberVO.TNumber}">승인</a></td>

					<td align="center"><a
						href="/admin/tmemberExpiration?tNumber=${TmemberVO.TNumber}">계약만료</a></td>

				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<!-- 페이징 네비게이션 -->
<div>

	<c:if test="${pagination.prev}">
		<a href="/admin/tmemberApproveList${pagination.makeQuery(pre)}">&laquo;</a>
	</c:if>
	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/admin/tmemberApproveList${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>
	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="/admin/tmemberApproveList${pagination.makeQuery(next)}">&raquo;</a>
	</c:if>
</div>


<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>