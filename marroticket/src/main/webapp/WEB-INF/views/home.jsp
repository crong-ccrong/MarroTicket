<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- main content -->
<section class="common_section section_hero_banner">
	<img alt="" src="/images/main_template_background.png">
</section>
<!-- Swiper(현재 상연작) -->
<section class="swiper mySwiper"
	style="width: 1120px; position: relative; margin: auto; top: -430px">
	<!-- h1 align="center" style="margin-bottom:30px;color:white; font-family: 'Gowun Batang', serif; font-size:30px">상연 중인 작품</h1-->
	<div class="swiper-wrapper">
		<c:choose>
			<c:when test="${empty playCurrentList }">
				<h3>상연중인 연극이 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<c:forEach items="${playCurrentList}" var="list" varStatus="status">
					<div class="swiper-slide">
						<a href="/play/playDetail?pNumber=${list.pnumber}"> <img
							alt="..." src="poster?pnumber=${list.pnumber}"
							style="width: 273px; height: 348px; border-radius: 10px;">
						</a>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="swiper-button-next" style="color: #EB0000"></div>
	<div class="swiper-button-prev" style="color: #EB0000"></div>
	<div class="swiper-pagination"></div>
</section>
<!-- 상연 예정작 -->
<section class="common_section section_weekly_culture">
	<div class="container">
		<div class="section_heading">
			<h2 class="section_title">상연 예정작</h2>
		</div>
		<div class="gallery">
			<c:choose>
				<c:when test="${empty playCurrentList }">
					<h3>상연중인 연극이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach items="${playExpectedList}" var="list">
						<img alt="" src="poster?pnumber=${list.pnumber }"
							class="single-image" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>
<!-- --------------------------------------------------- -->
<script>
<!-- Initialize Swiper -->
	var swiper = new Swiper(".mySwiper", {
		initialSlide : 1,
		slidesPerView : 4,
		loop : true,
		spaceBetween : 5,
		centeredSlides : true,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
		effect : 'coverflow',
		watchOverflow : true
	});

	$(".header_gnb_link.home").css({
		'color' : '#EB0000',
		'font-weight' : 'bold'
	});
</script>




