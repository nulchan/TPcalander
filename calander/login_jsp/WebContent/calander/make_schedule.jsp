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
                  <table id="menu_calander">
                    <tr id="mc_top">
                      <td class="mc_pointer" colspan="2" >◀</td>
                      <td colspan="3">
                        <div id="mc_year">2014</div>
                        <div id="mc_month">10</div>
                      </td>
                      <td class="mc_pointer" colspan="2" >▶</td>
                    </tr>
                    <tr class="mc_border"><td class="mc_border" colspan="7"></td></tr>
                    <tr id="week_col">
                      <td id="sun">일</td>
                      <td id="mon">월</td>
                      <td id="tues">화</td>
                      <td id="wed">수</td>
                      <td id="thu">목</td>
                      <td id="fri">금</td>
                      <td id="sat">토</td>
                    </tr>
                    <tr class="mc_border"><td class="mc_border" colspan="7"></td></tr>
                    <tr class="mday_col" >
                      <td class="csfont">28</td>
                      <td class="cfont">29</td>
                      <td class="cfont">30</td>
                      <td class="cfont">1</td>
                      <td class="cfont">2</td>
                      <td class="cfont">3</td>
                      <td class="cfont">4</td>
                    </tr>
                    <tr class="mday_col">
                      <td class="csfont">5</td>
                      <td class="cfont">6</td>
                      <td class="cfont">7</td>
                      <td class="cfont">8</td>
                      <td class="cfont">9</td>
                      <td class="cfont">10</td>
                      <td class="cfont">11</td>
                    </tr>
                    <tr class="mday_col">
                      <td class="csfont">12</td>
                      <td class="cfont">13</td>
                      <td class="cfont">14</td>
                      <td class="cfont">15</td>
                      <td class="cfont">16</td>
                      <td class="cfont">17</td>
                      <td class="cfont">18</td>
                    </tr>
                    <tr class="mday_col">
                      <td class="csfont">19</td>
                      <td class="cfont">20</td>
                      <td class="cfont">21</td>
                      <td class="cfont">22</td>
                      <td class="cfont">23</td>
                      <td class="cfont">24</td>
                      <td class="cfont">25</td>
                    </tr>
                    <tr class="mday_col">
                      <td class="csfont">26</td>
                      <td class="cfont">27</td>
                      <td class="cfont">28</td>
                      <td class="cfont">29</td>
                      <td class="cfont">30</td>
                      <td class="cfont">31</td>
                      <td class="cfont">1</td>
                    </tr>
                    <tr class="mday_col">
                      <td class="csfont">2</td>
                      <td class="cfont">3</td>
                      <td class="cfont">4</td>
                      <td class="cfont">5</td>
                      <td class="cfont">6</td>
                      <td class="cfont">7</td>
                      <td class="cfont">8</td>
                    </tr>
                    <tr class="mc_border"><td class="mc_border" colspan="7"></td></tr>
                  </table>
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
					<div id="title">
						제목 &nbsp; <input class="title_box", type="text" placeholder="제목을 입력하세요">
						
						<tr height="1" bgcolor="#B2CCFF"><td colspan="4"></td></tr>
					</div>
					<div id="time">
						시간 &nbsp; <input class="time_box", type="text" placeholder="YYYY-MM-DD">
							<select name="">
								<option value="time">00:00</option>
								<option value="time">01:00</option>
								<option value="time">02:00</option>
								<option value="time">03:00</option>
								<option value="time">04:00</option>
								<option value="time">05:00</option>
								<option value="time">06:00</option>
								<option value="time">07:00</option>
								<option value="time">08:00</option>
								<option value="time">09:00</option>
								<option value="time">10:00</option>
								<option value="time">11:00</option>
								<option value="time">12:00</option>
								<option value="time">13:00</option>
								<option value="time">14:00</option>
								<option value="time">15:00</option>
								<option value="time">16:00</option>
								<option value="time">17:00</option>
								<option value="time">18:00</option>
								<option value="time">19:00</option>
								<option value="time">20:00</option>
								<option value="time">21:00</option>
								<option value="time">22:00</option>
								<option value="time">23:00</option>
							</select>
							~
							<input class="time_box", type="text" placeholder="YYYY-MM-DD">
							<select name="">
								<option value="time">00:00</option>
								<option value="time">01:00</option>
								<option value="time">02:00</option>
								<option value="time">03:00</option>
								<option value="time">04:00</option>
								<option value="time">05:00</option>
								<option value="time">06:00</option>
								<option value="time">07:00</option>
								<option value="time">08:00</option>
								<option value="time">09:00</option>
								<option value="time">10:00</option>
								<option value="time">11:00</option>
								<option value="time">12:00</option>
								<option value="time">13:00</option>
								<option value="time">14:00</option>
								<option value="time">15:00</option>
								<option value="time">16:00</option>
								<option value="time">17:00</option>
								<option value="time">18:00</option>
								<option value="time">19:00</option>
								<option value="time">20:00</option>
								<option value="time">21:00</option>
								<option value="time">22:00</option>
								<option value="time">23:00</option>
							</select>
					</div>
					
					<div id="color">
						색상	
					</div>
					
					<div id="schedule_content">
						내용
					</div>
					
					
						</table>
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