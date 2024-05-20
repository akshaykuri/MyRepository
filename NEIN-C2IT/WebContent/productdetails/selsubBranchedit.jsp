<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%String no=request.getParameter("count");  
String buffer="<select name='Subcity' onchange=\"Mail(this.value)\" style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";  
Connection con=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Statement stmt=null;
ResultSet rs=null;
try{ 
	Class.forName(driver).newInstance();
	con= DriverManager.getConnection(url+dbName,userName,password);  
 stmt = con.createStatement();  
 rs = stmt.executeQuery("select id,b_name from branch_master WHERE b_no='"+no+"' ORDER BY b_name Asc");
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
}catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,stmt,con);
	
} %>