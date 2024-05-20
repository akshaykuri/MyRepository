<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRATIONREPORT</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
<link rel='stylesheet' type='text/css' href='../css/homePage.css' />
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

function deleteRecord(id)
{   

	if(confirm('You are above to delete a Registration form'))
	{
var f=document.form;    
f.method="post";    
f.action='registrationDelete.jsp?id='+id;    
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
<%String SessionName=null,Sessiondesg=null,SessionmailId=null;
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
SessionmailId = (String) session.getAttribute("mail");
%>
     <br />
       <!-- //ISP-NAME,MPLS-BRANCH,CIRCUIT ID,BRAND WIDTH,LAN IP,WAN IP,NETWORK IP
//isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip 	 -->     
 <!-- <table align="right" ><tr>
 <td style="size:1"><input  type="button" value="BACK"  onclick="window.location.href='../adminbom.jsp?msg=1'" /></td> 
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
 
</table> -->    
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr style="visibility: hidden; display: none">
	<td><input name="deleteBy" value="<%=SessionName %>" />
	<input name="deleteDesig" value="<%=Sessiondesg %>" />
	<input name="deleteMail" value="<%=SessionmailId %>" />
	 </td>
	</tr>
	<tr bgcolor="grey">
	<td align="center" id="hiderow"><SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script></td>
	<td colspan="8" align="center">REGISTRATION FORM</td>
	<td align="center" id="hiderow"><input align="middle" type="button" value="BACK"  onclick="window.location.href='../adminbom.jsp?msg=1'" /></td>
	</tr>
		<tr>
        <td bgcolor="lightgrey"  align=center><font size="2" color="black"><b>SL </b></font></td>
		<td height="20" bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>FORM NO</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>CREATED BY </b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>CREATED FOR</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>FROM BRANCH</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>FOR BRANCH</b></font></td>
		<td bgcolor="lightgrey" width="120" align=center><font size="2" color="black"><b>CREATED ON</b></font></td>
		<td bgcolor="lightgrey" width="220" align=center><font size="2" color="black"><b>APPROVED ROUTINE</b></font></td>
		
		<td bgcolor="lightgrey" width="120" align=center colspan="2"><font size="2" color="black"><b>DELETE</b></font></td>
		</tr>
	
		<%Connection con = null;
  String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
int i=0;
Statement st=null;
ResultSet rs=null;
try
{
	Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
//String query = "SELECT f.id,f.form1_no,f.i_name,f.full_name,f.i_city,f.branch,f.f_date,GROUP_CONCAT(g.emp ORDER BY g.id ASC SEPARATOR ', ') as emm FROM form1_it_clearance f INNER JOIN form1_it_clearance_item g ON(f.form1_no=g.form1_no) GROUP BY f.id ORDER BY DATE(f.f_date) DESC,MONTH(f.f_date) DESC,YEAR(f.f_date) DESC";
String query = "SELECT f.id,f.form10_no,f.i_name,f.full_name,f.i_city,f.branch,f.f_date,GROUP_CONCAT(g.emp ORDER BY g.id ASC SEPARATOR ', ') as emm FROM  form10_registration f INNER JOIN  form10_registration_item g ON(f.form10_no=g.form10_no) WHERE Approval_status='Pending' AND f.deleted='no' GROUP BY f.id ORDER BY f.id";
st = con.createStatement();
 rs = st.executeQuery(query);
%>
<%while(rs.next()){i++;%>
		
		<tr>
		<td bgcolor="white" ><font size="2" color="black"><%=i%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(2)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(4)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(6)%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
<td bgcolor="white" width="100" colspan="2"><font size="2" color="black"><%=rs.getString(8)%></font></td>


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






 <table style="margin-left: auto;margin-right: auto;" ><tr>
 <td style="size:1"><input  type="button" value="BACK"  onclick="window.location.href='../adminbom.jsp?msg=1'" /></td> 
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