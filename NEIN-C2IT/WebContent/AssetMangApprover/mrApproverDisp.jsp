<%-- <%@page import="CON1.DbUtil"%> --%>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MR APPROVER</title>
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
f.action='approverEdit.jsp?id='+id;    
f.submit();
}
function deleteRecord(lno,bran,empid,itnon,useroffice)
{    
	if(confirm('You are above to delete a Approver Details'))
	{
var f=document.form;   
var k=lno+","+bran+","+empid+","+itnon+","+useroffice;
f.method="post";    
f.action='mrApproverDel.jsp?id='+k;    
f.submit();
}
	else{}
}

</script>

<SCRIPT Language="Javascript">
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
		<td height="20" bgcolor="white" width="120" align=center><font size="2" color="black"><b>SR._NO.</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center><font size="2" color="black"><b>LEVEL_NO</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>LEVEL_NAME</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>IT/NONIT</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>BRANCH</b></font></td>
        <td bgcolor="white" width="120" align=center><font size="2" color="black"><b>EMP_ID</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>EMP_NAME</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>EMP_BRANCH</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>EMP_DESG</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>EMP_DEPT</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>EMP_MAILID</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>ALL APPROVER ALLOW</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>SEND/DIRECT</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>USER/OFFICE</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>MASTER FOR</b></font></td>
		<td bgcolor="white" width="120" align=center colspan=2><font size="2" color="black"><b>DELETE</b></font></td>
		</tr>
	
		<%Connection con=null;
		Statement st=null;
		ResultSet rs=null;
  String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
String rmaster1=request.getParameter("rmaster");
String itnonit=request.getParameter("itnonit");
String branch=request.getParameter("branch");
String useroffice=request.getParameter("useroffice");
System.out.println("ITNONIT :"+itnonit);
System.out.println("ITNONIT br :"+branch);
System.out.println("ITNONIT user:"+useroffice);



try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from mrapprover where (rmaster= '"+rmaster1+"'and itnonit='"+itnonit+"' and branch='"+branch+"' and useroffice='"+useroffice+"') ORDER BY levelno";
st = con.createStatement();
 rs = st.executeQuery(query);
 int i=0;
 String all="";
%>
<%while(rs.next()){ i++; 
all=rs.getString(14);
if(all.equals("0")) all="NO"; else all="YES";
%>
		
	 <tr>
		<td bgcolor="" width="100"><font size="2" color="black"><%=i%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(2)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(4)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(6)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(8)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(9)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(10)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(11)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=all%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(15)%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=useroffice%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(19)%></font></td>
        <%-- <td id="hiderow"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(2)%>);" ></td> --%>
        <td id="hiderow"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(2)%>,<%=rs.getString(5)%>,<%=rs.getString(6)%>,'<%=itnonit%>','<%=useroffice%>');" ></td>
    </tr>
		<%}%>
<%}catch(Exception e){e.printStackTrace();}finally{
/* 	DbUtil.closeDBResources(rs,st,con); */
	
}%>

	</table>
	
	
<br>






<table width="165" align ="center" id="hiderow">
<tr>
<td align="left" id="hiderow"><a href="mrApproverD.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> </td>
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