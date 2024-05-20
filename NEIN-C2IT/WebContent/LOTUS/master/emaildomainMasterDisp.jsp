<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>


<script language="javascript">

function deleteGSNETBCode(cname)
{  //alert("fgfg");  
	if(confirm('You are above to delete '))
	{
var f=document.form;   

f.method="post";    
f.action='emaildomainMasterDel.jsp?id='+cname;    
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
                
	<table border="1" width='150' align="center" bgcolor="#F0F0F0" bordercolor="grey">
		<tr>
		  <td height="20" bgcolor="white" width="10" align=center><font size="2" color="black"><b>SR._NO.</b></font></td>
		  <td height="20" bgcolor="white" width="90" align=center><font size="2" color="black"><b>EMAIL DOMAIN</b></font></td>
		  <td height="20" bgcolor="white" width="50" align=center><font size="2" color="black"><b>DELETE</b></font></td>
      	</tr>
	
		<%Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
		String userName = dbProperties.getString("csdb.username");
		String password = dbProperties.getString("csdb.password");
		String url = dbProperties.getString("csdb.url");
		String driver = dbProperties.getString("csdb.driverName");
		String dbName = dbProperties.getString("csdb.dbName");
int sumcount=0;
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from emaildomainmaster  ORDER BY emaildomain";
st = con.createStatement();
 rs = st.executeQuery(query);
 int i=0;
 String all="",dir="";
%>
<%while(rs.next()){ i++; 

%>
		
	 <tr>
		<td bgcolor="" width="100"><font size="2" color="black"><%=i%></font></td>
        <td bgcolor="" width="100"><font size="2" color="black"><%=rs.getString(2)%></font></td>
       
        <td id="hiderow"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteGSNETBCode('<%=rs.getString(2)%>');" ></td>
    </tr>
		<%}%>
<%}catch(Exception e){e.printStackTrace();}finally{
	//DbUtil.closeDBResources(rs,st,con);
	
}%>

	</table>
	
	
<br>






<table width="165" align ="center" id="hiderow">
<tr>
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