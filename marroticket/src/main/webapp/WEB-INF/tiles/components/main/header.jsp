<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 로그인을 하지 않은 경우 -->
<sec:authorize access="isAnonymous()">	
	<div style="font-size : 12px; text-align:right"><a href="/auth/memberlogin">로그인</a> | <a href="/umember/umembermypage">마이페이지</a> | <a href="/umember/umemberReserveInfo">예매확인/취소</a> | <a href="/join">회원가입</a></div>
</sec:authorize>
<!-- 로그인을 한(인증된 사용자인) 경우 -->
<sec:authorize access="isAuthenticated()">
	<div style="font-size : 12px; text-align:right"> <a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a> | <a href="/umember/umembermypage">마이페이지</a> | <a href="/umember/umemberReserveInfo">예매확인/취소</a></div>
</sec:authorize>
<form id="logout" action="/memberlogout" method="POST">
   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
</form>
<br><br>
<div style="font-size : 1.5em; text-align:left"><a href="/">마로티켓</a></div>
<hr>