<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PRINTER MASTER</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
<link rel='stylesheet' type='text/css' href='../css/homePage.css' />

<script language="javascript">
function editRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='UserAvailableEdit.jsp?id='+id;    
f.submit();
}
function deleteRecord(id)
{    
	if(confirm('You are above to delete a Availability details'))
	{
var f=document.form;    
f.method="post";    
f.action='UserAvailableDelete.jsp?id='+id;    
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
<%String SystemAdminName = (String) session.getAttribute("Nname"); %>
<br><br>
<form method="post" name="form">
<center>
     <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
	<td></td>
	<td colspan="3" align="center" background="grey">
	<font size="2" color="black"><b>AVAILABILITY</b></font>
	</td><td colspan="2"></td>
	</tr> 
		<tr>
		
		<td height="20" bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>SYSTEM ADMIN</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b> TYPE</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>LEAVE FROM</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center ><font size="2" color="black"><b>LEAVE TO</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center ><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center colspan="2"><font size="2" color="black"><b>EDIT/DELETE</b></font></td>
		</tr>
	
		<%Connection con = null;
		ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
		String userName = dbProperties.getString("csdb.username");
		String password = dbProperties.getString("csdb.password");
		String url = dbProperties.getString("csdb.url");
		String driver = dbProperties.getString("csdb.driverName");
		String dbName = dbProperties.getString("csdb.dbName");
int sumcount=0;
Statement st=null;
ResultSet rs=null; 
String Nameee=null,Availiable=null,date1=null,date2=null,feedback=null;
try
{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
System.out.println("SystemAdminName :"+SystemAdminName);
String query = "SELECT a.id,a.about,a.name,DATE_FORMAT(a.date1,'%e/%M/%Y'),DATE_FORMAT(a.date2,'%e/%M/%Y'),a.feedback FROM availability a INNER JOIN nentryho n ON (a.name=n.Nname) WHERE n.DESG_NO='2' AND a.name LIKE '%"+SystemAdminName+"%' AND  DATE(NOW()) between a.date1 and a.date2";
st = con.createStatement();
 rs = st.executeQuery(query);
%>
<%while(rs.next()){
	 Availiable = rs.getString(2);
	   Nameee = rs.getString(3);
	   date1 = rs.getString(4);
	   date2 = rs.getString(5);
	   feedback = rs.getString(6);
%>
		
		<tr>
<td bgcolor="white" width="100" align=center><font size="2" color="black"><%=Nameee%></font></td>
<td bgcolor="white" width="100" align=center><font size="2" color="black"><%=Availiable%></font></td>
<td bgcolor="white" width="100" align=center><font size="2" color="black"><%=date1%></font></td>
<td bgcolor="white" width="100" align=center><font size="2" color="black"><%=date2%></font></td>
<td bgcolor="white" width="100" align=center><font size="2" color="black"><%=feedback%></font></td>


<td id="hiderow"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td id="hiderow"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>

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