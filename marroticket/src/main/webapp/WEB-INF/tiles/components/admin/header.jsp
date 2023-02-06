<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="font-size: 12px; text-align: right">
	<form action="/" method="get">

		<button type="submit" id="backMainbtn" name="로그아웃">로그아웃</button>

	</form>
</div>
<br>
<br>

<div style="text-align: left">

	<form action="/admin" method="post">

		<button type="submit" id="backHomebtn" name="홈으로 돌아가기">마로티켓</button>

	</form>

</div>
<hr>

<script>
	$(document).ready(function() {

		$("#backMainbtn").on("click", function() {
			var result = confirm("정말 로그아웃 하시겠습니까?");
			if (result) {
				alert("로그아웃 되었습니다.");
				self.location = "/";
			} else {
				alert("로그아웃을 취소하셨습니다.");
				return false;

			}
		});
	});

	$(document).ready(function() {
		$("#backHomebtn").on("click", function() {

			self.location = "/admin";
		});
	});
</script>


