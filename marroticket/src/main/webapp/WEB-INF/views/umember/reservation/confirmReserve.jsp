<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 좌석에 대한 변수 설정 -->
<c:set var="firstT" value="${reservation.rticketFirst }" />
<c:set var="firstTlength" value="${fn:length(firstT)}" />
<c:set var="firstTRow"
	value="${fn:substring(firstT, firstTlength -2, firstTlength -1)}" />
<c:set var="firstTLine"
	value="${fn:substring(firstT, firstTlength -1, firstTlength)}" />
<c:if test="${ not empty reservation.rticketSecond }">
	<c:set var="secondT" value="${reservation.rticketSecond }" />
	<c:set var="secondTlength" value="${fn:length(secondT)}" />
	<c:set var="secondTRow"
		value="${fn:substring(secondT, secondTlength -2, secondTlength -1)}" />
	<c:set var="secondTLine"
		value="${fn:substring(secondT, secondTlength -1, secondTlength)}" />
</c:if>
<c:if test="${ not empty reservation.rticketThird }">
	<c:set var="thirdT" value="${reservation.rticketThird }" />
	<c:set var="thirdTlength" value="${fn:length(thirdT)}" />
	<c:set var="thirdTRow"
		value="${fn:substring(thirdT, thirdTlength -2, thirdTlength -1)}" />
	<c:set var="thirdTLine"
		value="${fn:substring(thirdT, thirdTlength -1, thirdTlength)}" />
</c:if>
<c:if test="${ not empty reservation.rticketFourth }">
	<c:set var="fourthT" value="${reservation.rticketFourth }" />
	<c:set var="fourthTlength" value="${fn:length(fourthT)}" />
	<c:set var="fourthTRow"
		value="${fn:substring(fourthT, fourthTlength -2, fourthTlength -1)}" />
	<c:set var="fourthTLine"
		value="${fn:substring(fourthT, fourthTlength -1, fourthTlength)}" />
</c:if>
<!-- body시작 -->
<div class="reserve_step3 mgt0">
	<div class="title_box">
		<h4 class="title title_txt" style="margin: 0; margin-bottom: 10px">티켓확인</h4>
	</div>
	<div class="white_box choice_delivery">
		<table class="table2">
			<caption>티켓확인</caption>
			<colgroup>
				<col style="width: 120px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th class="th fbold">티켓</th>
					<td>
						<div class="radio_group">
							<span ng-repeat="delivery in deliveryList" class="ng-scope">
								<span class="radio_box_type checked"> <input type="radio"
									name="d_method" id="d_method_0"
									class="ng-pristine ng-untouched ng-valid ng-not-empty"
									value="SITE"> <label for="d_method_0"
									class="ng-binding">모바일 티켓으로 입장하실 수 있습니다.</label>
							</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th class="th fbold">선택좌석</th>
					<td>[${firstTRow }열 ${firstTLine }좌석] <c:if
							test="${ not empty reservation.rticketSecond }">, [${secondTRow }열 ${secondTLine }좌석]</c:if>
						<c:if test="${ not empty reservation.rticketThird }">, [${thirdTRow }열 ${thirdTLine }좌석]</c:if>
						<c:if test="${ not empty reservation.rticketFourth }">, [${fourthTRow }열 ${fourthTLine }좌석]</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="notice_box">
	<ul class="notice ng-scope">
		<li class="ng-scope">티켓은 관람일 당일 현장에서 티켓번호 및 본인 확인 후 모바일 티켓으로 입장할
			수 있습니다.</li>
	</ul>
</div>
<div class="reserve_step3">
	<div class="title_box" style="padding-top: 10px">
		<h4>주문자 정보</h4>
	</div>
	<div class="white_box">
		<table class="table2 table2_v2">
			<caption>주문자 정보</caption>
			<colgroup>
				<col style="width: 86px;">
				<col>
				<col style="width: 100px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th fbold">이름 <span class="color_point">*</span></th>
					<td class="ng-binding">${ reservation.uname }</td>
					<th scope="row" class="th fbold">휴대폰<br>번호 <span
						class="color_point">*</span></th>
					<td>
						<div class="input_block">
							<input type='text' class="input" style="width: 180px"
								maxlength="11" title="휴대폰 번호"
								value="${ reservation.uphonenumber }" readonly />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th fbold">이메일</th>
					<td colspan="3">
						<div class="input_block">
							<input type='text' name="reserveEmail" class="input"
								style="width: 517px" title="이메일" value="${ reservation.uemail }"
								readonly />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="reserve_step3">
	<div class="title_box" style="padding-top: 10px">
		<h4>결제 정보</h4>
	</div>
	<div class="white_box">
		<table class="table2 table2_v2">
			<caption>결제 정보</caption>
			<colgroup>
				<col style="width: 120px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th fbold" style="height: 50px">결제방식</th>
					<td class="ng-binding" style="color: black;"><strong
						style="display: inline-block; border: 1px solid black; padding: 5px">카드
							결제</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="reserve_step3 customer_check">
	<div class="title_box">
		<h4>예매자 확인</h4>
	</div>
	<ul class="input_block_lst" style="padding-inline-start: 0">
		<li><label for="agree_phone">주문자 확인 및 예매처리를 위해 휴대폰번호,
				이메일을 확인하며<br>이용목적 달성 이후 파기합니다.
		</label></li>
		<li><label for="reserve_agree2">개인정보 제 3자 제공에 동의합니다.
				(고객응대 및 관람정보안내 등을 위함)</label><label for="reserve_agree"
			style="margin-left: 14%; font-size: 15px; font-weight: bold; color: red;">동의</label>&nbsp;&nbsp;<input
			style="accent-color: red; zoom: 1.5;" type='checkbox'
			id='reserve_agree' name='reserve_agree' /> <a></a></li>
	</ul>
</div>
<form method="post" id="reserve_detail">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<script>
$(document)
.ready(
	function() {
		//csrf
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});

		//css변경
		$('.step2').css({
			'left': '0',
			'top': '0',
			'z-index': '1',
			'width': '198px',
			'height': '45px',
			'background-color': 'black',
			'border-width': '0',
			'padding-left' :'30px',
			'padding-right': '30px'
		});

		//총 결제 금액 변경
		var rtotalpayment = ${ reservation.rtotalpayment };
		var rticketcount = ${ reservation.rticketcount };
		$("#_price_count").empty().html(rticketcount + '개');
		$("#_price_amount").empty().html(rtotalpayment + '원');

		//다음단계를 클릭했을 때
		$('#reserveNext').click(function() {
			if (!$('#reserve_agree').prop('checked')) { //예매자 동의를 안했을 경우
				alert('예매자 확인에 동의해주세요');
				$('#reserve_agree').focus();
				return false;
			}
			if (confirm("티켓 구매를 확정하시겠습니까?")) {
	            $.ajax({ // 티켓 등록
	                type: "POST",
	                url: "/reserve/completeReserve",
	                success: function(response) {
	                   console.log(response);
	                   if (response=='complete') {
	       				alert('티켓구매 완료!');
	       				//location.href="/reserve/reservationDetails"
	       				$("#reserve_detail").attr("action", "/reserve/reservationDetails");
	    				$("#reserve_detail").submit(); 
	                   }
	                }
	             });
			}
		});
	});
</script>