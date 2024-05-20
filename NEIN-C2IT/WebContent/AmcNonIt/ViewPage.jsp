<%-- <%@page import="CON2.DbUtil"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>

<%@ page import="java.sql.*" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Softwares Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
    <link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

    
<style>
.button {
    background:none!important;
     border:none; 
     padding:0!important;
    
    /*optional*/
    font-family:arial,sans-serif; /*input has OS specific font-family*/
     color:red;
     text-decoration:underline;
  
</style>
    
    
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
	//alert("editttttt idddd"+id);
    var f=document.form;    
    f.method="post";    
    f.action='EditPage.jsp?id='+id;    
    f.submit();
    }
    
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('You are above to delete Hardware Type'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='DeletePage.jsp?id='+id;    
           f.submit();
          }
	else{}
   }
function displayRecord(id)
{  
//alert(id);
var f=document.form;    
f.method="post";    
f.action='DisplayNonItAssetDetails.jsp?id='+id;    
f.submit();
}
</script>
</head>
<body>
<br><br>
 <form method="post" name="form"> 
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
    
    </tr>
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">HARDWARE AMC DETAILS</font></strong></td>
</tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("emp_no")%>" >        
                </td>
 </tr>
</table>

<center>
 <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
		<tr>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Asset Details</b></font></td>
	
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Vender</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>PO</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Vender</b></font></td>
		 <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC PO</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Branch</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Sub Branch</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC From</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC To</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Expiry</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Amount</b></font></td>
       <!-- <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>License Type</b></font></td>
       <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>No of Users</b></font></td>
        --> <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Invoice</b></font></td>
      
       
		<td bgcolor="white" width="120" align=center colspan="2" style="background-color:#74c1b9"><font size="2" color="black"><b>EDIT/DELETE</b></font></td>
		</tr>
	
<%
response.setContentType("text/html;charset=UTF-8");
//PrintWriter out1 = response.getWriter();

//System.out.println("in viewwwwwwwwwwww paggggeeeeeeeeeee");

String assetno=request.getParameter("assetno");
String ponum=request.getParameter("pono");
String fromdate1=request.getParameter("fromdate");
String todate1=request.getParameter("todate");

//System.out.println("in search result-----"+assetno);
//System.out.println("in search result-----"+ponum);
//System.out.println("in search result-----"+fromdate1);
//System.out.println("in search result-----"+todate1);

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-dd-MM");
 Date startDate = null;
 Date endDate =  null;
  
 startDate = dateFormat.parse(fromdate1);
 endDate = dateFormat.parse(todate1);

Connection con1 = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
Statement st=null,st1=null,st2=null,st3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null; 
try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+db,userName,password);
String query =null;
PreparedStatement prds=null;

if(!assetno.equals("") && ponum.equals(""))
{
	//System.out.println("in asset");
query = "select s.hw_id_Nit,s.Asset_no,s.po_no,s.vender_name,s.amc_po,s.amc_podate,s.amc_vender,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.Asset_no='"+assetno+"' and (s.amc_exp_date >= ? and s.amc_exp_date <= ?)";
/* st = con.createStatement();
 rs = st.executeQuery(query); */
 prds = con1.prepareStatement(query);
	prds.setDate(1, new java.sql.Date(startDate.getTime() ));
	prds.setDate(2,new java.sql.Date(endDate.getTime()));
	rs = prds.executeQuery();
}
else
	if(!ponum.equals("") && assetno.equals(""))
	{
		//System.out.println("in ponum");
	query = "select s.hw_id_Nit,s.Asset_no,s.po_no,s.vender_name,s.amc_po,s.amc_podate,s.amc_vender,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.amc_po='"+ponum+"' and (s.amc_exp_date >= ? and s.amc_exp_date <= ?)";
	/* st = con.createStatement();
	 rs = st.executeQuery(query); */
	 prds = con1.prepareStatement(query);
		prds.setDate(1, new java.sql.Date(startDate.getTime() ));
		prds.setDate(2,new java.sql.Date(endDate.getTime()));
		rs = prds.executeQuery();
	}
	else{
		//System.out.println("in ponum n asset");
		query = "select s.hw_id_Nit,s.Asset_no,s.po_no,s.vender_name,s.amc_po,s.amc_podate,s.amc_vender,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.Asset_no='"+assetno+"' and s.amc_po='"+ponum+"' and (s.amc_exp_date >= ? and s.amc_exp_date <= ?)";
		/* st = con.createStatement();
		 rs = st.executeQuery(query); */
		 prds = con1.prepareStatement(query);
			prds.setDate(1, new java.sql.Date(startDate.getTime() ));
			prds.setDate(2,new java.sql.Date(endDate.getTime()));
			rs = prds.executeQuery();
	}

