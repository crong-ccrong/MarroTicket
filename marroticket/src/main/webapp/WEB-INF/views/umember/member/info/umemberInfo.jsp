<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/css/umember_mypage.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=IBM+Plex+Sans+KR:wght@300&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&display=swap"
	rel="stylesheet">

<!-- 일반회원 마이페이지의 내정보 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- content section -->

<div class="wrapper">
	<div class="side">

		<ul class="sidebar">
			<li><a href="/umember/umembermypage" data-text="내 정보">내 정보</a></li>
<<<<<<< HEAD
			<li><a href="/umember/umemberReserveInfo" data-text="예약 정보">예약
					정보</a></li>
			<li><a href="/umember/umemberCancelInfo" data-text="예약 취소 정보">예약
=======
			<li><a href="/umember/umemberReserveInfo" data-text="예매 정보">예매
					정보</a></li>
			<li><a href="/umember/umemberCancelInfo" data-text="예매 취소 정보">예매
>>>>>>> 1ece4c5f1ae0a4231030598bc1f2a3a98089a8c2
					취소 정보</a></li>
			<li><a href="/umember/umemberViewHistory" data-text="내가 본 연극">내가
					본 연극</a></li>
			<li><a href="/umember/umemberCustomPlayList"
				data-text="나의 맞춤 연극">나의 맞춤 연극</a></li>
		</ul>

	</div>
	<div class="content">
		<h1>내 정보</h1>
		<hr>

		<form:form modelAttribute="vo">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><form:input path="uId" readonly="true" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><form:input path="uName" readonly="true" /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><form:input path="uGender" readonly="true" /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><form:input path="uBirthday" readonly="true" /></td>
				</tr>
				<tr>
					<td>휴대전화번호</td>
					<td><form:input path="uPhoneNumber" readonly="true" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><form:input path="uEmail" readonly="true" /></td>
				</tr>
				<tr>
					<td>선호하는 장르</td>
					<td><form:input path="uGenre" readonly="true" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="회원탈퇴" id="deleteMember">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" value="회원정보수정"
						onclick="location.href='/umember/umemberModify'"></td>
				</tr>
			</table>
		</form:form>
	</div>
</div>


<script>
	$(document).ready(function() {
		$("#deleteMember").on("click", function() {
			if (window.confirm("정말로 탈퇴하시겠습니까?")) {
				location.href = "/umember/umemberSecession";
			}
		});
	});
</script>

<!-- <script>
var Message = '${eMessage}';
if(Message === '에러메시지') {
    alert("아직 관람하지 않은 내역이 존재하거나 당일 관람이 존재합니다.  당일 관람이 있을 경우 취소가 불가하기 때문에 탈퇴 또한 불가합니다.");
}
</script> 
 -->


