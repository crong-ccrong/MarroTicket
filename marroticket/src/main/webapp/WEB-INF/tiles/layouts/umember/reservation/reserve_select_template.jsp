<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/reserve.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/reserve.css">
</head>
<body>
	<div id="wrap_reserve">
		<div id="header"></div>
		<div class="reserve_title">
			<tiles:insertAttribute name="logo" ignore="true" />
		</div>
		<!-- 예매진행탭 -->
		<tiles:insertAttribute name="step" ignore="true" />
		<div id="container" class="ng-isolate-scope">
			<div class="reserve_content">
				<div class="reserve_left ng-isolate-scope">
					<!-- 공연제목, 날짜, 공연장소 -->
					<tiles:insertAttribute name="title_info" ignore="true" />
					<div id="main_view_top" class="select_seat ng-isolate-scope">
						<div id="main_view" class="in">
							<tiles:insertAttribute name="content" ignore="true" />
						</div>
						<div class="select_seat_info ng-isolate-scope">
							<a href="#" class="seat_header">
								<div ng-show="!selected.isWaitingReservation">
									<strong class="tit ng-binding ng-scope"> 예매를 진행합니다.
										좌석을 선택해 주세요. </strong>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="reserve_right ng-isolate-scope">
					<!-- 사이드바 -->
					<tiles:insertAttribute name="sidebar" ignore="true" />
					<!-- 사이드바 버튼 -->
					<tiles:insertAttribute name="reserve_btn" ignore="true" />
				</div>
			</div>
		</div>
		<div class="reserve_ban"></div>
			<tiles:insertAttribute name="bottom" ignore="true" />
	</div>
</body>
</html>