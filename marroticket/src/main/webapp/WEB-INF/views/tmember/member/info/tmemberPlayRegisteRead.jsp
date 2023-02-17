<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>
	등록한 연극 상세보기
</h2>

<form:form modelAttribute="playVO">

	<form:hidden path="pnumber" />
	<table>
		<tr>
			<td>연극 번호</td>
			<td><form:input path="pnumber" readonly="true" /></td>
			<td><font color="red"><form:errors path="pnumber" /></font></td>
		</tr>

		<tr>
			<td>연극명</td>
			<td><form:input path="pname" readonly="true"/></td>
			<td><font color="red"><form:errors path="pname" /></font></td>
			
		</tr>
		
		<tr>
			<td>연극 시작일</td>
			<td><form:input path='pstartDate' type='date' readonly="true"/><font
				color="red"> <form:errors path="pstartDate" /></font></td>
		</tr>
		
		<tr>
			<td>연극 종료일</td>
			<td><form:input path='pcloseDate' type='date' readonly="true"/><font
				color="red"> <form:errors path="pcloseDate" /></font></td>
		</tr>
		
		<tr>
			<td>연극 소요 시간(분단위)</td>
			<td><form:input path="prunningTime" readonly="true"/></td>
			<td><font color="red"><form:errors path="prunningTime" /></font></td>
		</tr>
		
		<tr>
			<td>극장 이름</td>
			<td><form:input path="ptheaterName" readonly="true"/></td>
			<td><font color="red"><form:errors path="ptheaterName" /></font></td>
		</tr>
		
		<tr>
			<td>극장 주소</td>
			<td><form:input path="ptheaterAddress" id="ptheaterAddress" readonly="true"/>
				<font color="red"><form:errors path="ptheaterAddress" /> </font></td>
		</tr>
					
		<tr>
			<td>기획사 정보</td>
			<td><form:input path="pagency" readonly="true"/></td>
			<td><font color="red"><form:errors path="pagency" /></font></td>
		</tr>
		
		<tr>
			<td>관람 등급</td>
			<td><form:input path="pratings" readonly="true" />
					<font color="red"><form:errors path="pratings" /></font></td>
		</tr>
		
		<tr>
			<td>캐스팅</td>
			<td><form:input path="pcasting" readonly="true"/></td>
			<td><font color="red"><form:errors path="pcasting" /></font></td>
		</tr>
		
		
		<tr>
			<td>줄거리</td>
			<td><form:input path="pplot" readonly="true"/></td>
			<td><font color="red"><form:errors path="pplot" /></font></td>
		</tr>
		
		<tr>
			<td>좌석 개수</td>
			<td><form:input path="pseatNumber" readonly="true"/></td>
			<td><font color="red"><form:errors path="pseatNumber" /></font></td>
		</tr>
		
		<tr>
			<td>티켓 가격(원)</td>
			<td><form:input path="pticketPrice" readonly="true"/></td>
			<td><font color="red"><form:errors path="pticketPrice" /></font></td>
		</tr>
		
		<tr>
			<td>장르 정보</td>
			<td>
			
				<form:input path="pgenre" readonly="true" /><form:errors path="pgenre" />
			
				 
				 <%-- <c:choose>
					<c:when test="${pgenre eq '1'}">로맨스</c:when>
					<c:when test="${pgenre eq '2'}">코미디</c:when>
					<c:when test="${pgenre eq '3'}">드라마</c:when>
					<c:when test="${pgenre eq '4'}">공포</c:when>
					<c:when test="${pgenre eq '5'}">추리스릴러</c:when>
					<c:when test="${pgenre eq '6'}">판타지</c:when>
					<c:when test="${pgenre eq '7'}">시대/역사</c:when>
				</c:choose> --%>
			
			
			</td>
		</tr>
		
		<!-- 연극 포스터 미리보기 및 변경 구현하기
		<tr>
			<td>연극 포스터 미리보기 및 변경 구현하기</td>
			<td><input type="File" name="pposter" id="pposter"
				accept="image/jpeg, image/png, image/jpg" /><font color="red"
				id="pposterError"><spring:message code="registe.file.error" /></font></td>
		</tr> -->
		<!-- 
		<tr>
			<td>동의 여부</td>
			<td><form:textarea path="pagree" readonly="true" /></td>
			<td><font color="red"><form:errors path="pagree" /></font></td>
		</tr>
		 -->
		 
		 <tr>
			<td>연극 등록 승인 상태</td>
			<td><form:textarea path="pregistrationApproval" readonly="true" /></td>
			<td><font color="red"><form:errors path="pregistrationApproval" /></font></td>
		</tr>
		
		<tr>
			<td>연극 수정 승인 상태</td>
				<td><form:textarea path="pmodifyApproval" readonly="true" /></td>
			<td><font color="red"><form:errors path="pmodifyApproval" /></font></td>
		</tr>
	
		<!--
		<tr>
			 수정 신청 시 modifyApproval 변경
			<form:input path="pmodifyApproval" value="1" hidden="true" />
		</tr>	 -->	
	</table>
<%-- </form:form> --%>

<!-- 수정 등록 구현 -->
<div>
	<input type="button" value="목록으로 돌아가기" onclick="location.href='/theater/playRegisteInfo'">
</div>
</form:form>


<!-- 극단 주소 -->
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

<!-- 달력 -->
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

<%-- </form:form> --%>
<!--  -->

<!-- 
<script>
	$(document).ready(function() {

		var formObj = $("#noticeVO");

		console.log(formObj);

		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		$("#btnEdit").on("click", function() {
			var noticeNo = $("#noticeNo");
			var noticeNoVal = noticeNo.val();

			self.location = "noticeModify?noticeNo=" + noticeNoVal;
		});

		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/noticeList";
		});
	});
</script>

http://localhost:8080/theater/playRegisteRead?pNumber=5
http://localhost:8080/theater/playReigsteRead?pNumber=5
 -->