<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String no=request.getParameter("count"); 
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
System.out.println("Count number : "+no);
String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>";   
try{ Class.forName(driver).newInstance();
Connection con = DriverManager.getConnection(url+dbName,userName,password); 
Statement stmt = con.createStatement();  
//ResultSet rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ");  
//ResultSet rs = stmt.executeQuery("SELECT DISTINCT EMP_NAME FROM emp INNER JOIN assigned_master a ON(emp.EMP_NAME=a.Locname) WHERE Locpost='"+no+"'");
ResultSet rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ");   
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("EMP_NAME")+"'>"+rs.getString("EMP_NAME")+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
} catch(Exception e){   
	System.out.println(e); } %>