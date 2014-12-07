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
	String time = request.getParameter("start");
	int s_year = 0;
	int s_month = 0;
	s_year = Integer.parseInt(time.substring(0, 4));
	s_month = Integer.parseInt(time.substring(5, 7));
	List<String> start = new ArrayList<String>();
	List<Integer> year = new ArrayList<Integer>();
	List<Integer> month = new ArrayList<Integer>();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("select start from schedule");
		rs = stmt.executeQuery();
		while(rs.next()){
			start.add(rs.getString("start"));
		}
		stmt.close();
		rs.close();
		for(int i=0;i<start.size();i++){
			year.add(Integer.parseInt(start.get(i).substring(0, 4)));
			month.add(Integer.parseInt(start.get(i).substring(5,7)));
		}
		for(int i=0;i<year.size();i++){
			if(year.get(i) < s_year){
				stmt = conn.prepareStatement("delete from schedule where start =?");
				stmt.setString(1,start.get(i));
				stmt.executeUpdate();
				stmt.close();
			}else{
				if(month.get(i) < s_month){
					stmt = conn.prepareStatement("delete from schedule where start =?");
					stmt.setString(1,start.get(i));
					stmt.executeUpdate();
					stmt.close();
				}
			}
		}
	}catch(SQLException e){
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
<title>HCP calendar</title>
</head>
<body>
	<script type="text/javascript">
	 	alert("삭제되었습니다");
		parent.location.replace("../calander/calander.jsp");
 	</script>
</body>
</html>
