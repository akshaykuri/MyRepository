<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>

<%@page import="CON2.NormalMailConference"%>
<%

String id=request.getParameter("id");
String cancelremarks=request.getParameter("remarks");
System.out.println("remarks==="+cancelremarks);
String empid=request.getParameter("empname");
int i=0;
try
{
	Connection conn = null;
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");



	Class.forName(driver).newInstance();
	conn= DriverManager.getConnection(url+dbName,userName,password);
	Statement st=null,st1=null;
	ResultSet rs=null;
	String msg=null;
	/* String query = "select id from asset_type where item_name='"+num+"'";
	st = conn.createStatement();
	rs = st.executeQuery(query);
	while(rs.next())
	     {
	 	 id= rs.getString(1);
	     }
	System.out.println(id);
 */	
 st1=conn.createStatement();
	 i=st1.executeUpdate("update conference_room_booking set status ='Inactive',Cancel_remarks='"+cancelremarks+"',cancelled_by='"+empid+"' where id ='"+id+"'");
	
	 String query="SELECT Booking_no,user_email,user_name,booking_room_type,cc,cancelled_by,Cancel_remarks FROM conference_room_booking WHERE id ='"+id+"' AND status ='Inactive'";
	 PreparedStatement prs3 = conn.prepareStatement(query);
	 rs = prs3.executeQuery();
	 if (rs.next())
	    {
			String Bookingid=rs.getString("Booking_no");
			String user_name=rs.getString("user_name");System.out.println("user_name----"+user_name);
			String usermail=rs.getString("user_email");
			String cc=rs.getString("cc");
			System.out.println("cc----"+cc);
			String booking_room_type=rs.getString("booking_room_type");
			
			 String body ="<html><body>" +
		        "<p>Hi" +
				"<p> The Booking With ID "+Bookingid+" is Cancelled by "+empid+" "+
				" for  due to Reason "+cancelremarks+""+  
				"</p>"+	
				"<h3 style='color:red;'>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
			    "<h3 style='color:red;'>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
				"<br></body></html>";
	
				String ToAdd=cc;
				String CCList ="";
				String from=usermail;
				// msg = "Conference_Room_Cancelled_Successfully";
				new NormalMailConference().sendMail(from,ToAdd,CCList,body,booking_room_type+" BOOKING IS CANCELLED");
				
			
		}
	 
	 response.sendRedirect("CancelBooking.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

