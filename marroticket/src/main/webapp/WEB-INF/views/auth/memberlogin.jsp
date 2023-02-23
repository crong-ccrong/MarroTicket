<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/memberlogin.css">
<form method="post" action="/memberlogin">
	<div class="login-box">
		<input id="username" type="text" name="username" placeholder="아이디">
		<label for="username">아이디</label>
	</div>

	<div class="login-box">
		<input id="password" type="password" name="password"
			placeholder="비밀번호"> <label for="password">비밀번호</label>
	</div>
	<!-- 로그인 상태유지 체크박스 -->
	<div align="left" style="margin-top:17px">
	<label
			for="login_status" style="position:static">로그인 상태유지</label>
		<input type="checkbox" name="remember-me" style="accent-color: #EB0000;" id="login_status" checked>
	<span style="display: inline-block; float:right; font-size:1em" id="forgot">
		<a href="/memberFindId">아이디 찾기</a> | <a href="/memberFindPassword">비밀번호
			찾기</a>
	</span>
	</div>
	<c:if test="${ not empty error }">
		<div style="color: red;margin-top:15px;margin-left:5px" align="left">
			아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.
		<br>입력하신 내용을 다시 확인해주세요.</div>
	</c:if>
	<input type="submit" value="Login">
<sec:csrfInput /> 
</form>