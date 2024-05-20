<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="DSCUpdate.jsp">
<br />
<br /><br />
<%String SessionName=null,SessionDesg=null;
SessionName = (String) session.getAttribute("Nname");%>
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>CIN NO</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>EMP CODE</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>OWNER NAME</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>BRANCH</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>DEPARTMENT</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>SCOPE OF WORK</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>REPORTING OFFICER</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>CREATED BY</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>CREATED DATE</b></font></td>
		
	

			</tr>
<%
String no=request.getParameter("id");
Connection conn=null;
Statement st=null,st2=null,st3=null,st4=null,st5=null;
ResultSet rs=null,rs2=null,rs3=null,rs4=null,rs5=null;
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
  String query = "select id,cin_no,emp_code,owner_name,branch,department,scopeWork,rofficer,Designation,createdBy,DATE_FORMAT(createdDate,'%e-%m-%Y') as createdDate from  dsc_owner_master where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
   
   String query2 = "select b_name,b_location from branch_master ORDER BY b_name Asc";//branch
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2);
   
   String query3 = "select dept_name from department_master ORDER BY dept_name Asc";//department
   st3 = conn.createStatement();
   rs3 = st3.executeQuery(query3);
   
   String query4 = "select DESIGNATION from desg ORDER BY DESIGNATION Asc";//Designation
   st4 = conn.createStatement();
   rs4 = st4.executeQuery(query4);
   
   String query5 = "select DISTINCT Nname from  formuser_master WHERE Npost <> 'IT SUPPORT' AND Npost <> 'SOFTWARE ENGINEER' AND Npost <> 'EXECUTIVE' ORDER BY Nname Asc";//Rofficer
   st5 = conn.createStatement();
   rs5 = st5.executeQuery(query5);
   
   
  while(rs.next()){%>
  <tr>

<td bgcolor="white" width="100"><font size="2" color="black">
<input type="hidden" name="sessionName" value="<%=SessionName%>" />
<input name="cin_no" style="background-color:white;width:100;color:black;" value="<%=rs.getString("cin_no")%>"></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><input name="emp_code" style="background-color:white;width:100;color:black;" value="<%=rs.getString("emp_code")%>"></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><input name="owner_name" style="background-color:white;width:100;color:black;" value="<%=rs.getString("owner_name")%>"></font></td>
<td bgcolor="white" width="100"><font size="2" color="black">
 <select name="branch">
			<option value="<%=rs.getString("branch")%>"><%=rs.getString("branch")%></option>
			<%while(rs2.next()){%>
			<option ><%=rs2.getString(1)%> </option>
			<%} %>
		</select>
<%-- <input name="branch" style="background-color:white;width:100;color:black;" value="<%=rs.getString("branch")%>"> --%>
</font></td>
<td bgcolor="white" width="100"><font size="2" color="black">
<%-- <input name="department" style="background-color:white;width:100;color:black;" value="<%=rs.getString("department")%>"> --%>
<select name="department">
			<option value="<%=rs.getString("department")%>"><%=rs.getString("department")%></option>
			<%while(rs3.next()){%>
			<option ><%=rs3.getString(1)%> </option>
			<%} %>
		</select>

</font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><input name="scopeWork" style="background-color:white;width:100;color:black;" value="<%=rs.getString("scopeWork")%>"></font></td>
<td bgcolor="white" width="100"><font size="2" color="black">
<%-- <input name="Designation" style="background-color:white;width:100;color:black;" value="<%=rs.getString("Designation")%>"> --%>
<select name="Designation">
			<option value="<%=rs.getString("Designation")%>"><%=rs.getString("Designation")%></option>
			<%while(rs4.next()){%>
			<option ><%=rs4.getString(1)%> </option>
			<%} %>
		</select>
</font></td>
<td bgcolor="white" width="100"><font size="2" color="black">
<%-- <input name="Rofficer" style="background-color:white;width:100;color:black;" value="<%=rs.getString("Rofficer")%>"> --%>
<select name="Rofficer">
			<option value="<%=rs.getString("Rofficer")%>"><%=rs.getString("Rofficer")%></option>
			<%while(rs5.next()){%>
			<option ><%=rs5.getString(1)%> </option>
			<%} %>
		</select>
</font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><input name="" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("createdBy")%>"></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><input name="" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("createdDate")%>"></font></td>


     
      <td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
      <td align="left" id="hiderow"><input id="hiderow" type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
      <%}%>
      <%
  } catch (SQLException ex) {
	    ex.printStackTrace();
	}	


	finally{
		DbUtil.closeDBResources(rs,st,null);
		DbUtil.closeDBResources(rs2,st2,null);
		DbUtil.closeDBResources(rs3,st3,null);
		DbUtil.closeDBResources(rs4,st4,null);
		DbUtil.closeDBResources(rs5,st5,conn);
		

				}
      %>
      </table>
      </form>