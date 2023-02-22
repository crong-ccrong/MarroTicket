<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<h2>
	<spring:message code="notice.header.modify" />
</h2>
<form:form modelAttribute="noticeVO" action="modify">
	<form:hidden path="noticeNo" />
	<table>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td><form:input path="title" /></td>
			<td><font color="red"><form:errors path="title" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
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

		var formObj = $("#noticeVO");

		$("#btnModify").on("click", function() {
			formObj.attr("action", "/notice/noticeModify");
			formObj.attr("method", "post");

			formObj.submit();
		});

		$("#btnList").on("click", function() {
			//self.location = "noticeList";
			//페이징 관련 정보를 쿼리 파라미터로 전달한다.
			self.location = "noticeList${pgrq.toUriString()}";
		});
	});
	$(".header_gnb_link.board_manage").css({
	    'color': '#EB0000',
	    'font-weight': 'bold'
		});
</script>