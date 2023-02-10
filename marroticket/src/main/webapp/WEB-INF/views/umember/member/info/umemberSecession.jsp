<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="umemberSidebar.jsp" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<form:form modelAttribute="umemberVo" action="/umember/umemberSecession"> 
<table border="1">
  
	 <tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="uPassword"  id="uPassword" placeholder="현재 비밀번호 입력해주세요."/></td>
		</tr>  
		<tr>
		<td colspan="2" align="center">
		<input type="button" value="취소" id="cancle">
	<input type="submit" value="탈퇴 하기" id="sBtn">
	</td>
	</tr> 
	</table>
	</form:form>
	
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
if(passwordError === '에러메시지') {
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





