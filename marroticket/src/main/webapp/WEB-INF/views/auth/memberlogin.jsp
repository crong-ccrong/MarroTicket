<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<h1>로그인</h1>
<form method="post" action="/memberlogin">
	<table style="width:354px">
		<tr><td>　</td></tr>
		<tr>
			<td><label for="username">아이디</label></td>
			<td>&nbsp;<input type="text" name="username" id="username" value="" style="width:90%"></td>
		</tr>
		<tr>
			<td><label for="password">비밀번호</label></td>
			<td>&nbsp;<input type="password" name="password" id="password" value="" style="width:90%"></td>
		</tr>
		<tr><td>　</td></tr>
		<!-- 로그인 상태유지 체크박스 -->
		<tr>
			<td colspan="2" style="font-size: 12px"><input type="checkbox" name="remember-me" id="login_status">
				<label for="login_status">로그인 상태유지</label></td>
		</tr>
		<c:if test="${ not empty error }">
			<tr style="font-size: 12px; color:red">
				<td colspan="2"> 아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.</td>
			</tr>
			<tr style="font-size: 12px; color:red">
				<td colspan="2"> 입력하신 내용을 다시 확인해주세요.</td>
			</tr>
		</c:if>
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