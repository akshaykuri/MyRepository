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
System.out.println("wat this no   "+no);
String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>";
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select * from nentryho where DESIGNATION='"+no+"' ORDER BY Nname");    
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