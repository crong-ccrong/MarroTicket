<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/css/memberFind.css">
<div class="tabs">
	<span class="tab signin active"><a href="#signin">일반회원</a></span> <span
		class="tab signup"><a href="#signup">극단회원</a></span>
</div>
<div class="content">
	<div class="signin-cont cont">
		<form>
			<input type="text" name="uId" id="uId" class="inpt"
				required="required" placeholder="아이디"> <label for="uId">아이디</label>
			<input type="email" name="uEmail" id="uEmail" class="inpt"
				required="required" placeholder="이메일"> <label for="uEmail">이메일</label>
			<div class="submit-wrap">
				<input type="button" value="Find Password" id="umemberFindPassword"
					class="submit">
			</div>
		</form>
	</div>
	<div class="signup-cont cont">
		<form>
			<input type="text" name="tId" id="tId" class="inpt"
				required="required" placeholder="아이디"> <label for="tId">아이디</label>
			<input type="email" name="tOwnerEmail" id="tOwnerEmail" class="inpt"
				required="required" placeholder="이메일"> <label
				for="tOwnerEmail">이메일</label>
			<div class="submit-wrap">
				<input type="button" value="Find Password" id="tmemberFindPassword"
					class="submit">
			</div>
		</form>
	</div>
</div>
<script>
	$(document)
			.ready(
					function() {
						// ajax 통신을 위한 csrf 설정
						var token = $("meta[name='_csrf']").attr("content");
						var header = $("meta[name='_csrf_header']").attr(
								"content");
						$(document).ajaxSend(function(e, xhr, options) {
							xhr.setRequestHeader(header, token);
						});
						//일반회원 비밀번호 찾기

						$(document)
								.ready(
										function() {
											$("#umemberFindPassword")
													.on(
															"click",
															function() {
																//json
																var uId = $("#uId");
																var uEmail = $("#uEmail");
																var uIdVal = uId
																		.val();
																var uEmailVal = uEmail
																		.val();

																//유효성 검사
																//아이디
																if (uIdVal.length > 20) {
																	alert("아이디는 20자리까지 입력가능합니다.");
																	return;
																}
																if (uIdVal == null
																		|| uIdVal.length == 0) {
																	alert("아이디를 입력하세요");
																	return;
																}
																//전화번호
																if (uEmailVal == null
																		|| uEmailVal.length == 0) {
																	alert("이메일을 입력하세요");
																	return;
																}
																if (!uEmailVal
																		.match(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/)) {
																	alert("이메일 양식이 올바르게 입력되지 않았습니다.");
																	return;
																}

																var jsonObject = {
																	uId : uIdVal,
																	uEmail : uEmailVal
																};
																var jsonStg = JSON
																		.stringify(jsonObject);
																console
																		.log(jsonStg);

																//ajax
																$
																		.ajax({
																			type : "post",
																			url : "/umember/findPassword",
																			data : jsonStg,
																			contentType : "application/json; charset=utf-8",
																			success : function(
																					result) {
																				switch (result) {
																				case 'fail':
																					//입력한 아이디와 이메일에 일치하는 비밀번호가 없을 때
																					alert("비밀번호 찾기 실패 \n입력하신 정보와 일치하는 비밀번호가 없습니다.");
																					break;
																				case 'send':
																					//입력한 아이디와 이메일로 비밀번호 찾기를 성공했을 때. 임시 비밀번호 이메일 발송 사실을 alert.
																					alert("임시비밀번호가 입력하신 이메일로 발송됐습니다!");
																					break;
																				}
																			}
																		});
															});
										});

						$("#tmemberFindPassword")
								.on(
										"click",
										function() {
											//json
											var tId = $("#tId");
											var tOwnerEmail = $("#tOwnerEmail");
											var tIdVal = tId.val();
											var tOwnerEmailVal = tOwnerEmail
													.val();

											//유효성 검사
											//아이디
											if (tIdVal.length > 15) {
												alert("아이디는 20자리까지 입력할 수 있습니다.");
												return;
											}
											if (tIdVal == null
													|| tIdVal.length == 0) {
												alert("아이디를 입력하세요");
												return;
											}
											//전화번호
											if (tOwnerEmailVal == null
													|| tOwnerEmailVal.length == 0) {
												alert("대표자 이메일을 입력하세요");
												return;
											}
											if (!tOwnerEmailVal
													.match(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/)) {
												alert("이메일 양식이 올바르게 입력되지 않았습니다.");
												return;
											}

											var jsonObject = {
												tId : tIdVal,
												tOwnerEmail : tOwnerEmailVal
											};
											var jsonStg = JSON
													.stringify(jsonObject);
											console.log(jsonStg);

											//ajax
											$
													.ajax({
														type : "post",
														url : "/theater/findPassword",
														data : jsonStg,
														contentType : "application/json; charset=utf-8",
														success : function(
																result) {
															switch (result) {
															case 'fail':
																//입력한 극단 아이디와 이메일에 일치하는 비밀번호가 없을 때
																alert("아이디 찾기 실패 \n입력하신 정보와 일치하는 아이디가 없습니다.");
																break;
															case 'send':
																//입력한 극단 아이디와 이메일로 비밀번호 찾기를 성공했을 때. 임시 비밀번호 이메일 발송 사실을 alert.
																alert("임시비밀번호가 입력하신 이메일로 발송됐습니다!");
																break;
															}
														}
													});
										});

					});
	$('.tabs .tab').click(function() {
		if ($(this).hasClass('signin')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.cont').hide();
			$('.signin-cont').show();
		}
		if ($(this).hasClass('signup')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.cont').hide();
			$('.signup-cont').show();
		}
	});
</script>