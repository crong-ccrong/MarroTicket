<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>등록한 연극 상세보기</h2>

<form:form modelAttribute="playVO">
	<form:hidden path="pname" />
	<table>
		<tr>
			<td>연극 번호</td>
			<td><form:input path="pnumber" readonly="true" /></td>
			<td><font color="red"><form:errors path="pnumber" /></font></td>
		</tr>

		<tr>
			<td>연극명</td>
			<td><form:textarea path="pname" readonly="true" /></td>
			<td><font color="red"><form:errors path="pname" /></font></td>
		</tr>

		<tr>
			<td>연극시작일</td>
			<td><form:textarea path="pstartDate" readonly="true" /></td>
			<td><font color="red"><form:errors path="pstartDate" /></font></td>
		</tr>

		<tr>
			<td>연극 종료일</td>
			<td><form:textarea path="pcloseDate" readonly="true" /></td>
			<td><font color="red"><form:errors path="pcloseDate" /></font></td>
		</tr>

		<tr>
			<td>러닝타임</td>
			<td><form:textarea path="prunningTime" readonly="true" /></td>
			<td><font color="red"><form:errors path="prunningTime" /></font></td>
		</tr>

		<tr>
			<td>극장명</td>
			<td><form:textarea path="ptheaterName" readonly="true" /></td>
			<td><font color="red"><form:errors path="ptheaterName" /></font></td>
		</tr>

		<tr>
			<td>극장주소</td>
			<td><form:textarea path="ptheaterAddress" readonly="true" /></td>
			<td><font color="red"><form:errors path="ptheaterAddress" /></font></td>
		</tr>

		<tr>
			<td>기획사 정보</td>
			<td><form:textarea path="pagency" readonly="true" /></td>
			<td><font color="red"><form:errors path="pagency" /></font></td>
		</tr>

		<tr>
			<td>관람등급</td>
			<td><form:textarea path="pratings" readonly="true" /></td>
			<td><font color="red"><form:errors path="pratings" /></font></td>
		</tr>

		<tr>
			<td>캐스팅데이터</td>
			<td><form:textarea path="pcasting" readonly="true" /></td>
			<td><font color="red"><form:errors path="pcasting" /></font></td>
		</tr>

		<tr>
			<td>예매오픈 희망일</td>
			<td><form:textarea path="pticketOpenDate" readonly="true" /></td>
			<td><font color="red"><form:errors path="pticketOpenDate" /></font></td>
		</tr>

		<tr>
			<td>연극 줄거리</td>
			<td><form:textarea path="pplot" readonly="true" /></td>
			<td><font color="red"><form:errors path="pplot" /></font></td>
		</tr>

		<tr>
			<td>좌석개수</td>
			<td><form:textarea path="pseatNumber" readonly="true" /></td>
			<td><font color="red"><form:errors path="pseatNumber" /></font></td>
		</tr>

		<tr>
			<td>티켓가격</td>
			<td><form:textarea path="pticketPrice" readonly="true" /></td>
			<td><font color="red"><form:errors path="pticketPrice" /></font></td>
		</tr>

		<tr>
			<td>장르</td>
			<td><form:textarea path="pgenre" readonly="true" /></td>
			<td><font color="red"><form:errors path="pgenre" /></font></td>
		</tr>

		<tr>
			<td>포스터url</td>
			<td><form:textarea path="pposterUrl" readonly="true" /></td>
			<td><font color="red"><form:errors path="pposterUrl" /></font></td>
		</tr>

		<tr>
			<td>약관동의여부</td>
			<td><form:textarea path="pagree" readonly="true" /></td>
			<td><font color="red"><form:errors path="pagree" /></font></td>
		</tr>

		<tr>
			<td>수정 승인 여부</td>
			<td><form:textarea path="pmodifyApproval" readonly="true" /></td>
			<td><font color="red"><form:errors path="pmodifyApproval" /></font></td>
		</tr>

		<tr>
			<td>등록 승인 여부</td>
			<td><form:textarea path="pregistrationApproval" readonly="true" /></td>
			<td><font color="red"><form:errors
						path="pregistrationApproval" /></font></td>
		</tr>

		<tr>
			<td>1회차 상연 시작 시각</td>
			<td><form:textarea path="pfirstStartTime" readonly="true" /></td>
			<td><font color="red"><form:errors path="pfirstStartTime" /></font></td>
		</tr>

		<tr>
			<td>2회차 상연 시작 시각</td>
			<td><form:textarea path="psecondStartTime" readonly="true" /></td>
			<td><font color="red"><form:errors
						path="psecondStartTime" /></font></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnList">목록으로 돌아가기</button>

</div>


<script>
	$(document).ready(function() {

		var formObj = $("playVO");

		console.log(formObj);

		$("#btnList").on("click", function() {
			self.location = "/admin/playApproveList";
		});
	});
</script>