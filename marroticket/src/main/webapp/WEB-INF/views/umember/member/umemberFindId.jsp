<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	$("#umemberFindId").on("click", function() {
		//json
		var uName =  $("#uName");
		var uPhoneNumber =  $("#uPhoneNumber");
		var uNameVal = uName.val();
		var uPhoneNumberVal = uPhoneNumber.val();

		//유효성 검사
		//이름
		if(uNameVal.length>6){
			alert("이름은 6자리까지 입력가능합니다.");
			return;
		}
		if (uNameVal==null || uNameVal.length==0){
			alert("이름을 입력하세요");
			return;
		}
		//전화번호
		if (uPhoneNumberVal==null || uPhoneNumberVal.length==0){
			console.log(uNameVal+" 길이 : "+uNameVal.length);
			alert("휴대폰번호를 입력하세요");
			return;
		}
		if(!uPhoneNumberVal.match(/^\d{3}\d{3,4}\d{4}$/)){
			alert("휴대폰번호가 올바르게 입력되지 않았습니다.");
			return;
		}

		var jsonObject = { uName : uNameVal , uPhoneNumber:uPhoneNumberVal };
		var jsonStg = JSON.stringify(jsonObject);
		console.log(jsonStg);

		//ajax
		$.ajax({
			type : "post",
			url : "/umember/findId",
			data : jsonStg,
			contentType : "application/json; charset=utf-8",
			success : function(result){
				switch (result) {
				case 'fail':
					//입력한 이름와 휴대폰 번호에 일치하는 아이디가 없을 때
					alert("아이디 찾기 실패 \n입력하신 정보와 일치하는 아이디가 없습니다.");
					break;
				default :	
					//아이디 찾기 성공
					console.log('회원의 아이디 : ' + result);
					alert("아이디 찾기 성공 \n아이디는 "+result+"입니다.");
					break;
				}		
			}
		});
	});
	
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});

});	
</script>
<p>아이디 찾기</p>
<div>
	<table>
		<tr>
			<td><label for="uName">이름</label></td>
		</tr>
		<tr>
			<td><input type='text' name='uName' id='uName'/></td>
		</tr>
		<tr>
			<td><label for="uPhoneNumber">휴대폰번호</label></td>
		</tr>
		<tr>
			<td><input type='text' name='uPhoneNumber' id='uPhoneNumber' placeholder="(-)을 제외하고 입력하세요" />
		</tr>
		<tr>
			<td align='right'><input type='button' id='umemberFindId' value='찾기'></td>
		</tr>
	</table>
</div>