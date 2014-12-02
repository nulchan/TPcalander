<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오래된 일정 삭제</title>
	<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 	
}
	
</script>
<body>
<div id="delete_menu">
		<div id="delete_message">
			<br>
	    		오래된 일정 삭제
	    </div>
	    <br>
	    <div id="delete_time">
			<input class="time_box", type="text" id="start" placeholder="YYYY-MM-DD"><br>
			이전의 일정을 모두 삭제하시겠습니까?
		</div>
		<br>
	    <input class="yes_button" type="button" value="확인" onclick="frameclose()">
	    <input class="no_button" type="button" value="취소" onclick="frameclose()">
	    <br><br>
    	
</div>
</body>
</html>