<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import= "CON2.ConnectionLMS" %> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FORM USER MASTER</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
	<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", ""); 
    disp = disp.replace("%27", " ");
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

		     
function editRecord(id)
{    
var f=document.form;    
f.method="post";    
f.action='FormUserEdit.jsp?id='+id;    
f.submit();
}

function deleteRecord(id)
{  
	if(confirm('You are above to delete a Form User'))
	{
var f=document.form;    
f.method="post";    
f.action='FormUserDelete.jsp?id='+id;    
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
</head>
<body>

<br><br>
<form method="post" name="form">
<center>
     <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
		<tr>
		
		<td height="20" bgcolor="grey" width="100" align=center><font size="2" color="black">E-NAME</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-ID</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-PWD</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-EMP_ID</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-ADDRESS</font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black">E-CONTACT</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-POST</font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black">E-POSTING</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-MAILID</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-RIGHTS</font></td>
		<td bgcolor="grey" width="100" align=center><font size="2" color="black">E-DEPT</font></td>
		<td bgcolor="grey" width="100" align=center colspan="2"><font size="2" color="black">EDIT / DELETE</font></td>
		</tr>
	
		<%Connection con = null,lms=null;
 
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
String query = "select * from formUser_master ORDER BY Nname ASC";
st = con.createStatement();
 rs = st.executeQuery(query);
int k=0;
%>
<%while(rs.next()){
	
	
	String empid=rs.getString("EMP_NO");

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

%>
		
		<tr>
 
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("Nname")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("idd")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("Npwd")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("EMP_NO")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("Naddr")%></font></td>
<td bgcolor="" width="120"><font size="2" color="black"><%=rs.getString("Ncontact")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=ndesgLms%></font></td>
<td bgcolor="" width="120"><font size="2" color="black"><%=rs.getString("NpostingCo")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=emailLms1%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("admin")%></font></td>
<td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString("subDept")%></font></td>

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
 
<td align="left"><input id="hiderow" type='submit' style="background-color:lightgrey;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'></td>
<td align="right">
<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:lightgrey;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
</tr>

</table>



 

</center>
</form>
</body>



</html>