<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<script language="javascript" type="text/javascript">
function ChangeDesg(no)
{

document.getElementById('iddesg').value = no;
}
function btnClick() { 
    close(); 
}

function changeFunc()
{
	var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var selectedValue2 = selectBox.options[selectBox.selectedIndex].text;
    document.getElementById('iddesg').value = selectedValue;
    document.getElementById('iddesgg').value = selectedValue2;
}
</script>
<script language="javascript" type="text/javascript">
function rightFunc()
{
	var sz = document.forms['idform'].elements['right'];
    alert("Double Click radio button for RIGHTS");
	for (var i=0, len=sz.length; i<len; i++) {
	    sz[i].onclick = function() {
	        this.form.rights.value = this.value;
	    };
	}
}
function newinsFunc()
{
	var szz = document.forms['idform'].elements['newinsUser'];
    alert("Double Click radio button for Newins");
	for (var i=0, len=szz.length; i<len; i++) {
	    szz[i].onclick = function() {
	        this.form.newinsUsers.value = this.value;
	    };
	}
}
</script>
<form method="post" action="adminupdate.jsp" name="form" id="idform">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" >
	<tr>
		
			<td height="20" bgcolor="grey" width="100" align=center><font color="black" size="2">A-NAME</font></td>
			<td height="20" bgcolor="grey" width="100" align=center><font color="black" size="2">A-EMP-NO</font></td>
		<td bgcolor="grey" width="100" align=center><font color="black" size="2">A-ID</font></td>
		<td bgcolor="grey" width="100" align=center><font color="black" size="2">A-PWD</font></td>
		<td bgcolor="grey" width="100" align=center><font color="black" size="2">A-DESIGNATION</font></td>
		<td bgcolor="grey" width="100" align=center><font color="black" size="2">CODE</font></td>
		<td bgcolor="grey" width="120" align=center><font color="black" size="2">A-CITY</font></td>
		<td bgcolor="grey" width="120" align=center><font color="black" size="2">A-MAILID</font></td>
		<td bgcolor="grey" width="120" align=center><font color="black" size="2">DEPART</font></td>
		<td bgcolor="grey" width="120" align=center><font color="black" size="2">SUB-DEPART</font></td>
				<td bgcolor="grey" width="120" align=center><font color="black" size="2">RIGHTS</font></td>
				<td bgcolor="grey" width="120" align=center><font color="black" size="2">NEWINS USER</font></td>
		<td bgcolor="grey" width="120" align=center colspan="2"><font color="black" size="2">Update - Cancel</font></td>
		</tr>
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");


String no=request.getParameter("id");
//Class.forName("com.mysql.jdbc.Driver");
Connection conn=null;
Statement st=null,st2=null,st3=null,st21=null;
ResultSet rs=null,rs02=null,rs01=null,rs21=null;
//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 



String query2 ="select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc";
 st = conn.createStatement();
 rs02 = st.executeQuery(query2);
 String query21 ="select dept_name from department_master WHERE dept_name NOT LIKE '%IT%' ORDER BY dept_name Asc";
 st21 = conn.createStatement();
 rs21 = st21.executeQuery(query21);
 
String query3 = "select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc";
 st3 = conn.createStatement();
 rs01 = st3.executeQuery(query3);

  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	
  
  String query = "select * from login where id='"+no+"'";
   st2 = conn.createStatement();
   rs = st2.executeQuery(query);
  while(rs.next()){%>
  <tr>
     
      <td bgcolor=""><input name="Nname" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("Nname")%>"></td>
      <td bgcolor=""><input name="Nno" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("Nno")%>"></td>
      <td bgcolor=""><font color="black"><input readonly="readonly" name="UID" style="background-color:white;width:100;color:black;" value="<%=rs.getString("UID")%>"></font></td>
      <td bgcolor="" ><font color="black"><input type="text" name="UPWD" style="background-color:white;width:100;color:black;" value="<%=rs.getString("UPWD")%>"></font></td>
      <td bgcolor="" width="100"><font color="white"><%-- <input type="text" name="post" style="background-color:white;width:100;color:black;" value="<%=rs.getString("post")%>"> --%>
      <select id="selectBox" onchange="changeFunc(this.id);">
      <option value="<%=rs.getString("post")%>"><%=rs.getString("post")%> </option>
			<option value="">Select</option>
			<%while(rs01.next()){ %>
			
			<option value="<%=rs01.getString("DESG_NO")%>"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select>
     
      </font></td>
     <td>
     <input type="hidden" name="post" value="<%=rs.getString("post")%>" id="iddesgg"/>
     <input type="text" id="iddesg" name="DESG_NO" size="5" value="<%=rs.getString("DESG_NO")%>" readonly="readonly" /></td>
      <td bgcolor="" width="60"><font color="white"><%-- <input type="text" name="city" style="background-color:white;width:120;color:black;" value="<%=rs.getString("city")%>"> --%>
     <select name="city">
			<option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
			<%while(rs02.next()){ %>
			<%-- <option><%=rs02.getString("b_name")%></option> --%>
			<option ><%=rs02.getString(1)+" - "+rs02.getString(2)%> </option>
			<%} %>
		</select></font>
      
      </td>
        
      <td bgcolor="" width="100"><font color="white"><input type="text" name="Nmail" style="background-color:white;width:120;color:black;" value="<%=rs.getString("Nmail")%>"></font></td>
      
      
      <td bgcolor="" width="100"><font color="white"><%-- <input type="text" name="DEPT_NAME" style="background-color:white;width:120;color:black;" value="<%=rs.getString("DEPT_NAME")%>">--%>
      <select name="DEPT_NAME" >
      <option value="<%=rs.getString("DEPT_NAME")%>"><%=rs.getString("DEPT_NAME")%></option>
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
      
      <td bgcolor="">
      <input name="rights" id="idrights" style="background-color:white;width:100;color:black;" value="<%=rs.getString("rights")%>" readonly="readonly">
      <br>
      <input type="radio" name="right" value="4" onclick="rightFunc(this)"/><font size="1">Admin</font>
	  <input type="radio" name="right"  value="5" onclick="rightFunc(this)"/><font size="1">Super Admin</font>

      </td>
       <td bgcolor="">
      <input name="newinsUser" id="idnewins" style="background-color:white;width:100;color:black;" value="<%=rs.getString("newinsUser")%>" readonly="readonly">
      <br>
      <input type="radio" name="newinsUser" value="Yes" onclick="newinsFunc(this)"/><font size="1">Yes</font>
	  <input type="radio" name="newinsUser"  value="No" onclick="newinsFunc(this)"/><font size="1">No</font>

      </td>
      <td style = "display:none"><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
      <td align="left" id="hiderow"><input id="hiderow" type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
      </tr>
      <%}} catch (Exception e) {
 		 System.out.println(e);
		}
		finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs02,st2,null);
			DbUtil.closeDBResources(rs01,st3,null);
			}%>
     <tr> </tr>
      </table>
      </form>