<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	등록한 연극 상세보기
</h2>

<form:form modelAttribute="playVO">
	<form:hidden path="pNumber" />
	<table>
		<tr>
			<td>연극 번호</td>
			<td><form:input path="pNumber" readonly="true" /></td>
			<td><font color="red"><form:errors path="pNumber" /></font></td>
		</tr>

		<tr>
			<td></td>
			<td><form:textarea path="pName" readonly="true" /></td>
			<td><font color="red"><form:errors path="pName" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pStartDate" readonly="true" /></td>
			<td><font color="red"><form:errors path="pStartDate" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pCloseDate" readonly="true" /></td>
			<td><font color="red"><form:errors path="pCloseDate" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pRunningTime" readonly="true" /></td>
			<td><font color="red"><form:errors path="pRunningTime" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pTheaterName" readonly="true" /></td>
			<td><font color="red"><form:errors path="pTheaterName" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pTheaterAddress" readonly="true" /></td>
			<td><font color="red"><form:errors path="pTheaterAddress" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pAgency" readonly="true" /></td>
			<td><font color="red"><form:errors path="pAgency" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pRatings" readonly="true" /></td>
			<td><font color="red"><form:errors path="pRatings" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pCasting" readonly="true" /></td>
			<td><font color="red"><form:errors path="pCasting" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pTicketOpenDate" readonly="true" /></td>
			<td><font color="red"><form:errors path="pTicketOpenDate" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pPlot" readonly="true" /></td>
			<td><font color="red"><form:errors path="pPlot" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pSeatNumber" readonly="true" /></td>
			<td><font color="red"><form:errors path="pSeatNumber" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pTicketPrice" readonly="true" /></td>
			<td><font color="red"><form:errors path="pTicketPrice" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pGenre" readonly="true" /></td>
			<td><font color="red"><form:errors path="pGenre" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pPosterUrl" readonly="true" /></td>
			<td><font color="red"><form:errors path="pPosterUrl" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pAgree" readonly="true" /></td>
			<td><font color="red"><form:errors path="pAgree" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pModifyApproval" readonly="true" /></td>
			<td><font color="red"><form:errors path="pModifyApproval" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pRegistrationApproval" readonly="true" /></td>
			<td><font color="red"><form:errors path="pRegistrationApproval" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pFirstStartTime" readonly="true" /></td>
			<td><font color="red"><form:errors path="pFirstStartTime" /></font></td>
		</tr>
		
		<tr>
			<td></td>
			<td><form:textarea path="pSecondStartTime" readonly="true" /></td>
			<td><font color="red"><form:errors path="pSecondStartTime" /></font></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnEdit">
		수정하기
	</button>

	<button type="submit" id="btnList">
		목록으로 돌아가기
	</button>
	
</div>

<!-- 
<script>
	$(document).ready(function() {

		var formObj = $("#noticeVO");

		console.log(formObj);

		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		$("#btnEdit").on("click", function() {
			var noticeNo = $("#noticeNo");
			var noticeNoVal = noticeNo.val();

			self.location = "noticeModify?noticeNo=" + noticeNoVal;
		});

		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/noticeList";
		});
	});
</script>

 -->