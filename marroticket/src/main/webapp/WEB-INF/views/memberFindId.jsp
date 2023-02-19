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
			<input type="text" name="uName" id="uName" class="inpt"
				required="required" placeholder="이름"> <label for="uName">이름</label>
			<input type="text" name="uPhoneNumber" id="uPhoneNumber" class="inpt"
				required="required" placeholder="휴대폰 번호"> <label
				for="uPhoneNumber">휴대폰 번호</label>
			<div class="submit-wrap">
				<input type="button" value="Find ID"
					id="umemberFindId" class="submit">
			</div>
		</form>
	</div>
	<div class="signup-cont cont">
		<form>
			<input type="text" name="tName" id="tName" class="inpt"
				required="required" placeholder="극단명"> <label for="tName">극단명</label>
			<input type="email" name="tOwnerEmail" id="tOwnerEmail" class="inpt"
				required="required" placeholder="이메일"> <label
				for="tOwnerEmail">이메일</label>
			<div class="submit-wrap">
				<input type="button" value="Find ID" id="tmemberFindId"
					class="submit">
			</div>
		</form>
	</div>
</div>
<script>
	//일반회원 아이디 찾기
	$(document).ready(function() {
		// ajax 통신을 위한 csrf 설정
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		$("#umemberFindId").on("click", function() {
			console.log('what');
			//json
			var uName = $("#uName");
			var uPhoneNumber = $("#uPhoneNumber");
			var uNameVal = uName.val();
			var uPhoneNumberVal = uPhoneNumber.val();

			//유효성 검사
			//이름
			if (uNameVal.length > 6) {
				alert("이름은 6자리까지 입력가능합니다.");
				return;
			}
			if (uNameVal == null || uNameVal.length == 0) {
				alert("이름을 입력하세요");
				return;
			}
			//전화번호
			if (uPhoneNumberVal == null || uPhoneNumberVal.length == 0) {
				console.log(uNameVal + " 길이 : " + uNameVal.length);
				alert("휴대폰번호를 입력하세요");
				return;
			}
			if (!uPhoneNumberVal.match(/^\d{3}\d{3,4}\d{4}$/)) {
				alert("휴대폰번호가 올바르게 입력되지 않았습니다.");
				return;
			}

			var jsonObject = {
				uName : uNameVal,
				uPhoneNumber : uPhoneNumberVal
			};
			var jsonStg = JSON.stringify(jsonObject);
			console.log(jsonStg);

			//ajax
			$.ajax({
				type : "post",
				url : "/umember/findId",
				data : jsonStg,
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					switch (result) {
					case 'fail':
						//입력한 이름와 휴대폰 번호에 일치하는 아이디가 없을 때
						alert("아이디 찾기 실패 \n입력하신 정보와 일치하는 아이디가 없습니다.");
						break;
					default:
						//아이디 찾기 성공
						console.log('회원의 아이디 : ' + result);
						alert("아이디 찾기 성공 \n아이디는 " + result + "입니다.");
						break;
					}
				}
			});
		});

	});

	$("#tmemberFindId")
			.on(
					"click",
					function() {
						//json
						var tName = $("#tName");
						var tOwnerEmail = $("#tOwnerEmail");
						var tNameVal = tName.val();
						var tOwnerEmailVal = tOwnerEmail.val();

						//유효성 검사
						//아이디
						if (tNameVal.length > 15) {
							alert("극단명은 15자리까지 입력할 수 있습니다.");
							return;
						}
						if (tNameVal == null || tNameVal.length == 0) {
							alert("극단명을 입력하세요");
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
							tName : tNameVal,
							tOwnerEmail : tOwnerEmailVal
						};
						var jsonStg = JSON.stringify(jsonObject);
						console.log(jsonStg);

						//ajax
						$
								.ajax({
									type : "post",
									url : "/theater/findId",
									data : jsonStg,
									contentType : "application/json; charset=utf-8",
									success : function(result) {
										switch (result) {
										case 'fail':
											//입력한 극단명과 이메일에 일치하는 아이디가 없을 때
											alert("아이디 찾기 실패 \n입력하신 정보와 일치하는 아이디가 없습니다.");
											break;
										default:
											//입력한 극단명과 이메일로 비밀번호 찾기를 성공했을 때. 이메일 발송 사실을 alert.
											console.log(result);
											alert("아이디가 입력하신 이메일로 발송됐습니다!");
											break;
										}
									}
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