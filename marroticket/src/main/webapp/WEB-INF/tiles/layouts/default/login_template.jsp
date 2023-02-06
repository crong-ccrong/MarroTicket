<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title><tiles:getAsString name="title" /></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
* {
	text-decoration: none;
	margin: 0 auto;
}
#logo {
	text-align : center;
}
section {
	margin: 10% 8%;
}
</style>
</head>
<body>
	<div>
		<section>
			<div id="logo">
				<tiles:insertAttribute name="logo" ignore="true" />
			</div>


			<div align='center'>
				<!-- content -->

				<tiles:insertAttribute name="content" ignore="true" />
			</div>
		</section>
	</div>
</body>
</html>
