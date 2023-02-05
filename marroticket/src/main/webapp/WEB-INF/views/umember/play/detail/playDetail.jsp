<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<script>
	$(function($) {
		$(".tab-content").eq(0).show(0);
		$(".tab-ul li").click(function() {
			var idx = $(this).index();
			$(".tab-content").hide();
			$(".tab-content").eq(idx).show();
			$(".tab-ul li").removeClass("active");
			$(this).addClass("active");
		});
		
	});
</script>
<ul class="tab-ul">
	<li class="active">상세정보</li>
	<li onclick="relayout()">장소정보</li>
	<li>예매/취소안내</li>
</ul>
<div class="tab-content">
	<p>${test }</p>
</div>
<div class="tab-content"><%@include file="placeInfo.jsp"%></div>
<div class="tab-content"><%@include
		file="cancelReservationInfo.jsp"%></div>