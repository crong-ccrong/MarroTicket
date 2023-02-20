<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- 극단 회원가입
<h3 class="joinheader">마로 티켓 극단 회원 가입 페이지</h3> -->

<form:form method="post" action="/theater/signUp" modelAttribute="tmember"
   enctype="multipart/form-data">
   <table border="1" class="tmemberJoinForm">
      <form:hidden path="tAgree" value="1" />
      <form:hidden path="tAuth" value="승인" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <tr>
         <th class="joinWindow" style="width : 20%">대표자 이름</th>
         <td class="joinInput"><form:input path="tOwnerName" placeholder="(필수)6자까지 입력 가능" /><font
            color="red"> <form:errors path="tOwnerName" /></font></td>
      </tr>

      <tr>
         <th class="joinWindow">개인/기업구분</th>
         <td class="joinInput"><form:radiobutton path="tBusinessRegistration" value="1"
               label="개인사업자" id="businessRegistration" /> <form:radiobutton
               path="tBusinessRegistration" value="2" label="법인사업자" /></td>
      </tr>

      <tr>
         <th class="joinWindow">사업자/법인 등록번호</th>
         <td class="joinInput"><form:input path="tBusinessRegistrationNumber"
               placeholder="(필수)-제외 숫자만 입력" /><font color="red"> <form:errors
                  path="tBusinessRegistrationNumber" /></font></td>
      </tr>

      <tr>
         <th class="joinWindow">아이디</th>
         <td class="joinInput"><form:input path="tId" placeholder="(필수)영문/숫자 포함 8~20자" style="width:74%; display:inline-block; margin-right:28px;" /><font
            color="red"> <form:errors path="tId" /></font>
         <button type="button" id="idCheck" onclick="tIdChk()">중복확인</button></td>
      </tr>
      <tr>
         <th class="joinWindow">비밀번호</th>
         <td class="joinInput"><form:input path="tPassword"
               placeholder="(필수)영문/숫자 포함 8~20자" /><font color="red"> <form:errors
                  path="tPassword" /></font></td>
      </tr>
      <tr>
         <th class="joinWindow">비밀번호 확인</th>
         <td class="joinInput"><input type="Password" id="tPasswordConfirm"
            placeholder="(필수)비밀번호 재입력" /></td>
      </tr>
      <tr>
         <th class="joinWindow">극단 주소</th>
         <!-- tAddress -->
         <td class="joinInput"><input type="text" name=tAddress id="tAddress_postcode"
            placeholder="우편번호" style="width : 70%; margin-right:15px"> <input type="button"
            onclick="tAddressBtn()" value="우편번호 찾기" id=postChk style="margin-top:0"><br> <input
            type="text" name='tAddress' id="tAddress_address" placeholder="주소"><br>
            <input type="text" name='tAddress' id="tAddress_detailAddress"
            placeholder="상세주소"> <input type="text" name='tAddress'
            id="tAddress_extraAddress" placeholder="참고항목"></td>
      </tr>
      <tr>
         <th class="joinWindow">대표자 이메일</th>
         <td class="joinInput"><form:input path="tOwnerEmail"
               placeholder="(필수)@ 포함 영문/숫자 10~15자" /><font color="red"> <form:errors
                  path="tOwnerEmail" /></font></td>
      </tr>
      <tr>
         <th class="joinWindow">극단명</th>
         <td class="joinInput"><form:input path="tName" placeholder="(필수)" /><font
            color="red"> <form:errors path="tName" /></font></td>
      </tr>
      <tr>
         <th class="joinWindow">대표자 휴대폰번호</th>
         <td class="joinInput"><form:input path="tOwnerPhoneNumber"
               placeholder="(필수)-제외 숫자만 입력" /><font color="red"> <form:errors
                  path="tOwnerPhoneNumber" /></font></td>
      </tr>
      <tr>
         <th class="joinWindow">설립일</th>
         <td class="joinInput"><input type='date' name='tEstablishmentDate'><font
            color="red"> <form:errors path="tEstablishmentDate" /></font></td>
      </tr>
      <tr>
         <th class="joinWindow">계좌 정보</th>
         <td ><form:select path="tBank">
               <form:option value="none" label="==은행선택=="></form:option>
               <form:option value="카카오뱅크" label="카카오뱅크"></form:option>
               <form:option value="하나은행" label="하나은행"></form:option>
               <form:option value="신한은행" label="신한은행"></form:option>
               <form:option value="우리은행" label="우리은행"></form:option>
               <form:option value="국민은행" label="국민은행"></form:option>
            </form:select> <form:input path="tBankNumber" placeholder="(필수)계좌번호" /><font
            color="red"><form:errors path="tBankNumber" /></font></td>

      </tr>
      <tr>
         <th class="joinWindow">예금주</th>
         <td class="joinInput"><form:input path="tBankOwner" placeholder="(필수)예금주 성명" /><font
            color="red"><form:errors path="tBankOwner" /></font></td>
      </tr>

      <tr>
         <th class="joinWindow">사업자 등록증</th>
         <td class="joinInput"><input type="file" name=tBusinessRegistrationImage id="tBusinessRegistrationImage" accept="image/jpeg, image/png, image/jpg" /></td>
         
      </tr>
      <tr>
         <td colspan="2" align="center">
         <input type="button" value="이전" id="back" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="submit" value="회원가입" id="join_submit" />
            </td>
      </tr>
   </table>
