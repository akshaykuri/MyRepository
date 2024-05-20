<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("leavemanagement");
String userName = dbProperties.getString("leavemanagement.username");
String password = dbProperties.getString("leavemanagement.password");
String url = dbProperties.getString("leavemanagement.url");
String driver = dbProperties.getString("leavemanagement.driverName");
String dbName = dbProperties.getString("leavemanagement.dbName");

ResourceBundle dbProperties1 = ResourceBundle.getBundle("csdb");
String url1 = dbProperties1.getString("csdb.url");
String dbName1 = dbProperties1.getString("csdb.dbName");

String name=request.getParameter("count");  
String buffer="";  
Connection con=null,con1=null;
Statement stmt=null,stmt1=null;
ResultSet rs =null,rs1=null;
try{
 Class.forName(driver).newInstance();
 con = DriverManager.getConnection(url+dbName,userName,password); 
  con1 = DriverManager.getConnection(url1+dbName1,userName,password); 
 
  String empno="";
  stmt1 = con1.createStatement();  
  rs1 = stmt1.executeQuery("Select DISTINCT EMP_NO from emp where emp_name='"+name+"' ");    
  if(rs1.next()){
	  empno =rs1.getString(1);
  }
 
 
 
 
 
 
 
 
 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select DISTINCT email from user where emp_id='"+empno+"' ");    
while(rs.next()){  
	    //buffer =buffer+"Mail Id: "+rs.getString(1);
	buffer =buffer+rs.getString(1);
	}   
 
response.getWriter().println(buffer); 
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			}
 %>