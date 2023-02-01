<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function chk() {
		var chkbox = document.getElementsByName('agree');
		var chk = false;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chk = true;
			} else {
				chk = false;
			}
		}

		if (chk) {
			alert("이용약관에 모두 동의하셨습니다.")
			location.href = "/umember/umemberJoinForm";
			return false;
		} else {
			alert("마로티켓 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.")
		}

	}

	function nochk() {
		alert("회원 가입을 취소합니다.");
		location.href = "/";
	}
</script>
<title>일반 사용자 회원가입</title>
<form>
	<h2>일반 사용자 회원가입</h2><br><hr>
	
	<br><div class="text" align="center"><b>개인 정보 수집 및 이용 동의(필수)</b></div><br>
	
	<textarea rows="10" cols="120">
[수집 목적]
1. 본인확인, 개인 식별 중복가입 및 부정이용 방지 
2. 계약 이행 및 서비스 제공 고객 고층처리 및 분쟁조정 해결
3.서비스 이용기록 분석 부정이용 방지를 위한 이용기록 관리

[수집 항목]
1. 아이디, 비밀번호, 이름, 성별, 생년월일, 전화번호, 이메일
2. IP Address, 쿠키, 방문 일시, OS종류, 기기정보, 브라우져 종류, 서비스 이용 기록

[보유 기간]
1. 동의 철회 또는 회원 탈퇴 시 까지
	
	
	</textarea>
	
	<div>
		<p>
			<input type="checkbox" name="agree" id="agree_first"><label for="agree_first"><b>동의합니다.</b></label>
		</p>
	</div>

	<br><br><div class="text"><b>마로티켓 이용 약관 동의(필수)</b></div><br>

	<textarea rows="20" cols="120">
	제 1장 총 칙
제1조(목적)
이 약관은 마로티켓 주식회사가 운영하는 인터넷사이트 에서 제공하는 전자상거래 관련 서비스를 이용함에 있어 회사와 이용자의 권리, 의무, 책임사항 및 서비스 이용절차 등에 관한 사항을 규정함을 목적으로 합니다. 회사가 운영하는 오프라인의 영업장과 관련된 전자상거래 관련 서비스에 대해서도 그 성질에 반하지 아니하는 한 이 약관을 준용합니다.
제2조(용어의 정의)
① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 회사 : 마로티켓 주식회사를 의미하며, 이와 아울러 마로티켓 주식회사가 재화 또는 용역(이하 ‘재화 등’이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하고, 또한 사이버 몰을 운영하는 사업자의 의미로도 사용합니다.
2. 이용자 : 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
3. 회원 : 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자로서 아래와 같이 구분될 수 있습니다.
제3조(약관의 명시와 개정)
① 회사는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 회사의 서비스가 제공되는 인터넷 사이트() 첫 화면에 게시합니다.
② 회사는 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
제2장 회사의 서비스
제1조(서비스의 제공 및 변경)
① 회사는 다음과 같은 업무를 수행합니다.
1. 재화 등에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 등의 배송
3. 기타 회사가 정하는 업무
	</textarea>

	<div>
		<p>
			<input type="checkbox" name="agree" id="agree_second"><label for="agree_second"><b>동의합니다.</b></label>
		</p>
	</div>

	<div>
		<br><p>
			<input type="button" value="다음 " onclick="chk()" />&nbsp;&nbsp;&nbsp;
			<input type="button" value="메인 화면으로" onclick="nochk()" />
		</p>

	</div>

</form>