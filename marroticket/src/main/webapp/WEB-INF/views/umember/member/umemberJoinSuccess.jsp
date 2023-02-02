<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원 가입을 축하드립니다!</h2>
<h4>5초 후 로그인 화면으로 돌아갑니다.</h4>
<script>
	 setTimeout('go_url()',5000)  // 5초후 go_url() 함수를 호출하여 로그인 화면으로 돌아감
	
	
	 function go_url(){
	
	    location.href="/auth/memberlogin"  // 페이지 이동...
	
	 }
 </script>
