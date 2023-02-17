<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 일반회원 회원가입 페이지 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<h3 class="joinheader">마로 티켓 일반 회원 가입 페이지</h3>

<form:form modelAttribute="umember" action="register"> 
	<table border="1" class="umemberJoinForm">
		<tr>
			<th class="joinWindow">이름</th>
			<td  ><form:input path="uName" placeholder="(필수)6자까지 입력 가능" /><font
				color="red"> <form:errors path="uName" /></font></td>
		</tr>

		<tr>
			<th class="joinWindow">아이디</th>
			<td  ><form:input path="uId" placeholder="(필수)영문/숫자 포함 8~20자"
					id="uId" /><font color="red"> <form:errors path="uId" /></font>
				<button type="button" id="idCheck" onclick="uIdChk()">중복확인</button></td>
		</tr>
		<tr>
			<th class="joinWindow">비밀번호</th>
			<td  > <form:input path="uPassword"
					placeholder="(필수)영문/숫자 포함 8~20자" class="joinError" /><font color="red"> <form:errors
						path="uPassword" /></font></td>
		</tr>

		<tr>
			<th class="joinWindow">비밀번호 재확인</th>
			<td  ><input type="Password" id="uPasswordConfirm"
				placeholder="(필수)비밀번호 재입력" /></td>
		</tr>


		<tr>
			<th class="joinWindow">생년월일</th>
			<td  ><input type='date' name="uBirthday" /> <!-- form:input path="uBirthday"  placeholder="(필수) 생년월일을 입력하세요(ex. 1992-01-01) " /-->
				<font color="red"> <form:errors path="uBirthday" /></font></td>
		</tr>

		<tr>
			<th class="joinWindow">성별</th>
			<td  ><form:radiobutton path="uGender" value="1" label="남자"
					id="gender" /> <form:radiobutton path="uGender" value="2"
					label="여자" />
		</tr>

		<tr>
			<th class="joinWindow">이메일</th>
			<td  ><form:input path="uEmail"
					placeholder="(필수)@ 포함 영문/숫자 10~15자" /><font color="red"> <form:errors
						path="uEmail" /></font></td>
		</tr>

		<tr>
			<th class="joinWindow">휴대폰번호</th>
			<td  ><form:input path="uPhoneNumber"
					placeholder="(필수)-제외 숫자만 입력 ,11자" /><font color="red"> <form:errors
						path="uPhoneNumber" /></font></td>
		</tr>

		<tr>
			<th class="joinWindow">관심장르</th>
			<td><form:radiobutton path="uGenre" value="1" label="로맨스" id="genre" /> 
			<form:radiobutton path="uGenre" value="2" label="코미디" /> 
			<form:radiobutton path="uGenre" value="3" label="드라마" /> 
			<form:radiobutton path="uGenre" value="4" label="공포" /> 
			<form:radiobutton path="uGenre" value="5" label="추리/스릴러" /> 
			<form:radiobutton path="uGenre" value="6" label="판타지" />
			<form:radiobutton path="uGenre" value="7" label="시대/역사" />
			
			</td>
		</tr>
		<form:hidden path="uAgree" value="1" />
		<tr>
<<<<<<< HEAD
			<td colspan="2" align="center"><input type="submit" value="회원가입"  id="joinBtn"/>
				<input type="button" value="이전" id="back" /></td>
=======
			<td colspan="2" align="center"><input type="button" value="이전" id="back" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input  type="submit" value="회원가입"  id="joinBtn"/>
				</td>
>>>>>>> soobin
		</tr>
	</table>
	</form:form>

<!-- 장르와 성별의 기본 체크 -->
<script>
	$("#gender").attr("checked", "checked")
	$("#genre").attr("checked", "checked")
</script>

<!-- 이전 버튼 -->
<script>
	$(document).ready(function() {
		$("#back").on("click", function() {
			location.href = "/umember/umemberAgreement";
		});
	});
</script>

<!-- 중복아이디 체크  -->
<script>
function uIdChk() {
	var uIdValue = $("#uId").val();
	  if (uIdValue === '') {
	    alert("ID를 입력해주세요!!");
	    return;
	  }
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	$.ajax({
		url : "/umember/uIdCheck",
		type : "post",
		data : {
			"uId" : $("#uId").val()
		},
		success : function(data) {
			if (data == "overlap") {
				alert("중복된 아이디 입니다.");
				 $("#uId").val(''); //입력값 재설정
			} else {
				alert("사용가능한 아이디입니다.");
			}
		}
	});

}

</script>

<!-- 비밀번호 재확인 여부-->
<script type="text/javascript">

$(function() {
	  $("#joinBtn").click(function() {
	    if ($("#uPasswordConfirm").val() === "") {
	      alert("비밀번호 재확인을 해야합니다.");
	     return false;
	      $("#uPasswordConfirm").focus();
	    } 
	  });
	});

</script>

<!-- 비밀번호 재확인 -->
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
 
  <style>
/* 양식 헤더 스타일 지정 */
.joinheader {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 30px;
}

.umemberJoinForm {
  margin: 0 auto;
  width: 60%;
}

/* 양식 레이블 스타일 지정 */
.joinWindow {
  font-size: 16px;
  font-weight: bold;
  padding: 10px;
  text-align: left;
}

/* 양식 입력 필드의 스타일 지정 */
.joinInput {
  padding-left: 10px;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"], input[type="date"] {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 10px;
}

input[type="radio"], input[type="checkbox"] {
  margin-right: 10px;
}

/* 오류 메시지 스타일 */
form .errors {
  font-size: 14px;
  color: red;
  margin-top: 5px;
}

/* 중복 확인 버튼 스타일 지정 */
#idCheck {
  background-color: #ff6666;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  margin: 10px 0;
  cursor: pointer;
}

#idCheck:hover {
  background-color: #ff3333;
}

/* 양식 버튼 스타일 지정 */
input[type="submit"] {
  background-color: #ff6666; /* light red */
  color: white;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  margin: 10px 0;
  cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
  background-color: #ff3333; /* dark red */
}

input[type="button"] {
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  cursor: pointer;
}

</style> 


<<<<<<< HEAD

=======
>>>>>>> soobin
