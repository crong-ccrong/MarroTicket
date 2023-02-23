<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/utermsofuse.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<sec:authorize access="hasRole('ROLE_UMEMBER') or isAnonymous()">
<div class="total_wrap">
</sec:authorize>
	<h2>이용약관 페이지</h2>

	<div class="wrap_tab">
		<ul class="nav nav-tabs">
			<li class="nav-item"><c:choose>
					<c:when test="${empty tmember }">
						<a class="nav-link active" aria-current="page"
							title="umemberTermsOfUsePageMoving" href="/umembertermsofuse">
							<span class="tabtitle">마로티켓 일반 회원 이용 약관</span>
						</a>
					</c:when>
					<c:otherwise>
						<a class="nav-link active" aria-current="page"
							title="umemberTermsOfUsePageMoving"
							href="/theater/umembertermsofuse"> <span class="tabtitle">마로티켓
								일반 회원 이용 약관</span>
						</a>
					</c:otherwise>
				</c:choose></li>
			<li class="on"><c:choose>
					<c:when test="${empty tmember }">
						<a class="nav-link" title="tmemberTermsOfUsePageMoving"
							href="/tmembertermsofuse"> <span class="tabtitle">마로티켓
								극단 회원 이용 약관</span>
						</a>
					</c:when>
					<c:otherwise>
						<a class="nav-link" title="tmemberTermsOfUsePageMoving"
							href="/theater/tmembertermsofuse"> <span class="tabtitle">마로티켓
								극단 회원 이용 약관</span>
						</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</div>

	<!-- 목차 -->
	<div class="tcont_terms">
		<ol class="type01">
			<li><a href="#terms01" title="제 1장 총칙 보기"> <span>1.</span>
					"총칙"
			</a></li>
			<li><a href="#terms02" title="제 1장 총칙 보기"> <span>2.</span>
					"회사의 서비스"
			</a></li>
		</ol>
	</div>
	<!-- //목차 -->
	<!-- 1. 총칙 -->
	<div id="terms01" class="section_terms">
		<h3>제 1장. 총칙</h3>
		<dl>
			<dt>제1조 (목적)</dt>
			<dd>"이 약관은 마로티켓 주식회사가 운영하는 인터넷사이트 에서 제공하는 전자상거래 관련 서비스를 이용함에 있어
				회사와 이용자의 권리, 의무, 책임사항 및 서비스 이용절차 등에 관한 사항을 규정함을 목적으로 합니다. 회사가 운영하는
				오프라인의 영업장과 관련된 전자상거래 관련 서비스에 대해서도 그 성질에 반하지 아니하는 한 이 약관을 준용합니다."</dd>
		</dl>
		<dl>
			<dt>제2조 (용어의 정의)</dt>
			<dd>
				<ol class="list_terms">
					<li><span class="bullet">①</span> "이 약관에서 사용하는 용어의 정의는 다음과
						같습니다."
						<ol class="list_terms01">
							<li><span class="bullet">1.</span> "회사 : 마로티켓 주식회사를 의미하며, 이와
								아울러 마로티켓 주식회사가 재화 또는 용역(이하 ‘재화 등’이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등
								정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하고, 또한 사이버 몰을 운영하는
								사업자의 의미로도 사용합니다."</li>
							<li><span class="bullet">2.</span> "이용자 : 이 약관에 따라 회사가 제공하는
								서비스를 받는 회원 및 비회원을 말합니다."</li>
							<li><span class="bullet">3.</span> "회원 : 회사에 개인정보를 제공하여
								회원등록을 한 자로서, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자로서 아래와 같이 구분될 수
								있습니다."</li>
						</ol></li>
					<li><span class="bullet">②</span> "제1항에 정의되지 않은 용어는 일반적인 상관례에
						따릅니다."</li>
				</ol>
			</dd>
		</dl>
		<dl>
			<dt>제3조 (약관의 명사와 개정)</dt>
			<dd>
				<ol class="list_terms">
					<li><span class="bullet">①</span> "회사는 약관의 규제에 관한 법률, 전자거래기본법,
						전자서명법, 정보통신망 이용촉진 및 정보보호등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련법을
						위배하지 않는 범위에서 본 약관을 개정할 수 있습니다."</li>
					<li><span class="bullet">②</span> "이 약관에서 정하지 아니한 사항과 이 약관의
						해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제등에 관한 법률, 공정거래위원회가 정하는
						전자상거래등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다."</li>
					<li><span class="bullet">③</span> "약관에 동의하는 것은 회사가 운영하는 인터넷
						사이트를 방문하여 약관의 개정사항을 확인하는 것에 동의함을 의미하며, 변경된 약관에 대한 정보를 알지 못하여 발생하는
						이용자의 피해에 대해 회사는 책임을 지지 않습니다."</li>
					<li><span class="bullet">④</span> "개정된 약관에 동의하지 않는 회원은 회원
						탈퇴(계약의 해지)를 요청할 수 있고, 약관 적용일 까지 거부의 의사를 표시하지 않으면 약관의 변경에 동의한 것으로
						간주 합니다."</li>
				</ol>
			</dd>
		</dl>
	</div>
	<!-- //총칙 -->

	<!-- 2. 회사의 서비스 -->
	<div id="terms02" class="section_terms">
		<h3>제 2장. 회사의 서비스</h3>
		<dl>
			<dt>제4조 (서비스의 제공 및 변경)</dt>
			<dd>
				<ol class="list_terms">
					<li><span class="bullet">①</span> "회사는 다음과 같은 업무를 수행합니다."
						<ol class="list_terms01">
							<li><span class="bullet">1.</span> "재화 등에 대한 정보 제공 및 구매계약의
								체결"</li>
							<li><span class="bullet">2.</span> "구매계약이 체결된 재화 등의 제공"</li>
							<li><span class="bullet">3.</span> "기타 회사가 정하는 업무"</li>
						</ol></li>
					<li><span class="bullet">②</span> "회사는 재화 등의 품절 또는 기술적 사양의 변경
						등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 등의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 등의
						내용 및 제공일자를 명시하여 현재의 재화 등의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다. 단, 회사가
						합리적으로 예측할 수 없는 불가피한 여건이나 사정이 있는 경우, 위 공지를 하지 않을 수 있습니다."</li>
					<li><span class="bullet">③</span> "회사가 제공하기로 이용자와 계약을 체결한 서비스의
						내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 회사는 이로 인하여 이용자가 입은 손해를
						배상합니다. 단, 회사에 고의 또는 과실이 있는 경우에 한합니다."</li>
				</ol>
			</dd>
		</dl>
		<dl>
			<dt>제5조 (서비스의 중단)</dt>
			<dd>
				<ol class="list_terms">
					<li><span class="bullet">①</span> "회사는 컴퓨터 등 정보통신설비의 보수점검.교체 및
						고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다."</li>
					<li><span class="bullet">②</span> "제1항에 의한 서비스 중단의 경우에는 회사는
						이용자에게 통지합니다. 다만 회사가 합리적으로 예측할 수 없는 사유로 인한 서비스 중단의 경우에는 사전통지를 할 수
						없으며 사후에 이를 공지합니다."</li>
					<li><span class="bullet">③</span> "회사는 제1항 및 제2항 단서조항의 사유로
						서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, 회사에 고의
						또는 과실이 있는 경우에 한합니다."</li>
					<li><span class="bullet">④</span> "사업종목의 전환, 사업의 포기, 업체간의 통합
						등의 이유로 서비스를 제공할 수 없게 되는 경우에는 회사는 이용자에게 통지하고 당초 회사에서 제시한 조건에 따라
						소비자에게 보상합니다. 다만, 회사가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 적립금 등을 회사에서 통용되는
						통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다."</li>
				</ol>
		</dl>
	</div>
</div>
<sec:authorize access="hasRole('ROLE_UMEMBER') or isAnonymous()">
</div>
</sec:authorize>
<!-- //회사의 서비스 -->
<style>
.total_wrap {
	width: 1120px;
	margin: 50px auto;
}
</style>
