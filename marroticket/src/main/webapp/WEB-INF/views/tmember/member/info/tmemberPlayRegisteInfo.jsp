<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	등록한 연극
</h2>

<table border="1">
	<tr>
		<th align="center" width="80">연극 번호</th>
		<th align="center" width="250">연극 제목</th>
		<th align="center" width="80">등록 승인 상태</th>
		<th align="center" width="180">예매예정일</th>
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
						<a href="/theater/playModify?pnumber=${list.pnumber }">수정임시버튼</a>
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

<style>
body {
background-color: #f8f8f8;
}

/* Use a modern font family and make the text easy to read */
body, h2, th, td, a {
font-family: 'Roboto', sans-serif;
color: #444;
line-height: 1.5;
}

/* Add some animation to the headings */
h2 {
animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
from { opacity: 0; }
to { opacity: 1; }
}

/* Add a bold accent color for links and headings */
a {
color: #4286f4;
}

/* Add a hover effect for links */
a:hover {
text-decoration: underline;
}

/* Style the table */
table {
border-collapse: collapse;
width: 100%;
}

/* Style the table header */
th {
background-color: #4286f4;
color: #fff;
text-align: center;
font-weight: bold;
padding: 10px;
}

/* Style the table cells */
td {
text-align: center;
padding: 10px;
}

/* Style the odd rows of the table */
tr:nth-child(odd) {
background-color: #f2f2f2;
}

/* Style the even rows of the table */
tr:nth-child(even) {
background-color: #fff;
}

/* Style the content sections */
.section_terms {
margin: 20px 0;
padding: 20px;
background-color: #fff;
border-radius: 5px;
box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Make the sections responsive */
@media (max-width: 768px) {
.section_terms {
padding: 10px;
}
}
</style>
