<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header_gnb_inner">
	<nav class="header_gnb_area">
		<ul class="header_gnb_list" style="padding-left : 0;">
			<li class="header_gnb_item"><a class="header_gnb_link home"
				href="/admin">홈</a></li>
			<li class="header_gnb_item"><a class="header_gnb_link current"
				href="/admin/playApproveList">가맹 관리</a>
				<div class="header_lnb ">
					<ul class="header_lnb_list">
						<li class="header_lnb_item first"><a class="header_lnb_link"
							href="/admin/playApproveList">연극승인</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/admin/playModifyList">연극수정승인</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/admin/paymentList">정산</a></li>
					</ul>
				</div></li>
			<li class="header_gnb_item"><a class="header_gnb_link expected"
				href="/admin/tmemberApproveList">회원 관리</a>
				<div class="header_lnb ">
					<ul class="header_lnb_list">
						<li class="header_lnb_item second"><a class="header_lnb_link"
							href="/admin/tmemberApproveList">극단회원목록</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/admin/umemberList">일반회원목록</a></li>
					</ul>
				</div></li>
			<li class="header_gnb_item"><a class="header_gnb_link pass"
				href="/admin/playCurrentList">연극 관리</a>
				<div class="header_lnb ">
					<ul class="header_lnb_list">
						<li class="header_lnb_item third"><a class="header_lnb_link"
							href="/admin/playCurrentList">현재 상연작</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/admin/playExpectedList">상연 예정작</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/admin/playPassList">지난 상연작</a></li>
					</ul>
				</div></li>
			<li class="header_gnb_item"><a class="header_gnb_link service"
				href="/notice/noticeList?accept=admin">게시판 관리</a>
				<div class="header_lnb ">
					<ul class="header_lnb_list">
						<li class="header_lnb_item fourth"><a class="header_lnb_link"
							href="/notice/noticeList?accept=admin">공지사항</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/ufaq/ufaqList?accept=admin">사용자 FAQ</a></li>
						<li class="header_lnb_item"><a class="header_lnb_link"
							href="/tfaq/tfaqList?accept=admin">극단 FAQ</a></li>
					</ul>
				</div></li>
		</ul>
	</nav>
</div>