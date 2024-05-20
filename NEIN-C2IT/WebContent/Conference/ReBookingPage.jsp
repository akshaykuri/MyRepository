<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%

String bookingno=request.getParameter("id");
String fromdate=request.getParameter("id");
String todate=request.getParameter("id");
String fromtime=request.getParameter("id");
String totime=request.getParameter("id");

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
	ResultSet rs=null,rs1=null;
	PreparedStatement prs = null;
	
	prs = conn.prepareStatement("select * from conference_room_booking where(from_date>='" + fromdate + "' && from_time>='" + fromtime + "' && to_date<='" + todate + "'&& to_time<='" +totime + "' && status='Active'); ");
	rs1 = prs.executeQuery();
	if(rs1.next())
    {%> 
            <script language="javascript"> //Java Script alert message 
            alert("BOOKING_ALREADY_DONE_IN_THIS_DATE_AND_TIME......PLEASE__DO__NEW_BOOKING");
            window.history.back();
            </script> 
	<%}
	else
	{
     st1=conn.createStatement();
	 i=st1.executeUpdate("update conference_room_booking set status='Active',Cancel_remarks='null' where Booking_no='"+bookingno+"'");
	
	String msg="YOUR_CANCELLED_BOOKING_IS_REBOOKED_AGAIN";
	 
    response.sendRedirect("SearchCancelBooking.jsp?msg="+msg);
	}
}
catch(Exception e)
{
	System.out.println(e);
}%>

