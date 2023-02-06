<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.dropdown {
	display: inline-block;
	float: left;
	position: relative;
	display: inline-block;
	text-decoration: none;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<div align="left">

	<div class="dropdown">
		<span>가맹관리|</span>
		<div class="dropdown-content">
			<p>
				<a href="#">극단목록</a>
			</p>
			<p>
				<a href="#">연극승인</a>
			</p>
			<p>
				<a href="#">연극수정승인</a>
			</p>
			<p>
				<a href="#">정산</a>
			</p>
		</div>
	</div>

	<div class="dropdown">
		<span>|회원관리|</span>
		<div class="dropdown-content">
			<p>
				<a href="#">회원목록</a>
			</p>
			<p>
				<a href="#">탈퇴회원목록</a>
			</p>
		</div>
	</div>

	<div class="dropdown">
		<span>|연극관리|</span>
		<div class="dropdown-content">
			<p>
				<a href="/admin/play/adminPlayCurrentList">현재상연작</a>
			</p>
			<p>
				<a href="/admin/play/adminPlayExpectedList">상연예정작</a>
			</p>
			<p>
				<a href="admin/play/adminPlayPassList">지난상연작</a>
			</p>
		</div>
	</div>

	<div class="dropdown">
		<span>|게시판관리</span>
		<div class="dropdown-content">
			<p>
				<a href="/notice/noticeList">공지사항</a>
			</p>
			<p>
				<a href="/ufaq/ufaqList">사용자FAQ</a>
			</p>
			<p>
				<a href="/tfaq/tfaqList">극단FAQ</a>
			</p>
		</div>
	</div>
</div>
<br>
<hr>