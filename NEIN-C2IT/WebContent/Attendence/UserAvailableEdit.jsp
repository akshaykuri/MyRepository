<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="UserAvailableUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="120" align=center><font color="black" size="2">SYSTEM ADMIN</font></td>
		<td bgcolor="white" width="120" align=center><font color="black" size="2">TYPE</font></td>
		<td bgcolor="white" width="120" align=center><font color="black" size="2">LEAVE FROM</font></td>
		<td bgcolor="white" width="120" align=center><font color="black" size="2">LEAVE TO</font></td>
		<td bgcolor="white" width="120" align=center><font color="black" size="2">REMARKS</font></td>

<td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black" size="2">Update/Cancel</font></td>
			</tr>
<%
String no=request.getParameter("id");
  
System.out.println("ID :"+no);  
Connection conn=null;
Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;
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
      conn = DriverManager.getConnection(url+dbName,userName,password); 
   //SELECT a.about,a.name,DATE_FORMAT(a.date1,'%e/%M/%Y'),DATE_FORMAT(a.date2,'%e/%M/%Y') FROM availability a INNER JOIN nentryho n ON (a.name=n.Nname) WHERE n.DESG_NO='2' AND a.name LIKE '%"+SystemAdminName+"%' AND  DATE(NOW()) between a.date1 and a.date2
  String query = "select * from availability where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  
  String query2 = "select * from branch_master ORDER BY b_name Asc";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2);
  while(rs.next()){%>
  <tr>
     

      <td bgcolor=""><font color="black"><%=rs.getString("name")%></font></td>
      <td bgcolor=""><font color="black"><%=rs.getString("About")%></font></td>
      <td bgcolor=""><font color="black"><%=rs.getString("date1")%></font></td>
      <td bgcolor=""><font color="black"><%=rs.getString("date2")%></font></td>
      <td bgcolor=""><font color="black"><input name="remarks" style="background-color:white;width:180;color:black;" value="<%=rs.getString("feedback")%>" maxlength="199"></font></td>

      <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
      </tr>
      <%}%>

<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs2,st2,null);
			DbUtil.closeDBResources(rs02,st02,null);
			} %>
      </table>
      </form>