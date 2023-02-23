<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- css -->
<style>
	img.logo{
		margin-top : 8%;
		margin-bottom:15px;
	}
	#umemberJoin, #tmemberJoin{
	font-family: 'Nanum Gothic ', sans-serif;
	display : inline-block;
	margin : 20px 10px 0;
		background-color: white;
	color : black;
	box-shadow: 10px 30px 40px rgba(0, 0, 0, 0.2);
	font-weight : 500;
	letter-spacing: -1.7px;
	border-color: #EB0000;
	outline: #EB0000 solid 2px;
	border: none;
	border-radius: 5px;
	width: 30%;
	padding : 5px;
	height: 35px;
	font-size: 13pt;
	margin-top: 25px;
	}
	#umemberJoin:hover, #tmemberJoin:hover{
	background-color: #EB0000;
	color : white;
	font-weight : bold;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#umemberJoin").on("click", function() {
			location.href = "/umember/umemberAgreement";
		});
		$("#tmemberJoin").on("click", function() {
			location.href = "/theater/tmemberAgreement";
		});
	});
</script>
<input type='button' id='umemberJoin' value="일반회원 가입" />
<input type='button' id='tmemberJoin' value="극단회원 가입" />