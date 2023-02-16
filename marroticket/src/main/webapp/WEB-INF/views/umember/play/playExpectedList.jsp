<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h2>상연 예정 목록</h2>

<table border="1">
	<c:choose>
		<c:when test="${empty playExpectedList }">
			<tr>
				<td><h3>상연 예정 연극이 없습니다.</h3></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<c:forEach items="${playExpectedList}" var="list"
					varStatus="status">
					<td><table>
							<tr>
								<td align="center"><a
									href="/play/playDetail?pnumber=${list.pnumber }">
									<img alt="..." src="poster?pnumber=${list.pnumber }"></a></td>
							</tr>
							<tr>
								<td align="center">${list.pname}</td>
							</tr>
							<tr>
								<td align="center">${list.ptheaterName}</td>
							</tr>
							<tr>
								<td align="center"><fmt:formatDate pattern="YYYY-MM-dd (E)"
										value="${list.pstartDate}" />~<br> <fmt:formatDate
										pattern="YYYY-MM-dd (E)" value="${list.pcloseDate }" /></td>
							</tr>
						</table></td>
					<c:if test="${status.count%4 == 0 }">
						<tr></tr>
					</c:if>
				</c:forEach>
			</tr>
		</c:otherwise>
	</c:choose>
</table>

