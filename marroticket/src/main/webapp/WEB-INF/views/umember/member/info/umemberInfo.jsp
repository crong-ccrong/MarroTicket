<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 일반회원 마이페이지의 '일반회원정보' -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<!-- content section -->
  <div class="main_content">
   <%@ include file="umemberSidebar.jsp" %> 
    <div class="main_body">
<form:form modelAttribute="vo"> 
  <table border="1">
  <tr>
			<td>아이디</td>
			<td><form:input path="uId" readonly="true" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><form:input path="uName" readonly="true"/></td>
		</tr>
		<tr>
			<td>성별</td>
		 <td>
		 <form:input path="uGender" readonly="true"/></td> 
		</tr>
		<tr>
			<td>생년월일</td>
			<td><form:input path="uBirthday" readonly="true" /></td>
		</tr>
		<tr>
			<td>휴대전화번호</td>
			<td><form:input path="uPhoneNumber" readonly="true"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><form:input path="uEmail" readonly="true"/></td>
		</tr>
		<tr>
			<td>선호하는 장르</td>
			 <td><form:input path="uGenre" readonly="true"/></td> 
		</tr> 
		<tr>
		<td colspan="2" align="center">
	<input type="button" value="회원탈퇴" id="deleteMember">
	<input type="button" value="회원정보수정" onclick="location.href='/umember/umemberModify'">
	</td>
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




 <style>

  .main_content {
  width: 100%;
  height:auto;
 /*  background-color: green; */
  padding: 10px;
  }
  
  .main_body{
  width: 80%;
  float: right;
/*   background-color: skyblue; */
  padding: 10px;
  }
  
  .footer {
  	clear: both;
  }
  
</style> 
		
