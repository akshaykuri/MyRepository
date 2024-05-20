<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="bomuserupdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-NAME</b></font></td>
		<td bgcolor="white" width="80" align=center><font color="black" size="2"><b>E-ID</b></font></td>
		<td bgcolor="white" width="80" align=center><font color="black" size="2"><b>E-PWD</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-ADDRESS</b></font></td>
		<td bgcolor="white" width="120" align=center><font color="black" size="2"> <b>E-CONTACT</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-POST</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-POSTING</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-MAILID</b></font></td>
		
		</tr>
<%
String no=request.getParameter("id");
  
  
 
  int sumcount=0;
  ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      Connection conn = DriverManager.getConnection(url+dbName,userName,password); 
  String query = "select * from nentrybom where id='"+no+"'";
  Statement st = conn.createStatement();
  ResultSet rs = st.executeQuery(query);
  while(rs.next()){%>
  <tr>
     
      <td bgcolor="#F0F0F0"><input name="Nname" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Nname")%>"></td>
      <td bgcolor="#F0F0F0"><font color="black"><input name="idd" style="background-color:#F0F0F0;width:80;color:black;" value="<%=rs.getString("idd")%>"></font></td>
      <td bgcolor="#F0F0F0" ><font color="black"><input type="text" name="Npwd" style="background-color:#F0F0F0;width:80;color:black;" value="<%=rs.getString("Npwd")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Naddr" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Naddr")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Ncontact" style="background-color:#F0F0F0;width:120;color:black;" value="<%=rs.getString("Ncontact")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Npost" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Npost")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="NpostingCo" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("NpostingCo")%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Nmail" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Nmail")%>"></font></td>
      <td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td></tr>
      <%}}catch(Exception e){}%>
      </table>
      </form>