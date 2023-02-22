<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- html -->
<sec:authorize access="hasRole('ROLE_TMEMBER') or hasRole('ROLE_GUEST')">
	<a href="/theater">
</sec:authorize>
<sec:authorize access="hasRole('ROLE_UMEMBER') or isAnonymous()">
	<a href="/">
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/admin">
</sec:authorize>
	<img class="footer_logo"alt="company_info" src="/images/마로티켓 로고 2-002.png">
</a>	
<img class="footer_companyInfo"alt="company_info" src="/images/company_info.png">    
<!-- css -->
<style>
	.footer_logo {
		display : inline-block;
		position: absolute;
		left : 35%;
		margin-top : 200px;
		width : 550px;
	}
	.common_container.page_main{
		width : 1200px !important;
		margin : 0 auto !important;	
	}
	/* img.footer_companyInfo */
</style>
<!-- javascript -->
<script type="text/javascript">
	$("header.common_header").hide();
</script>