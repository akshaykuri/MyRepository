<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title>Matrix for Life</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <%
    	System.out.println("-------------  Asm Invetory Back   -----------------");
	    String uid=request.getParameter("m_b_no");  
		String buffer="<select name='Subcity'  class='subBranch' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";
		String name=null;
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "csdb";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root"; 
		String password = "";
		    try{ 
		    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
		        conn = DriverManager.getConnection(url+dbName,userName,password);  
		        Statement stmt = conn.createStatement();  
		        ResultSet rs = stmt.executeQuery("select * from branch_master where (b_no='" + uid + "') ");
		        while(rs.next()){  
		        	buffer=buffer+"<option value='"+rs.getString(2)+"'>"+rs.getString(2)+"</option>"; 
		        	}   
		       buffer=buffer+"</select>"; 
		       response.getWriter().println(buffer); 
			  } catch(Exception e)
		                {   
			            System.out.println(e);
			            } 
		    	%>
	 
     </head>
</html>
