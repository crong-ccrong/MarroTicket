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

<sec:authentication var="principal" property="principal" />
<h2>공연 등록 페이지</h2>



<form:form method="post" modelAttribute="playVO"
	action="/theater/registePlayComplete" enctype="multipart/form-data">

	<table border="1">
		<tr>
			<td>정산 관련 동의(필수)</td>
		</tr>
		<tr>
			<td>정산관련 약관 내용</td>
			<td><input type="checkbox" name="agree1" /><font color="red"
				id="agree1Error" hidden="true"><spring:message
						code="registe.checkbox.error" /></font></td>
		</tr>
		<tr>
			<td>연극등록 약관(필수)</td>
		</tr>
		<tr>
			<td>연극등록 약관 내용</td>
			<td><input type="checkbox" name="agree2" /><font color="red"
				id="agree2Error" hidden="true"><spring:message
						code="registe.checkbox.error" /></font></td>
		</tr>
		<tr>
			<td>예매 좌석 제한 관련 동의(필수)</td>
		</tr>
		<tr>
			<td>예매 좌석 제한 고지</td>
			<td><input type="checkbox" name="agree3" /><font color="red"
				id="agree3Error" hidden="true"><spring:message
						code="registe.checkbox.error" /></font></td>
		</tr>

		<tr>
			<td>연극명</td>
			<td><form:input path="pname" placeholder="연극명 입력칸" /><font
				color="red"><form:errors path="pname" /></font></td>
		</tr>

		<tr>
			<td>연극 시작일(현재일 시점부터 최소 30일 이후여야 합니다.)</td>
			<td><form:input path="pstartDate" id="pstartDate"
					readonly="true" /><font color="red"><form:errors
						path="pstartDate">
						<spring:message code="registe.date.error" />
					</form:errors></font></td>
		</tr>
		<tr>
			<td>연극 종료일(연극 시작일 시점부터 최대 60일까지 선택 가능합니다.)</td>
			<td><form:input path="pcloseDate" id="pcloseDate"
					readonly="true" /><font color="red"><form:errors
						path="pcloseDate">
						<spring:message code="registe.date.error" />
					</form:errors></font></td>
		</tr>

		<tr>
			<td>예매오픈 희망일(연극 시작일 시점부터 최소 30일 전이여야 합니다.)</td>
			<td><form:input path="pticketOpenDate" id="pticketOpenDate"
					readonly="true" /><font color="red"><form:errors
						path="pticketOpenDate">
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
			<td><form:input path="ptheaterAddress" id="ptheaterAddress" />
				<font color="red"><form:errors path="ptheaterAddress" /> </font></td>
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
			<td><form:textarea rows="10" cols="120" path="pcasting"
					placeholder="캐스팅 정보 입력칸" /><font color="red"><form:errors
						path="pcasting" /></font></td>
		</tr>
		<tr>
			<td>연극 줄거리</td>
			<td><form:textarea rows="10" cols="120" path="pplot"
					placeholder="연극 줄거리 입력칸" /><font color="red"><form:errors
						path="pplot" /></font></td>
		</tr>

		<tr>
			<td>좌석 개수</td>
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
			</select>: <select id="pfirstStartTimeMinute" onchange="changePFirstStartTime()">
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
			</select> <form:input path="pfirstStartTime" id="pfirstStartTime"
					hidden="true" /><font color="red"><form:errors
						path="pfirstStartTime" /></font></td>

			<td>2회차 상연 시간 선택 <select id="psecondStartTimeHour"
				onchange="changePSecondStartTime()" disabled="disabled">
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
						path="psecondStartTime" /></font></td>

		</tr>

		<tr>
			<form:input path="pregistrationApproval" value="0" hidden="true" />
			<form:input path="pmodifyApproval" hidden="true" />
			<form:input path="pagree" id="pagree" hidden="true" />
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
													
													$("#pfirstStartTime").val(
																	$("#pfirstStartTimeHour").val()
																			+ ":"
																			+ $("#pfirstStartTimeMinute").val());
													
													if (psecondStartTimeHour == "" || $("#psecondStartTimeHour").val() == null ) {
														
															$("#psecondStartTime").val("없음");
															formObj.submit();
														
														
													} else {
														if ($("#psecondStartTimeMinute").val() == "" || $("#psecondStartTimeMinute").val() == null ) {
															alert("2회차 시작 시간을 정확히 선택해주세요");
															 document.getElementById("psecondStartTimeMinute").focus();
														} else{
															$("#psecondStartTime").val(
																	$("#psecondStartTimeHour").val()
																			+ ":"
																			+ $("#psecondStartTimeMinute").val());
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
		if (interval > 999 || interval == ""|| interval < 0) {
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
		var secondMinute = Math.round((time/60 - secondTime)*60);
		
	 	//(2회차 선택 가능 시각 >= 22 그리고 2회차 선택 가능 분) 또는 2회차 선택 가능 시각 >22 라면
		if ((secondTime >= 22 && secondMinute > 50) || secondTime > 22)  {
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				}
				break;
			case 12:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				}
				break;
			case 13:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				}
				break;
			case 14:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				}
				break;
			case 15:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				}
				break;
			case 16:
				$('#psecondStartTimeHour [value="10"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="11"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="12"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="13"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="14"]').prop("disabled", true);
				$('#psecondStartTimeHour [value="15"]').prop("disabled", true);
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="16"]').prop("disabled", true);
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="17"]').prop("disabled", true);
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="18"]').prop("disabled", true);
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="19"]').prop("disabled", true);
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="20"]').prop("disabled", true);
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="21"]').prop("disabled", true);
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
				if(secondMinute > 50){
					$('#psecondStartTimeHour [value="22"]').prop("disabled", true);
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
		var secondMinute = Math.round((time/60 - secondTime)*60);
		
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
			if(psecondStartTimeHour == "10"){
				
				// 2회차 선택 시작값 == 2회차 선택 가능 시각값
				if(psecondStartTimeHour == secondTime){
					// 분 비교(2회차 선택 가능 분) 함수 호출
					minuteComparison(secondMinute);
					}
				
			} else if(psecondStartTimeHour == "11"){
				
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
				
			} else if(psecondStartTimeHour == "12"){

				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
				
			} else if(psecondStartTimeHour == "13"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			} else if(psecondStartTimeHour == "14"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			} else if(psecondStartTimeHour == "15"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			} else if(psecondStartTimeHour == "16"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			}else if(psecondStartTimeHour == "17"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			}else if(psecondStartTimeHour == "18"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			}else if(psecondStartTimeHour == "19"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			}else if(psecondStartTimeHour == "20"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			}else if(psecondStartTimeHour == "21"){
			
				if(psecondStartTimeHour == secondTime){
					minuteComparison(secondMinute);
					}
			
			}else if(psecondStartTimeHour == "22"){
			
				if(psecondStartTimeHour == secondTime){
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
		if(m > 50){
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