<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#umemberFindPwd").on("click", function() {
			location.href = "/umemberFindPassword";
		});

		$("#tmemberFindPwd").on("click", function() {
			location.href = "/tmemberFindPassword";
		});

	});
</script>
<table>
	<tr>
		<td><input type='button' id='umemberFindPwd' value="일반회원 비밀번호 찾기" /></td>
		<td><input type='button' id='tmemberFindPwd' value="극단회원 비밀번호 찾기" /></td>
	</tr>
</table>