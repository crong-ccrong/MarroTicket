<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/main_template.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=IBM+Plex+Sans+KR:wght@300&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">	
<title><tiles:getAsString name="title" /></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="app">
		<div class="common_wrap">
			<!-- header start -->
			<header class="common_header">
				<!-- header menu(login, mypage, reservation, join) -->
				<div class="header_util">
					<tiles:insertAttribute name="header" ignore="true" />
				</div>
				<!-- logo -->
				<div class="header_inner">
					<tiles:insertAttribute name="logo" ignore="true" />
				</div>
				<!-- menu -->
				<div class="header_gnb">
					<tiles:insertAttribute name="menu" ignore="true" />
				</div>
			</header>
			<!-- header end -->
			<!-- content start -->
			<main id="content" class="common_container page_main" role="main">
				<tiles:insertAttribute name="content" ignore="true" />
			</main>
			<!-- content end -->
			<!-- footer start -->
			<footer class="common_footer">
				<tiles:insertAttribute name="footer" ignore="true" />
			</footer>
			<!-- footer end -->
		</div>
	</div>
</body>
</html>
