<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
<script language="javascript">
function closewindow() { 
    close(); 
}
</script>
</head>
<body>
<br><br>
<form method="post" name="form">
<center>
 <br/>
                
	<table border="1"  width="150%">
		<tr>
		    <td align=center style="background-color:#167277"><font size="2" ><b>Booking Number</b></font></td>
		    <td align=center style="background-color:#167277"><font size="2" ><b>Booked Date</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Booking for branch</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Booking Room Type</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Booked By</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Booking for person</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Booking for dept</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Purpose</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Meeting type</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>From date</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>To date</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>No of attendies</b></font></td>
			<td align=center style="background-color:#167277"><font size="2" ><b>Remarks</b></font></td>
		</tr>
	
		<%	    Connection con = null;
		ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
		String userName = dbProperties.getString("csdb.username");
		String password = dbProperties.getString("csdb.password");
		String url = dbProperties.getString("csdb.url");
		String driver = dbProperties.getString("csdb.driverName");
		String dbName = dbProperties.getString("csdb.dbName");

				int sumcount=0;
				Statement st=null;
				ResultSet rs=null;
				String date=request.getParameter("msg");

				try
				{
				Class.forName(driver).newInstance();
				con = DriverManager.getConnection(url+dbName,userName,password);
				String query = " SELECT DISTINCT `user_name`,`Booking_no`,`booked_date`,`booking_for_person`,`purpose`,`booking_room_type`,`meeting_type`,`from_date`, "+
				               "`from_time`,`to_date`,`to_time`,`no_of_attendies`,`remarks`,b.`branch_name`,"+
				               " d.`department_name` FROM `conference_room_booking` c "+
				               " INNER JOIN `leavemanagement`.`branchmaster` b on b.`branch_type_code` = c.`booking_for_branch`"+
				               " INNER JOIN `leavemanagement`.`department` d on d.`department_id` = c.`booking_for_dept`"+
				               " WHERE c.`from_date` = '"+date+"' AND c.`status`='Active' ";
				
				st = con.createStatement();
				rs = st.executeQuery(query);
				%>
				<%while(rs.next()){
				
					String meeting=rs.getString("meeting_type");
				
				%>
				<%if(meeting.equals("Video Conference")) {%>
				<tr>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("Booking_no")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("booked_date")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("branch_name")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("booking_room_type")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("user_name")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("booking_for_person")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("department_name")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("purpose")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("meeting_type")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("from_date")%>&nbsp<%=rs.getString("from_time")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("to_date")%>&nbsp<%=rs.getString("to_time")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("no_of_attendies")%></font></td>
				<td align=center style="background-color:#f9d5ca"><font size="2" ><%=rs.getString("remarks")%></font></td>
				
				</tr>
				<%} else if(meeting.equals("Audio Conference")){ %>
				<tr>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("Booking_no")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("booked_date")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("branch_name")%></font></td>
				<td align=center style="background-color:#fcefa4"><<font size="2" ><%=rs.getString("booking_room_type")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("user_name")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("booking_for_person")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("department_name")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("purpose")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("meeting_type")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("from_date")%>&nbsp<%=rs.getString("from_time")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("to_date")%>&nbsp<%=rs.getString("to_time")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("no_of_attendies")%></font></td>
				<td align=center style="background-color:#fcefa4"><font size="2" ><%=rs.getString("remarks")%></font></td>
				
				</tr>
				<%} else if(meeting.equals("Web-Ex Meeting")){ %>
				<tr>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("Booking_no")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("booked_date")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("branch_name")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("booking_room_type")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("user_name")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("booking_for_person")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("department_name")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("purpose")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("meeting_type")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("from_date")%>&nbsp<%=rs.getString("from_time")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("to_date")%>&nbsp<%=rs.getString("to_time")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("no_of_attendies")%></font></td>
				<td align=center style="background-color:#d0fca4"><font size="2" ><%=rs.getString("remarks")%></font></td>
				
				</tr>
				<%} else if(meeting.equals("General Meeting")){ %>
				<tr>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("Booking_no")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("booked_date")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("branch_name")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("booking_room_type")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("user_name")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("booking_for_person")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("department_name")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("purpose")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("meeting_type")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("from_date")%>&nbsp<%=rs.getString("from_time")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("to_date")%>&nbsp<%=rs.getString("to_time")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("no_of_attendies")%></font></td>
				<td align=center style="background-color:#f4dbf9"><font size="2" ><%=rs.getString("remarks")%></font></td>
					
				</tr>
				<%} else{ %>
				<tr>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("Booking_no")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("booked_date")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("branch_name")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("booking_room_type")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("user_name")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("booking_for_person")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("department_name")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("purpose")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("meeting_type")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("from_date")%>&nbsp<%=rs.getString("from_time")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("to_date")%>&nbsp<%=rs.getString("to_time")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("no_of_attendies")%></font></td>
				<td align=center style="background-color:#d5f2ee"><font size="2" ><%=rs.getString("remarks")%></font></td>
					
				</tr>
				<%}%>
				<%}%>
				<%} catch (SQLException ex) {
				    ex.printStackTrace();
				}	
				finally{
							}%>

	</table>
<br>
<input id="hiderow" type='submit' style="background-color:#5F9EA0;font-weight:bold;color:black;" value='Close Window' onclick="closewindow();">
</center>
</form>
</body>
</html>