%>
<%while(rs.next()){%>
<tr>
 
<td style="background-color:#d2f7f3"><input id="hiderow" type="button" class="button" size="2" name="user" value="<%=rs.getString("Asset_no")%>" style="background-color:white;font-weight:bold;color:black;" onclick='displayRecord("<%=rs.getString("Asset_no")%>");' ></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("vender_name")%></font></td>

<td bgcolor="#d2f7f3" width="100"><font size="2" color="black">
<table>
<%try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+db,userName,password);
String query3 = "SELECT p.po_no,p.filePath,a.po_no FROM nepldb.po_signed_files p INNER JOIN csdb.hardware_amc_nonit a on a.amc_po=p.po_no WHERE a.po_no='"+rs.getString("po_no")+"'";
st3 = con1.createStatement();
 rs3 = st3.executeQuery(query3);
 
%>
<%while(rs3.next()){%>

<tr>
<td>
<input type="hidden" name="invoice" id="invoice" value="<%=rs3.getString("filePath")%>" >
 <a href="DownloadFile.jsp?f=<%=rs3.getString("filePath")%>" ><%=rs.getString("po_no")%></a></font>
 
 </td>
 </tr><%}%>
 <%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

 </table></font></td>

<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_vender")%></font></td>

<td bgcolor="#d2f7f3" width="100"><font size="2" color="black">
<table>
<%try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+db,userName,password);
String query2 = "SELECT p.po_no,p.filePath,a.amc_po FROM nepldb.po_signed_files p INNER JOIN csdb.hardware_amc_nonit a on a.amc_po=p.po_no WHERE a.amc_po='"+rs.getString("amc_po")+"'";
st2 = con1.createStatement();
 rs2 = st2.executeQuery(query2);
 /* String query1="Select user,ip_addr from software_details_multiple where sw_id='"+rs.getInt("sw_id")+"'";
 st1=con.createStatement();
 rs1 = st1.executeQuery(query1); */
%>
<%while(rs2.next()){%>

<tr>
<td>
<input type="hidden" name="invoice" id="invoice" value="<%=rs2.getString("filePath")%>" >
 <a href="DownloadFile.jsp?f=<%=rs2.getString("filePath")%>" ><%=rs.getString("amc_po")%></a></font>
 
 </td>
 </tr><%}%>
 <%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

 </table></font></td>

<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("m_b_name")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("b_name")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_from_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_to_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_exp_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_amount")%></font></td>
<%-- <td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("license_type")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("No_of_users")%></font></td> --%>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black">
<table>
<%try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+db,userName,password);
String query1 = "select hnit_id,Asset_no,hnit_invoice from hardware_nonit_invoice where Asset_no='"+rs.getString("Asset_no")+"' and amc_po='"+rs.getString("amc_po")+"'";
st1 = con1.createStatement();
 rs1 = st1.executeQuery(query1);
 /* String query1="Select user,ip_addr from software_details_multiple where sw_id='"+rs.getInt("sw_id")+"'";
 st1=con.createStatement();
 rs1 = st1.executeQuery(query1); */
%>
<%while(rs1.next()){%>

<tr>
<td>
<input type="hidden" name="invoice" id="invoice" value="<%=rs1.getString("hnit_invoice")%>" >
 <a href="DownloadFile.jsp?f=<%=rs1.getString("hnit_invoice")%>" >VIEW/DOWNLOAD</a>
 
 </td>
 </tr><%}%>
 <%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

 </table></td>
 
<%-- <td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs.getInt("sw_id")%>,<%=rs.getString("software_name")%>,<%=rs.getString("license_no")%>,<%=rs.getString("vender")%>,<%=rs.getString("branch")%>,<%=rs.getString("sub_branch")%>,<%=rs.getString("AMC_from_date")%>,<%=rs.getString("AMC_to_date")%>,<%=rs.getString("AMC_expiry")%>,<%=rs.getString("AMC_amount")%>,<%=rs.getString("license_type")%>,<%=rs.getString("No_of_users")%>,<%=rs.getString("m_b_name")%>,<%=rs.getString("b_name")%>");' ></td> --%>
<td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs.getString("hw_id_Nit")%>");' ></td>
<td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs.getInt("hw_id_Nit")%>");' ></td>
 </tr>
 <%}%>
 
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

	</table>
<br>
</form> 
<form action="../AMCcallForReport" method="get">
<input type="hidden" name="view" value="AmcNonIt">
 <input type="hidden" name="assetno" value="<%=assetno%>">
 <input type="hidden" name="pono" value="<%=ponum%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
</form>
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
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 

</body>
</html>