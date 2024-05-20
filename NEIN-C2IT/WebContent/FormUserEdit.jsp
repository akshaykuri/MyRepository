<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<script type="text/javascript">

function btnClick() { 
    close(); 
}
</script>
<script type="text/javascript">
function changeFunc()
{
	var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var selectedValue2 = selectBox.options[selectBox.selectedIndex].text;
    document.getElementById('iddesg').value = selectedValue;
    document.getElementById('iddesgg').value = selectedValue2;
}
</script>
<form method="post" action="FormUserUpdate.jsp">
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
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-DESG NO</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-POSTING</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-MAILID</b></font></td>
				<td bgcolor="grey" width="120" align=center><font color="black" size="2">DEPART</font></td>
		<td bgcolor="grey" width="120" align=center><font color="black" size="2">SUB-DEPART</font></td>
		<td bgcolor="white" width="100" align=center colspan="3"><font color="black" size="2"><b>UPDATE CANCEL</b></font></td>
		</tr>
<%
String no=request.getParameter("id");
  
Connection conn=null;
Statement st=null,st2=null,st3=null,st21=null;
ResultSet rs=null,rs02=null,rs01=null,rs21=null;
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
  
   String query3 = "select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc";
   st3 = conn.createStatement();
   rs01 = st3.executeQuery(query3);
   
   String query21 ="select dept_name from department_master WHERE dept_name NOT LIKE '%IT%' ORDER BY dept_name Asc";
   st21 = conn.createStatement();
   rs21 = st21.executeQuery(query21);
  String query = "select * from formUser_master where id='"+no+"'";
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
      <%-- <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Npost" style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Npost")%>"></font></td> --%>
      
      
          <td bgcolor="" width="100"><font color="white"><%-- <input type="text" name="post" style="background-color:white;width:100;color:black;" value="<%=rs.getString("post")%>"> --%>
      <select id="selectBox" onchange="changeFunc(this.id);">
      <option value="<%=rs.getString("Npost")%>"><%=rs.getString("Npost")%> </option>
			<option value="">Select</option>
			<%while(rs01.next()){ %>
			
			<option value="<%=rs01.getString("DESG_NO")%>"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select>
     
      </font></td>
     <td>
     <input type="hidden" name="Npost" value="<%=rs.getString("Npost")%>" id="iddesgg"/>
     <input type="text" id="iddesg" name="DESG_NO" size="5" value="<%=rs.getString("DESG_NO")%>" readonly="readonly" /></td>
     
     
     
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
      
      
       <td bgcolor="" width="100"><font color="white"><%-- <input type="text" name="DEPT_NAME" style="background-color:white;width:120;color:black;" value="<%=rs.getString("DEPT_NAME")%>">--%>
      <select name="DEPT_NAME" >
      <option value="<%=rs.getString("deptName")%>"><%=rs.getString("deptName")%></option>
			<!-- <option onclick="hideHigherTR();"  value="0">Select</option> -->
		    <option onclick="hideHigherTR();"  value="IT">IT</option>
			<option onclick="showHigherTR();" value="NON">NON</option>
	  </select>
      </font> 
      </td>
      <td bgcolor="" width="100"><font color="white"><%-- <input type="text" name="subDept" style="background-color:white;width:120;color:black;" value="<%=rs.getString("subDept")%>"> --%>
      
      
      <select name="subDept">
			<option value="<%=rs.getString("subDept")%>"><%=rs.getString("subDept")%></option>
			<%while(rs21.next()){%>
			<option ><%=rs21.getString(1)%> </option>
			<%} %>
		</select>
      </font></td>
      
      <td style="visibility: hidden;"><input type="hidden" name="id"  value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
            <td align="left" id="hiderow"><input id="hiderow" type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
      <%}} catch (SQLException ex) {
    	    // Exception handling stuff
          ex.printStackTrace();
  } finally {
  	DbUtil.closeDBResources(rs,st,null);
  	DbUtil.closeDBResources(null,null,conn );
  	DbUtil.closeDBResources(rs02,st2,null );

  }%>
      </table>
      </form>