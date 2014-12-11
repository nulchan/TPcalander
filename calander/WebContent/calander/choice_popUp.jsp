<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HCP calendar</title>
	<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 	
}
function go(url){
	opener.location.href = url;
	window.close;
}

</script>
<body>
		<div id="delete_message">
			<br>
	 		보고싶은 주단위를 고르세요
	 		<br>
	 		<br>
	 		<input class="one_button" type="button" value="1주씩" onclick="go('../calander/calander_choice1.jsp'),frameclose()">
		    <input class="two_button" type="button" value="2주씩" onclick="go('../calander/calander_choice2.jsp'),frameclose()">
		    <input class="three_button" type="button" value="3주씩" onclick="go('../calander/calander_choice3.jsp'),frameclose()">
		    <input class="four_button" type="button" value="4주씩" onclick="go('../calander/calander_choice4.jsp'),frameclose()">
	
	    	
	    </div>
		
</body>
</html>