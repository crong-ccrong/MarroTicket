<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="/css/registePlay.css" rel="stylesheet" type="text/css">

<sec:authentication var="principal" property="principal" />
<h2>공연 등록 페이지</h2>



<form:form method="post" modelAttribute="playVO"
	action="/theater/registePlayComplete" enctype="multipart/form-data">
	<div class="content">
		<table class="agree">
			<tr>
				<td colspan="2">정산 관련 동의(필수) <input type="checkbox"
					name="agree1" /><font color="red" id="agree1Error" hidden="true"><spring:message
							code="registe.checkbox.error" /></font></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><textarea rows="10" cols="120"
						readonly>
마로티켓 서비스 수익 및 비용 정산 약관

제1조 (목적)
본 약관은 마로티켓 회사(이하 “회사”라 함)와 가맹극단 회원(이하 “회원”이라 함) 간에 “회원”이 마로티켓 서비스를 이용함에 있어 수익 및 비용 정산을 하는 데 필요한 사항을 정하는 것을 그 목적으로 합니다. 

제2조 (용어의 정의)
① 본 약관에서 사용되는 용어의 의미는 다음 각 호와 같습니다.
“정산 및 지급 ”(이하 “정산업무”라 한다)라 함은 “회사”가 “정산대상자”에게 지급하여야 할 비용에 대한 정산 및 지급을 “회사”가 자신의 시스템을 이용하여 “정산대상자”에게 지급함으로써 정산 의무를 이행하는 것을 말한다.
“정산대상자”라 함은 “회사”의 마로티켓 서비스 가입자(또는 회원)으로서 “회사”가 정산의무를 부담하고 있는 자를 말한다. 
“정산금”이라 함은 마로티켓 서비스를 이용하며 “회사”가 관련 시스템과 플랫폼에서 제공하는 대가를 말한다. 
“정산 데이터”라 함은 “회사”가 마로티켓 서비스 가입자(회원)별로 작성한 비용 정산 자료를 말한다.
② 본 계약에서 사용하는 용어 중 제1항에서 규정되지 않은 용어의 해석은 관련 법령 및 일반 상관례에 따릅니다. 

제3조 (계약의 성립)
마로티켓 서비스 이용 신청시 “[필수]수익 및 비용 정산 약관”에 “동의" 선택을 하면  약관에 동의하는 것으로 간주되며,  고객의 이용신청에 대해 회사가  승낙함으로써 계약이 성립합니다. 

제4조 (약관의 효력 및 변경)
본 약관은 “정산업무” 서비스를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다.
본 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지하고, 이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.
회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용일자 및 변경 사유를 명시하여 제2항과 같은 방법으로 그 적용일자 15일전에 공지합니다. 다만, 회원에게 불리한 약관 변경인 경우에는 그 적용일자 30일전에 공지하며, E-Mail, SMS 등으로 회원에게 개별 통지합니다. 단, 회원의 연락처 미기재, 변경 후 미수정 등으로 인하여 개별 통지가 어려운 경우에 한하여 본 항의 공지를 함으로써 개별 통지한 것으로 간주합니다. 회원이 변경된 서비스 또는 약관 사항에 동의하지 않는 경우 서비스 이용 계약의 해지를 요청할 수 있습니다.

제5조 (본 약관 외 준칙)
본 약관은 “회사”의 마로티켓 서비스와 관련된 “정산업무”에 대하여 적용됩니다. 본 약관에 명시되지 않은 사항에 대해서는 “회사”의 마로티켓 서비스 이용약관, 관련법령 및 “회사”가 정한 서비스의 세부이용지침 등의 규정에 따릅니다.

제6조 (정산업무의 범위)
“회사”가 이행하는 “정산업무”의 범위는 다음 각 호와 같습니다. 

“회사”가 요청하는 “정산대상자”에 대한 비용정산
정산된 비용의 “정산대상자”에 대한 정산내역의 게시

제7조 (정산대상자에 대한 대가(정산액) 산정)
① 정산대상자에 대한 대가는 “정산대상자”가 자신의 컨텐츠 등에 자신의 “연극”을 노출하고 “이용자”에게 해당 연극티켓번호로 qr코드를 발송하여 구매하는 등의 활동의 대가를 말합니다.
② “이용자” 는 “정산대상자”의 티켓을 구매할 시 티켓가격과 수수료500원을 지불합니다. 단, “이용자” 의 환불 요청에 의한 환불 건은 수수료를 제외하고 “정산금” 산정에서 제외합니다. 
③ “회사” 는 이를 정산액에서 정산 후 지급합니다. 

