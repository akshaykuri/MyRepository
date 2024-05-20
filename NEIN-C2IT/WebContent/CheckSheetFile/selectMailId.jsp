<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String name=request.getParameter("count");  
String buffer=""; 
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try{ Class.forName(driver).newInstance();
Connection con = DriverManager.getConnection(url+dbName,userName,password); 
Statement stmt = con.createStatement();  
ResultSet rs = stmt.executeQuery("Select DISTINCT mail_id from emp where emp_name='"+name+"' ");    
while(rs.next()){  
	    //buffer =buffer+"Mail Id: "+rs.getString(1);
	buffer =buffer+rs.getString(1);
	}   
 
response.getWriter().println(buffer); 
} catch(Exception e){   
	System.out.println(e); } %>