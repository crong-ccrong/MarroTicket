<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#umemberFindId").on("click", function() {
			location.href = "/umemberFindId";
		});

		$("#tmemberFindId").on("click", function() {
			location.href = "/tmemberFindId";
		});

	});
</script>
<table>
	<tr>
		<td><input type='button' id='umemberFindId' value="일반회원 아이디 찾기" /></td>
		<td><input type='button' id='tmemberFindId' value="극단회원 아이디 찾기" /></td>
	</tr>
</table>