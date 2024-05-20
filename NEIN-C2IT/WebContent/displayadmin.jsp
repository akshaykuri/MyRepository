<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import= "CON2.ConnectionLMS" %> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINISTRATOR MASTER</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />


<script language="javascript">
function link(Nname) 
{
var f=document.form;  
    alert("Assign Sub Location Handling By General Manager For Feedback");
	f.method="post";    
	f.action='DisplayHandlingLocation.jsp?Nname='+Nname;    
	f.submit();
	}
function editRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='adminedit.jsp?id='+id;    
f.submit();
}
function deleteRecord(id)
{  
	if(confirm('You are above to delete a Administrator \n \n  Admin can not access admin page,user page and form page'))
	{
var f=document.form;    
f.method="post";    
f.action='admindelete.jsp?id='+id;    
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
</head>
<body>

<br><br>
<form method="post" name="form">
<center>
     <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
		<tr>
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>SUB-BRANCH</b></font></td>
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>ADMIN-NAME</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>ADMIN-ID-NO.</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>ADMIN-LOGIN-ID</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>ADMIN-LOGIN-PWD</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>ADMIN-DESIGNATION</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>ADMIN-BRANCH</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>ADMIN-MAILID</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>ADMIN-RIGHTS</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>NEWINS-USER</b></font></td>
		<td bgcolor="white" width="120" align=center colspan="2"><font size="2" color="black"><b>EDIT/DELETE</b></font></td>
		</tr>
	
		<%Connection con = null,lms=null;
/*   String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";  */
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName"); 

int sumcount=0;
Statement st=null,stlms1=null;
ResultSet rs=null,rslms1=null;
try
{
	lms = conlms.getConnectionlms();
	
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from login ORDER BY Nname ASC";
st = con.createStatement();
rs = st.executeQuery(query);
int k=0;
%>
<%while(rs.next()){k++;
String Nname = rs.getString(2);
String empid=rs.getString("Nno");

String emailLms1="",ndesgLms=""; 
stlms1=lms.createStatement();
// rslms1 = stlms1.executeQuery("SELECT email FROM user WHERE emp_id='"+EmpNo+"' ");
rslms1 = stlms1.executeQuery("SELECT DISTINCT rr.role_code,u.email FROM user u "+
"Inner Join user_role ur on ur.user_id=u.user_id "+
"INNER JOIN role rr ON ur.role_id =rr.role_id "+
"WHERE ( u.emp_id ='"+empid+"' ) AND u.employee_status = 'yes' ");
if(rslms1.next())
     {
	 emailLms1 = rslms1.getString("email");
	 ndesgLms=rslms1.getString(1);
	 System.out.println("HO LOGIN Name emailLms1emailLms1: "+emailLms1);
	 System.out.println("HO LOGIN Name ndesgndesgndesg: "+ndesgLms);
	 }  



//System.out.println("Nname "+Nname);

%>
		
		<tr>
		  <input type="hidden" name="<%=k%>" value="<%=Nname%>" />
    <td width="120" align=center  ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"><%=Nname%></a></font> </td>  
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("Nname")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("Nno")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("UID")%></font></td>
<td bgcolor="" width="100" ><font size="2" color="black" face="Symbols" style="font-style: oblique;font-family: monospace; "><%=rs.getString("UPWD")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=ndesgLms%></font></td>
<td bgcolor="" width="120"><font size="2" color="black"><%=rs.getString("city")%></font></td>
<td bgcolor="" width="120"><font size="2" color="black"><%=emailLms1%></font></td>
<td bgcolor="" width="60"><font size="2" color="black"><%=rs.getString("rights")%></font></td>
<td bgcolor="" width="60"><font size="2" color="black"><%=rs.getString("newinsUser")%></font></td>



<td id="hiderow"><input id="hiderow" type="button" name="edit" size="2" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>

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
 
<td align="left" id="hiderow"><input id="hiderow" type='submit' size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'></td>
<td align="right" id="hiderow">
<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input type="button" id="hiderow" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
</tr>

</table>



 

</center>
</form>
</body>



</html>