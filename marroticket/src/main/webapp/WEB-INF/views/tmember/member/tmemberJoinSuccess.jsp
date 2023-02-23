<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h2 class="login_complete_header">회원 가입을 축하드립니다!</h2>
<h4 class="login_complete_content">잠시후 로그인 화면으로 돌아갑니다.</h4>
<!-- css -->
<style>
img.logo {
	width: 480px;
	margin-top: 45px;
	margin-bottom: 20px;
}

.login_complete_header, .login_complete_content {
	font-family: 'Nanum Gothic ', sans-serif;
	line-height: 50px;
	letter-spacing: -4.5px;
}

.login_complete_header {
	font-size: 25px;
}

.login_complete_content {
	font-size: 25px;
}
</style>
<script>
	setTimeout('go_url()', 3000) // 3초후 go_url() 함수를 호출하여 로그인 화면으로 돌아감

	function go_url() {

		location.href = "/auth/memberlogin" // 페이지 이동...

	}
</script>