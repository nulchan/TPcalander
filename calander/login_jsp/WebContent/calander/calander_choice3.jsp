<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" %>
<%
	String errorMsg = null;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String dbUrl = "jdbc:mysql://localhost:3306/member_data";
	String dbUser = "login";
	String dbPassword = "12345";
	String userid = "";
	String userpwd = "";

	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	List<String> start = new ArrayList<String>();
	List<String> end = new ArrayList<String>();
	List<String> color = new ArrayList<String>();
	List<String> submit = new ArrayList<String>();
	List<String> aniv = new ArrayList<String>();
	List<String> aniv_submit = new ArrayList<String>();
	List<Integer> start_year = new ArrayList<Integer>();
	List<Integer> start_month = new ArrayList<Integer>();
	List<Integer> start_day = new ArrayList<Integer>();
	List<Integer> end_year = new ArrayList<Integer>();
	List<Integer> end_month = new ArrayList<Integer>();
	List<Integer> end_day = new ArrayList<Integer>();
	List<Integer> aniv_month = new ArrayList<Integer>();
	List<Integer> aniv_day = new ArrayList<Integer>();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT *FROM users join schedule on users.id = schedule.id WHERE users.id=?");
		stmt.setString(1,id);
		rs = stmt.executeQuery();
		while(rs.next()){
			submit.add(rs.getString("submit"));
			start.add(rs.getString("start"));
			end.add(rs.getString("end"));
			color.add(rs.getString("color"));
		}
		for(int i=0;i<start.size();i++){
			start_year.add(Integer.parseInt(start.get(i).substring(0, 4)));
			start_month.add(Integer.parseInt(start.get(i).substring(5,7)));
			start_day.add(Integer.parseInt(start.get(i).substring(8,10)));
			end_year.add(Integer.parseInt(end.get(i).substring(0, 4)));
			end_month.add(Integer.parseInt(end.get(i).substring(5,7)));
			end_day.add(Integer.parseInt(end.get(i).substring(8,10)));
		}
		stmt.close();
		rs.close();
		stmt = conn.prepareStatement("SELECT *FROM users join aniv on users.id = aniv.id WHERE users.id=?");
		stmt.setString(1,id);
		rs = stmt.executeQuery();
		while(rs.next()){
			aniv.add(rs.getString("time"));
			aniv_submit.add(rs.getString("submit"));
		}
		for(int i=0;i<aniv.size();i++){
			aniv_month.add(Integer.parseInt(aniv.get(i).substring(0, 2)));
			aniv_day.add(Integer.parseInt(aniv.get(i).substring(3,5)));
		}
	}catch(SQLException e){
		errorMsg = "SQL 에러" + e.getMessage();
	}finally{
		if(rs != null)try{rs.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
		if(stmt != null)try{stmt.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
		if(conn != null)try{conn.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
	}
	int count = start_year.size();
	int count2 = aniv_month.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Calander</title>
<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function mini_calendar(change_year,change_month){ 
		var now_Date = new Date();               
		var year = now_Date.getFullYear();      
		var month = now_Date.getMonth() ;       
		var date = now_Date.getDate();          
		var day = now_Date.getDay();         
		var end_day = new Array(31,28,31,30,31,30,31,31,30,31,30,31);      
		var week = new Array("일","월","화","수","목","금","토");
		var col=0;  
		
		if (change_year == null){
			change_year=year;
		}	
		if (change_month == null){
			change_month=month;
		}
		
		Change_Date = new Date();      
		Change_Date.setFullYear(change_year);
		Change_Date.setMonth(change_month);  
		Change_Date.setDate(1);        
		var first_day = Change_Date.getDay(); 
		var last_Day = end_day[Change_Date.getMonth()];
		if((Change_Date.getMonth() == 1)&&(((Change_Date.getYear()%4 == 0)&&(Change_Date.getYear() %100 != 0))|| Change_Date.getYear() % 400 ==0 )){
			last_Day=29;
		} 
		calendarSave ="<a href=javascript:mini_calendar("+change_year+","+(change_month-1)+")><input class=month_button id=month_button type=button value=◀></a>"
		calendarSave +="<font size=3 color=black>  <b>"+Change_Date.getFullYear()+"년"+(Change_Date.getMonth()+1)+"월</b></font>"
		calendarSave +="<a href=javascript:mini_calendar("+change_year+","+(change_month+1)+")><input class=month_button id=month_button type=button value=▶></a>"
		calendarSave +=" <table width= 100% border= 1 solid><tr>"
		for (i=0;i<week.length;i++){			
			calendarSave +="<td>"+week[i] + "</td>"
		}	
		calendarSave +="</tr><tr align=center>"
		for (i=0;i<first_day;i++){         
			calendarSave +="<td>&nbsp;</td>" 
			col++;                     
		}
		for (i=1; i<=last_Day; i++){     
			if(Change_Date.getFullYear()==change_year && Change_Date.getMonth()==change_month && i==date){
				calendarSave +="<td>"+i+"</td>" 
			}else{
				if(col==0){
					calendarSave +="<td>"+i+"</td>"
				}else if(1<=col && col<=5){
					calendarSave +="<td>"+i+"</td>" 
				}else if(col==6){        
					calendarSave +="<td>"+i+"</td>" 
				}
		
				}			
				col++;
				if(col==7){    
					calendarSave +="</tr><tr align=center>"
					col=0;
				}
			}   
			for (i=col;i<week.length;i++){       
				calendarSave +="<td>&nbsp;</td>"
			}		
			calendarSave +="</tr></table>"
			document.getElementById('mini_calendar').innerHTML = calendarSave
	}
		var day = new Date(); 
  		day.setDate(day.getDate()-day.getDay()); 

  		function week_calandar(week,num) { 
  			var title;
  			var s_year;
  	   	  	var s_month;
  	   	  	var s_day;
  	   	  	var e_year;
  	   	  	var e_month;
  	   	  	var e_day;
  	   	  	var color;
  	   	  	var a_month;
  	   	  	var a_day;
  	   	  	var a_submit;
  	   	  	var title_store = new Array();
  	   	  	var s_year_store = new Array();
  	   		var s_month_store = new Array();
  	   		var s_day_store = new Array();
  	   		var e_year_store = new Array();
  	  	 	var e_month_store = new Array();
  	  	 	var e_day_store = new Array();
  	  	 	var color_store = new Array();
  	  	 	var a_month_store = new Array();
  	   	  	var a_day_store = new Array();
  	   	  	var a_submit_store = new Array();
  	   	  	for(var i=0; i< <%=count%>;i++){
  	   	  		title = document.getElementById("submit"+i).value;
  	   	  		s_year = document.getElementById("s_year"+i).value;
  	   	  		s_month = document.getElementById("s_month"+i).value;
  	   	  		s_day = document.getElementById("s_day"+i).value;
  	   	  		e_year = document.getElementById("e_year"+i).value;
  	   	  		e_month = document.getElementById("e_month"+i).value;
  	   	  		e_day = document.getElementById("e_day"+i).value;
  	   	  		color = document.getElementById("color"+i).value;
  	   	  		title_store[i] = title;
  	   	  		s_year_store[i] = s_year;
  	   		  	s_month_store[i] = s_month;
  	   		  	s_day_store[i] = s_day;
  	   			e_year_store[i] = e_year;
  	 		  	e_month_store[i] = e_month;
  	 		  	e_day_store[i] = e_day;
  	 		  	color_store[i] = color;
  	   	  	}
  	   	  	for(var i=0; i < <%=count2%>;i++){
  	   	  		a_month = document.getElementById("a_month"+i).value;
  	  			a_day = document.getElementById("a_day"+i).value;
  	  			a_submit = document.getElementById("a_submit"+i).value;
  	  			a_month_store[i] = a_month;
  			  	a_day_store[i] = a_day;
  			  	a_submit_store[i] = a_submit;
  	   	  	}
  	   	  	var set_color = new Array();
  	   	 	set_color[0] = "red";
  	   	 	set_color[1] = "blue";
  	   	 	set_color[2] = "yellow";
  	   	 	set_color[3] = "purple";
  	   	 	set_color[4] = "black";
      		day.setDate(day.getDate()+week*7); 
      		var title2 = "<div id=content_search><input class=search_text type=text value=일정검색><input class=search_button type=button value=검색></div>"
      		title2 += "<div id=content_navbar><a href=../calander/calander_day.jsp><input class=navbar_button type=button value=일간></a><a href=../calander/calander_week.jsp><input class=navbar_button type=button value=주간></a><a href=../calander/calander.jsp><input class=navbar_button type=button value=월간></a><a href=../calander/calander_view.jsp><input class=navbar_button type=button value=목록></a><a href=javascript:popupOpen2()><input class=navbar_button type=button value=정렬></a></div><br>"
      	 	title2 +="<a href=javascript:week_calandar(-5,3)><input class=month_button id=month_button type=button value=◀></a>"
      		title2 += day.getFullYear() + "." + (day.getMonth()+1)+","+Math.ceil((day.getDate()/7))+"번쨰 주"; 
      		var data = "<table width=98% height=100% border= 1 solid>" 
      			for(var a=0; a<num; a++){
    	      		data += "<tr align=center height=50>"
    	      			for(var i=0 ; i<7 ; i++) {
    		      			var check = 0;
    		      			var check2 = 0;
    		      			var check3 = 0;
    		      			for(num=0; num < <%=count%>; num++){
    		      				if(color_store[num] == set_color[0]){
    								color_name = "red";
    							}else if(color_store[num] == set_color[1]){
    								color_name = "blue";
    							}else if(color_store[num] == set_color[2]){
    								color_name = "yellow";
    							}else if(color_store[num] == set_color[3]){
    								color_name = "purple";
    							}else if(color_store[num] == set_color[4]){
    								color_name = "black";
    							}
    			      			if(day.getFullYear() == s_year_store[num]){
    			      				if(day.getMonth()+1 == s_month_store[num]){
    			      					if(check == 1){
    			      						check3 = 1;
    			      						if(day.getDate() == s_day_store[num]){
    			      							data +=",<span style=color:"+color_name+">"+title_store[num]+"</span>시작"
    			      						}
    			      					}else if(day.getDate() == s_day_store[num]){
    			      						check3 = 1;
    			      						data +="<td width=14%><span style=color:"+color_name+">"+title_store[num]+"</span>시작"
    			      						check = 1;
    			      					}
    			      				}
    			      			}
    			      			if(day.getFullYear() == e_year_store[num]){
    			      				if(day.getMonth()+1 == e_month_store[num]){
    			      					if(check2 == 1){
    			      						check3 = 1;
    			      						if(day.getDate() == s_day_store[num]){
    			      							data +=",<span style=color:"+color_name+">"+title_store[num]+"</span>시작"
    			      						}
    			      					}else if(day.getDate() == e_day_store[num]){
    			      						check3 = 1;
    			      						data +="<td width=14%><span style=color:"+color_name+">"+title_store[num]+"</span>종료"
    			      						check2 = 1;
    			      					}
    			      				}
    			      			}
    			      			if(num == <%=count%>-1  && check3 == 0){
    			      				data +="<td width=14%>"+day.getDate()
    			      			}
    		      			}
    		      			data += "</td>"
    		      			if(<%=count%> == 0){
    							data +="<td width=14%>"+day.getDate()+"</td>"
    						}
    		      			day.setDate(day.getDate()+1);
    	      		}
    	      	}
      		day.setDate(day.getDate()-7); 
      		data += "</tr></table>"
      		title2 +="<a href=javascript:week_calandar(1,3)><input class=month_button id=month_button type=button value=▶></a>"
      		document.getElementById("big_calendar").innerHTML = title2 + "<br />" + data; 
      	} 
      		
 		function set_day(num) { 
  		day = new Date(); 
  		day.setDate(day.getDate()-day.getDay()); 
  		week_calandar(0,num); 
  		} 
 		function popupOpen(){
 			var popUrl = "delete_popUp.jsp";	//팝업창에 출력될 페이지 URL
 			var popOption = "width=370, height=165, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
 				window.open(popUrl,"",popOption);

 		}
 		
 		function popupOpen2(){
 			var popUrl = "choice_popUp.jsp";	//팝업창에 출력될 페이지 URL
 			var popOption = "width=370, height=165, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
 				window.open(popUrl,"",popOption);

 		}
 		function add_memo(){
 			alert("새 메모를 등록했습니다");
 		}
 		function HideLeftMenu() {
 			if (document.getElementById("menu_body").style.display == "none") {
 				document.getElementById("menu_body").style.display = "block";
 				document.getElementById("menu_hide").innerText = "◀";
 				document.getElementById("c_content").style.width = "79%";
 			} else {
 				document.getElementById("menu_body").style.display = "none";
 				document.getElementById("menu_hide").innerText = "▶";
 				document.getElementById("c_content").style.width = "98%";
 			}
 		}
</script>
</head>
<body background = "../images/background.jpg" onload="mini_calendar(null,null),set_day(3)">

    <div id="wrap">
    	<div id="top">
    		안녕하세요. <b><%=session.getAttribute("id") %></b>님 ||
    		<a href="../login/logout.jsp">로그아웃하기</a>
    	</div>
        <div id="header">
            <div id="cal_images">
					<img src="../images/slogo.jpg" alt="small_logo">
			</div>
            <a href="../calander/calander.jsp" id="header-title">HCP calendar</a> 
        </div>
        
        <div id="menu">
            <div id="menu_body">
	            <a href="../calander/make_schedule.jsp">
                <input class="menu_button" type="button" value="일정쓰기" >
                </a>
                
				<a href="../calander/make_aniv.jsp">
                <input class="menu_button" type="button" value="기념일관리" >
				</a>
                 <!-- 메뉴영역 달력 start -->
                 <div id="mini_calendar" ></div>
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
                      	<div id="all_schedule">
                 			<a href="../calander/show_aniv.jsp">
							<img src="../images/important.png" alt="important">
							기념일 보기</a><br>
						</div>
                      
                      	<div id="show_important">
                      		<a href="../calander/s_delete_view2.jsp">
	                      	<img src="../images/can.png" alt="delete">
							일정 삭제하기</a><br>
						</div>
                      
                      	<div id="menu_delete">
                      		<a href="../calander/s_delete_view.jsp" >
							<img src="../images/can.png" alt="delete">
							오래된 일정 삭제</a><br>
						</div>
						
                      
                      	<div id="show_memo">
                    	  	<a href="../calander/show_memo.jsp">
							<img src="../images/memo.png" alt="show_memo">
							메모 모아보기</a>
						</div>    
                     
         		  </div>
          </div>
     </div>
            <div id="menu_hide" onclick="HideLeftMenu();">
                <a href="">◀</a>
            </div>
        <div id="c_content">
 			<div id="big_calendar"></div> 
 			<div id="hide">
          	<%
          		for(int i=0;i<start_year.size();i++){
          			String title = submit.get(i);
          			int s_year = start_year.get(i);
          			int s_month = start_month.get(i);
          			int s_day = start_day.get(i);
          			int e_year = end_year.get(i);
          			int e_month = end_month.get(i);
          			int e_day = end_day.get(i);
          			String color_store = color.get(i);%>
          			<input type="text" id = "submit<%=i%>" value="<%=title%>">
          			<input type="text" id = "color<%=i%>" value="<%=color_store%>">
          			<input type="text" id = "s_year<%=i%>" value="<%=s_year%>">
          			<input type="text" id = "s_month<%=i%>" value="<%=s_month%>">
          			<input type="text" id = "s_day<%=i%>" value="<%=s_day%>">
          			<input type="text" id = "e_year<%=i%>" value="<%=e_year%>">
          			<input type="text" id = "e_month<%=i%>" value="<%=e_month%>">
          			<input type="text" id = "e_day<%=i%>" value="<%=e_day%>">
          		<%}
          		for(int i=0; i<aniv_month.size();i++){
          			int a_month = aniv_month.get(i);
          			int a_day = aniv_day.get(i);
          			String a_submit = aniv_submit.get(i);%>
          			<input type="text" id = "a_month<%=i%>" value="<%=a_month%>">
          			<input type="text" id = "a_day<%=i%>" value="<%=a_day%>">
          			<input type="text" id = "a_submit<%=i%>" value="<%=a_submit%>">
          		<%}%>
       	
          </div>
          <script>
          document.getElementById("hide").style.display = "none";
          </script>
          	</div>
        <div id="footer">
            8조 - 박정현, 최기영, 하늘찬
        </div>


</body>
    </html>

