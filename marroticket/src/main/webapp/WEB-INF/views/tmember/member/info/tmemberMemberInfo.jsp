<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 극단 회원 정보 + 수정버튼 -->

<h3>극단 회원 정보</h3>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<div class="content">
<form:form modelAttribute="vo" action="/theater/tmembermypage"> 
<table border="1">
	<tr>
		<th align="center" width="180">분류</th>
		<th align="center" width="400">내용</th>
	</tr>
	<tr>
		<th>회원번호</th>
		<th><form:input path="tNumber" readonly="true" /></th>
	</tr>
	<tr>
		<th>아이디</th>
		<th><form:input path="tId" readonly="true" /></th>
	</tr>
	
	<tr>
		<th>극단명</th>
		<th><form:input path="tName" readonly="true" /></th>
	</tr>
	<tr>
		<th>극단주소</th>
		<th><form:input path="tAddress" readonly="true" /></th>
	</tr>
	<tr>
		<th>대표자명</th>
		<th><form:input path="tOwnerName" readonly="true" /></th>
	</tr>
	<tr>
		<th>대표자 연락처</th>
		<th><form:input path="tOwnerPhoneNumber" readonly="true" /></th>
	</tr>
	<tr>
		<th>대표자 이메일</th>
		<th><form:input path="tOwnerEmail" readonly="true" /></th>
	</tr>
	<tr>
		<th>사업자 등록 구분</th>
		<th><form:input path="tBusinessRegistration" readonly="true" /></th>
	</tr>
	<tr>
		<th>사업자 등록 번호</th>
		<th><form:input path="tBusinessRegistrationNumber" readonly="true" /></th>
	</tr>
	<tr>
		<!-- 이미지로 보여주기 -->
	</tr>
	<tr>
		<th>거래은행</th>
		<th><form:input path="tBank" readonly="true" /></th>
	</tr>
	<tr>
		<th>계좌번호</th>
		<th><form:input path="tBankNumber" readonly="true" /></th>
	</tr>
	<tr>
		<th>예금주</th>
		<th><form:input path="tBankOwner" readonly="true" /></th>
	</tr>
	<tr>
		<th>가입 승인 여부</th>
		<th><form:input path="tAuth" readonly="true" /></th>
	</tr>
	
	<!-- 회원 정보 수정 버튼 -->
	
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="회원정보수정" onclick="location.href='/theater/tmemberModify'">
		</td>
	</tr>
	
	
</table>
</form:form>
</div>
