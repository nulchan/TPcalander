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
	String submit = request.getParameter("submit");
	String content = request.getParameter("content");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String start_time = request.getParameter("start_time");
	String end_time = request.getParameter("end_time");
	String color = request.getParameter("color");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("insert into schedule values(?,?,?,?,?,?,?,?)");
		stmt.setString(1,id);
		stmt.setString(2,submit);
		stmt.setString(2,start);
		stmt.setString(2,end);
		stmt.setString(2,start_time);
		stmt.setString(2,end_time);
		stmt.setString(2,color);
		stmt.setString(2,submit);
		stmt.executeUpdate();
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
<title>Insert title here</title>
</head>
<body>
	<%String req = request.getHeader("REFERER");
	  response.sendRedirect(req);
	 %>
</body>
</html>