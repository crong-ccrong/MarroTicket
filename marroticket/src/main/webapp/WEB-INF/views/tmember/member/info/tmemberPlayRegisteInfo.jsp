<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/tregisteplayinfo.css">

<h2>
	등록한 연극
</h2>

<table border="1">
	<tr>
		<th align="center" width="80">연극 번호</th>
		<th align="center" width="250">연극 제목</th>
		<th align="center" width="300">연극 포스터</th>
		<th align="center" width="80">등록 승인 상태</th>
		<th align="center" width="180">개막일</th>
		<th align="center" width="120">수정</th>
		<th align="center" width="80">수정 승인 상태</th>
	</tr>

	<c:choose>
		<c:when test="${empty playlist}">
			<tr>
				<td colspan="7"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>

		<c:otherwise>
			<c:forEach items="${playlist}" var="list" varStatus="status">
				<tr>
					<td align="center">${list.pnumber}</td>
					<td align="center"><a href="/theater/playRegisteRead?pnumber=${list.pnumber }">${list.pname}</a></td>
					
					<td align="center"><img alt="..."
						src="playPoster?pnumber=${list.pnumber}"
						width="100" height="100" id="big" /></td>
					
					<td align="center">
						<c:choose>
							<c:when test="${list.pregistrationApproval eq '0'}">미승인</c:when>
							<c:when test="${list.pregistrationApproval eq '1'}">승인</c:when>
							<c:otherwise>반려</c:otherwise>
						</c:choose>
					</td>
					
					<td align="left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${list.pstartDate}" /></td>
							
					<td align="center">
						<%-- <a href="/theater/playModify?pnumber=${list.pnumber }">수정임시버튼</a> --%>
						<c:choose>
							<c:when test="${list.pregistrationApproval eq '0' }">
								수정불가
							</c:when>
							<c:otherwise>
								<a href="/theater/playModify?pnumber=${list.pnumber }">수정하기</a>
							</c:otherwise>
						</c:choose>
					 
					 
					 
					 <!-- 연극 승인 처리 전까지 이 상태 유지하기 -->
					 
					 
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${list.pmodifyApproval eq '0'}">수정 없음/완료</c:when>
							<c:otherwise>수정 검토 중</c:otherwise>
						</c:choose>
					
					</td>
				</tr>
				<c:if test="${status.count%4 == 0 }">
						<tr></tr>
				</c:if>
			</c:forEach>
		</c:otherwise>
</c:choose>
</table>

<!-- 연극 포스터 호버 -->
<style>
#big:hover {
	width: 400px;
	height: 400px;
}
</style>