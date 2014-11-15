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
	List<String> memo = new ArrayList<String>();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT *FROM users join memo on users.id = memo.id WHERE users.id=?");
		stmt.setString(1,id);
		rs = stmt.executeQuery();
		while(rs.next()){
			memo.add(rs.getString("memo"));
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
<meta charset="EUC-KR">
<title>메모 모아보기</title>
<link href="../stylesheets/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	 <div id="wrap">
    	<div id="top">
    		안녕하세요. <b><%=session.getAttribute("id") %></b>님 ||
    		<a href="../login/logout.jsp">로그아웃하기</a>
    	</div>
        <div id="header">
            Calander - 8조       
        </div>
        <div id="menu">
            <div id="menu_body">
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
	                    <textarea cols="36" rows="10" name="memo" id="memo" placeholder="이 곳에 메모를 입력 할 수 있습니다"></textarea>
	                    </div>
	                    <input class="memo_button" type="submit" value="등록">
                    </form>
                  </div>
                  <div id="menu_check">
                      <a href="">전체 일정 보기</a></br>
                      <a href="">중요 일정 보기</a></br>
                      <a href="">오래된 일정 삭제</a></br>
                      <a href="../calander/show_memo.jsp">메모 모아보기</a>
                  </div>
            </div>
            <div id="menu_hide" onclick="HideLeftMenu();">
                <a href="">◀</a>
            </div>
        </div>
        </div id="memo content">
        	<ul>
        	<% for(String content: memo) { %>
 						<li><%=content %></li>
 					<%} %>
 			</ul>
        </div>
        <div id="footer">
            8조 - 박정현, 최기영, 하늘찬
        </div>
    </div>
</body>
</html>

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