<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<script language="javascript" type="text/javascript">
function ChangeDesg(no)
     { 
     document.getElementById('iddesg').value = no;
     }
function btnClick()
     { 
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
<html>
<body>
<form method="post" action="systembackupusereditback.jsp" name="form" id="idform">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" >
	 <tr>
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>EMPNO</b></font></td>
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>EMP-NAME</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>DEPATMENT</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>BRANCH</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>SUB_BRANCH</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>CONTACT NO</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>SYSTEM_TYPE</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>SYSTEM_NO</b></font></td>
		<td bgcolor="white" width="120" align=center colspan="2"><font color="black" size="2">Update - Cancel</font></td>
	 </tr>
<%
String no=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=null;
Statement st=null,st2=null,st3=null,st21=null;
ResultSet rs=null,rs02=null,rs01=null,rs21=null;
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
String query2 ="select b_name from branch_master ORDER BY b_name Asc";
st = conn.createStatement();
rs02 = st.executeQuery(query2);
int sumcount=0;
  try 
     {
	 String query = "select * from systemuserbackup where empno='"+no+"'";
     st2 = conn.createStatement();
     rs = st2.executeQuery(query);
     while(rs.next()){%>
     <tr>
         <td bgcolor=""><input name="empno" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("empno")%>"></td>
         <td bgcolor=""><input name="empname" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("empname")%>"></td>
         <td bgcolor=""><font color="black"><input readonly="readonly" name="desg" style="background-color:white;width:100;color:black;" value="<%=rs.getString("desg")%>"></font></td>
         <td bgcolor="" ><font color="black"><input readonly="readonly" type="text" name= "dept" style="background-color:white;width:100;color:black;" value="<%=rs.getString("dept")%>"></font></td>
         <td bgcolor="" ><font color="black"><input readonly="readonly" type="text" name= "branch" style="background-color:white;width:100;color:black;" value="<%=rs.getString("branch")%>"></font></td>
         <td>      <select name="subbranch">
			         <option value="<%=rs.getString("subbranch")%>"><%=rs.getString("subbranch")%></option>
			          <%while(rs02.next()){ %>
			             <option ><%=rs02.getString(1)%> </option>
		             	<%} %>
		           </select></font>
        </td>
        <td bgcolor=""><input name="cono" readonly="readonly" style="background-color:white;width:100;color:black;" value="<%=rs.getString("contactno")%>"></td>
         <td>      <select name="systype">
			          <option value="<%=rs.getString("lapdesk")%>"><%=rs.getString("lapdesk")%></option>
			          <option  value="LAPTOP">LAPTOP</option>
			          <option  value="DESKTOP">DESKTOP</option>
			      </select></font>
        </td>
      <td bgcolor=""><font color="black"><input  name="sysno" style="background-color:white;width:100;color:black;" value="<%=rs.getString("sysno")%>"></font></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
      <td align="left" id="hiderow"><input id="hiderow" type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
    </tr>
      <%}} catch (Exception e) {
 		 System.out.println(e);
		}
		finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs02,st2,null);
			}%>
     </table>
  </form>
</body>
</html>