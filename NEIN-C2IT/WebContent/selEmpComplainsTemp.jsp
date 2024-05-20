<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String no=request.getParameter("count"); 

System.out.println("Count number : "+no);
String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>";   
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
 stmt = con.createStatement();  
//ResultSet rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ");  
 //rs = stmt.executeQuery("SELECT DISTINCT EMP_NAME FROM emp INNER JOIN assigned_master a ON(emp.EMP_NAME=a.Locname) WHERE Locpost='"+no+"' ORDER BY EMP_NAME");
 rs = stmt.executeQuery("SELECT DISTINCT Nname FROM nentryho WHERE Npost='"+no+"' ORDER BY Nname ASC");
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("Nname")+"'>"+rs.getString("Nname")+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			} %>