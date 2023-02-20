<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/playtemporary.css">

<h1>
	연극 정보가 수정되었습니다.<br> 관리자 승인 후 연극이 수정됩니다.
</h1>
<div>
	<input type="button" value="메인화면으로 가기" id="main" /> <input
		type="button" value="등록한 연극으로 가기" id="RegisteInfo" />
</div>

<script>
	$(document).ready(function() {
		$("#main").on("click", function() {
			location.href = "/theater/";
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#RegisteInfo").on("click", function() {
			location.href = "/theater/playRegisteInfo/";
		});
	});
</script>
