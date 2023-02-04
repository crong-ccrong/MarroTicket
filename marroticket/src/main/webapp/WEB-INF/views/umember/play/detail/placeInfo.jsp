<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<script type="text/javascript">
$(document).ready(function() {
	$("button").on("click", function(){
		$("p").data("name","test");
		$("p").data("address","가산");
	
		//data로 저장된 data읽기
		var name= $("p").data("name");
		console.log(name);
		var address = $("p").data("address");
		$("p").eq(0).text(name);
		$("p").eq(1).text(address);
	})
});
</script>
<button type='button'><span>jQuery의 data()읽기 방법</span></button>
<p></p>
<p></p>