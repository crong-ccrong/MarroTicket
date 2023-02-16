<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- sidebar section -->
<div class="main_aside">
  <ul >
    <li >
      <a class="submenu_info" href="/umember/umembermypage">내정보</a>
    </li></ul>
  
  
    <span class="submenu_title">예매확인</span>
    
  <ul>
    <li >
      <a  class="submenu_rInfo" href="/umember/umemberReserveInfo">예매 정보</a>
    </li>
    <li>
      <a class="submenu_cInfo" href="/umember/umemberCancelInfo">예매 취소 정보</a>
    </li>
    </ul>
  <ul>
    <li>
      <a class="submenu_history"  href="/umember/umemberViewHistory">나의 관람 연극</a>
    </li>
    </ul>
  <ul>
   <li>
      <a class="submenu_custom"  href="/umember/umemberCustomPlayList">나의 맞춤 연극</a>
    </li>
  </ul>
</div>
    
    
  <style>
  
.footer {
  clear: both;
}
/* Side menu container */
.main_aside {
  position: fixed;
  left: 0;
  top: 60px; /* adjust as needed */
  bottom: 60px; /* adjust as needed */
  background-color: #f0f0f0;
  box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
}

/* Side menu header */
.submenu_title {
  display: block;
  padding: 10px;
  font-size: 16px;
  font-weight: bold;
  color: #555;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}


ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.submenu_info,
.submenu_rInfo,
.submenu_cInfo,
.submenu_history,
.submenu_custom {
  display: block;
  padding: 10px;
  text-decoration: none;
  color: #333;
}

.submenu_info:hover,
.submenu_rInfo:hover,
.submenu_cInfo:hover,
.submenu_history:hover,
.submenu_custom:hover {
  background-color: #ddd;
}

  

</style>
    