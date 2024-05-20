<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String name=request.getParameter("count");  
String buffer="";  
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select DISTINCT file_name, file_path, file_size, uploaded_by, created_date "+
		 "FROM file_supporting_upload from file_supporting_upload where form_no='"+name+"' ");    
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