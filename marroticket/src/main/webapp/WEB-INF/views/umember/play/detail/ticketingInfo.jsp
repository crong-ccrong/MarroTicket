<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <script>
	$(document).ready(function() {
	function prevMonth(date) {
		var target = new Date(date);
		target.setDate(1);
		target.setMonth(target.getMonth() - 1);

		return getYmd(target);
	}

	function nextMonth(date) {
		var target = new Date(date);
		target.setDate(1);
		target.setMonth(target.getMonth() + 1);

		return getYmd(target);
	}

	function getYmd(target) {
		// IE에서 날짜 문자열에 0이 없으면 인식 못함
		var month = ('0' + (target.getMonth() + 1)).slice(-2);
		return [ target.getFullYear(), month, '01' ].join('-');
	}

	function fullDays(date) {
		var target = new Date(date);
		var year = target.getFullYear();
		var month = target.getMonth();

		var firstWeekDay = new Date(year, month, 1).getDay();
		var thisDays = new Date(year, month + 1, 0).getDate();

		// 월 표시 달력이 가지는 셀 갯수는 3가지 가운데 하나이다.
		var cell = [ 28, 35, 42 ].filter(function(n) {
			return n >= (firstWeekDay + thisDays);
		}).shift();

		// 셀 초기화
		var days = []
		for (var i = 0; i < cell; i++) {
			days[i] = {
				date : '',
				dayNum : '',
				today : false
			};
		}

		var now = new Date();
		var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
		var inDate;
		for (var index = firstWeekDay, i = 1; i <= thisDays; index++, i++) {
			inDate = new Date(year, month, i);
			days[index] = {
				date : i,
				dayNum : inDate.getDay(),
				today : (inDate.getTime() === today.getTime())
			};
		}

		return days;
	}
	function drawMonth(date) {
		$('#calendar_title').text(date.substring(0, 7).replace('-', '.'));
		$('#calendar_nav_btn_prev').data('ym', prevMonth(date));
		$('#calendar_nav_btn_next').data('ym', nextMonth(date)); 

		$('.calandar_content').empty();

		var div = '<div class="__REST__ __TODAY__"><a __HREF__>__DATE__</a></div>';
		var href = '/depart/schedule?date=' + date.substring(0, 8);
		var hasEvent;
		var divClass;
		var week = null;
		var days = fullDays(date);
		for (var i = 0, length = days.length; i < length; i += 7) {
			// 전체 셀을 주단위로 잘라서 사용
			week = days.slice(i, i + 7);

			var $div = $('<div class="calandar_week"></div>');
			week.forEach(function(obj, index) {
				// 매주 일요일에 이벤트가 있다고 가정
				hasEvent = (index === 0);
				divClass = (index === 0) ? 'sun' : 'calandar_day';
				divClass = (index === 6) ? 'sat' : divClass;

				$div.append(div.replace('__REST__', divClass).replace('__TODAY__',
						(obj['today']) ? 'today' : '').replace(
						'__HREF__',
						(hasEvent) ? 'class="event" href="' + href
								+ ('0' + obj['date']).slice(-2) + '"' : '')
						.replace('__DATE__', obj['date']));
			});
			$('.calandar_content').append($div);
		}
	}

	$(function() {
		var date = (new Date()).toISOString().substring(0, 10);
		drawMonth(date);

		$('.month-move').on('click', function(e) {
			e.preventDefault();

			drawMonth($(this).data('ym'));
			//console.log($(this).data('ym'));

		});
	});
});
</script> 


<!-- ticketingInfo -->
<!-- content_ticketingInfo -->
<div class="content_ticketingInfo">
	<!-- 날짜선택 -->
	<div class="play_reserve_date">
		<!-- 소제목 -->
		<h3 class="play_reserve_heading">
			<span class="play_reserve_step">STEP1</span> <span
				class="play_reserve_title">날짜 선택</span>
		</h3>
		<!-- 달력(내용) -->
		<div class="datepicker">
			<div class="datepicker_triangle"></div>
			<div class="datepicker_month-container">
				<div id="datepicker_header">
					<div id="calendar_header">
						<div id="calendar_nav">
							<button type="button" class="month-move" id="calendar_nav_btn_prev" data-ym="2022-04-01"><</button>
							<strong id="calendar_title">2023.01</strong>
							<button type="button" class="month-move" id="calendar_nav_btn_next" data-ym="2022-06-01">></button>
						</div> 
						<div class="day_names">
							<div class="day_name">일</div>
							<div class="day_name">월</div>
							<div class="day_name">화</div>
							<div class="day_name">수</div>
							<div class="day_name">목</div>
							<div class="day_name">금</div>
							<div class="day_name">토</div>
						</div>
					</div>
					<div class="calandar_content">
						<div class="calandar_week">
							<div class="sun">1</div>
							<div class="calandar_day">2</div>
							<div class="calandar_day">3</div>
							<div class="calandar_day">4</div>
							<div class="calandar_day">5</div>
							<div class="calandar_day">6</div>
							<div class="sat">7</div>
						</div>
						<!-- 행 반복 -->
						<div class="calandar_week">
							<div class="sun">29</div>
							<div class="calandar_day">30</div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
							<div class="sat"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회차선택 -->
	<div class="play_reserve_time">
		<!-- 소제목 -->
		<h3 class="play_reserve_heading">
			<span class="play_reserve_step">STEP2</span> <span
				class="play_reserve_title">회차 선택</span>
		</h3>
		<!-- 회차선택(내용) -->
		<ul class="play_time_list" role="listbox">
			<li class="play_time_item" role="none">
				<button type="button" class="play_time_btn" role="option"
					aria-selected="true">
					<span class="play_time">00시 00분</span>
				</button>
			</li>
		</ul>
	</div>
	<!-- 좌석 여부 -->
	<div class="play_reserve_seat">
		<!-- 소제목 -->
		<h3 class="play_reserve_heading">
			<span class="play_reserve_title">예매가능좌석</span>
		</h3>
		<!-- 예매가능좌석(내용) -->
		<ul class="play_seat_list">
			<li class="play_seat_item"><span class="play_seat_title">잔여</span>
				<span class="play_seat_remain">00석</span></li>
		</ul>
	</div>
</div>
<div align="right">
	<input type="button" class="reservation_button" value="예매하기">
</div>