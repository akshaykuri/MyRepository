<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="ProbUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="120" align=center><font color="black">PROBLEM TYPE</font></td>
<!-- 	<td bgcolor="white" width="120" align=center><font color="black">LOCATION</font></td> -->
	<td bgcolor="white" width="120" align=center><font color="black">DEPARTMENT</font></td>
<td style="visibility: hidden;" ></td>
<td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>

			</tr>
<%
String no=request.getParameter("id");

Connection conn=null;
Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;
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
       String query = "select * from prob_master where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  
/*   String query2 = "select * from branch_master ORDER BY b_name Asc";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2); */
  while(rs.next()){%>
  <tr>
     
      <td bgcolor=""><input name="p_type" style="background-color:white;width:100;color:black;" value="<%=rs.getString("p_type")%>"></td>
      
<%-- <td bgcolor=""><font color="white">
      <select name="bkLocation">
		<option value="<%=rs.getString("bkLocation")%>"><%=rs.getString("bkLocation")%></option> 
			<%while(rs2.next()){ %>
			
			<option><%=rs2.getString("b_name")%></option>
			<%} %>
		</select>
      </font></td> --%>
      <td bgcolor=""><font color="white">
      <select name="department">
      <option value="<%=rs.getString("department")%>"><%=rs.getString("department")%></option> 
		<option value="IT SUPPORT">IT SUPPORT</option> 
		<option value="OFFICE ADMINISTRATION">OFFICE ADMINISTRATION</option> 
		<option value="SOFTWARE DEVELOPMENT">SOFTWARE DEVELOPMENT</option> 
		</select>
      </font></td>
      <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
      <%}%><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs2,st2,null);
			DbUtil.closeDBResources(rs02,st02,null);
			} %>
      </table>
      </form>