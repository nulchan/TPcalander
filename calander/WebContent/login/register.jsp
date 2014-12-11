<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%
	String errorMsg = null;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	List<String> errorMsgs = new ArrayList<String>();
	String dbUrl = "jdbc:mysql://localhost:3306/member_data";
	String dbUser = "login";
	String dbPassword = "12345";
	
	request.setCharacterEncoding("utf-8");
	String join_id = request.getParameter("join_id");
	String join_pwd = request.getParameter("join_pwd");
	String join_pwd2 = request.getParameter("join_pwd2");
	if (join_id == null || join_id.trim().length() == 0) {
		if (join_id == null || join_id.trim().length() == 0) {
			errorMsgs.add("ID를 입력해주세요");
		}
		if (!join_pwd.equals(join_pwd2)) {
			errorMsgs.add("비밀번호를 다시확인해주세요");
		}
	}
	if (errorMsgs.size() == 0) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("insert into users values(?,?)");
			stmt.setString(1,join_id);
			stmt.setString(2, join_pwd);
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
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>HCP calendar</title>
</head>
<body>
	<%String req = request.getHeader("REFERER");
	  response.sendRedirect(req);
	 %>
</body>
</html>