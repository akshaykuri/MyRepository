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
String name=request.getParameter("count");  
System.out.println("NAME -------------------------------------------------:"+name);
String buffer="";  
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select DISTINCT pt_fullDescription from prob_type_master_sub where pt_descriptions='"+name+"' ");    
while(rs.next()){  
	    //buffer =buffer+"Mail Id: "+rs.getString(1);
	buffer =buffer+rs.getString(1);
	}   
System.out.println("pt_fullDescription -------------------------------------------------:"+buffer);
response.getWriter().println(buffer); 
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			}
 %>