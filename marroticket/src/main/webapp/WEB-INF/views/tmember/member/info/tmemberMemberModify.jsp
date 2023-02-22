<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/tmembermodify.css">

<form:form modelAttribute="vo" action="/theater/tmemberModify"> 
<table border="1">
  <tr>
			<td>아이디</td>
			<td><form:input path="tId" readonly="true" /></td>
		</tr>
	 <tr>
			<td>기존 비밀번호</td>
			<td><input type="password" name="tPassword"  id="tPassword" placeholder="현재 비밀번호 입력해주세요."/></td>
		</tr>  
		 <tr>
			<td>변경할 비밀번호</td>
			<td><input type="password"  name="changePw"  id="changePw" placeholder="영문/숫자 포함 8~20자"/>
			<font color="red">비밀번호 변경시 로그인 페이지로 돌아갑니다.</font></td>
		</tr>  
		 <tr>
			<td>변경할 비밀번호 재확인</td>
			<td><input type="password"  name="confirmPw"  id="confirmPw" placeholder="영문/숫자 포함 8~20자"/></td>
		</tr>   
		<tr>
			<td>극단 이름</td>
			<td><form:input path="tName" /><font color="red"><form:errors
						path="tName" /></font></td>
		</tr>
		<tr>
			<td>극단주소</td>
			<td><form:input path="tAddress" /><font color="red"> <form:errors
						path="tAddress" /></font></td>
		</tr>
		<tr>
			<td>대표자 이름</td>
			<td><form:input path="tOwnerName" /><font color="red"> <form:errors
						path="tOwnerName" /></font></td>
		</tr>
		<tr>
			<td>대표자 연락처</td>
			<td><form:input path="tOwnerPhoneNumber" /><font color="red"> <form:errors
						path="tOwnerPhoneNumber" /></font></td>
		</tr>
		<tr>
			<td>대표자 이메일</td>
			<td><form:input path="tOwnerEmail" /><font color="red"> <form:errors
						path="tOwnerEmail" /></font></td>
		</tr>
		<tr>
			<td>거래 은행</td>
			<td>
					<form:select path="tBank">
					<form:option value="none" label="==은행선택=="></form:option>
					<form:option value="카카오뱅크" label="카카오뱅크"></form:option>
					<form:option value="하나은행" label="하나은행"></form:option>
					<form:option value="신한은행" label="신한은행"></form:option>
					<form:option value="우리은행" label="우리은행"></form:option>
					<form:option value="국민은행" label="국민은행"></form:option>
				</form:select>
			</td>						
						
		</tr>
		<tr>
			<td>거래 은행 계좌 번호</td>
			<td><form:input path="tBankNumber" /><font color="red"> <form:errors
						path="tBankNumber" /></font></td>
		</tr>
		<tr>
			<td>거래 은행 예금주</td>
			<td><form:input path="tBankOwner" /><font color="red"> <form:errors
						path="tBankOwner" /></font></td>
		</tr>
		</table> 
		
		<table>
			<tr>
				<th colspan="2" align="center">
					<input type="button" value="취소" id="cancle">
				</th>
				<th>
					<input type="submit" value="수정 하기" id="mBtn">
				</th>
			</tr> 
		</table>
	</form:form>
	
	<!-- 취소 버튼 -->
<script>
	$(document).ready(function() {
		$("#cancle").on("click", function() {
			location.href = "/theater/tmembermypage";
		});
	});
</script>

<!-- 기존 비밀번호가 빈칸일때 다음으로 넘어갈수없음을 알리는 오류메세지 -->
<script>
var msg = '${msg}';
if(msg === '에러 : 기존 비밀번호에 입력된 값이 없거나 틀린 비밀번호 입니다.') {
    alert("에러 : 기존 비밀번호에 입력된 값이 없거나 틀린 비밀번호 입니다.");
} 
</script>

<!-- 기존 비밀번호와 변경할 비밀번호가 같은 값일때 알리는 오류메세지  -->
<script>
var emsg = '${emsg}';
if(emsg === '에러 : 기존 비밀번호와 같은 비밀번호를 사용 할 수 없습니다.') {
    alert("에러 : 기존 비밀번호와 같은 비밀번호를 사용 할 수 없습니다.");
}
</script>



<!-- 비밀번호 재확인 여부-->
<script type="text/javascript">
$(function() {
	  $("#mBtn").click(function() {
	    if ($("#changePw").val() !== "" && $("#confirmPw").val() === "") {
	      alert("비밀번호를 재확인 하세요.");
	      $("#confirmPw").focus();
	      return false;
	    }
	  });
	});
</script>

<!--변경할 비밀번호 재확인 -->
<script type="text/javascript">
$(function(){
      $('#confirmPw').blur(function(){
         if($('#changePw').val() != $('#confirmPw').val()){
             if($('#confirmPw').val()!=''){
             alert("변경할 비밀번호와 일치하지 않습니다.");
                 $('#confirmPw').val('');
                $('#confirmPw').focus();
             }
          }
      })        
   });
</script>

 
<!-- ======유효성 검사 ====== -->
<!-- 비밀번호 --> 
<script>
$(function(){
	 $("#mBtn").click(function() {
	<!-- 변수 선언
		 var changePw = $("#changePw").val();
		 var confirmPw = $("#confirmPw").val();
		 var phoneNumber = $("#tOwnerPhoneNumber").val();
		 var email = $("#tOwnerEmail").val();-->
		 <!-- 비밀번호 재확인 여부-->
		  if (changePw !== "" && confirmPw === "") {
		      alert("비밀번호를 재확인 하세요.");
		      $("#confirmPw").focus();
		      return false;
		    }
		  <!--변경할 비밀번호 재확인 -->
		  if (changePw !== confirmPw) {
			  alert("변경할 비밀번호와 일치하지 않습니다.");
			  $('#confirmPw').val('');
              $('#confirmPw').focus();
              return false;
		}
		  <!--변경할 비밀번호 유효성 검사 --> 
		 var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])(?=.{8,20})/; 정규식 선언
		 if (!reg.test(changePw)) {
			alert("비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.");
			  $("#changePw").focus();
			    return false;
		}
		 <!--변경할 핸드폰번호 유효성 검사 -->
		 var phoneReg =  /^(01)(\d{9})$/; 
		 if (!phoneReg.test(phoneNumber) || phoneNumber.includes("-")) {
			    alert(" - 를 제외한 올바른 휴대폰 번호 형식의 숫자만 입력해주세요.");
			    $("#uPhoneNumber").focus();
			    return false;
			  }
		 <!--변경할 이메일 유효성 검사-->
		 var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		 if (!emailReg.test(email)) {
			  alert("이메일 형식이 올바르지 않습니다.");
			  $("#uEmail").focus();
			    return false;
		} 
})
});
</script>
	