<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display All asset</title>
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

</head>
<body>
<br><br>
<form  name="form" id="myform" action="<%=request.getContextPath()%>/assetManagement/Report/reportOfAllTransfer.jsp">
<center>
 <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
		<tr>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Inventory No</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Asset Type</b></font></td>
        <td height="20" bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Asset No</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Configuration</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>From Branch</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>From User</b></font></td>
		
         <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>To Branch</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>To User</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Purpose Of Transfer</b></font></td>
         <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Date Of Transfer</b></font></td>
          <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Transfered By</b></font></td>
           <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Approved By</b></font></td>
            <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>File</b></font></td>
       <!--  <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>ID</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>CurrentAssetNo</b></font></td>
	 -->
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
int k=0;
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select 	at.Inventory_No,at.old_asset_no,at.AssetType,at.New_Asset_No,at.Branch,at.fromUser,at.NewBranch,at.toUser,at.purpus,at.id,at.curAID,at.ConfigField,at.dateOfTrans,at.transBy,at.approvedby,at.srno,at.filepath from asset_trans at,asset_type ai where at.AssetType=ai.item_name and ai.it_nonit='NON IT' ORDER BY New_Asset_No , srno asc; ";
st = con.createStatement();
 rs = st.executeQuery(query);
String s1="";
%>
<%
String FPath="E:\\neinSoft\\files\\C2IT\\UploadAssetTransfer\\" ;
String FileFullPath="" ;
while(rs.next()){ int q=rs.getInt(11); int srno=rs.getInt("srno"); 
String fname=rs.getString("filepath");
FileFullPath = FPath+Integer.toString(srno)+"\\"+fname;
//System.out.println("File path :"+FileFullPath);
//System.out.println("File name :"+fname);
%>
<tr>
 

<%if(q==1){%>
            <td bgcolor="PaleGreen" width="100"> <font size="2" color="black"><%=rs.getString(1)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
            <td bgcolor="PaleGreen" width="100"> <font size="2" color="black"><%=rs.getString(4)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(12)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(6)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
            <%if(rs.getString(8)==null) s1="Not Assigned"; else s1=rs.getString(8);%>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=s1%></font></td>
         <%--    <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(8)%></font></td>
          --%>  
           <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(9)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString("dateOfTrans")%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString("transBy")%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(15)%></font></td>
            <td align="center" width="90" ><a href="download6.jsp?f=<%=FileFullPath%>">View</a></td>
       <%}else{%>
            <td bgcolor="white" width="100"> <font size="2" color="black"><%=rs.getString(1)%></font></td>
             <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
            <td bgcolor="white" width="100"> <font size="2" color="black"><%=rs.getString(4)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(12)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(6)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
            <%if(rs.getString(8)==null) s1="Not Assigned"; else s1=rs.getString(8);%>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=s1%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(9)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString("dateOfTrans")%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString("transBy")%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(15)%></font></td>
           <td align="center" width="90" ><a href="download6.jsp?f=<%=FileFullPath%>">View</a></td>
           <%}%>

          <!--  <td bgcolor="white" width="100"><font size="2" color="black"></font></td> -->
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
<td align="center"><input type="submit" value="EXCEL" id="submit1" class="hollow" style="background-color:white;font-weight:bold;color:black;"></input></td>
</tr>
</table>
</center>
</form>
</body>
</html>