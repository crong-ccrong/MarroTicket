<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<h1>로그인</h1><%-- 
	<c:out value="${ error }" />
	<c:out value="${ logout }" /> --%>
<form method="post" action="/memberlogin">
	<table>
		<tr><td>　</td></tr>
		<tr>
			<td><label for="username">아이디</label></td>
			<td><input type="text" name="username" id="username" value=""></td>
		</tr>
		<tr>
			<td><label for="password">비밀번호</label></td>
			<td><input type="password" name="password" id="password" value=""></td>
		</tr>
		<tr><td>　</td></tr>
		<!-- 로그인 상태유지 체크박스 -->
		<tr>
			<td colspan="2" style="font-size: 12px"><input type="checkbox" name="remember-me">
				로그인 상태유지</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="로그인" style="width:90%"></td>
		</tr>
		<tr><td>　</td></tr>
		<tr>
			<td colspan="2" style="font-size: 12px" align="center"><a href="/memberFindId">아이디 찾기</a> | <a
				href="/memberFindPassword">비밀번호 찾기</a></td>
		</tr>
	</table>
	<sec:csrfInput />
</form>