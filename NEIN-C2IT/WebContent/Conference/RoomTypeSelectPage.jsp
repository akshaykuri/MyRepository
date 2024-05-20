<%@ page import = "java.util.ResourceBundle" %>
<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%String no=request.getParameter("branchid");  

System.out.println("ïn room page"+no);

String buffer="<select name='room' id='roomid'required style='font-size: 11px;width: 142px;overflow: auto;height: 20px'><option value='select'>Select</option>";  
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
try{ 
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");

	Class.forName(driver).newInstance();
	con= DriverManager.getConnection(url+dbName,userName,password); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("select Booking_For from booking_room_master WHERE branch_id ='"+no+"'");
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("Booking_For")+"'>"+rs.getString("Booking_For")+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
}catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,stmt,con);
	
} %>