<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Cartridge Details</title>
<script language="javascript">
function editRecord(id)
    {  
	//alert(id);
    var f=document.form;    
    f.method="post";    
    f.action='EditCatridgeMaster.jsp?id='+id;    
    f.submit();
    }
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('confirm to Delete'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='DeleteCatridgeMaster.jsp?id='+id;    
           f.submit();
          }
	else{}
   }
   
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
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="60%">
		<tr>
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Printer Name</b></font></td>	
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Cartridge Model</b></font></td>	
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Cost</b></font></td>	       
	    <td bgcolor="white" width="30" align=center style="background-color:grey"><font size="2" color="black"><b>EDIT</b></font></td>
	     <td bgcolor="white" width="30" align=center style="background-color:grey"><font size="2" color="black"><b>DELETE</b></font></td>
		</tr>
	
		<%
			
				Connection con = null;
				Connection2 dbConn = new Connection2();
				con = dbConn.getConnection2();
				
				int sumcount=0;
				Statement st=null;
				ResultSet rs=null; 
				try
				{
				
				String query = "select * from catridge_master";
				st = con.createStatement();
				rs = st.executeQuery(query);
		%>
		<%      while(rs.next()){%>
		<tr>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(2)%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(3)%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(4)%></font></td>
		<td bgcolor="white" width="30">
		<font size="2" color="blue"><a  onclick="return editRecord(<%=rs.getString(1)%>)">EDIT</a></font></td>
		<td bgcolor="white" width="30">
		<%-- <font size="2" color="blue"><a onclick="return deleteRecord(<%=rs.getString(1)%>)">DELETE</a></font> --%></td>
		
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