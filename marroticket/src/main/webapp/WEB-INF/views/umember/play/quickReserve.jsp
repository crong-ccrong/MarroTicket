<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 빠른 예매 페이지 -->
<h2>빠른 예매</h2>
<table>
	<tr>
		<td align="center"><label id="prev"> ◀ </label></td>
		<td colspan="5" align="center"><button id="selectDate">날짜 선택</button></td>
		<td align="center"><label id="next"> ▶ </label></td>
	</tr>
</table>
<div id="view">
	<table border="1" id="content">
		<c:choose>
			<c:when test="${empty quickReserve }">
				<tr>
					<td><h3>상연 예정 연극이 없습니다.</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<c:forEach items="${quickReserve}" var="list" varStatus="status">
						<td><table>
								<tr>
									<td>연극명 : ${list.pname }<br>회차 / 시간 :
										1회차/${list.pfirstStartTime } / 2회차/${list.psecondStartTime }
									</td>
								</tr>
							</table></td>

					</c:forEach>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>

<script>
	$(document)
			.ready(
					function() {

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

						$('#selectDate').datepicker("option","minDate","0");
						$('#selectDate').datepicker("option","maxDate","0");
						
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
						$("#ptheaterMapError").hide();
						$("#pposterError").hide();

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

												if (!($("#ptheaterMap").val() == "" && $(
														"#ptheaterMap").val() == null)
														&& !($("#pposter")
																.val() == "" && $(
																"#pposter")
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
												if ($("#ptheaterMap").val() == "") {
													$("#ptheaterMapError")
															.show();

												}
												if ($("#pposter").val() == "") {
													$("#pposterError").show();

												}

											}

										});

					});
</script>

<script>
	$(document).ready(
			function() {

				var today = new Date();
				currentDate.innerHTML = today.getFullYear() + "-"
						+ (today.getMonth() + 1) + "-" + today.getDate();
				var selectDate = today.getFullYear() + "-"
						+ (today.getMonth() + 1) + "-" + today.getDate();
				
				
				
				$("#currentDate")
						.on(
								"click",
								function() {
									var header = $("meta[name='_csrf_header']")
											.attr("content");

									$("#currentDate").val(selectDate);
									var jsonData = {
									}


				$("#prev").on(
						"click",
						function() {
							today.setDate(today.getDate() - 1);
							currentDate.innerHTML = today.getFullYear() + "-"
									+ (today.getMonth() + 1) + "-"
									+ today.getDate();
						});

				$("#next").on(
						"click",
						function() {
							today.setDate(today.getDate() + 1);
							currentDate.innerHTML = today.getFullYear() + "-"
									+ (today.getMonth() + 1) + "-"
									+ today.getDate();
						});

			});
</script>
