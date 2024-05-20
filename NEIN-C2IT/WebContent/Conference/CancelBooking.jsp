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
<%@ page import = "java.util.ResourceBundle" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
    <link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
    
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
 <%-- <script  type="text/javascript">
<% 
String msg[] = request.getQueryString().toString().split("=");

String disp = msg[1].toString();
disp = disp.replace("%20", "");
disp = disp.replace("%27", " ");
disp = disp.replace("__","   ");

    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>    --%>
    
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

function deleteRecord(id,i)
    {  
	//alert("hereeee"); 
	
	
	//alert("hereeee----id1----"+id1); 
	//alert("hereeee----i-----"+i); 
	//alert(id); 
	var remarks=document.getElementById("cancelremarks"+i).value;
	 if(remarks==null || remarks=="")
	{
		alert("Please Enter The Reason For Cancelling");
		remarks.focus();
	}
	else 
	{
	if(confirm('You are sure to Cancel Booking ?'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='CancelBookingPageback.jsp?id='+id+"&remarks="+remarks;    
           f.submit();
          }
	else{}
	}
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
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">CANCELLED BOOKING DETAILS</font></strong></td>
</tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
                <%-- <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("empid")%>" >    
       <input type="hidden" name="empname" value="<%=session.getAttribute("fullname")%>" >    
                </td>
 </tr>
</table>

<center>
 <br />
                
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booking Number</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booking Room Type</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booked Date</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>From Date</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>To Date</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>From Time</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>To Time</b></font></td>
	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Reason For Cancel</b></font></td>
	<td bgcolor="white" width="120" align=center colspan="2" style="background-color:#74c1b9"><font size="2" color="black"><b>CANCEL</b></font></td>
   </tr>
	
<%
response.setContentType("text/html;charset=UTF-8");
//PrintWriter out1 = response.getWriter();

//System.out.println("in viewwwwwwwwwwww paggggeeeeeeeeeee");
String empid=null;
empid = (String) session.getAttribute("empid");
System.out.println("in edit page empid==="+empid);

Date date = new Date();
String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
System.out.println("in modified date==="+modifiedDate);

Connection con1 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

int i=0;
Statement st=null,st1=null,st2=null,st3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null; 
try
{
	Class.forName(driver).newInstance();
	con1= DriverManager.getConnection(url+dbName,userName,password);
String query =null;
PreparedStatement prds=null;


		//System.out.println("in ponum n asset");
		query = "SELECT * FROM `conference_room_booking` WHERE from_date >='"+modifiedDate+"' and `user_empid`='"+empid+"' and status='Active'";
		/* st = con.createStatement();
		 rs = st.executeQuery(query); */
		 prds = con1.prepareStatement(query);
		/* 	prds.setDate(1, new java.sql.Date(startDate.getTime() ));
			prds.setDate(2,new java.sql.Date(endDate.getTime())); */
			rs = prds.executeQuery();
	
%>
<%while(rs.next()){
i++;
%>
<tr>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("Booking_no")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("booking_room_type")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("booked_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("from_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("to_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("from_time")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("to_time")%></font></td>
<td bgcolor="#d2f7f3" width="100"><textarea name="cancelremarks<%=i%>" id="cancelremarks<%=i%>" required></textarea></td>
<td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="delete" value="Cancel" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs.getString("id")%>","<%=i%>");' ></td>
 <%}%>
 
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

	</table>
<br>

</form> 

<br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="ConRoomHome.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 

</body>
</html>