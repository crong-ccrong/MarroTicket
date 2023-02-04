<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<h2>
	<spring:message code="ufaq.header.modify" />
</h2>
<form:form modelAttribute="ufaqVO" action="modify">
	<form:hidden path="ufaqNo" />
	<table>
		<tr>
			<td><spring:message code="ufaq.title" /></td>
			<td><form:input path="title" /></td>
			<td><font color="red"><form:errors path="title" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="ufaq.content" /></td>
			<td><form:textarea path="content" /></td>
			<td><font color="red"><form:errors path="content" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>

	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#ufaqVO");

		$("#btnModify").on("click", function() {
			formObj.attr("action", "/ufaq/ufaqModify");
			formObj.attr("method", "post");

			formObj.submit();

		});

		$("#btnList").on("click", function() {
			// 페이징 처리로 삭제 self.location = "noticeList";
			
			//페이징 관련 정보를 쿼리 파라미터로 전달한다.
			self.location = "ufaqList${pgrq.toUriString()}";

		});
	});
</script>