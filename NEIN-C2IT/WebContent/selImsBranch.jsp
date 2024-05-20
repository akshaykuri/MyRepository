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
Object city=null;
city = session.getAttribute("NpostingCo"); 
%>
<%String no=request.getParameter("count");
String city2=request.getParameter("city");
System.out.println("no11111111  :  "+no);
System.out.println("CITYY111111  :  "+city);
String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>";  

Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ORDER BY EMP_NAME ");   
//ResultSet rs = stmt.executeQuery("Select DISTINCT e.EMP_NAME from emp where l.post=e.DESIGNATION AND e.DESIGNATION='"+no+"' AND l.city ='"+city2+"' ORDER BY e.EMP_NAME ASC");
//ResultSet rs = stmt.executeQuery("Select DISTINCT EMP_NAME from emp where DESIGNATION='"+no+"' AND e_city ='"+city2+"' ORDER BY EMP_NAME ASC");

while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("EMP_NAME")+"'>"+rs.getString("EMP_NAME")+"</option>"; 
	System.out.println("EMP NAME we are getting ::: "+rs.getString("EMP_NAME"));
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			}%>