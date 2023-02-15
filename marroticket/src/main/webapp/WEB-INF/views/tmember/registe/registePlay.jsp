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
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<sec:authentication var="principal" property="principal" />
<h2>공연 등록 페이지</h2>



<form:form method="post" modelAttribute="playVO"
	action="registePlayComplete" enctype="multipart/form-data">

	<table border="1">
		<tr>
			<td>정산 관련 동의(필수)</td>
		</tr>
		<tr>
			<td>정산관련 약관 내용</td>
			<td><input type="checkbox" name="agree1" /><font color="red"
				id="agree1Error"><spring:message
						code="registe.checkbox.error" /></font></td>
		</tr>
		<tr>
			<td>연극등록 약관(필수)</td>
		</tr>
		<tr>
			<td>연극등록 약관 내용</td>
			<td><input type="checkbox" name="agree2" /><font color="red"
				id="agree2Error"><spring:message
						code="registe.checkbox.error" /></font></td>
		</tr>
		<tr>
			<td>예매 좌석 제한 관련 동의(필수)</td>
		</tr>
		<tr>
			<td>예매 좌석 제한 고지</td>
			<td><input type="checkbox" name="agree3" /><font color="red"
				id="agree3Error"><spring:message
						code="registe.checkbox.error" /></font></td>
		</tr>

		<tr>
			<td>연극명</td>
			<td><form:input path="pName" placeholder="연극명 입력칸" /><font
				color="red"><form:errors path="pName" /></font></td>
		</tr>

		<tr>
			<td>연극 시작일(현재일 시점부터 최소 30일 이후여야 합니다.)</td>
			<td><form:input path="pStartDate" id="pstartDate" /><font
				color="red"><form:errors path="pStartDate">
						<spring:message code="registe.date.error" />
					</form:errors></font></td>
		</tr>
		<tr>
			<td>연극 종료일(연극 시작일 시점부터 최대 60일까지 선택 가능합니다.)</td>
			<td><form:input path="pCloseDate" id="pcloseDate" /><font
				color="red"><form:errors path="pCloseDate">
						<spring:message code="registe.date.error" />
					</form:errors></font></td>
		</tr>

		<tr>
			<td>예매오픈 희망일(연극 시작일 시점부터 최소 30일 전이여야 합니다.)</td>
			<td><form:input path="pTicketOpenDate" id="pticketOpenDate" /><font color="red"><form:errors
						path="pTicketOpenDate">
						<spring:message code="registe.date.error" />
					</form:errors></font></td>
		</tr>

		<tr>
			<td>연극 소요시간(분단위)</td>
			<td><form:input path="pRunningTime" placeholder="연극 소요 시간 입력칸" />
				<font color="red"><form:errors path="pRunningTime" /></font></td>
		</tr>

		<tr>
			<td>극장명</td>
			<td><form:input path="pTheaterName" placeholder="극장명 입력칸" /> <font
				color="red"><form:errors path="pTheaterName" /> </font></td>
		</tr>

		<tr>
			<td>극장 주소</td>
			<td><input type="button" onclick="sample6_execDaumPostcode()"
				value="주소 찾기" /></td>
		</tr>

		<tr>
			<td><form:input path="pTheaterAddress" id="ptheaterAddress" />
				<font color="red"><form:errors path="pTheaterAddress" /> </font></td>
		</tr>
		<tr>
			<td>연극포스터</td>
			<td><input type="File" name="pPoster" id="pPoster"
				accept="image/jpeg, image/png, image/jpg" /><font color="red"
				id="pPosterError"><spring:message code="registe.file.error" /></font></td>
		</tr>

		<tr>
			<td>기획사 정보</td>
			<td><form:input path="pAgency" placeholder="기획사 정보 입력칸"
					value="마로기획" /><font color="red"><form:errors
						path="pAgency" /></font></td>
		</tr>



		<tr>
			<td>장르 정보</td>
			<td><form:select path="pGenre">
					<option value="1">로맨스극</option>
					<option value="2">코미디극</option>
					<option value="3">드라마극</option>
					<option value="4">공포극</option>
					<option value="5">추리스릴러극</option>
					<option value="6">판타지극</option>
					<option value="7">시대/역사극</option>
				</form:select><font color="red"><form:errors path="pGenre" /></font></td>
		</tr>

		<tr>
			<td>관람 등급</td>
			<td><form:select path="pRatings">
					<option value="1">전체 이용가</option>
					<option value="2">12세 이상</option>
					<option value="3">15세 이상</option>
					<option value="4">18세 이상</option>
				</form:select><font color="red"><form:errors path="pRatings" /></font></td>
		</tr>

		<tr>
			<td>티켓 가격(원)</td>
			<td><form:input type="text" path="pTicketPrice"
					placeholder="티켓 가격 입력칸" /><font color="red"><form:errors
						path="pTicketPrice" /></font></td>
		</tr>

		<tr>
			<td>캐스팅 데이터</td>
			<td><form:textarea rows="10" cols="120" path="pCasting"
					placeholder="캐스팅 정보 입력칸" /><font color="red"><form:errors
						path="pCasting" /></font></td>
		</tr>
		<tr>
			<td>연극 줄거리</td>
			<td><form:textarea rows="10" cols="120" path="pPlot"
					placeholder="연극 줄거리 입력칸" /><font color="red"><form:errors
						path="pPlot" /></font></td>
		</tr>

		<tr>
			<td>좌석 개수</td>
			<td><form:input type="text" path="pSeatNumber"
					placeholder="좌석 개수 입력칸" /><font color="red"><form:errors
						path="pSeatNumber" /></font></td>

		</tr>

		<tr>
			<td>상연 시각</td>
			<td>1회차 상연 시간 선택 <form:select path="pFirstStartTime">
					<option value="10:00">10:00</option>
					<option value="10:10">10:10</option>
					<option value="10:20">10:20</option>
					<option value="10:30">10:30</option>
					<option value="10:40">10:40</option>
					<option value="10:50">10:50</option>
					<option value="11:00">11:00</option>
					<option value="11:10">11:10</option>
					<option value="11:20">11:20</option>
					<option value="11:30">11:30</option>
					<option value="11:40">11:40</option>
					<option value="11:50">11:50</option>
					<option value="12:00">12:00</option>
					<option value="12:10">12:10</option>
					<option value="12:20">12:20</option>
					<option value="12:30">12:30</option>
					<option value="12:40">12:40</option>
					<option value="12:50">12:50</option>
					<option value="13:00">13:00</option>
					<option value="13:10">13:10</option>
					<option value="13:20">13:20</option>
					<option value="13:30">13:30</option>
					<option value="13:40">13:40</option>
					<option value="13:50">13:50</option>
					<option value="14:00">14:00</option>
					<option value="14:10">14:10</option>
					<option value="14:20">14:20</option>
					<option value="14:30">14:30</option>
					<option value="14:40">14:40</option>
					<option value="14:50">14:50</option>
					<option value="15:00">15:00</option>
					<option value="15:10">15:10</option>
					<option value="15:20">15:20</option>
					<option value="15:30">15:30</option>
					<option value="15:40">15:40</option>
					<option value="15:50">15:50</option>
					<option value="16:00">16:00</option>
					<option value="16:10">16:10</option>
					<option value="16:20">16:20</option>
					<option value="16:30">16:30</option>
					<option value="16:40">16:40</option>
					<option value="16:50">16:50</option>
					<option value="17:00">17:00</option>
					<option value="17:10">17:10</option>
					<option value="17:20">17:20</option>
					<option value="17:30">17:30</option>
					<option value="17:40">17:40</option>
					<option value="17:50">17:50</option>
					<option value="18:00">18:00</option>
					<option value="18:10">18:10</option>
					<option value="18:20">18:20</option>
					<option value="18:30">18:30</option>
					<option value="18:40">18:40</option>
					<option value="18:50">18:50</option>
					<option value="19:00">19:00</option>
					<option value="19:10">19:10</option>
					<option value="19:20">19:20</option>
					<option value="19:30">19:30</option>
					<option value="19:40">19:40</option>
					<option value="19:50">19:50</option>
					<option value="20:00">20:00</option>
					<option value="20:10">20:10</option>
					<option value="20:20">20:20</option>
					<option value="20:30">20:30</option>
					<option value="20:40">20:40</option>
					<option value="20:50">20:50</option>
					<option value="21:00">21:00</option>
					<option value="21:10">21:10</option>
					<option value="21:20">21:20</option>
					<option value="21:30">21:30</option>
					<option value="21:40">21:40</option>
					<option value="21:50">21:50</option>
					<option value="22:00">22:00</option>
				</form:select><font color="red"><form:errors path="pFirstStartTime" /></font></td>
			<td>2회차 상영시간 선택 <form:select path="pSecondStartTime">
					<option value="없음">없음</option>
					<option value="10:00">10:00</option>
					<option value="10:10">10:10</option>
					<option value="10:20">10:20</option>
					<option value="10:30">10:30</option>
					<option value="10:40">10:40</option>
					<option value="10:50">10:50</option>
					<option value="11:00">11:00</option>
					<option value="11:10">11:10</option>
					<option value="11:20">11:20</option>
					<option value="11:30">11:30</option>
					<option value="11:40">11:40</option>
					<option value="11:50">11:50</option>
					<option value="12:00">12:00</option>
					<option value="12:10">12:10</option>
					<option value="12:20">12:20</option>
					<option value="12:30">12:30</option>
					<option value="12:40">12:40</option>
					<option value="12:50">12:50</option>
					<option value="13:00">13:00</option>
					<option value="13:10">13:10</option>
					<option value="13:20">13:20</option>
					<option value="13:30">13:30</option>
					<option value="13:40">13:40</option>
					<option value="13:50">13:50</option>
					<option value="14:00">14:00</option>
					<option value="14:10">14:10</option>
					<option value="14:20">14:20</option>
					<option value="14:30">14:30</option>
					<option value="14:40">14:40</option>
					<option value="14:50">14:50</option>
					<option value="15:00">15:00</option>
					<option value="15:10">15:10</option>
					<option value="15:20">15:20</option>
					<option value="15:30">15:30</option>
					<option value="15:40">15:40</option>
					<option value="15:50">15:50</option>
					<option value="16:00">16:00</option>
					<option value="16:10">16:10</option>
					<option value="16:20">16:20</option>
					<option value="16:30">16:30</option>
					<option value="16:40">16:40</option>
					<option value="16:50">16:50</option>
					<option value="17:00">17:00</option>
					<option value="17:10">17:10</option>
					<option value="17:20">17:20</option>
					<option value="17:30">17:30</option>
					<option value="17:40">17:40</option>
					<option value="17:50">17:50</option>
					<option value="18:00">18:00</option>
					<option value="18:10">18:10</option>
					<option value="18:20">18:20</option>
					<option value="18:30">18:30</option>
					<option value="18:40">18:40</option>
					<option value="18:50">18:50</option>
					<option value="19:00">19:00</option>
					<option value="19:10">19:10</option>
					<option value="19:20">19:20</option>
					<option value="19:30">19:30</option>
					<option value="19:40">19:40</option>
					<option value="19:50">19:50</option>
					<option value="20:00">20:00</option>
					<option value="20:10">20:10</option>
					<option value="20:20">20:20</option>
					<option value="20:30">20:30</option>
					<option value="20:40">20:40</option>
					<option value="20:50">20:50</option>
					<option value="21:00">21:00</option>
					<option value="21:10">21:10</option>
					<option value="21:20">21:20</option>
					<option value="21:30">21:30</option>
					<option value="21:40">21:40</option>
					<option value="21:50">21:50</option>
					<option value="22:00">22:00</option>
				</form:select></td>
		</tr>

		<tr>
			<form:input path="pRegistrationApproval" value="0" hidden="true" />
			<form:input path="pModifyApproval" value="0" hidden="true" />
			<form:input path="pAgree" id="pagee" value="1" hidden="true" />
			<form:input path="tId" hidden="true" value="${principal.tId }" />
		</tr>
	</table>
</form:form>
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
						$("#pticketOpenDate").datepicker();
						$("#pticketOpenDate")
								.datepicker("option", "minDate", 0);
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
											$("#pticketOpenDate").datepicker(
													"option", "minDate", 0);
											$("#pticketOpenDate").datepicker(
													"option", "maxDate",
													ticketDate);
										});
						$("#agree1Error").hide();
						$("#agree2Error").hide();
						$("#agree3Error").hide();
						$("#pPosterError").hide();
						$("#registeTemporary")
								.on(
										"click",
										function() {
											if ($(
													'input:checkbox[name="agree1"]')
													.is(":checked") == true
													&& $(
															'input:checkbox[name="agree2"]')
															.is(":checked") == true
													&& $(
															'input:checkbox[name="agree3"]')
															.is(":checked") == true) {
												$("pagree").val(1);
												if ( !($("#pPoster")
																.val() == "" && $(
																"#pPoster")
																.val() == null)) {
													formObj.submit();
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
												
												if ($("#pPoster").val() == "") {
													$("#pPosterError").show();
												}
											}
										});
					});
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