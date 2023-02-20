<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="common_ufaqRead">
	<h2>
		<spring:message code="ufaq.header.read" />
	</h2>
	<form:form modelAttribute="ufaqVO">
		<form:hidden path="ufaqNo" />
		<table>
			<tr>
				<td><spring:message code="ufaq.title" /></td>
				<td><form:input path="title" readonly="true" /></td>
				<td><font color="red"><form:errors path="title" /></font></td>
			</tr>
	
			<tr>
				<td><spring:message code="ufaq.content" /></td>
				<td><form:textarea path="content" readonly="true" /></td>
				<td><font color="red"><form:errors path="content" /></font></td>
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
	
		<button type="submit" id="btnList">
			<spring:message code="action.list" />
		</button>
	</sec:authorize>
	</div>
</div>	
<script>
	$(document).ready(function() {

		var formObj = $("#ufaqVO");

		console.log(formObj);

		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		$("#btnEdit").on("click", function() {
			var ufaqNo = $("#ufaqNo");
			var ufaqNoVal = ufaqNo.val();

			self.location = "ufaqModify?ufaqNo=" + ufaqNoVal;
		});

		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/ufaq/ufaqList";
		});
	});
</script>
<style>
	.common_ufaqRead {
		width : 1120px;
		margin : 0 auto;
		font-family: 'Nanum Gothic ', sans-serif;
	}
</style>