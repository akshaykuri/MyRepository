<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMPLOYEE STATUS FORM (MAA)</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>



<script language="javascript">
function editRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='MaaUserEdit.jsp?id='+id;    
f.submit();
}
function deleteRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='MaaUserDelete.jsp?id='+id;    
f.submit();
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
		
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>E-NAME</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>E-ID</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>E-PWD</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>E-ADDRESS</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>E-CONTACT</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>E-POST</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>E-POSTING</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>E-MAILID</b></font></td>
		
		</tr>
	
		<%Connection con = null;
  /* String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password=""; */
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
int sumcount=0;
Statement st;
try
{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from nentrymaa";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%while(rs.next()){%>
		
		<tr>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(2)%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(4)%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
<td bgcolor="" width="120"><font size="2" color="black"><%=rs.getString(6)%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
<td bgcolor="" width="120"><font size="2" color="black"><%=rs.getString(8)%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(9)%></font></td>
<td id="hiderow"><input id="hiderow" type="button" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td id="hiderow"><input id="hiderow" type="button" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>

</tr>
		<%}%>
<%}catch(Exception e){e.printStackTrace();}%>

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