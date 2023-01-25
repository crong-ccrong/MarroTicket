<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 일반회원 회원가입 페이지 -->

<h3>마로 티켓 일반 회원 가입 페이지</h3>
<form enctype="UTF-8" name='join_form'>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" placeholder="(필수)6자 이내 입력"
				required="required" /></td>
		</tr>

		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" required="required"
				autofocus="autofocus" placeholder="(필수)영문/숫자 포함 8~20자" /></td>
		</tr>

		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd"
				placeholder="(필수)영문/숫자 포함 8~20자" required="required" /></td>
		</tr>

		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="pwd" placeholder="(필수)비밀번호 재입력"
				required="required" /></td>
		</tr>

		<tr>
			<td>생년월일</td>
			<td><input name="birth" type="date"
				placeholder="(필수) 생년월일을 입력하세요" /></td>
		</tr>

		<tr>
			<td>성별</td>
			<td><font color='red'>택 1 필수 </font> <input type="radio"
				value="여자" name="gender" id="woman" checked /><label for="여자">여자</label>
				<input type="radio" value="남자" name="gender" id="men" /><label
				for="남자">남자</label></td>
		</tr>

		<tr>
			<td>주소</td>
			<td><input type="text" name='postcode' id="sample6_postcode"
				placeholder="우편번호"> <input type="button"
				onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name='address' id="sample6_address"
				placeholder="주소"><br> <input type="text" name='address'
				id="sample6_detailAddress" placeholder="상세주소"> <input
				type="text" name='address' id="sample6_extraAddress"
				placeholder="참고항목"></td>
		</tr>

		<tr>
			<td>이메일</td>
			<td><input type="email" name="email" required="required"
				placeholder="(필수)@ 포함 영문/숫자 10~15자"></td>
		</tr>

		<tr>
			<td>휴대폰 번호</td>
			<td><input type="text" name="phone" required="required"
				placeholder="(필수)(-)제외 숫자만 입력 ,11자" /></td>
		</tr>



		<tr>
			<td>관심 장르</td>
			<td><input type="radio" value="로맨스" name="subscription_path"
				id="로맨스극" checked /><label for="로맨스">로맨스</label> <input
				type="radio" value="드라마" name="subscription_path" id="드라마극" /><label
				for="드라마">드라마</label> <input type="radio" value="공포"
				name="subscription_path" id="공포극" /><label for="공포물">공포</label> <input
				type="radio" value="추리스릴러" name="subscription_path" id="추리스릴러극" /><label
				for="추리스릴러">추리/스릴러</label> <input type="radio" value="판타지"
				name="subscription_path" id="판타지극" /><label for="판타지">판타지</label> <input
				type="radio" value="시대역사" name="subscription_path" id="시대역사극" /><label
				for="시대역사">시대/역사</label>
		</tr>


		<tr>
			<td colspan="2"><input type="button" onclick='join_fuction()'
				value="회원가입" /> <input type="reset" value="이전" /> <input
				type='hidden' name='command' value='joinmember'></td>
		</tr>
	</table>
</form>
</body>
<script type="text/javascript">
	function join_fuction() {
		var formJoin = document.join_form;
		var id = formJoin.id.value;
		var pwd = formJoin.pwd.value;
		var name = formJoin.name.value;
		var nickname = formJoin.nickname.value;
		var email = formJoin.email.value;
		//가입경로들
		var susin = formJoin.subscription_path.value;
		var tel = formJoin.tel.value;
		var phone = formJoin.phone.value;
		var birth = formJoin.birth.value;
		var postcode = formJoin.postcode.value;
		var address = formJoin.address.value;
		// var joinDate = formJoin.joinDate.value;
		if ((id.length == 0 || id == null) || (pwd.length == 0 || pwd == null)
				|| (name.length == 0 || name == null)
				|| (nickname.length == 0 || nickname == null)
				|| (email.length == 0 || email == null)
				|| (tel.length == 0 || tel == null)
				|| (phone.length == 0 || phone == null)
				|| (birth.length == 0 || birth == null)
				|| (postcode.length == 0 || postcode == null)
		//|| (address.length == 0 || address == null)

		) {
			alert("필수 항목은 반드시 입력해주세요!");
		} else {
			formJoin.method = 'post';
			formJoin.action = 'joinwith';
			formJoin.submit();
		}
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
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
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

