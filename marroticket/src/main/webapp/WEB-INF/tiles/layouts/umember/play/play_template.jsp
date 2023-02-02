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
<link rel="stylesheet" type="text/css" href="/css/play_detail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header" ignore="true" />

	<!-- menu -->
	<tiles:insertAttribute name="menu" ignore="true" />

	<!-- content -->
	<div id="content">
		<!-- 포스터, 연극정보, 예매날짜, 좌석 등 정보  -->
		<section id="play_tickect_info">
			<div id="content_p_i">
				<div id="content_poster">
					<tiles:insertAttribute name="content_poster" ignore="true" />
				</div>
				<div id="content_playInfo">
					<tiles:insertAttribute name="content_playInfo" ignore="true" />
				</div>
			</div>
			<div id="content_ticketingInfo_tickecting" style="clear: both">
				<tiles:insertAttribute name="content_ticketingInfo" ignore="true" />
			</div>
		</section>
		<!-- 상세정보, 장소정보, 예매/취소안내 -->
		<section id="content_detail">
			<div>
				<tiles:insertAttribute name="content_detail" ignore="true" />
			</div>
		</section>

	</div>

	<!-- footer -->
	<tiles:insertAttribute name="footer" ignore="true" />
</body>
</html>
