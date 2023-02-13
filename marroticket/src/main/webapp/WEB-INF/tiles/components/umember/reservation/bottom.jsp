<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="reserveInfo" method='post'>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="rtotalpayment"/>
	<input type="hidden" name="rticketcount"/>
	<input type="hidden" name="rticketFirst"/>
	<input type="hidden" name="rticketSecond"/>
	<input type="hidden" name="rticketThird"/>
	<input type="hidden" name="rticketFourth"/>
</form>