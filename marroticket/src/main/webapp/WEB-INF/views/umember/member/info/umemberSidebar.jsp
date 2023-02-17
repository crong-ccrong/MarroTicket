<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
    <head>
  <link rel="stylesheet" type="text/css" href="/src/main/resources/static/css/umember_mypage.css">
</head>
    
    

<!-- sidebar section -->
<div class="mypage_sidebar">
  <ul class="menu-hover-fill flex flex-col items-start leading-none text-2xl uppercase space-y-4">
    <li >
      <a  href="/umember/umembermypage">내정보</a>
    </li></ul>
  
  
    <span >예매확인</span>
    
  <ul>
    <li >
      <a   href="/umember/umemberReserveInfo">예매 정보</a>
    </li>
    <li>
      <a  href="/umember/umemberCancelInfo">예매 취소 정보</a>
    </li>
    </ul>
  <ul>
    <li>
      <a   href="/umember/umemberViewHistory">나의 관람 연극</a>
    </li>
    </ul>
  <ul>
   <li>
      <a  href="/umember/umemberCustomPlayList">나의 맞춤 연극</a>
    </li>
  </ul>
</div>
    
    
    <style>
/* Apply styles to the sidebar container */
.mypage_sidebar {
  width: 15%;
  float: left;
  padding: 5px;
}

/* Apply styles to the unordered list */
ul {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

/* Apply styles to the links within the unordered list */
ul li a {
  display: block;
  padding: 10px;
  color: #333;
  transition: background-color 0.3s ease;
}

ul li a:hover {
  background-color: #eee;
}

/* Apply styles to the section title */
.mypage_sidebar span {
  display: block;
  padding: 10px;
  font-weight: bold;
  color: #555;
}

/* Apply styles to the footer */
.footer {
  clear: both;
}

</style>

    