제8조 (정산 절차 및 수수료)
① “회사”가 “정산대상자”에게 정산하는 절차는 다음 각호의 내용에 따릅니다. 
 
“정산대상자”가 등록한 연극의 종료일 이후 “회사”는 정산처리 후 종료일 기준 내달 20일에 지급한다.
그외 정산 관련 상세 사항은 마로티켓 웹페이지의 공지 및 개별 연락으로 정한 사항 등에 따른다.

제9조 (계약기간)
① 본 계약은 “정산대상자” 가 본 계약에 동의한 날로부터 “회사” 와 “정산대상자” 간의 마로티켓 서비스 해지 완료 시점까지 유효합니다.
② 마로티켓 서비스 해지시 “회사” 는 “정산대상자” 에 대한 지급 및 정산 의무도 동반 종료됩니다.

제10조 (권리∙의무의 양도 등 금지)
“정산대상자”는 “회사” 의 사전 서면동의 없이는 본 계약상의 지위 또는 권리 및 의무의 전부 또는 일부를 제3자에게 양도, 위임하거나 담보제공 등의 목적으로 처분할 수 없습니다. 


   
   </textarea></td>
			</tr>
			<tr>
				<td colspan="2">연극등록 약관(필수)<input type="checkbox" name="agree2" /><font
					color="red" id="agree2Error" hidden="true"><spring:message
							code="registe.checkbox.error" /></font></td>
			</tr>

			<tr>
				<td align="center" colspan="2"><textarea rows="10" cols="120"
						readonly>
마로티켓 연극 등록 서비스 약관

제1조 (목적)
본 약관은 마로티켓 회사(이하 “회사”라 함)와 가맹극단 회원(이하 “회원”이라 함) 간에 “회원”이 마로티켓 연극 등록 서비스를 이용함에 있어  필요한 사항을 정하는 것을 그 목적으로 합니다. 

제2조 (용어의 정의)
① 본 약관에서 사용되는 용어의 의미는 다음 각 호와 같습니다.
“연극등록 ”(이하 “연극등록”라 한다)라 함은 “회원”이 “회사”의 홈페이지에 입력할 연극 데이터를 연극등록 시스템을 사용해 등록 하는 것을 말한다.
“연극 데이터”라 함은 “회원”이 마로티켓 연극 등록 서비스 회원별로 작성한 연극 자료를 말한다.
② 본 계약에서 사용하는 용어 중 제1항에서 규정되지 않은 용어의 해석은 관련 법령 및 일반 상관례에 따릅니다. 

제3조 (계약의 성립)
마로티켓 마로티켓 연극 등록 서비스 이용 신청시 “[필수]마로티켓 연극 등록 서비스 약관”에 “동의" 선택을 하면  약관에 동의하는 것으로 간주되며,  고객의 이용신청에 대해 회사가  승낙함으로써 계약이 성립합니다. 

제4조 (약관의 효력 및 변경)
본 약관은 “연극등록” 서비스를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다.
본 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지하고, 이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.
회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용일자 및 변경 사유를 명시하여 제2항과 같은 방법으로 그 적용일자 15일전에 공지합니다. 다만, 회원에게 불리한 약관 변경인 경우에는 그 적용일자 30일전에 공지하며, E-Mail, SMS 등으로 회원에게 개별 통지합니다. 단, 회원의 연락처 미기재, 변경 후 미수정 등으로 인하여 개별 통지가 어려운 경우에 한하여 본 항의 공지를 함으로써 개별 통지한 것으로 간주합니다. 회원이 변경된 서비스 또는 약관 사항에 동의하지 않는 경우 서비스 이용 계약의 해지를 요청할 수 있습니다.

제5조 (본 약관 외 준칙)
본 약관은 “회사”의 마로티켓 연극 등록 서비스와 관련된 “연극등록”에 대하여 적용됩니다. 본 약관에 명시되지 않은 사항에 대해서는 “회사”의 마로티켓 연극 등록 서비스 이용약관, 관련법령 및 “회사”가 정한 서비스의 세부이용지침 등의 규정에 따릅니다.

제6조 (연극등록의 범위)
“회사”가 이행하는 “연극등록”의 범위는 다음 각 호와 같습니다. 

