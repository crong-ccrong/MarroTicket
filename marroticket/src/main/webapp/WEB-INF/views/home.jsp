<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- main content -->
<section class="common_section section_hero_banner">
	<img alt="" src="/images/main_template_background.png">
</section>
<!-- Swiper(현재 상연작) -->
<section class="swiper mySwiper">
	<div class="swiper-wrapper">
		<c:choose>
			<c:when test="${empty playCurrentList }">
				<h3>상연중인 연극이 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<c:forEach items="${playCurrentList}" var="list" varStatus="status">
					<div class="swiper-slide">
						<p style="font-family: 'Gowun Batang', serif; font-size:1.3em; color:white">
						<span style="display:block">${list.pname}</span>
						<span style="display:block; font-size:0.8em;"><fmt:formatDate pattern="YYYY-MM-dd (E)"
										value="${list.pstartDate}" />~<fmt:formatDate
										pattern="YYYY-MM-dd (E)" value="${list.pcloseDate }" /></span>
						</p>
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
<section class="common_banner">
	<div class="common_banner_inner">
		<a class="common_banner_link" href="/play/playCurrentList">
			<img alt="test1" src="/images/banner_right.png" class="common_banner_img">
		</a>
		<a class="common_banner_link" href="/play/playExpectedList">
			<img alt="test2" src="/images/banner_left.png" class="common_banner_img">
		</a>
	</div>	
</section>
<section class="common_content">
<!-- 비워둘지 고민 -->
<h1>이번주 연극</h1>
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




