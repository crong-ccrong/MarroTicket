<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div id="main_view_top" class="select_seat ng-isolate-scope">
	<div id="main_view" class="in">
		<h1 style="color: white; text-align: center; margin-top: 20%">STAGE</h1>
		<table id="seatsTable"></table>
	</div>
	<div class="select_seat_info ng-isolate-scope">
		<a href="#" class="seat_header">
			<div ng-show="!selected.isWaitingReservation">
				<strong class="tit ng-binding ng-scope" style="color:white"> 예매를 진행합니다. 좌석을 선택해
					주세요. </strong>
			</div>
		</a>
	</div>
</div>
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

      $('.step1').css({
         'left': '0',
         'top': '0',
         'z-index': '1',
         'width': '198px',
         'height': '45px',
         'background-color': 'black',
         'border-width': '0'
      });

      var pdate = ${ reservation.pdate };
      var unumber = ${ reservation.unumber };
      var pnumber = ${ reservation.pnumber };
      
	  //페이지가 refresh or 새로 열렸을 때
	  refreshOrReopen();


      let enteredNumber = ${ reservation.pseatNumber }; // 극단이 입력한 극장의 좌석수
      var selectedSeats = []; //나중에 checkbox로 선택된 좌석을 담을 변수
      var seats = [];
      var reserveSeats = ${ reserveSeat };
      for (var i = 0; i < reserveSeats.length; i++) { //예매된 좌석 확인
         console.log("예매된 좌석 : " + reserveSeats);
      }

      for (let i = 1; i <= enteredNumber; i++) {
         seats.push(i); // 극장의 좌석 수만큼 빈 셀 생성
      }
      var seatsPerRow = 9; // 한 열은 10개가 max
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
            var date = ${ reservation.pdate };
            var pnumber = ${ reservation.pnumber };
            var pturn = ${ reservation.pturn };
            var ticketNum = date.toString() + pnumber.toString() + pturn.toString() + value; //==티켓번호

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
      $("input.seat").change(function() {
         if ($(".seat:checked").length > 4 ) {
             alert("좌석은 최대 4석까지 예매가 가능합니다.");
             $(this).prop("checked", false); //체크한 것을 해제함
             return false;
         }

         var $checkbox = $(this);
         var ticketNum = $checkbox.attr("name");
         var reserveJSON = {
            "rticketFirst": ticketNum,
            "pdate": pdate,
            "unumber": unumber,
            "pnumber": pnumber
         }

         if (this.checked) {
            count++;
            $.ajax({ // 이선좌 등록
               type: "POST",
               url: "/reserve/checkSeatAvailability",
               contentType: 'application/json',
               data: JSON.stringify(reserveJSON),
               success: function(response) {
                  console.log("선택된 좌석? : "+response);
                  if (response) {
                     alert("이미 선택된 좌석입니다.");
                     //$checkbox.prop("checked", false);
                     location.reload();
                  }
               }
            });
         } else { //이선좌 delete
            count--;
            $.ajax({ // 이선좌 취소
               type: "POST",
               url: "/reserve/uncheckSeat",
               contentType: 'application/json',
               data: JSON.stringify(reserveJSON),
               success: function(response) {
                  console.log(response);
               }
            });
         }
         var ticketPrice = ${ reservation.pticketPrice };
         $("#_price_count").empty().html( count + '개');
         $("#_price_amount").empty().html((ticketPrice + 500) * count + '원');
      });

      $("#reserveNext").click(function() {
    	  var numCheckedSeats = 0;

    	  $('.seat').each(function() {
    	    if ($(this).prop('checked')) {
    	      numCheckedSeats++;
    	    }
    	  });
    	  // 좌석을 하나도 선택하지 않았을 경우
    		    if (numCheckedSeats<1) {
    		      alert('좌석을 한 개 이상 선택해주세요');
    		      return false; // Stop the loop
    		    } else {
    		    	var ticketInfo = getTicketInfo();
    		         var rtotalpayment = ticketInfo["rtotalpayment"];
    		         var rticketcount = ticketInfo["rticketcount"];
    		         var rticketFirst = ticketInfo["rticketFirst"];
    		         var rticketSecond = ticketInfo["rticketSecond"];
    		         var rticketThird = ticketInfo["rticketThird"];
    		         var rticketFourth = ticketInfo["rticketFourth"];
    		         
    		         if (rticketFourth !== undefined) {
      		        	$("#reserveInfo input[name='rticketSecond']").val(rticketSecond);
		        	  $("#reserveInfo input[name='rticketThird']").val(rticketThird);
		        	  $("#reserveInfo input[name='rticketFourth']").val(rticketFourth);
    		        	}
    		         if (rticketThird !== undefined) {
      		        	  $("#reserveInfo input[name='rticketSecond']").val(rticketSecond);
    		        	  $("#reserveInfo input[name='rticketThird']").val(rticketThird);
   		        	}
    		         if (rticketSecond !== undefined) {
   		        	  $("#reserveInfo input[name='rticketSecond']").val(rticketSecond);
   		        	}
    		         $("#reserveInfo input[name='rticketFirst']").val(rticketFirst); 
    		         
     		        $("#reserveInfo input[name='rtotalpayment']").val(rtotalpayment); 
    		        $("#reserveInfo input[name='rticketcount']").val(rticketcount); 
    				$("#reserveInfo").attr("action", "/reserve/confirmReserve");
    				$("#reserveInfo").submit(); 
    		    }
      });
      
      //페이지가 refresh되거나, 닫혔다가 다시 열릴 때
      function refreshOrReopen(){
	   	   var refreshJson = {
					"pdate" : pdate,
					"unumber" : unumber,
					"pnumber" : pnumber,   
		   }
			$.ajax({ // 이선좌 취소
				type: "POST",
				url: "/reserve/selectSeatRefresh",
				contentType: 'application/json',
				data: JSON.stringify(refreshJson),
				success: function(response) {
					console.log(response);
				}
			});
      }
      
      function getTicketInfo() {
          $("input.seat").change(function() {  
             var count = 0;
             if (this.checked) {
                count++; 
            } else { //이선좌 delete
                  count--;
              }
          });
          var ticketPrice = ${ reservation.pticketPrice };
                    
          //티켓 넘버 넣기
          var rticketNames = ["rticketFirst", "rticketSecond", "rticketThird", "rticketFourth"];
         var rticketValues = [];
            
         for (var i = 0; i < rticketNames.length; i++) {
        	  rticketValues[i] = $(".seat:checked:not(:disabled)").eq(i).attr("name");
        	}
                     
         //변수 초기화
         var rtotalpayment = (ticketPrice + 500) * count;
         var rticketcount = count;
         var rticketFirst = rticketValues[0];
         var rticketSecond = rticketValues[1];
         var rticketThird = rticketValues[2];
         var rticketFourth = rticketValues[3];

         console.log(rtotalpayment);
         console.log(rticketcount);
         console.log(rticketFirst);
         console.log(rticketSecond);
         console.log(rticketThird);
         console.log(rticketFourth);
            
         ticketInfoJSON = {
               "rtotalpayment" : rtotalpayment,
               "rticketcount" : rticketcount,
               "rticketFirst" : rticketFirst,
               "rticketSecond" : rticketSecond,
               "rticketThird" : rticketThird,
               "rticketFourth" : rticketFourth   
         }   
         return ticketInfoJSON;
         }
   });
</script>