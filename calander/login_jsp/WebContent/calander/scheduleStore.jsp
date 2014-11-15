<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	String id = request.getParameter("id");
	String date = request.getParameter("date");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if (errorMsgs.size() == 0) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("insert into schedule values(?,?,?,?)");
			stmt.setString(1, id);
			stmt.setString(2, date);	
			stmt.setString(3, title);
			stmt.setString(4, content);
			stmt.executeUpdate();
			
		}catch(SQLException e){
			errorMsg = "SQL 에러" + e.getMessage();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
			if(stmt != null)try{stmt.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
			if(conn != null)try{conn.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert New Schedule</title>
</head>
<body>
	<%String req = request.getHeader("REFERER");
	  response.sendRedirect(req);
	 %>
	
</body>
</html>