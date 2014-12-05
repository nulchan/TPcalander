<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
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
   List<String> submit = new ArrayList<String>();
   List<String> time = new ArrayList<String>();
   List<String> content = new ArrayList<String>();
   try{
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
      stmt = conn.prepareStatement("SELECT *FROM users join aniv on users.id = aniv.id WHERE users.id=?");
      stmt.setString(1,id);
      rs = stmt.executeQuery();
      while(rs.next()){
         submit.add(rs.getString("submit"));
         time.add(rs.getString("time"));
         content.add(rs.getString("content"));
      }
   }catch(SQLException e){
      errorMsg = "SQL 에러" + e.getMessage();
   }finally{
      if(rs != null)try{rs.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
      if(stmt != null)try{stmt.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
      if(conn != null)try{conn.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 모아보기</title>
<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function day_click(change_year,change_month,day,week){
		date = new Date(change_year,change_month,day);
	}
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
	function popupOpen(){
		var popUrl = "delete_popUp.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=165, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	
	}
	function add_memo(){
		alert("새 메모를 등록했습니다");
	}
</script>
</head>
<body background = "../images/background.jpg" onload="mini_calendar(null,null),big_calendar(null,null)">

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
	                    <input class="memo_button" type="submit" value="등록" onclick="add_memo();">
                    </form>
                  </div>
                  <div id="menu_check">
                      	<div id="all_schedule">
                 			<a href="">
							<img src="../images/all.png" alt="all_schedule">
							전체 일정 보기</a><br>
						</div>
                      
                      	<div id="show_important">
	                      	<a href="">
							<img src="../images/important.png" alt="important">
							중요 일정 보기</a><br>
						</div>
                      
                      	<div id="menu_delete">
                      		<a href="javascript:popupOpen();" >
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
	          <div id="memo_content" >
	         		<div id="write_top">
						기념일  ㅣ <a href="../calander/calander.jsp">캘린더로 돌아가기  </a>
					</div>
			          <table style="margin-top:20px;">
						<%for(int i=0;i<submit.size();i++){
			        			String save1 = submit.get(i);
			        			String save2 = time.get(i);
			        			String save3 = content.get(i);%>
			        		<tr>	
			        		<td><%=save1 %></td>
			        		<td><%=save2 %></td>
			        		<td><%=save3 %></td>
			        		</tr>
						<%}%>
					</table>     	
	          </div>

        <div id="footer">
            8조 - 박정현, 최기영, 하늘찬
        </div>
<script>
	function HideLeftMenu() {
		if (document.getElementById("menu_body").style.display == "none") {
			document.getElementById("menu_body").style.display = "block";
			document.getElementById("menu_hide").innerText = "◀";
			document.getElementById("memo_content").style.width = "79%";
		} else {
			document.getElementById("menu_body").style.display = "none";
			document.getElementById("menu_hide").innerText = "▶";
			document.getElementById("memo_content").style.width = "98%";
		}
	}
</script>

</body>
    </html>

