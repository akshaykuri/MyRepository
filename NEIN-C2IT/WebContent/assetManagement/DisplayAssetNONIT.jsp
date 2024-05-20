<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display asset</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
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
<script language="javascript">
function editRecord(id)
    {  
	//alert(id);
    var f=document.form;    
    f.method="post";    
    f.action='assetTypeEdit.jsp?id='+id;    
    f.submit();
    }
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('You are above to delete a Problem Type'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='assetTypeDel.jsp?id='+id;    
           f.submit();
          }
	else{}
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
		<td height="20" bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>ID</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>AssetName</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>AssetDisc</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>IT/NONIT</b></font></td>
		<!-- <td bgcolor="white" width="120" align=center colspan="2" style="background-color:grey"><font size="2" color="black"><b>EDIT/DELETE</b></font></td> -->
		</tr>
	
<%Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
Statement st=null;
ResultSet rs=null; 
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select id,item_name,item_desc,it_nonit from asset_type where it_nonit='NON IT' order by item_name ";
st = con.createStatement();
 rs = st.executeQuery(query);
%>
<%while(rs.next()){%>
<tr>
 
<td bgcolor="white" width="100"> <font size="2" color="black"><%=rs.getString(1)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(2)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(4)%></font></td>

<td style="background-color:grey"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs.getString(1)%>,<%=rs.getString(2)%>,<%=rs.getString(3)%>,<%=rs.getString(4)%>");' ></td>
<td style="background-color:grey"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs.getString(1)%>");' ></td>
</tr>
<%}%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
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