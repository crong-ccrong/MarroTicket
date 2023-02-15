<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="umemberSidebar.jsp" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<h1>나의 맞춤 연극</h1>
<hr>

<h2>${uName}님께 추천 드리는 ${uGenre}장르의 상연 중 / 상연 예정 연극 정보 입니다.</h2>
<c:forEach items="${playList}" var="play">
    <div class="play-container">
        <a href="/play/playDetail?pNumber=${play.pnumber}">
            <img src="/play/poster?pnumber=${play.pnumber}" alt="${play.pname} 포스터" >
        </a>
        <div class="play-info">
            <h3><a href="/play/playDetail?pNumber=${play.pnumber}">${play.pname}
            </a></h3>
            <a href="/play/playDetail?pNumber=${play.pnumber}">
            장소:${play.ptheaterAddress}<br>1회차:${play.pfirstStartTime}<br>2회차:${play.psecondStartTime}</a>
        </div>
    </div>
</c:forEach>



<style>
.info_body {
	width: 80%;
	float: right;
	padding: 10px;
}

.footer {
	clear: both;
}

 .play-container {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .play-container img {
        width: 150px;
</style>