<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SYSTEM ADMIN MASTER</title>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

<script language="javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
function link(Nname) 
 {
var f=document.form;  

	f.method="post";    
	f.action='DisplayAssignedLocation.jsp?Nname='+Nname;    
	f.submit();
	}
		     
function editRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='HoUserEdit.jsp?id='+id;    
f.submit();
}

function deleteRecord(id)
{  
	if(confirm('You are above to delete a System Admin'))
	{
var f=document.form;    
f.method="post";    
f.action='HoUserDelete.jsp?id='+id;    
f.submit();

	}
	else
		{}
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
<style type="text/css">
.headline{
    margin: auto;
   /*  width: 50%; */
   /*  border: 3px solid green; */
    padding: 10px;
    background-color: grey;
    font-size: 5px;
    font-weight: bold;
    text-align: center;
}
.data{
 text-align: center;
}
.colorChange{
background-color:#2f4377;font-weight:bold;color:white;
}
.colorChange:HOVER{
background-color:red;font-weight:bold;color:black;
}
a:HOVER {
	background-color:red;
}
</style>
</head>
<body>

<br><br>
<form method="post" name="form">
<center>
     <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
		<tr>
		<td class="headline" width="100"><font size="2" color="black">Assigned Location</font></td>
		<td class="headline" height="20" width="100"><font size="2" color="black">NAME</font></td>
		<td class="headline" width="100" ><font size="2" color="black">UID</font></td>
		<td class="headline" width="100" ><font size="2" color="black">PWD</font></td>
		<td class="headline" width="100" ><font size="2" color="black">EMP-ID</font></td>
<!-- 		<td class="headline" width="100" ><font size="2" color="black">ADDRESS</font></td>
		<td class="headline" width="120" ><font size="2" color="black">CONTACT</font></td> -->
		<td class="headline" width="100" ><font size="2" color="black">DEPART.</font></td>
		<td class="headline" width="120" ><font size="2" color="black">R-BRANCH</font></td>
		<td class="headline" width="100" ><font size="2" color="black">MAILID</font></td>
		<td class="headline"  width="100" ><font size="2" color="black">RIGHTS</font></td>
		<td class="headline"  width="100" ><font size="2" color="black">DESIG</font></td>
			<td class="headline"  width="100" ><font size="2" color="black">REPORTING OFFICER</font></td>
		<td class="headline" id="hiderow" width="100"  colspan="2"><font size="2" color="black">EDIT / DELETE</font></td>
		</tr>
	
		<%Connection con = null;
 /*  String url = "jdbc:mysql://localhost:3306/";
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
Statement st=null;
ResultSet rs=null; 
try
{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select n.* from nentryho n WHERE n.Npost='IT SUPPORT' ORDER BY n.department,n.Nname ASC";
st = con.createStatement();
 rs = st.executeQuery(query);
int k=0;
%>
<%while(rs.next()){ 
	k++;
String Nname = rs.getString(2);

//System.out.println("Nname "+Nname);
String department = rs.getString("department");
%>
	
<tr>
	
  <%-- <td id="hiderow"><input id="hiderow" type="button" name="Location" size="2" value="LOCATION" style="background-color:white;font-weight:bold;color:black;" onclick="link(<%=Nname%>);" ></td> --%>
  <input type="hidden" name="<%=k%>" value="<%=Nname%>" />
    <td class="data" width="120" ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"><%=Nname%></a></font> </td>  
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("Nname")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("idd")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("Npwd")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("EMP_NO")%></font></td>
<%-- <td  width="100"><font size="2" color="black"><%=rs.getString("Naddr")%></font></td>
<td class="data" width="120"><font size="2" color="black"><%=rs.getString("Ncontact")%></font></td> --%>
<%if(department.equals("IT SUPPORT")) { %>	
<td class="data" width="100"><font size="2" color="red"><%=rs.getString("department")%></font></td>
<%}if(department.equals("OFFICE ADMINISTRATION")) { %>
<td class="data" width="100"><font size="2" color="blue"><%=rs.getString("department")%></font></td>
<%}if(department.equals("SOFTWARE DEVELOPMENT")) { %>
<td class="data" width="100"><font size="2" color="green"><%=rs.getString("department")%></font></td>
<%} %>
<td class="data" width="120"><font size="2" color="black"><%=rs.getString("NpostingCo")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("Nmail")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("admin")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("extraDesig")%></font></td>
<td class="data" width="100"><font size="2" color="black"><%=rs.getString("reportingOff")%></font></td>
<td id="hiderow"><input class="colorChange" type="button" name="edit" size="2" value="Edit"  onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td id="hiderow"><input class="colorChange" type="button" name="delete" size="2" value="Delete"  onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>

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
 
<td align="left"><input class="colorChange"  type='submit' value='CANCEL' onclick='btnClick();'></td>
<td align="right" id="hiderow" >
<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input  class="colorChange" type="button" value="PRINT" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
</tr>

</table>



 

</center>
</form>
</body>



</html>