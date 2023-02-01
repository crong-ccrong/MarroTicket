<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 일반회원 회원가입 페이지 -->


<h3>마로 티켓 일반 회원 가입 페이지</h3>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<form:form method="post" action="register" modelAttribute="umember">

	<table border="1">
		<tr>
				<th>이름</th>
				<td><form:input path="uName" placeholder="(필수)6자까지 입력 가능" /><font color="red"> <form:errors
							path="uName" /></font></td>
			</tr>

		<tr>
			<th>아이디</th>
			<td><form:input path="uId" placeholder="(필수)영문/숫자 포함 8~20자"  id="uId"/><font color="red"> <form:errors path="uId" /></font>
				<button  type="button" id="idCheck"
					onclick="uIdChk()">중복확인</button></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<form:input path="uPassword" placeholder="(필수)영문/숫자 포함 8~20자" /><font color="red"> <form:errors path="uPassword" /></font>
				</td>
		</tr>

		<tr>
			<th>비밀번호 재확인</th>
			<td><input type="Password" id="uPasswordConfirm" placeholder="(필수)비밀번호 재입력" /> 
			</td>
		</tr>
		

		<tr>
			<th>생년월일</th>
			<td>
				<form:input path="uBirthday"  placeholder="(필수) 생년월일을 입력하세요(ex. 1992-01-01) " /><font color="red"> <form:errors path="uBirthday" /></font>
				</td>
		</tr>

		<tr>
			<th>성별</th>
			<td><form:radiobutton path="uGender" value="1" label="남자"  id="gender"/>
			<form:radiobutton path="uGender" value="2" label="여자" /> 
		</tr>

		<tr>
			<th>이메일</th>
			<td>
				<form:input path="uEmail" placeholder="(필수)@ 포함 영문/숫자 10~15자" /><font color="red"> <form:errors path="uEmail" /></font>
				</td>
		</tr>

		<tr>
			<th>휴대폰번호</th>
			<td>
				<form:input path="uPhoneNumber" placeholder="(필수)-제외 숫자만 입력 ,11자" /><font color="red"> <form:errors path="uPhoneNumber" /></font>
				</td>
		</tr>

		<tr>
			<th>관심장르</th>
			<td><form:radiobutton path="uGenre" value="1" label="로맨스"  id="genre" />
			<form:radiobutton path="uGenre" value="2" label="드라마" /> 
			<form:radiobutton path="uGenre" value="3" label="공포" /> 
			<form:radiobutton path="uGenre" value="4" label="추리/스릴러" /> 
			<form:radiobutton path="uGenre" value="5" label="판타지" /> 
			<form:radiobutton path="uGenre" value="6" label="시대/역사" /> </td>
		</tr>
		<input type="hidden" name="uAgree" value="1" />
		<tr>
			<td colspan="2" align="center"><input type="submit" value="회원가입" />
				<input type="button" value="이전" id = "back"/></td>
		</tr>
	</table>
</form:form>

<!-- 장르와 성별의 기본 체크 -->
<script>
$("#gender").attr("checked","checked")
$("#genre").attr("checked","checked")

</script>

<!-- 이전 버튼 -->
<script>
$(document).ready(function() {
	$("#back").on("click", function() {
		location.href = "/umember/umemberAgreement";
	});
});
</script>

<!-- 중복아이디 체크 (절대 지우지마) -->
<script>
	function uIdChk() {

		$.ajax({
			url : "/umember/uIdCheck",
			type : "post",
			data : {
				"uId" : $("#uId").val()
			},
			success : function(data) {
				if (data == "overlap") {
					alert("중복된 아이디 입니다.");
				} else {
					alert("사용가능한 아이디입니다.");
				}
			}
		});
	}
</script>

<!-- 비밀번호 확인 -->
<script type="text/javascript">
$(function(){
		$('#uPasswordConfirm').blur(function(){
		   if($('#uPassword').val() != $('#uPasswordConfirm').val()){
		    	if($('#uPasswordConfirm').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#uPasswordConfirm').val('');
		          $('#uPasswordConfirm').focus();
		       }
		    }
		})  	   
	});
</script>








