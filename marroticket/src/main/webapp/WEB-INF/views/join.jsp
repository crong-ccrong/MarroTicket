<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#umemberJoin").on("click", function() {
			location.href = "/umember/umemberAgreement";
		});

		$("#tmemberJoin").on("click", function() {
			location.href = "/theater/tmemberAgreement";
		}); 

	});
</script>
<table>
	<tr>
		<td><input type='button' id='umemberJoin' value="일반회원으로 회원가입하기" /></td>
		<td><input type='button' id='tmemberJoin' value="극단회원으로 회원가입하기" /></td>
	</tr>
</table>