</form:form>
<!-- 
<script>

$(document).ready(function() {
   console.log('click이벤트');
   $("#join_submit").on("click", function(){
      // csrf 설정
      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      $(document).ajaxSend(function(e, xhr, options) {
          xhr.setRequestHeader(header, token);
      });
   });
});
</script> -->

<!-- 개인 / 기업 구분 체크 -->
<script>
   $("#businessRegistration").attr("checked", "checked")
</script>

<!-- 이전 버튼 -->
<script>
   $(document).ready(function() {
      $("#back").on("click", function() {
         location.href = "/theater/tmemberAgreement";
      });
   });
</script>

<!-- 중복아이디 체크 -->
<script>
   function tIdChk() {
	   var tIdValue = $("#tId").val();
	   if (tIdValue === '') {
	     alert("아이디를 입력해주세요!!");
	     return;
	   }

	   var token = $("meta[name='_csrf']").attr("content");
	   var header = $("meta[name='_csrf_header']").attr("content");
	   $(document).ajaxSend(function(e, xhr, options) {
	     xhr.setRequestHeader(header, token);
	   });
	   $.ajax({
		     url: "/umember/uIdCheck",
		     type: "post",
		     data: {
		       "uId" : tIdValue
		     },
		     success : function(data) {
		       if (data == "overlap") {
		    	   alert("중복된 아이디 입니다.")
		         $("#tId").val(''); // 입력값 재설정
		    	   return;
		       }else{
		    	   $.ajax({
		    		     url: "/theater/tIdCheck",
		    		     type: "post",
		    		     data: {
		    		       "tId" : tIdValue
		    		     },
		    		     success : function(data) {
		    		       if (data == "overlap") {
		    		         alert("중복된 아이디 입니다. ");
		    		         $("#tId").val(''); // 입력값 재설정
		    		       } else {
		    		         alert("사용가능한 아이디 입니다.");
		    		       }
		    		     }
		    		   });
		       }
		     }
		   });
	   
	 

	  
	 }
</script>

<!-- 비밀번호 확인 -->
<script type="text/javascript">

$(function() {
     $("#join_submit").click(function() {
       if ($("#tPasswordConfirm").val() === "") {
         alert("비밀번호 재확인을 해야합니다.");
        return false;
         $("#tPasswordConfirm").focus();
       } 
     });
   });

</script>

<!-- 비밀번호 확인 -->
<script type="text/javascript">
$(function(){
      $('#tPasswordConfirm').blur(function(){
         if($('#tPassword').val() != $('#tPasswordConfirm').val()){
             if($('#tPasswordConfirm').val()!=''){
             alert("비밀번호가 일치하지 않습니다.");
                 $('#tPasswordConfirm').val('');
                $('#tPasswordConfirm').focus();
             }
          }
      })        
   });
</script>
 



<!-- 극단 주소 -->
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function tAddressBtn() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("tAddress_extraAddress").value = extraAddr;

                  } else {
                     document.getElementById("tAddress_extraAddress").value = '';
                  }
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('tAddress_postcode').value = data.zonecode;
                  document.getElementById("tAddress_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("tAddress_detailAddress")
                        .focus();
               }
            }).open();
   }
</script>

<!-- 파일 업로드 유효성 검사 -->

<script type="text/javascript">
const input = document.querySelector("input[name='tBusinessRegisterationImage']");

input.addEventListener("change", function() {
  if (this.files.length === 0) {
    alert("파일을 선택해주세요!!");
    return;
  }

  const file = this.files[0];
  if (file.size > 10485760) {
    alert("파일 크기가 10MB를 초과합니다. 10MB보다 용량이 작은  파일을 선택하세요.");
    return;
  }

  // Check for allowed file types
  const allowedTypes = ["image/jpeg", "image/png", "application/pdf"];
  if (!allowedTypes.includes(file.type)) {
    alert("파일 형식이 허용되지 않습니다. JPEG, PNG 또는 PDF 파일을 선택하세요.");
    return;
  }

});

</script>


<style>
#login_box_total .container {
	width: 1120px;
	height : 100%;
	padding-bottom : 20px;
	margin-bottom : 150px;
	font-family: 'Nanum Gothic ', sans-serif;
}
.logo {
	margin-bottom : 40px;
}

/* 양식 헤더 스타일 지정 */
 .joinheader {
    font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 30px;
  }
   .tmemberJoinForm {
  margin: 0 auto 50px;
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
  display: inline-block;
  margin-top: 50px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  cursor: pointer;
}
input[type="button"]:first-child {
	width:93.33px;
}
  form:select, form:input {
   background-color: #ffcccc;
   color: #333;
   padding: 5px 10px;
   border: 1px solid #999;
   border-radius: 5px;
   margin-right: 10px;
}

</style>