<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="umemberSidebar.jsp"%>



<h1>예매 정보</h1>
<hr>

<div class="info_body">
	<table border="1">
		<tr>
			<th>예매일</th>
			<th>예매 번호</th>
			<th>티켓 번호</th>
			<th>상품명</th>
			<th>관람일시</th>
			<th>매수</th>
			<th>결제총액</th>
			<th>디지털 티켓</th>
			<th>예매 취소</th> 
		</tr>
		<c:forEach var="reservation" items="${reservationList}">
			<c:if test="${reservation.rcancelState == 0}">
			
				<tr>
					<td><fmt:formatDate pattern="YYYY-MM-dd" value="${reservation.rdate}" /></td>
					<td>${reservation.rnumber}<input type="hidden" name="rnumber" value="${reservation.rnumber}" /></td>
					<td>${reservation.rticketFirst}<br>
					${reservation.rticketSecond}<br>
						${reservation.rticketThird}<br>
						${reservation.rticketFourth}</td>
														<!-- 좌석에 대한 변수 설정 -->
								<c:set var = "firstT" value="${reservation.rticketFirst }"/>
								<c:set var = "firstTlength" value = "${fn:length(firstT)}"/>
								<c:set var = "firstTRow" value = "${fn:substring(firstT, firstTlength -2, firstTlength -1)}" />
								<c:set var = "firstTLine" value = "${fn:substring(firstT, firstTlength -1, firstTlength)}" />
								<c:if test="${ not empty reservation.rticketSecond }">
								   <c:set var = "secondT" value="${reservation.rticketSecond }"/>
								   <c:set var = "secondTlength" value = "${fn:length(secondT)}"/>
								   <c:set var = "secondTRow" value = "${fn:substring(secondT, secondTlength -2, secondTlength -1)}" />
								   <c:set var = "secondTLine" value = "${fn:substring(secondT, secondTlength -1, secondTlength)}" />
								</c:if>   
								<c:if test="${ not empty reservation.rticketThird }">
								   <c:set var = "thirdT" value="${reservation.rticketThird }"/>
								   <c:set var = "thirdTlength" value = "${fn:length(thirdT)}"/>
								   <c:set var = "thirdTRow" value = "${fn:substring(thirdT, thirdTlength -2, thirdTlength -1)}" />
								   <c:set var = "thirdTLine" value = "${fn:substring(thirdT, thirdTlength -1, thirdTlength)}" />
								</c:if>
								<c:if test="${ not empty reservation.rticketFourth }">
								   <c:set var = "fourthT" value="${reservation.rticketFourth }"/>
								   <c:set var = "fourthTlength" value = "${fn:length(fourthT)}"/>
								   <c:set var = "fourthTRow" value = "${fn:substring(fourthT, fourthTlength -2, fourthTlength -1)}" />
								   <c:set var = "fourthTLine" value = "${fn:substring(fourthT, fourthTlength -1, fourthTlength)}" />
								</c:if>
					<td>${reservation.pname}</td>
					<td><fmt:parseDate var="reservationDate" value="${reservation.pdate}" pattern="yyyy-MM-dd HH:mm:ss" /> 
					<fmt:formatDate value="${reservationDate}" pattern="yyyy-MM-dd" />
					</td>
					<td>${reservation.rticketcount}</td>
					<td>${reservation.rtotalpayment}</td>
					<td>		
					<a class="button" onclick="openPopup(${reservation.rnumber},'${reservation.pname}' ,'${reservation.ptheaterName}', '${reservation.pdate}',
					${reservation.rticketcount},${reservation.rtotalpayment}, '${firstTRow}' ,'${firstTLine}' ,'${secondTRow}' ,'${secondTLine}' ,
					'${thirdTRow}' ,'${thirdTLine}' ,'${fourthTRow}' ,'${fourthTLine}' ,'${firstT}','${secondT}','${thirdT}','${fourthT}')">보기</a> 
					</td>
					 <td>
                <c:if test="${reservationDate > reservation.rcancelDeadline}">
                    <a class="button" onclick="confirmCancellation(${reservation.rnumber})">취소</a>
                </c:if>
                <c:if test="${reservationDate <= reservation.rcancelDeadline}">
                    <a class="button2" disabled="disabled">취소 불가</a>
                </c:if>
            </td>
				</tr>
			</c:if>
		</c:forEach>
	

	</table>
</div>

<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
function generateQRCode(value) {
	  var chartUrl = "https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=" + encodeURIComponent(value);
	  return chartUrl;
	}

</script>


<script>
function openPopup(rnumber, pname, ptheaterName, reservationDate, rticketcount, rtotalpayment,
		firstTRow ,firstTLine , secondTRow ,secondTLine , thirdTRow ,thirdTLine ,fourthTRow,fourthTLine,firstT,secondT,thirdT,fourthT) {
    var popup = window.open('', '_blank', 'width=400,height=400');
    
    popup.document.write('<h1>디지털 티켓</h1>');
    popup.document.write('<p>예매 번호 : ' + rnumber + '</p>');
    popup.document.write('<p>상품명 : ' + pname + '</p>');
    popup.document.write('<p>극장명 : ' + ptheaterName + '</p>');
    //한국 날짜 형식으로 저장- year: 'numeric 연도 숫자 포함하도록 지정 / month: '2-digit 2자리의 월 숫자 포함 / day: '2-digit' 2자리의  일 숫자 포함
    popup.document.write('<p>이용일 : ' + new Date(reservationDate).toLocaleDateString('ko-KR', {year: 'numeric', month: '2-digit', day: '2-digit'}) + '</p>'); 
    popup.document.write('<p>티켓 매수 : ' + rticketcount + '</p>');
    popup.document.write('<p>결제 총 금액 : ' + rtotalpayment + '</p>');
    popup.document.write('<p>티켓 번호 : ' + firstT +'<br>' +secondT +'<br>' +thirdT +'<br>' +fourthT +'<br>' +'</p>');
    var seat= '<p>좌석 번호 : '+ firstTRow + ' 열 ' + firstTLine + ' 좌석';
    if (secondTRow != null && secondTRow.length != 0) {
        seat += '<br>' + secondTRow + ' 열 ' + secondTLine + ' 좌석';
    }
    if (thirdTRow != null && thirdTRow.length != 0) {
        seat+= '<br>' + thirdTRow + ' 열 ' + thirdTLine + ' 좌석';
    }
    if (fourthTRow != null && fourthTRow.length != 0) {
        seat += '<br>' + fourthTRow + ' 열 ' + fourthTLine + ' 좌석';
    }
    seat += '</p>';
    
    popup.document.write(seat);
    
    var qrCodeUrl = generateQRCode(rnumber+pname+ptheaterName+reservationDate+rticketcount);
    popup.document.write('<img src="' + qrCodeUrl + '">');
}
</script>



<script>
function confirmCancellation(rnumber) {
  if (window.confirm("예매를 취소하시겠습니까?")) {
    window.location.href = "cancelReservation/" + rnumber;
  }
}
</script>

<style>
.info_body {
	width: 80%;
	float: right;
	padding: 10px;
}

a.button {
	padding: 10px 20px;
	background-color: silver;
	color: black;
	border-radius: 5px;
	text-decoration: none;
}

.footer {
	clear: both;
}
</style>
