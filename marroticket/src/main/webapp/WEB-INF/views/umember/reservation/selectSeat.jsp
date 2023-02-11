<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<h1 style="color: white; text-align: center; margin-top: 20%">STAGE</h1>

<table id="seatsTable"></table>
<script>
$(document)
.ready(
	function() {
		$('#reservePre').attr("disabled", true);
		$('#reservePre').css({
			'cursor': 'default'
		});
		$('.step1').css({
			'left': '0',
			'top': '0',
			'z-index': '1',
			'width': '198px',
			'height': '45px',
			'background-color': 'black',
			'border-width': '0'
		});

		
		let enteredNumber = ${reservation.pseatNumber}; // 극단이 입력한 극장의 좌석수
		var selectedSeats = []; //나중에 checkbox로 선택된 좌석을 담을 변수
		var seats = [];
		var reserveSeats = ${reserveSeat};
		for (var i = 0; i < reserveSeats.length; i++) { //예매된 좌석 확인
			console.log("예매된 좌석 : "+reserveSeats);
		}

		for (let i = 1; i <= enteredNumber; i++) {
		  seats.push(i); // 극장의 좌석 수만큼 빈 셀 생성
		}
		var seatsPerRow = 10; // 한 열은 10개가 max
		var numRows = Math.ceil(seats.length / seatsPerRow); //10개를 중심으로 행도 계산
		var letter = "a".charCodeAt(0); //행의 구분은 알파벳 순

		for (var i = 0; i < numRows; i++) { //테이블 동적 생성
		  var row = $("<tr></tr>");
		  for (var j = 0; j < seatsPerRow; j++) {
		    var seatNum = seats[i * seatsPerRow + j];
		    if (typeof seatNum === "undefined") {
		      break; 
		    }
		    var value = String.fromCharCode(letter + i) + (j + 1); // 좌석명 생성
		    //티켓번호 생성
            var date = ${reservation.pdate};
            var pnumber = ${reservation.pnumber};
            var pturn = ${reservation.pturn};
            var ticketNum = date.toString()+pnumber.toString()+pturn.toString()+value; //==티켓번호
            
            //티켓번호를 name, 좌석명을 value로 으로 하는 checkbox생성
		    var seat = $("<td><input type='checkbox' class='seat' name='" + ticketNum + "' value='" + value + "'></td>");
		    
             // 예매된 좌석은 disable해서 예매하지 못하게 한다.
		    if (reserveSeats.includes(value)) {
		      seat.find("input").prop("disabled", true);
		    }
		    
		    row.append(seat); // 한 줄 생성
		  }
		  $("#seatsTable").append(row); // 모든 좌석 생성
		}
		
		//checked세기
		 var count = 0;
		  $("input.seat").change(function(){
		    if(this.checked){
		      count++;
		    } else {
		      count--;
		    }
			  var ticketPrice = ${reservation.pticketPrice };
			  $("#_price_amount").empty().html((ticketPrice + 500 ) * count + '원');
		  });
		
		$(".seat").click(function() {
			  var $checkbox = $(this);
			  if ($(".seat:checked").length >= 4) { //4개 이상의 티켓은 선택하지 못한다.
			    $(".seat:not(:checked)").attr("disabled", true);
			  } else {
			    
			  }
			  
			  var ticketNum = $checkbox.attr("name");
			  var value = $checkbox.val();
			  
			  
			  //csrf
			  var token = $("meta[name='_csrf']").attr("content");
			  var header = $("meta[name='_csrf_header']").attr("content");
			  $(document).ajaxSend(function(e, xhr, options) {
			    xhr.setRequestHeader(header, token);
			  });
			  
			  $.ajax({ // 1. 이선좌 알림 2. 예매 진행
			    type: "POST",
			    url: "/reserve/checkSeatAvailability",
			    data: {
			      "seatName": ticketNum
			    },
			    success: function(response) {
			      console.log(response);
			      if (response) {
			        alert("이미 선택된 좌석입니다.");
			        //$checkbox.prop("checked", false);
			        location.reload();
			      } else {
			        // 선택하지 않은 좌석일 때 db처리
			      }
			    }
			  });
			});

			$("#reserveNext").click(function() {
			  $(".seat:checked").each(function() {
			    console.log($(this).attr("name"));
			    console.log($(this).val());
			    selectedSeats.push({ //checked된 좌석을 담음
			      name: $(this).attr("name"),
			      value: $(this).val()
			    });
			  });
			  // selectedSeats 폼 컨트롤러에 보내기.
			  // ...
			});
	});
</script>