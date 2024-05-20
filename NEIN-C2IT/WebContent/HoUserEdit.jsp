<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<script type="text/javascript">
function btnClick() { 
    close(); 
}
</script>
<form method="post" action="HoUserUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-NAME</b></font></td>
		<td bgcolor="white" width="80" align=center><font color="black" size="2"><b>E-ID</b></font></td>
		<td bgcolor="white" width="80" align=center><font color="black" size="2"><b>E-PWD</b></font></td>
		<td bgcolor="white" width="80" align=center><font color="black" size="2"><b>E-EMP-ID</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-ADDRESS</b></font></td>
		<td bgcolor="white" width="120" align=center><font color="black" size="2"><b>E-CONTACT</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-POST</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-POSTING</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-MAILID</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-DESIG</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-REPORTING OFFICER</b></font></td>
		<td bgcolor="white" width="100" align=center colspan="3"><font color="black" size="2"><b>UPDATE CANCEL</b></font></td>
		</tr>
<%
String no=request.getParameter("id");
  
Connection conn=null;
Statement st=null,st2=null,st02=null,st3=null;
ResultSet rs=null,rs2=null,rs02=null,rs03=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
  
   String query2 ="select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc";
   st2 = conn.createStatement();
   rs02 = st2.executeQuery(query2);
   
   String query3 ="select DISTINCT Nname,EMP_NO from  formuser_master WHERE Npost <> 'IT SUPPORT' AND Npost <> 'SOFTWARE ENGINEER' AND Npost <> 'EXECUTIVE' ORDER BY Nname Asc";
   st3 = conn.createStatement();
   rs03 = st3.executeQuery(query3);
  
  
  
  String query = "select * from nentryho where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  while(rs.next()){%>
  <tr>
     
      <td bgcolor="#F0F0F0"><input readonly="readonly" name="Nname" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Nname")%>"></td>
      <td bgcolor="#F0F0F0"><font color="black"><input readonly="readonly" name="idd" style="background-color:#F0F0F0;width:80;color:black;" value="<%=rs.getString("idd")%>"></font></td>
      <td bgcolor="#F0F0F0" ><font color="black"><input type="text" name="Npwd" style="background-color:#F0F0F0;width:80;color:black;" value="<%=rs.getString("Npwd")%>"></font></td>
            <td bgcolor="#F0F0F0" ><font color="black"><input type="text" name="emp_no" style="background-color:#F0F0F0;width:80;color:black;" value="<%=rs.getString("EMP_NO")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Naddr" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Naddr")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Ncontact" style="background-color:#F0F0F0;width:120;color:black;" value="<%=rs.getString("Ncontact")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Npost" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Npost")%>"></font></td>

     <%--  <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="NpostingCo" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("NpostingCo")%>"></font></td> --%>
       <td bgcolor="" width="60"><font color="white"><%-- <input type="text" name="city" style="background-color:white;width:120;color:black;" value="<%=rs.getString("city")%>"> --%>
     <select name="NpostingCo">
			<option value="<%=rs.getString("NpostingCo")%>"><%=rs.getString("NpostingCo")%></option>
			<%while(rs02.next()){ %>
			<%-- <option><%=rs02.getString("m_b_name")%></option> --%>
			<option ><%=rs02.getString(1)+" - "+rs02.getString(2)%> </option>
			<%} %>
		</select></font>
      
      </td>
      <td bgcolor="#F0F0F0" width="100" ><font color="black"><input type="text" name="Nmail" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Nmail")%>"></font></td>
            <td bgcolor="#F0F0F0" width="100"><font color="black"><%-- <input type="text" name="extraDesig" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("extraDesig")%>"> --%>
             <select name="extraDesig">
			<option value="<%=rs.getString("extraDesig")%>"><%=rs.getString("extraDesig")%></option>
			<option value="SA">SA</option>
			<option value="SSA">SSA</option>
			<option value="SSSA">SSSA</option>
			
		</select>
            
            </font></td>
      <td bgcolor="" width="60"><font color="white">
     <select name="reportingOff">
			<option value="<%=rs.getString("reportingOff")%>"><%=rs.getString("reportingOff")%></option>
			<%while(rs03.next()){ %>
			
			<option ><%=rs03.getString(1)+"--"+rs03.getString(2)%> </option>
			<%} %>
		</select></font>
      
      </td>
      <td style="visibility: hidden;"><input type="hidden" name="id"  value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
            <td align="left" id="hiderow"><input id="hiderow" type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
      <%}} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs2,st2,null);
			DbUtil.closeDBResources(rs02,st02,null);
			DbUtil.closeDBResources(rs03,st3,null);
			} %>
      </table>
      </form>