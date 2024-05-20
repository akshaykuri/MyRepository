<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Circuit Id Details</title>

 <script type="text/javascript" src="http://oss.sheetjs.com/js-xlsx/xlsx.core.min.js" ></script>
    <script type="text/javascript" src="http://oss.sheetjs.com/js-xlsx/ods.min.js"></script>
    <script type="text/javascript" src="http://sheetjs.com/demos/Blob.js"></script>
    <script type="text/javascript" src="http://sheetjs.com/demos/FileSaver.js"></script>
    <script type="text/javascript" src="http://sheetjs.com/demos/Export2Excel.js"></script>
 <script>
function download() { 
        	  export_table_to_excel('mplsmasterdetails', 'xlsx' || 'xlsx');
        	 // closewindow();
        	  }
function closewindow() { 
    close(); 
}
        	  
</script> 

</head>
<body onload="download()">
<br><br>
<form method="post" name="form">
<center>
 <br />
             
	<table border="1" id="mplsmasterdetails"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="95%" >
		<tr>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Circuit ID</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Link Type</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Location</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>ISP Name</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>LAN Pool</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>WAN Pool</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Account/Relationship No</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>BandWidth</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Media</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>ARC</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>OTC</b></font></td>	
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Po Number</b></font></td>
		<td  bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Po Date</b></font></td>	  
	    </tr>
	
		<%  Connection con = null;
		    Connection2 dbConn = new Connection2();
		    con = dbConn.getConnection2(); 
			int sumcount=0;
			Statement st=null;
			ResultSet rs=null; 
			try
			{
			 
			String query = "select *,b1.b_name from circuitidmaster_details c INNER JOIN branch_master b1 ON b1.id=c.branch_id order by linktype_id";
			st = con.createStatement();
			rs = st.executeQuery(query);
	 %>
	<%while(rs.next()){%>
	<tr>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("circuit_Id")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("linktype_id")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("b_name")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("isp_name")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("lanpool")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("wanpool")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("Acc_relation_no")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("bandwidth")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("media")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("arc")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("otc")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("po_number")%></font></td>
	<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("po_date")%></font></td>
	 
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