<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- body -->
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
<br>
<h3><span style='display:inline-block'><strong style="color: blue; font-size: 23px">${reservation.uname }</strong>님의&nbsp;&nbsp;예매확인</span><button class="snip1535" id="home_btn" >예매확인하기</button></h3>
<hr><br>
<div class="reserve_step3" style="clear:both">
	<div class="title_box" style="padding-top: 10px">
		<h4 style="margin: 0; margin-bottom: 10px; font-size: 18px">예매정보</h4>
	</div>
	<div class="white_box">
		<table class="table2 table2_v2">
			<caption>예매정보</caption>
			<colgroup>
				<col style="width: 130px; border-right: 1px solid #ecedf2;"
					align="center">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th fbold">예매번호</th>
					<td class="ng-binding">${ reservation.rnumber }</td>
				</tr>
				<tr>
					<th scope="row" class="th fbold">예매일</th>
					<td class="ng-binding"><fmt:formatDate pattern="YYYY-MM-dd (E)" value="${ reservation.rdate}" /></td>
				</tr>
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
<div class="reserve_step3 mgt0">
	<div class="title_box">
		<h4 class="title title_txt" style="margin-top: 16px; margin-bottom: 10px;  font-size: 18px">
			티켓확인
		</h4>
	</div>
	<div class="white_box choice_delivery">
		<table class="table2">
			<caption>티켓확인</caption>
			<colgroup>
				<col
					style="width: 130px; border-right: 1px solid #ecedf2;; margin: 0 auto"
					align="center">
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
					<th class="th fbold">티켓 개수</th>
					<td>${reservation.rticketcount }장</td>
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
		<li class="ng-scope" style="font-size:15px">티켓번호는 모바일티켓에서 확인하실 수 있습니다. 예매자는 관람일 당일 현장에서 모바일티켓에 기재된 티켓번호 확인 및 본인 확인(신분증) 후 입장할
			수 있습니다.</li>
	</ul>
</div>
<div class="reserve_step3">
	<div class="title_box" style="padding-top: 10px">
		<h4  style="margin-top: 25px; margin-bottom: 10px;  font-size: 18px">공연 정보</h4>
	</div>
	<div class="white_box">
		<table class="table2 table2_v2">
			<caption>공연 정보</caption>
			<colgroup>
				<col style="width: 130px; border-right: 1px solid #ecedf2;"
					align="center">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th fbold">공연명</th>
					<td class="ng-binding">${ reservation.pname }</td>
				</tr>
				<tr>
					<th scope="row" class="th fbold">공연 회차/날짜</th>
					<td>${reservation.pturn }회차 / 
						<c:choose>
							<c:when test="${reservation.pturn ==1}">
								${reservation.pfirstStartTime }
							</c:when>
							<c:when test="${reservation.pturn ==2}">
								${reservation.psecondStartTime }
							</c:when>
						</c:choose>	
					</td>
				</tr>
				<tr>
					<th scope="row" class="th fbold">극장정보</th>
					<td>${ reservation.ptheaterName }</td>
				</tr>
				<tr>
					<th scope="row" class="th fbold">공연장소</th>
					<td class="ng-binding">${reservation.ptheaterAddress }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br><br><hr><br><br>
</div>
<!-- script -->
<script>
	//csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	//css변경
	$('.step3').css({
		'left' : '0',
		'top' : '0',
		'z-index' : '1',
		'width' : '198px',
		'height' : '45px',
		'background-color' : 'black',
		'border-width' : '0'
	});
	$('.reserve_left').css({
		'width' : '950px'
	});
	
	//home_btn
	$(".hover").mouseleave(
	  function() {
	    $(this).removeClass("hover");
	  }
	);
	//click
	$("#home_btn").on("click", function(){
		location.href="/umember/umemberReserveInfo";
	});
</script>