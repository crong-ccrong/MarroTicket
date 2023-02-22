<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/list.css">

<!-- html -->
<div class="common_otherInquiries">
	<div class="common_otherInquiries_list">
		<h3 style="line-height: 5px; letter-spacing: -1px; margin-top: 10px"
			align="left">기타 문의</h3>
		<hr style="margin-top: 15px; margin-bottom: 15px">

		<table>
			<colgroup>
				<col style="width: 30%">
				<col style="width: 70%">
			</colgroup>
			<tr>
				<th scope="col" style="height: 23px; padding: 5px;">극단명</th>
				<th scope="col">이메일</th>
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
							<td align="center" style="height: 23px; padding: 5px;">${tmemberVO.tName}</td>
							<td align="left"><c:out value="${tmemberVO.tOwnerEmail}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<hr style="margin-top: 15px; margin-bottom: 15px">
	</div>
</div>
<script>
	$(".header_gnb_link.service").css({
		'color' : '#EB0000',
		'font-weight' : 'bold'
	});
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>