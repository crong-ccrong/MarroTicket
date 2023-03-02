<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/css/umember_mypage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<div class="wrapper">
	<div class="side">
		<!-- Sidebar content goes here -->
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
		<form:form modelAttribute="umemberVo"
			action="/umember/umemberSecession">
			<table border="1">

				<tr>
					<td style="width: 30%">비밀번호 확인</td>
					<td><input type="password" name="uPassword" id="uPassword"
						placeholder="현재 비밀번호 입력해주세요." /></td>
				</tr>
				<tr>
					<td colspan="2" class="table_btn"><input type="button"
						value="취소" id="cancle"> <input type="submit" value="탈퇴 하기"
						id="sBtn"></td>
				</tr>
			</table>
		</form:form>
	</div>
</div>

<!-- 취소 버튼 -->
<script>
	$(document).ready(function() {
		$("#cancle").on("click", function() {
			location.href = "/umember/umembermypage";
		});
	});
</script>

<!-- 비밀번호가 일치하지 않으면 나타날 메시지 -->
<script>
	var passwordError = '${passwordError}';
	if (passwordError === '에러메시지') {
		alert("에러 : 기존 비밀번호에 입력된 값이 없거나 틀린 비밀번호 입니다.");
	}
</script>

<!-- 비밀번호 확인이 빈칸일때 -->
<script type="text/javascript">
	$(function() {
		$("#sBtn").click(function() {
			if ($("#uPassword").val() === "") {
				alert("비밀번호를 확인 하세요.");
				$("#uPassword").focus();
				return false;
			}
		});
	});
</script>
<style>
table {
	border-collapse: collapse;
	width: 100%;
	max-width: 600px;
	margin: 70px auto 0;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

input[type="password" i] {
	width : 270px;
}

th {
	background-color: #f2f2f2;
}

input[type="button"], input[type="submit"] {
	background-color: #EB0000;
	color: #fff;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #ff1a1a;
}

.table_btn {
	text-align: right;
	border-right-color: transparent;
	border-left-color: transparent;
	border-bottom-color: transparent;
}
</style>



