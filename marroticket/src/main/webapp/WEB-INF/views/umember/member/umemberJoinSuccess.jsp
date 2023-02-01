<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <h1> 회원 가입을 축하드립니다!</h1>
<div>
<p>5초뒤 로그인 페이지로 이동합니다.</p>
</div>

<script type="text/javascript">
setTimeout(function(){
    window.location.href = "/login";
}, 5000);
</script>