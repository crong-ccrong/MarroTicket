<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 로그인을 한(인증된 사용자인) 경우 -->
<sec:authorize access="hasRole('ROLE_TMEMBER')">
	<div style="font-size : 12px; text-align:right"> <a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></div>
</sec:authorize>
<form id="logout" action="/memberlogout" method="POST">
   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
</form>
<br><br>
<<<<<<< HEAD
<div style="font-size : 1.5em; text-align:left"><a href="/theater">마로티켓</a></div>
=======
<div style="font-size : 1.5em; text-align:left"><a href="/theater/">마로티켓극단</a></div>
>>>>>>> 47cb8d33ad98e3b2b45f3ef3745e999e5994231a
<hr>