<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
							<!-- disabled 기능 사용해보기 -->
							<button type="button" class="calendar_nav_btn_prev"><</button>
							<strong class="calendar_title">2023.01</strong>
							<button type="button" class="calendar_nav_btn_next">></button>
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
							<div class="calandar_day">1</div>
							<div class="calandar_day">2</div>
							<div class="calandar_day">3</div>
							<div class="calandar_day">4</div>
							<div class="calandar_day">5</div>
							<div class="calandar_day">6</div>
							<div class="calandar_day">7</div>
						</div>
						<div class="calandar_week">
							<div class="calandar_day">8</div>
							<div class="calandar_day">9</div>
							<div class="calandar_day">10</div>
							<div class="calandar_day">11</div>
							<div class="calandar_day">12</div>
							<div class="calandar_day">13</div>
							<div class="calandar_day">14</div>
						</div>
						<div class="calandar_week">
							<div class="calandar_day">15</div>
							<div class="calandar_day">16</div>
							<div class="calandar_day">17</div>
							<div class="calandar_day">18</div>
							<div class="calandar_day">19</div>
							<div class="calandar_day">20</div>
							<div class="calandar_day">21</div>
						</div>
						<div class="calandar_week">
							<div class="calandar_day">22</div>
							<div class="calandar_day">23</div>
							<div class="calandar_day">24</div>
							<div class="calandar_day">25</div>
							<div class="calandar_day">26</div>
							<div class="calandar_day">27</div>
							<div class="calandar_day">28</div>
						</div>
						<div class="calandar_week">
							<div class="calandar_day">29</div>
							<div class="calandar_day">30</div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
							<div class="calandar_day"></div>
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