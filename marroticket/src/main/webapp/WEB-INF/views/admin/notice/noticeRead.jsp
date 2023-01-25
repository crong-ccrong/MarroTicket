<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<h2>
	<spring:message code="notice.header.read" />
</h2>
<form:form modelAttribute="noticeVO">
	<form:hidden path="n_number" />
	<table>
		<tr>
			<td><spring:message code="notice.n_title" /></td>
			<td><form:input path="n_title" readonly="true" /></td>
			<td><font color="red"><form:errors path="n_title" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="notice.n_content" /></td>
			<td><form:textarea path="n_content" readonly="true" /></td>
			<td><font color="red"><form:errors path="n_content" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button type="submit" id="btnEdit">
			<spring:message code="action.edit" />
		</button>
		<button type="submit" id="btnRemove">
			<spring:message code="action.remove" />
		</button>
	</sec:authorize>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#noticeVO");
		console.log(formObj);
		$("#btnEdit").on("click", function() {
			var n_numberNo = $("#n_number");
			var n_numberVal = n_number.val();
			self.location = "modify?n_number=" + n_numberVal;
		});
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "list";
		});
	});
</script>