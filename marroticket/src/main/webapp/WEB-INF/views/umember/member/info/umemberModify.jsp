<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="umemberSidebar.jsp" %> 
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form:form modelAttribute="vo" action="/umember/umemberModify"> 
<table border="1">
  <tr>
			<td>아이디</td>
			<td><form:input path="uId" readonly="true" /></td>
		</tr>
	 <tr>
			<td>기존 비밀번호</td>
			<td><input type="password" name="uPassword"  id="uPassword" placeholder="현재 비밀번호 입력해주세요."/></td>
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
			<td>이름</td>
			<td><form:input path="uName" readonly="true"/></td>
		</tr>
		<tr>
			<td>성별</td>
		 <td>
		 <form:input path="uGender" readonly="true"/></td> 
		</tr>
		<tr>
			<td>생년월일</td>
			<td><form:input path="uBirthday" readonly="true" /></td>
		</tr>
		<tr>
			<td>휴대전화번호</td>
			<td><form:input path="uPhoneNumber" /><font color="red"> <form:errors
						path="uPhoneNumber" /></font></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><form:input path="uEmail" /><font color="red"> <form:errors
						path="uEmail" /></font></td>
		</tr>
		<tr>
			<td>선호하는 장르</td>
			 <td><form:radiobutton path="uGenre" value="1" label="로맨스" id="genre" /> 
			 <form:radiobutton path="uGenre" value="2" label="코미디" /> 
			 <form:radiobutton path="uGenre" value="3" label="드라마" /> 
			 <form:radiobutton path="uGenre" value="4" label="공포" /> 
			 <form:radiobutton path="uGenre" value="5" label="추리/스릴러" /> 
			 <form:radiobutton path="uGenre" value="6" label="판타지" />
			 <form:radiobutton path="uGenre" value="7" label="시대/역사" />
			 </td> 
		</tr> 
		<tr>
		<td colspan="2" align="center">
		<input type="button" value="취소" id="cancle">
	<input type="submit" value="수정 하기" id="mBtn">
	</td>
	</tr> 
	</table>
	</form:form>
	
	<!-- 취소 버튼 -->
<script>
	$(document).ready(function() {
		$("#cancle").on("click", function() {
			location.href = "/umember/umembermypage";
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

<!-- 기존 비밀번호와 변경할 비밀번호가 같은 값일때 알리는 오류메세지 -->
<script>
var emsg = '${emsg}';
if(emsg === '에러 : 기존 비밀번호와 같은 비밀번호를 사용 할 수 없습니다.') {
    alert("에러 : 기존 비밀번호와 같은 비밀번호를 사용 할 수 없습니다.");
}
</script> 



<!-- 비밀번호 재확인 여부-->
<!-- <script type="text/javascript">
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
<!-- 비밀번호  -->
<script>
$(function(){
	 $("#mBtn").click(function() {
	<!-- 변수 선언-->
		 var changePw = $("#changePw").val();
		 var confirmPw = $("#confirmPw").val();
		 var phoneNumber = $("#uPhoneNumber").val();
		 var email = $("#uEmail").val();
		 <!-- 비밀번호 재확인 여부-->
		  if (changePw !== "" && confirmPw === "") {
		      alert("비밀번호를 재확인 하세요.");
		      $("#confirmPw").focus();
		      return false;
		    }
		  <!--변경할 비밀번호 유효성 검사 -->
		 var reg = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])(?=.{8,20})/; <!-- 정규식 선언 -->
		 if (changePw !== "" && !reg.test(changePw)) {
			alert("비밀번호는 영문 소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.");
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
		 <!--변경할 이메일 유효성 검사 -->
		 var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		 if (!emailReg.test(email)) {
			  alert("이메일 형식이 올바르지 않습니다.");
			  $("#uEmail").focus();
			    return false;
		}
})
});
</script>
	