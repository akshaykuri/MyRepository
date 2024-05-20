<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@ page import="CON2.Connection2" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Group Email Details</title>
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
 <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="70%">
		<tr>
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Branch Name</b></font></td>	
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Group Name</b></font></td>		
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Employee Name</b></font></td>		       
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Employee Email Id</b></font></td>		              
	   </tr>
	
			<%
			    Connection con = null; 
			    Connection2 dbConn = new Connection2();
			    con = dbConn.getConnection2();
			    
				int sumcount=0;
				Statement st=null;
				ResultSet rs=null; 
				
				String bNo=(String)session.getAttribute("b_no");
				
				String groupName=request.getParameter("groupName");
				String branchId=request.getParameter("branchId");
	            String query=null;
            
			try
			{
			 
			//String query = "select * from ispoutageemailgroup_master ";
			 
				query = " select isp.id,b.m_b_name,i.groupName,b.id,isp.empName,isp.empEmail from ispoutageemailadd_master isp "+
		                " INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		                " INNER JOIN ispoutageemailgroup_master i ON i.id=isp.groupId"+
		                " where isp.branchId='"+branchId+"' AND  i.groupName='"+groupName+"' order by i.groupName ";
              
           
			st = con.createStatement();
			rs = st.executeQuery(query);
			%>
			<%while(rs.next()){%>
			<tr>
			<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(2)%></font></td>
			<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(3)%></font></td>
			<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(5)%></font></td>
			<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(6)%></font></td>
			</tr>
			<%}%>
			<%} catch (SQLException ex) {
			    ex.printStackTrace();
			}	
			finally{
						}%>

	</table>
<br>
<input id="hiderow" type='submit' style="background-color:white;font-weight:bold;color:black;" value='Close Window' onclick='closewindow();'>
</center>
</form>
</body>
</html>