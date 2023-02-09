<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<table id="seatsTable"></table>
<br>
<input type="submit" value="Submit" id="submitButton">
<script>
	$(document)
			.ready(
					function() {
						let enteredNumber = 90;
						var selectedSeats = [];
						var seats = [];

						for (let i = 1; i <= enteredNumber; i++) {
							seats.push(i);
						}

						/* [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
						      13, 14, 15, 16, 17, 18, 19, 20 ]; */
						var seatsPerRow = 6;
						var numRows = Math.ceil(seats.length / seatsPerRow);
						var letter = "a".charCodeAt(0);

						for (var i = 0; i < numRows; i++) {
							var row = $("<tr></tr>");
							for (var j = 0; j < seatsPerRow; j++) {
								var seatNum = seats[i * seatsPerRow + j];
								if (typeof seatNum === "undefined") {
									break;
								}
								var value = String.fromCharCode(letter + i) + j;
								var date = new Date();
								var seatName = date.toLocaleDateString() + "_"
										+ (seatNum + 1);
								/* var seatId = "표현언어"; */

								var seat = '';
								seat = $("<td><input type='checkbox' class='seat' name='" + seatName + "' value='" + value + "'></td>");
								/*
								
								if ( seatId == seatName ) {
								seat = $("<td><input type='checkbox' class= 'seat' id='"+seatId+"' name='" + seatName + "' value='" + value + "' disabled></td>");
								} else{
								seat = $("<td><input type='checkbox' class= 'seat' id='"+seatId+"' name='" + seatName + "' value='" + value + "'></td>");
								} */

								row.append(seat);
							}
							$("#seatsTable").append(row);
						}

						$(".seat")
								.click(
										function() {
											var $checkbox = $(this);
											if ($(".seat:checked").length >= 4) {
												$(".seat:not(:checked)").attr(
														"disabled", true);
											} else {
												$(".seat").attr("disabled",
														false);
											}
											// ajax 통신을 위한 csrf 설정
											var token = $("meta[name='_csrf']")
													.attr("content");
											var header = $(
													"meta[name='_csrf_header']")
													.attr("content");
											$(document).ajaxSend(
													function(e, xhr, options) {
														xhr.setRequestHeader(
																header, token);
													});
											$
													.ajax({
														type : "POST",
														url : "/reserve/checkSeatAvailability",
														data : {
															"seatName" : seatName,
															"value" : value
														},
														success : function(
																response) {
															console
																	.log(response);
															if (response) {
																alert("This seat is already reserved");
															} else {
																// Your code to reserve the seat
															}
														}
													});
										});

						$("#submitButton").click(function() {
							$(".seat:checked").each(function() {
								console.log($(this).attr("name"));
								console.log($(this).val());
								selectedSeats.push({
									name : $(this).attr("name"),
									value : $(this).val()
								});
							});
							// send selectedSeats to the controller
							// ...
						});
					});
</script>
</script>