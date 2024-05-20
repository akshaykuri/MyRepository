<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BRANCH MASTER</title>
    <link rel='stylesheet' type='text/css' href='../../css/style.css' />
	<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />

<script language="javascript">
function editRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='DSCEdit.jsp?id='+id;    
f.submit();
}
function deleteRecord(id)
{    
	if(confirm('You are above to delete a DSC owner from Master'))
	{
var f=document.form;    
f.method="post";    
f.action='DSCDelete.jsp?id='+id;    
f.submit();
}
	else{}
}

</script>

<SCRIPT Language="Javascript">

/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function btnClick() { 
         close(); 
}
</script>
</head>
<body>

<br><br>
<form method="post" name="form">
<center>
     <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
	<td bgcolor="lightgrey" width="120" align=center colspan="13"><font size="3" color="black"><b>DSC OWNER MASTER</b></font></td>
	</tr>
		<tr>
		<td bgcolor="lightgrey" width="2" align=center><font size="2" color="black"><b>SL NO</b></font></td>
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
	
		<td id="hiderow" bgcolor="lightgrey" width="120" colspan="2" align=center><font size="2" color="black"><b>EDIT/DELETE</b></font></td>
		
		</tr>
	
		<%Connection con = null;
		ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
		String userName = dbProperties.getString("csdb.username");
		String password = dbProperties.getString("csdb.password");
		String url = dbProperties.getString("csdb.url");
		String driver = dbProperties.getString("csdb.driverName");
		String dbName = dbProperties.getString("csdb.dbName");
  /* String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password=""; */
int sumcount=0;
Statement st=null;
ResultSet rs=null; 
try
{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select id,cin_no,emp_code,owner_name,branch,department,scopeWork,Designation,rofficer,createdBy,DATE_FORMAT(createdDate,'%e-%m-%Y') as createdDate from dsc_owner_master ORDER BY owner_name ASC";
st = con.createStatement();
 rs = st.executeQuery(query);
 int i=1;
%>
<%while(rs.next()){%>
		
		<tr>
<td bgcolor="white" width="2" align="center"><font size="2" color="black"><%=i++%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(2)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(3)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(4)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(5)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(6)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(7)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(8)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(9)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(10)%></font></td>
<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=rs.getString(11)%></font></td>



<td id="hiderow" align="center"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td id="hiderow" align="center"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>

</tr>
		<%}%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,con);

			}%>

	</table>
	
	
<br>

<table width="165" align ="center" id="hiderow">
<tr>
<td align="left" id="hiderow"><input id="hiderow" type='submit' style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'></td>
<td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
</tr>

</table>



 

</center>
</form>
</body>



</html>