“회사”가 요청하는 “회원”에 대한 연극 데이터 등록
입력된 연극 데이터의 대한 연극 목록의 게시 및 예매

제7조 (계약기간)
① 본 계약은 “회원” 이 본 계약에 동의한 날로부터 “회사” 와 “회원” 간의 마로티켓 연극 등록 서비스 해지 완료 시점까지 유효합니다.
② 마로티켓 연극 등록 서비스 해지시 “회사” 는 “회원” 에 대한 연극 등록 서비스 의무도 동반 종료됩니다.

제8조 (권리∙의무의 양도 등 금지)
“회원”은 “회사” 의 사전 서면동의 없이는 본 계약상의 지위 또는 권리 및 의무의 전부 또는 일부를 제3자에게 양도, 위임하거나 담보제공 등의 목적으로 처분할 수 없습니다. 

   </textarea></td>
			</tr>


			<tr>
				<td colspan="2">예매 좌석 제한 관련 동의(필수)<input type="checkbox"
					name="agree3" /><font color="red" id="agree3Error" hidden="true"><spring:message
							code="registe.checkbox.error" /></font></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><textarea rows="10" cols="120"
						readonly>
마로티켓 예매 좌석 제한 관련 약관

제1조 (목적)
본 약관은 마로티켓 회사(이하 “회사”라 함)와 가맹극단 회원(이하 “회원”이라 함) 간에 “회원”이 마로티켓 연극 등록 서비스를 이용함에 있어  필요한 사항을 정하는 것을 그 목적으로 합니다. 

제2조 (용어의 정의)
① 본 약관에서 사용되는 용어의 의미는 다음 각 호와 같습니다.
“예매 좌석 제한 ”(이하 “예매 좌석 제한”라 한다)라 함은 “회원”이 “회사”의 홈페이지에 입력할 연극 데이터를 연극등록 시스템을 사용해 등록할 시 예매 좌석이 제한 되는 것을 말한다.
“예매 좌석”이라 함은 “회사”가 
② 본 계약에서 사용하는 용어 중 제1항에서 규정되지 않은 용어의 해석은 관련 법령 및 일반 상관례에 따릅니다. 

제3조 (계약의 성립)
마로티켓 마로티켓 연극 등록 서비스 이용 신청시 “[필수]마로티켓 마로티켓 예매 좌석 제한 관련 약관”에 “동의" 선택을 하면  약관에 동의하는 것으로 간주되며,  고객의 이용신청에 대해 회사가  승낙함으로써 계약이 성립합니다. 

제4조 (약관의 효력 및 변경)
본 약관은 “연극등록” 서비스를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다.
본 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지하고, 이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.
회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용일자 및 변경 사유를 명시하여 제2항과 같은 방법으로 그 적용일자 15일전에 공지합니다. 다만, 회원에게 불리한 약관 변경인 경우에는 그 적용일자 30일전에 공지하며, E-Mail, SMS 등으로 회원에게 개별 통지합니다. 단, 회원의 연락처 미기재, 변경 후 미수정 등으로 인하여 개별 통지가 어려운 경우에 한하여 본 항의 공지를 함으로써 개별 통지한 것으로 간주합니다. 회원이 변경된 서비스 또는 약관 사항에 동의하지 않는 경우 서비스 이용 계약의 해지를 요청할 수 있습니다.

제5조 (본 약관 외 준칙)
본 약관은 “회사”의 마로티켓 연극 등록 서비스와 관련된 “예매 좌석 제한”에 대하여 적용됩니다. 본 약관에 명시되지 않은 사항에 대해서는 “회사”의 마로티켓 연극 등록 서비스 이용약관, 관련법령 및 “회사”가 정한 서비스의 세부이용지침 등의 규정에 따릅니다.

제6조 (연극등록의 범위)
“회사”가 이행하는 “예매 좌석 제한”의 범위는 다음 각 호와 같습니다. 

“회사”가 요청하는 “회원”에 대한 연극 데이터 등록
입력된 연극 데이터의 대한 연극 목록의 게시 및 예매 이후
예매시 이용자가 예매할 수 있는 좌석 갯수의 제한이 있다.

제7조 (계약기간)
① 본 계약은 “회원” 이 본 계약에 동의한 날로부터 “회사” 와 “회원” 간의 마로티켓 연극 등록 서비스 해지 완료 시점까지 유효합니다.
② 마로티켓 연극 등록 서비스 해지시 “회사” 는 “회원” 에 대한 연극 등록 서비스 의무도 동반 종료됩니다.

