<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/css/umember_mypage.css">
<div class="wrapper">
	<div class="side">
		<!-- Sidebar content goes here -->
		<ul class="sidebar">
			<li><a href="/umember/umembermypage" data-text="내 정보">내 정보</a></li>
			<li><a href="/umember/umemberReserveInfo" data-text="예매 정보">예매
					정보</a></li>
			<li><a href="/umember/umemberCancelInfo" data-text="예매 취소 정보">예매
					취소 정보</a></li>
			<li><a href="/umember/umemberViewHistory" data-text="내가 본 연극">내가
					본 연극</a></li>
			<li><a href="/umember/umemberCustomPlayList"
				data-text="나의 맞춤 연극">나의 맞춤 연극</a></li>
		</ul>

	</div>
	<div class="content">
		<h1>나의 맞춤 연극</h1>
		<hr>
		<nav class="genre">
			<p>${uName}님께추천 드리는 ${uGenre}장르의 상연 중 / 상연 예정 연극 정보 입니다.</p>
		</nav>
		<div class="poster_container">
			<c:forEach items="${playList}" var="play">
				<div class="gallery-item">
					<a href="/play/playDetail?pNumber=${play.pnumber}"> <img
						src="/play/poster?pnumber=${play.pnumber}" alt="${play.pname} 포스터"
						width="200px">
					</a>
					<div class="play-info">
						<h3>
							<a href="/play/playDetail?pNumber=${play.pnumber}">${play.pname}
							</a>
						</h3>
						<a href="/play/playDetail?pNumber=${play.pnumber}">
							장소:${play.ptheaterAddress}<br>1회차:${play.pfirstStartTime}<br>2회차:${play.psecondStartTime}
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>


