<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Calander</title>
<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
</head>
<body background = "../images/background.jpg" >
    <div id="wrap">
    	<div id="top">
    		안녕하세요. <b><%=session.getAttribute("id") %></b>님 ||
    		<a href="../login/logout.jsp">로그아웃하기</a>
    	</div>
        <div id="header">
            <div id="cal_images">
					<img src="../images/slogo.jpg" alt="small_logo">
			</div>
            Calander - 8조
        </div>
        
        <div id="menu">
            <div id="menu_body">
	            <a href="../calander/make_schedule.jsp">
                <input class="menu_button" type="button" value="일정쓰기" >
                <input class="menu_button" type="button" value="기념일관리" >

                 <!-- 메뉴영역 달력 start -->
                
                  <!-- 메뉴영역 달력 end -->
                  <div id="menu_memo">
                	<form action ="../calander/memostore.jsp" method="post">  	
	                    <div class="memo_box">
	                    <textarea cols="36" rows="8" name="memo" id="memo" placeholder="이 곳에 메모를 입력 할 수 있습니다"></textarea>
	                    </div>
	                    <input class="memo_button" type="submit" value="등록">
                    </form>
                  </div>
                  <div id="menu_check">
                      
                      <a href="">
                      	<div id="all_schedule">
							<img src="../images/all.png" alt="all_schedule">
							전체 일정 보기</a></br>
						</div>
                      <a href="">
                      	<div id="show_important">
							<img src="../images/important.png" alt="important">
							중요 일정 보기</a></br>
						</div>
                      <a href="">
                      	<div id="menu_delete">
							<img src="../images/can.png" alt="delete">
							오래된 일정 삭제</a></br>
						</div>
						
                      <a href="../calander/show_memo.jsp">
                      	<div id="show_memo">
							<img src="../images/memo.png" alt="show_memo">
							메모 모아보기</a>
						</div>
                  </div>
            </div>
            <div id="menu_hide" onclick="HideLeftMenu();">
                <a href="">◀</a>
            </div>
        	<div id="make_schedule">
        		<table>
        		<br>
        			<div id="write_top">
						일정 등록  ㅣ <a href="../calander/calander.jsp">캘린더로 돌아가기  </a>
					</div>
					<br>
					<form action ="../calander/scheduleStore.jsp" method="post">
					<div id="title">
						제목 &nbsp; <input class="title_box", name="submit" type="text" placeholder="제목을 입력하세요">				
						<tr height="1" bgcolor="#B2CCFF"><td colspan="4"></td></tr>
					</div>
					<div id="time">
						시간 &nbsp; <input class="time_box", type="text" id="start" placeholder="YYYY-MM-DD">
							<select name="start_time">
								<option value="time0">00:00</option>
								<option value="time1">01:00</option>
								<option value="time2">02:00</option>
								<option value="time3">03:00</option>
								<option value="time4">04:00</option>
								<option value="time5">05:00</option>
								<option value="time6">06:00</option>
								<option value="time7">07:00</option>
								<option value="time8">08:00</option>
								<option value="time9">09:00</option>
								<option value="time10">10:00</option>
								<option value="time11">11:00</option>
								<option value="time12">12:00</option>
								<option value="time13">13:00</option>
								<option value="time14">14:00</option>
								<option value="time15">15:00</option>
								<option value="time16">16:00</option>
								<option value="time17">17:00</option>
								<option value="time18">18:00</option>
								<option value="time19">19:00</option>
								<option value="time20">20:00</option>
								<option value="time21">21:00</option>
								<option value="time22">22:00</option>
								<option value="time23">23:00</option>
							</select>
							~
							<input class="time_box", type="text" id="end" placeholder="YYYY-MM-DD">
							<select name="end_time">
								<option value="time24">00:00</option>
								<option value="time25">01:00</option>
								<option value="time26">02:00</option>
								<option value="time27">03:00</option>
								<option value="time28">04:00</option>
								<option value="time29">05:00</option>
								<option value="time30">06:00</option>
								<option value="time31">07:00</option>
								<option value="time32">08:00</option>
								<option value="time33">09:00</option>
								<option value="time34">10:00</option>
								<option value="time35">11:00</option>
								<option value="time36">12:00</option>
								<option value="time37">13:00</option>
								<option value="time38">14:00</option>
								<option value="time39">15:00</option>
								<option value="time40">16:00</option>
								<option value="time41">17:00</option>
								<option value="time42">18:00</option>
								<option value="time43">19:00</option>
								<option value="time44">20:00</option>
								<option value="time45">21:00</option>
								<option value="time46">22:00</option>
								<option value="time47">23:00</option>
							</select>
					</div>
					
					<div id="color">
						색상	<select name="color">
								<option value="red">빨강</option>
								<option value="blue">파랑</option>
								<option value="yello">노랑</option>
								<option value="puple">보라</option>
								<option value="black">검정</option>
							</select>	
					</div>
					
					<div id="schedule_content">
						내용 <textarea cols="36" rows="8" id="content"></textarea>
					</div>
					</table>
					<input type="submit" value="저장하기">
					</form>
					</div>




        <div id="footer">
            8조 - 박정현, 최기영, 하늘찬
        </div>
</body>
<script>
	function HideLeftMenu() {
		if (document.getElementById("menu_body").style.display == "none") {
			document.getElementById("menu_body").style.display = "block";
			document.getElementById("menu_hide").innerText = "◀";
			document.getElementById("content").style.width = "79%";
		} else {
			document.getElementById("menu_body").style.display = "none";
			document.getElementById("menu_hide").innerText = "▶";
			document.getElementById("content").style.width = "98%";
		}
	}
</script>