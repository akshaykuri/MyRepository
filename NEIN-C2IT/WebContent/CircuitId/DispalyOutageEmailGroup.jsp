<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@ page import="CON2.Connection2" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Group Details</title>
<script language="javascript">
function edit(id)
    {  	 
    var f=document.form;    
    f.method="post";    
    f.action='EditOutageEmailGroup.jsp?id='+id;    
    f.submit();
    }
function deleter(id)
    {   	 
	if(confirm('confirm to Delete'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='DeleteIspOutageEmailGroupMaster.jsp?group='+id;    
           f.submit();
          }
	else{}
   }
   
function closewindow() { 
    close(); 
}
</script>
<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
   %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
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
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Branch Name</b></font></td>	
		<td height="20" bgcolor="white" width="150" align=center style="background-color:grey"><font size="2" color="black"><b>Group Name</b></font></td>		       
	    <td bgcolor="white" width="30" align=center style="background-color:grey"><font size="2" color="black"><b>Edit</b></font></td>
	     <td bgcolor="white" width="30" align=center style="background-color:grey"><font size="2" color="black"><b>Delete</b></font></td>
		</tr>
	
			<%
			    Connection con = null; 
			    Connection2 dbConn = new Connection2();
			    con = dbConn.getConnection2();
			    
				int sumcount=0;
				Statement st=null;
				ResultSet rs=null; 
				
				String bNo=(String)session.getAttribute("b_no");
	            String query=null;
            
			try
			{ 
			 
                query = "select isp.id,b.m_b_name,isp.groupName,b.id from ispoutageemailgroup_master isp "+
		                "INNER JOIN branch_master_main b ON b.id=isp.branchId"+
		                " where branchId IN (select b1.id from branch_master_main b1) ORDER BY groupName";
             
           
			st = con.createStatement();
			rs = st.executeQuery(query);
			%>
			<%while(rs.next()){%>
			<tr>
			<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(2)%></font></td>
			<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString(3)%></font></td>
			<td bgcolor="white" width="30">
			<font size="2" color="blue"><a  onclick="return edit('<%=rs.getString(1)%>')">EDIT</a></font></td>
			<td bgcolor="white" width="30">
			<%-- <font size="2" color="blue"><a onclick="return deleter('<%=rs.getString(1)%>')">DELETE</a></font> --%></td>
			
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