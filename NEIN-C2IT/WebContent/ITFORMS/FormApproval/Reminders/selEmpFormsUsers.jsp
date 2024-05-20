<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");


String no=request.getParameter("count"); 
String Name=null;
Name = (String) session.getAttribute("Nname");
String b_no = (String) session.getAttribute("b_no");
System.out.println("Count number : "+no);
System.out.println("NAME from Ajax : "+Name);
//Count number : HO-FINANCE/ACCOUNTS
//NAME from Ajax : Prasanna Kumar
String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>";   
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
 stmt= con.createStatement();  
 rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ");  
//ResultSet rs = stmt.executeQuery("SELECT DISTINCT EMP_NAME FROM emp INNER JOIN assigned_master a ON(emp.EMP_NAME=a.Locname) WHERE Locpost='"+no+"'");
 //rs = stmt.executeQuery("Select DISTINCT EMP_NAME from emp where DESIGNATION='"+no+"' AND EMP_NAME <> '"+Name+"' AND SUBSTRING(e_city,-2)='"+b_no+"'");
//ResultSet rs = stmt.executeQuery("Select DISTINCT EMP_NAME from emp where DESIGNATION='"+no+"' AND EMP_NAME <> '"+Name+"'");
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("EMP_NAME")+"'>"+rs.getString("EMP_NAME")+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
} catch(Exception e){   
	System.out.println(e); }
finally{
	 DbUtil.closeDBResources(rs,stmt,con);
}
%>