제8조 (권리∙의무의 양도 등 금지)
“회원”은 “회사” 의 사전 서면동의 없이는 본 계약상의 지위 또는 권리 및 의무의 전부 또는 일부를 제3자에게 양도, 위임하거나 담보제공 등의 목적으로 처분할 수 없습니다. 
   
   </textarea><br> <br></td>
			</tr>
		</table>
		<table class="information" border="1">
			<tr>
				<td>연극명</td>
				<td><form:input path="pname" placeholder="연극명 입력칸" /><font
					color="red"><form:errors path="pname" /></font></td>
			</tr>

			<tr>
				<td>연극 시작일<br>(현재일 시점부터 최소 30일 이후여야 합니다.)
				</td>
				<td><form:input path="pstartDate" id="pstartDate"
						readonly="true" /><font color="red"><form:errors
							path="pstartDate">
							<spring:message code="registe.date.error" />
						</form:errors></font></td>
			</tr>
			<tr>
				<td>연극 종료일<br>(연극 시작일 시점부터 최대 60일까지 선택 가능합니다.)
				</td>
				<td><form:input path="pcloseDate" id="pcloseDate"
						readonly="true" /><font color="red"><form:errors
							path="pcloseDate">
							<spring:message code="registe.date.error" />
						</form:errors></font></td>
			</tr>


			<tr>
				<td>연극 소요시간(3자리까지 분단위입력)</td>
				<td><form:input path="prunningTime" id="prunningTime"
						placeholder="연극 소요 시간 입력칸" />분 <font color="red"><form:errors
							path="prunningTime" /></font></td>
			</tr>

			<tr>
				<td>극장명</td>
				<td><form:input path="ptheaterName" placeholder="극장명 입력칸" /> <font
					color="red"><form:errors path="ptheaterName" /> </font></td>
			</tr>

			<tr>
				<td>극장 주소</td>
				<td><input type="button" onclick="sample6_execDaumPostcode()"
					value="주소 찾기" /></td>
			</tr>

			<tr>
				<td colspan="2"><form:input path="ptheaterAddress"
						id="ptheaterAddress" /> <font color="red"><form:errors
							path="ptheaterAddress" /> </font></td>
			</tr>

			<tr>
				<td>연극포스터</td>
				<td><input type="File" name="pposter" id="pposter"
					accept="image/jpeg, image/png, image/jpg" /><font color="red"
					id="pposterError" hidden="true"><spring:message
							code="registe.file.error" /></font></td>
			</tr>

			<tr>
				<td>기획사 정보</td>
				<td><form:input path="pagency" placeholder="기획사 정보 입력칸"
						value="마로기획" /><font color="red"><form:errors
							path="pagency" /></font></td>
			</tr>



			<tr>
				<td>장르 정보</td>
				<td><form:select path="pgenre">
						<option value="1">로맨스극</option>
						<option value="2">코미디극</option>
						<option value="3">드라마극</option>
						<option value="4">공포극</option>
						<option value="5">추리스릴러극</option>
						<option value="6">판타지극</option>
						<option value="7">시대/역사극</option>
					</form:select><font color="red"><form:errors path="pgenre" /></font></td>
			</tr>

			<tr>
				<td>관람 등급</td>
				<td><form:select path="pratings">
						<option value="1">전체 이용가</option>
						<option value="2">12세 이상</option>
						<option value="3">15세 이상</option>
						<option value="4">18세 이상</option>
					</form:select><font color="red"><form:errors path="pratings" /></font></td>
			</tr>

			<tr>
				<td>티켓 가격(원)</td>
				<td><form:input type="text" path="pticketPrice"
						placeholder="티켓 가격 입력칸" />원<font color="red"><form:errors
							path="pticketPrice" /></font></td>
			</tr>

			<tr>
				<td>캐스팅 데이터</td>
				<td><form:textarea rows="10" cols="50" path="pcasting"
						placeholder="캐스팅 정보 입력칸" /><font color="red"><form:errors
							path="pcasting" /></font></td>
			</tr>
			<tr>
				<td>연극 줄거리</td>
				<td><form:textarea rows="10" cols="50" path="pplot"
						placeholder="연극 줄거리 입력칸" /><font color="red"><form:errors
							path="pplot" /></font></td>
			</tr>

			<tr>
				<td>좌석 개수(최대 100좌석까지만 입력할 수 있습니다.)</td>
				<td><form:input type="text" path="pseatNumber"
						placeholder="좌석 개수 입력칸" />좌석<font color="red"><form:errors
							path="pseatNumber" /></font></td>

			</tr>

			<tr>
				<td>상연 시각</td>
				<td>1회차 상연 시간 선택 <select id="pfirstStartTimeHour"
					onchange="changePFirstStartTime()">
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
				</select>: <select id="pfirstStartTimeMinute"
					onchange="changePFirstStartTime()">
						<option value="00">00</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
				</select> <form:input path="pfirstStartTime" id="pfirstStartTime"
						hidden="true" /><font color="red"><form:errors
							path="pfirstStartTime" /></font> <br> 2회차 상연 시간 선택 <select
					id="psecondStartTimeHour" onchange="changePSecondStartTime()"
					disabled="disabled">
						<option value="">선택</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
				</select>: <select id="psecondStartTimeMinute" disabled="disabled">
						<option value="">선택</option>
						<option value="00">00</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
				</select> <form:input path="psecondStartTime" id="psecondStartTime"
						hidden="true" /><font color="red"><form:errors
							path="psecondStartTime" /></font>
				</td>
			</tr>
			<tr>
				<form:input path="pregistrationApproval" value="0" hidden="true" />
				<form:input path="pmodifyApproval" hidden="true" />
				<form:input path="pagree" id="pagree" hidden="true" />
			</tr>
		</table>
	</div>
