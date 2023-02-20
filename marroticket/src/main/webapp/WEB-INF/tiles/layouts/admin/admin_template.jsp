<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title><tiles:getAsString name="title" /></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header" ignore="true" />

	<!-- menu -->
	<tiles:insertAttribute name="menu" ignore="true" />

	<!-- content -->
	<div align="center">
		<tiles:insertAttribute name="content" ignore="true" />
	</div>


</body>
</html>