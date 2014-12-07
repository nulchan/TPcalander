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
	String userid = "";
	String userpwd = "";
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if (errorMsgs.size() == 0) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("SELECT *FROM users WHERE id=? AND password=?");
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			rs = stmt.executeQuery();
			if(rs.next()){
				userid = rs.getString("id");
				userpwd = rs.getString("password"); 
			}
		}catch(SQLException e){
			errorMsg = "SQL 에러" + e.getMessage();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
			if(stmt != null)try{stmt.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
			if(conn != null)try{conn.close();}catch(SQLException e){errorMsg = "SQL 에러" + e.getMessage();}
		}
	}
%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>HCP calendar</title>

</head>
<body>
<%
	if (id == null || pwd == null || id.length() == 0 || pwd.length() == 0) {
%>
	<div class="error">
		<script type="text/javascript">
			alert("아이디와 비밀번호를 입력하세요");
			location.href=("../login/login.jsp");
	    </script>
	</div>
<%
	}else if (id.equals(userid) && pwd.equals(userpwd)) {
		session.setAttribute("id", userid);
		session.setAttribute("pwd", userpwd);	
		response.sendRedirect("../calander/calander.jsp");	      
	}else{%>
	<div class="error">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호 오류입니다.");
			location.href=("../login/login.jsp");
	    </script>
	</div>
<% }%>
</body>
</html>


