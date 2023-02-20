<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.jumbotron {
	background-position: center;
	background-size: 80em;
}

.btn btn-default {
	
}
</style>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>


<div>
	<div class="page-header">
		<div class="jumbotron">
			<h1>마로티켓 관리자 페이지</h1>


			<p>마로티켓 관리자 페이지 입니다</p>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-6 col-lg-4">
			<h2>공지사항</h2>
			<p>공지사항 게시판</p>
			<p>
				<a class="btn btn-default" href="/notice/noticeList?accept=admin" role="button">
					바로가기>> &raquo;</a>
			</p>
		</div>
		<div class="col-xs-6 col-lg-4">

			<h2>사용자 FAQ</h2>
			<p>사용자 FAQ 게시판</p>
			<p>
				<a class="btn btn-default" href="/ufaq/ufaqList?accept=admin" role="button">
					바로가기>> &raquo;</a>
			</p>
		</div>
		<div class="col-xs-6 col-lg-4">

			<div>
				<h2>극단 FAQ</h2>
				<p>극단 FAQ 게시판</p>
				<p>
					<a class="btn btn-default" href="/tfaq/tfaqList?accept=admin" role="button">
						바로가기>> &raquo;</a>
				</p>
			</div>
		</div>
	</div>
</div>