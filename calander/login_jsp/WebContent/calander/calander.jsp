<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Calander</title>
<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
<<<<<<< HEAD
<script type="text/javascript">
	function calendar(){ //위에 날짜옮기는 걸 함수만들고 값을 리턴해서 calendar에 넣는 방법이나 아니면 전체를 자바스크립트로ㄱ
		var date = new Date();
		var year = date.getYear();
		var month = date.getMonth();
		var day = date.getDate();
		var months = new Array("1","2","3","4","5","6","7","8","9","10","11","12");
		var day_months = new Array("31","28","31","30","31","30","31","31","30","31","30","31");
		if(year<=200){
			year = year + 1900;
		}
		if(year % 4 == 0 && year != 1900){
			day_months[1] = 29;
		}
		var total = day_months[month]; 
		var usedate = date;
		var week = 0;
		usedate.setDate(1);
		if(usedate.getDate() == 2){
			usedate.setDate(0);
		}
		usedate = usedate.getDay();            		
		document.write('<table><tbody><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr><tr>');
		for(var i=1; i<=usedate;i++){
			document.write('<td style="color:gray">' + (day_months[month-1] - usedate + i) + '</td>');
			week++;
		}
		for(var i=1; i <= total; i++){
			if(week == 0){
				document.write('<tr>');
			}
			if(day == i){
				document.write('<td style="color:red;">'+i+'</td>');
			}else{
				document.write('<td>' + i + '</td>');
			}
			week++;
			if(week==7){
				document.write('</tr>');
				week=0;
			}
		}
		for(var i=1; week !=0; i++){
			document.write('<td style="color:gray;">' + i + '</td>');
			week++;
			if(week==7){
				document.write('</tr>');
				week=0;
			}
		}
		document.write('</tbody></tabel>');
	}
</script>
=======
>>>>>>> 735ce47a2f4e8b62360a4836d08c3ef248428d9e
</head>
<body>
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
        <div id="content">
          
            <div id="content_search">
                <input class="search_text", type="text" value="일정검색">
                <input class="search_button", type="button" value="검색">
            </div>
            
           	<div id ="move_month">
<<<<<<< HEAD
            	2014. 11. 
=======
            	2014. 10. 
>>>>>>> 735ce47a2f4e8b62360a4836d08c3ef248428d9e
            	<input class="month_button" type="button" value="◁">
            	<input class="month_button" type="button" value="▷">
           	</div>
           	<br><br>
            <div id="content_navbar">
                <input class="navbar_button" type="button" value="일간">
                <input class="navbar_button" type="button" value="주간">
                <input class="navbar_button" type="button" value="월간">
                <input class="navbar_button" type="button" value="목록">
                <input class="navbar_button" type="button" value="정렬">
            </div>
            <div id="frame"	>
<<<<<<< HEAD
                <script type="text/javascript">
              		calendar();
              	</script>
=======
                <div id="month_clander">
                    <table class="week_header">
                        <tbody>
                          <tr>
                              <th title="일" class="sun">일</th>
                              <th title="월">월</th>
                              <th title="화">화</th>
                              <th title="수">수</th>
                              <th title="목">목</th>
                              <th title="금">금</th>
                              <th title="토">토</th>
                          </tr>
                        </tbody>
                    </table>
                    <div class="month_row">
                        <table class="week_row">
                            <tbody>
                                <tr>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                 <th></th>
                                 <th></th>
                                 <th></th>
                                 <th></th>
                               </tr>
                           </tbody>
                       </table>
                    </div>
                    <div class="month_row">
                        <table class="week_row">
                            <tbody>
                                <tr>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>                   
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="month_row">
                        <table class="week_row">
                            <tbody>
                                <tr>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="month_row">
                        <table class="week_row">
                            <tbody>
                                <tr>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                    <div class="month_row">
                        <table class="week_row">
                            <tbody>
                               <tr>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
>>>>>>> 735ce47a2f4e8b62360a4836d08c3ef248428d9e
            </div>
        </div>
        
        </div>
        <div id="footer">
            8조 - 박정현, 최기영, 하늘찬
        </div>
    </div>
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

