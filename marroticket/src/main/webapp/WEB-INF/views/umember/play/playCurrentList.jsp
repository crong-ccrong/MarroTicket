<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h2>상연 예정 목록</h2>

<table border="1">
	<tr>
		<th align="center" width='200'>공연1</th>
	</tr>
	<c:choose>
		<c:when test="${empty playCurrentList }">
			<tr>
				<td><h3>상연 예정 연극이 없습니다.</h3></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${playCurrentList}" var="CurrentList">
				<tr>
					<td>${CurrentList.pName}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