</form:form>
<br>
<div>
	<input type="button" value="메인화면으로" id="main" />
	<button type="submit" id="registeTemporary">임시등록</button>
</div>


<script>
	$(document).ready(function() {
		$("#main").on("click", function() {
			location.href = "/theater/";
		});
	});
</script>

<script>
	$(document)
			.ready(
					function() {
						var formObj = $("#playVO");

						$.datepicker
								.setDefaults({
									dateFormat : 'yy-mm-dd',
									prevText : '이전 달',
									nextText : '다음 달',
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNames : [ '일', '월', '화', '수', '목', '금',
											'토' ],
									dayNamesShort : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									showMonthAfterYear : true,
									yearSuffix : '년'
								});
						$('#pstartDate').datepicker();
						$('#pcloseDate').datepicker();
						$('#pstartDate')
								.datepicker("option", "minDate", "+30d");
						$('#pstartDate').datepicker("option", "maxDate",
								$("#pcloseDate").val());
						$('#pstartDate')
								.datepicker(
										"option",
										"onClose",
										function(selectedDate) {
											$("#pcloseDate").datepicker(
													"option", "minDate",
													selectedDate);
											var endMaxDate = new Date(
													selectedDate);
											endMaxDate.setDate(endMaxDate
													.getDate() + 60);
											var endDate = endMaxDate
													.toISOString();
											endDate = endDate.substring(0, 10);
											$("#pcloseDate").datepicker(
													"option", "maxDate",
													endDate);
											var ticketMaxDate = new Date(
													selectedDate);
											ticketMaxDate.setDate(ticketMaxDate
													.getDate() - 30);
											var ticketDate = ticketMaxDate
													.toISOString();
											ticketDate = ticketDate.substring(
													0, 10);
										});
						$("#registeTemporary")
								.on(
										"click",
										function() {
											$("#agree1Error").hide();
											$("#agree2Error").hide();
											$("#agree3Error").hide();
											$("#pposterError").hide();

											if ($(
													'input:checkbox[name="agree1"]')
													.is(":checked") == true
													&& $(
															'input:checkbox[name="agree2"]')
															.is(":checked") == true
													&& $(
															'input:checkbox[name="agree3"]')
															.is(":checked") == true) {
												$("#pagree").val(1);

												if (!$("#pposter").val() == "") {

													$("#pfirstStartTime")
															.val(
																	$(
																			"#pfirstStartTimeHour")
																			.val()
																			+ ":"
																			+ $(
																					"#pfirstStartTimeMinute")
																					.val());

													if (psecondStartTimeHour == ""
															|| $(
																	"#psecondStartTimeHour")
																	.val() == null) {

														$("#psecondStartTime")
																.val("없음");
														formObj.submit();

													} else {
														if ($(
																"#psecondStartTimeMinute")
																.val() == ""
																|| $(
																		"#psecondStartTimeMinute")
																		.val() == null) {
															alert("연극 시작 시간을 선택해주세요");
															document
																	.getElementById(
																			"psecondStartTimeMinute")
																	.focus();
														} else {
															$(
																	"#psecondStartTime")
																	.val(
																			$(
																					"#psecondStartTimeHour")
																					.val()
																					+ ":"
																					+ $(
																							"#psecondStartTimeMinute")
																							.val());
															formObj.submit();
														}

													}
												}
											} else {
												if ($(
														'input:checkbox[name="agree1"]')
														.is(":checked") == false) {
													$("#agree1Error").show();
												}
												if ($(
														'input:checkbox[name="agree2"]')
														.is(":checked") == false) {
													$("#agree2Error").show();
												}
												if ($(
														'input:checkbox[name="agree3"]')
														.is(":checked") == false) {
													$("#agree3Error").show();
												}

												if ($("#pposter").val() == "") {
													$("#pposterError").show();

												}
											}
										});
					});

	// 상연 시간 선택
	function changePFirstStartTime() {
		//1회차 입력 시
		var hour = Number($("#pfirstStartTimeHour").val());
		//1회차 입력 분
		var minute = Number($("#pfirstStartTimeMinute").val());
		//러닝타임
		var interval = Number($("#prunningTime").val());

		//러닝타임 미입력시 
		if (interval > 999 || interval == "" || interval < 0) {
			alert("정확한 연극 소요시간을 입력해주세요.");
			//러닝타임에 커서이동
			document.getElementById("prunningTime").focus();
			//1회차 시간 select를 첫번째 값으로 변경
			$("#pfirstStartTimeHour option:eq(0)").prop("selected", true);
			$("#pfirstStartTimeMinute option:eq(0)").prop("selected", true);
		}

		//2회차 선택 select를 비활성화 
		$("#psecondStartTimeHour").attr("disabled", true);
		$("#psecondStartTimeMinute").attr("disabled", true);
		//2회차 시간 select를 첫번째 값으로 변경
		$("#psecondStartTimeHour option:eq(0)").prop("selected", true);
		$("#psecondStartTimeMinute option:eq(0)").prop("selected", true);

		//1회차 입력 분의 값이 00이라면
		if (minute == "00") {
			//1회차 시간(분단위) = 1회차 입력 시 * 60
			var time = hour * 60;
		} else {
			//1회차 시간(분단위) = 1회차 입력 시 * 60 + 1회차 입력 분
			var time = hour * 60 + minute;

		}
		//1회차 시간(분단위) = 1회차 시간(분단위) + 러닝타임
		var time = time + interval;
		//2회차 선택 가능 시각 = 1회차 시간(분단위) / 60 ..소수점버림
		var secondTime = Math.floor(time / 60);
		//2회차 선택 가능 분 = (1회차 시각(분단위) /60 - 2회차 선택 가능 시각) * 60 ..소수점반올림
		var secondMinute = Math.round((time / 60 - secondTime) * 60);

		//(2회차 선택 가능 시각 >= 22 그리고 2회차 선택 가능 분) 또는 2회차 선택 가능 시각 >22 라면
		if ((secondTime >= 22 && secondMinute > 50) || secondTime > 22) {
			//2회차 상영시간 선택 select를 첫번째 값으로 변경
			$("#psecondStartTimeHour option:eq(0)").prop("selected", true);
			$("#psecondStartTimeMinute option:eq(0)").prop("selected", true);
		} else {
			//2회차 시각 select 활성화
			$("#psecondStartTimeHour").attr("disabled", false);
			//2회차 시각 select의 값을 선택할 수 있게 활성화
			$('#psecondStartTimeHour [value="10"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="11"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="12"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="13"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="14"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="15"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="16"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="17"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="18"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="19"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="20"]').prop("disabled", false);
			$('#psecondStartTimeHour [value="21"]').prop("disabled", false);

			//2회차 선택 가능 시각의 값에 따라 2회차 선택 시간 select의 값을 비활성화
			switch (secondTime) {
			case 11:
				//현재 시각보다 빠른 시간을 비활성화
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				//2회차 선택 가능 분이 50보다 높다면 2회차 선택 가능 시각과 같은 값도 비활성화
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="11"]').prop("disabled",
							true);
				}
				break;
			case 12:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="12"]').prop("disabled",
							true);
				}
				break;
			case 13:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="13"]').prop("disabled",
							true);
				}
				break;
			case 14:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="14"]').prop("disabled",
							true);
				}
				break;
			case 15:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="15"]').prop("disabled",
							true);
				}
				break;
			case 16:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="16"]').prop("disabled",
							true);
				}
				break;
			case 17:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="17"]').prop("disabled",
							true);
				}
				break;
			case 18:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="17"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="18"]').prop("disabled",
							true);
				}
				break;
			case 19:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="17"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="18"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="19"]').prop("disabled",
							true);
				}
				break;
			case 20:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="17"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="18"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="19"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="20"]').prop("disabled",
							true);
				}
				break;
			case 21:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="17"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="18"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="19"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="20"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="21"]').prop("disabled",
							true);
				}
				break;
			case 22:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="17"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="18"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="19"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="20"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="21"]').prop("disabled", true);
				if (secondMinute > 50) {
					$('#psecondStartTimeHour [value="22"]').prop("disabled",
							true);
				}
				break;
			}

		}

	};

	//2회차 상영 시간 선택
	function changePSecondStartTime() {
		//1회차 입력 시
		var hour = Number($("#pfirstStartTimeHour").val());
		//1회차 입력 분
		var minute = Number($("#pfirstStartTimeMinute").val());
		//러닝타임
		var interval = Number($("#prunningTime").val());

		//1회차 입력 분의 값이 00이라면
		if (minute == "00") {
			//1회차 시간(분단위) = 1회차 입력 시 * 60
			var time = hour * 60;
		} else {
			//1회차 시간(분단위) = 1회차 입력 시 * 60 + 1회차 입력 분
			var time = hour * 60 + minute;

		}
		//1회차 시간(분단위) = 1회차 시간(분단위) + 러닝타임
		var time = time + interval;
		//2회차 선택 가능 시각 = 1회차 시간(분단위) / 60 ..소수점버림
		var secondTime = Math.floor(time / 60);
		//2회차 선택 가능 분 = (1회차 시각(분단위) /60 - 2회차 선택 가능 시각) * 60 ..소수점반올림
		var secondMinute = Math.round((time / 60 - secondTime) * 60);

		// 2회차 선택 시각 값
		var psecondStartTimeHour = $("#psecondStartTimeHour").val();

		// !(2회차 선택 시작 값 == 없음) 이라면
		if (!(psecondStartTimeHour == "없음")) {
			//2회차 분 선택 select 활성화
			$("#psecondStartTimeMinute").attr("disabled", false);
			//2회차 분 선택 select의 값 활성화
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", false);
			$('#psecondStartTimeMinute [value="10"]').prop("disabled", false);
			$('#psecondStartTimeMinute [value="20"]').prop("disabled", false);
			$('#psecondStartTimeMinute [value="30"]').prop("disabled", false);
			$('#psecondStartTimeMinute [value="40"]').prop("disabled", false);
			$('#psecondStartTimeMinute [value="50"]').prop("disabled", false);

			// 2회차 선택 시작 값 == 10 이라면
			if (psecondStartTimeHour == "10") {

				// 2회차 선택 시작값 == 2회차 선택 가능 시각값
				if (psecondStartTimeHour == secondTime) {
					// 분 비교(2회차 선택 가능 분) 함수 호출
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "11") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "12") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "13") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "14") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "15") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "16") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "17") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "18") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "19") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "20") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "21") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			} else if (psecondStartTimeHour == "22") {

				if (psecondStartTimeHour == secondTime) {
					minuteComparison(secondMinute);
				}

			}
		} else {
			//2회차 분 선택 select 비활성화
			$("#psecondStartTimeMinute").attr("disabled", true);

		}

	};

	// m에 입력된 2회차 선택 가능 분을 비교
	function minuteComparison(m) {
		//m이 50보다 크다면 2회차 분 선택 select에서 50보다 낮은 값을 비활성화 
		if (m > 50) {
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="10"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="20"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="30"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="40"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="50"]').prop("disabled", true);
		} else if (m > 40) {
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="10"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="20"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="30"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="40"]').prop("disabled", true);
		} else if (m > 30) {
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="10"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="20"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="30"]').prop("disabled", true);
		} else if (m > 20) {
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="10"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="20"]').prop("disabled", true);
		} else if (m > 10) {
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", true);
			$('#psecondStartTimeMinute [value="10"]').prop("disabled", true);
		} else {
			$('#psecondStartTimeMinute [value="00"]').prop("disabled", true);

		}

	};
</script>


<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("ptheaterAddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("ptheaterAddress").focus();
			}
		}).open();
	}
</script>