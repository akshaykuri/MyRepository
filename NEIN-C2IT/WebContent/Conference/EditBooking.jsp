<%-- <%@page import="CON2.DbUtil"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<%@ page import = "java.util.ResourceBundle" %>
<jsp:useBean id = "con" class="CON2.Connection2" />

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
function editRecord(id,id1)
    {  
	//alert("editttttt idddd"+id);
	//alert("editttttt idddd111"+id1);
    var f=document.form;    
    f.method="post";    
    f.action='EditBookingPage.jsp?id='+id+'&id1='+id1;    
    f.submit();
    }
    
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('You are above to Cancel your booking'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='CancelBookingPage.jsp?id='+id;    
           f.submit();
          }
	else{}
   }
function displayAmenities(id)
{  
//alert(id);
var f=document.form;    
f.method="post";    
f.action='DisplayAmenities.jsp?id='+id;    
f.submit();
}

function displayVcbranch(id)
{  
//alert(id);
var f=document.form;    
f.method="post";    
f.action='DisplayVcbranch.jsp?id='+id;    
f.submit();
}

function displaywebex(id)
{  
//alert(id);
var f=document.form;    
f.method="post";    
f.action='Displaywebex.jsp?id='+id;    
f.submit();
}
</script>
<script type="text/javascript">
$(document).ready(function(){    
    //Check if the current URL contains '#'
    if(document.URL.indexOf("#")==-1){
        // Set the URL to whatever it was plus "#".
        url = document.URL+"#";
        location = "#";

        //Reload the page
        location.reload(true);
    }
});
</script>
</head>
<body onload="Refresh()">
<br><br>
 <form onload="refresh()" method="post" name="form"> 
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
       
    </tr>
 
 
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">BOOKING DETAILS</font></strong></td>
</tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
              <%--   <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("empid")%>" >        
                </td>
 </tr>
</table>

<center>
 <br />
               
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
		<tr>
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booking Number</b></font></td>
	    <td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booked BY</b></font></td>
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booked Date</b></font></td>
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booking For Person</b></font></td>
		<td height="20" bgcolor="white" width="450" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Booking Room Type</b></font></td>
		 <td height="20" bgcolor="white" width="400" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Meeting Type</b></font></td>
		<td height="20" bgcolor="white" width="250" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>No.of Attendies</b></font></td>
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>From Date</b></font></td>
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>To Date</b></font></td>
	<!-- 	<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>From Time</b></font></td> -->
		<!-- <td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>To Time</b></font></td> -->
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Amenities Details</b></font></td>
		<td height="20" bgcolor="white" width="300" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>VC/AC Branch Details</b></font></td>
	  
		<td bgcolor="white" width="220" align=center colspan="2" style="background-color:#74c1b9"><font size="2" color="black"><b>EDIT</b></font></td>
		</tr>
	
<%
response.setContentType("text/html;charset=UTF-8");
//PrintWriter out1 = response.getWriter();

//System.out.println("in viewwwwwwwwwwww paggggeeeeeeeeeee");
String empid=null;
empid = (String) session.getAttribute("empid");
System.out.println("in edit page empid==="+empid);
String fromdate=request.getParameter("fromdate");
String todate=request.getParameter("todate");

Connection con1 = null;

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null,st1=null,st2=null,st3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null; 
try
{
	Class.forName(driver).newInstance();
	con1= DriverManager.getConnection(url+dbName,userName,password);
String query =null;
PreparedStatement prds=null;


		//System.out.println("in ponum n asset");
		query = "SELECT * FROM `conference_room_booking` WHERE `from_date`>='"+fromdate+"' and `to_date`<='"+todate+"' and `user_empid`='"+empid+"' and status='Active'";
		/* st = con.createStatement();
		 rs = st.executeQuery(query); */
		 prds = con1.prepareStatement(query);
		/* 	prds.setDate(1, new java.sql.Date(startDate.getTime() ));
			prds.setDate(2,new java.sql.Date(endDate.getTime())); */
			rs = prds.executeQuery();
	
%>
<%while(rs.next()){

	 DateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		//Date date1=dateForm.format(cal);  
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
	    Date date = new Date();  
	    String date2=formatter.format(date); 
	   //System.out.println(formatter.format(date));  
		
		// Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date2); 
		 //Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date);
	     Date dbdate=rs.getDate("from_date");
	    // Date date2=new SimpleDateFormat("yyyy-MM-dd").parse(dbdate);
	  //  System.out.println("current date---"+date);
	    //System.out.println("database date---"+dbdate);
	    String meetingtype=rs.getString("meeting_type");
%>

<% if(dbdate.before(date)) { %> 
<tr>
 
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><%=rs.getString("Booking_no")%></font></td>
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><%=rs.getString("user_name")%></font></td>
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><%=rs.getString("booked_date")%></font></td>
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><%=rs.getString("booking_for_person")%></font></td>
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><center><%=rs.getString("booking_room_type")%></center></font></td>
<%-- <td bgcolor="#d2f7f3" width="500"><font size="2" color="black"><center><%=rs.getString("meeting_type")%></center></font></td>
 --%>
<%
  if (meetingtype.equals("Web-Ex Meeting")){
%>
<td bgcolor="#f4ea9c" width="500" align=center><font size="2" color="black">
<input id="hiderow" type="button" class="button" size="2" name="user" value="<%=rs.getString("meeting_type")%>" style="background-color:white;font-weight:bold;color:black;" onclick='displaywebex("<%=rs.getString("Booking_no")%>");' ></font></td>

<%} else {%>
<td bgcolor="#f4ea9c" width="200"><font size="2" color="black"><center><%=rs.getString("meeting_type")%></center></font></td>
<%} %>

<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><center><%=rs.getString("no_of_attendies")%></center></font></td>
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><%=rs.getString("from_date")%>&nbsp <%=rs.getString("from_time")%></font></td>
<td bgcolor="#f4ea9c" width="500"><font size="2" color="black"><%=rs.getString("to_date")%>&nbsp <%=rs.getString("to_time")%></font></td>
<%-- <td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("from_time")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("to_time")%></font></td> --%>
<td bgcolor="#f4ea9c" width="500" align=center><font size="2" color="black"><input id="hiderow" type="button" class="button" size="2" name="user" value="AmenitiesDetails" style="background-color:white;font-weight:bold;color:black;" onclick='displayAmenities("<%=rs.getString("Booking_no")%>");' ></font></td>
<td bgcolor="#f4ea9c" width="500" align=center><font size="2" color="black"><input id="hiderow" type="button" class="button" size="2" name="user" value="VC BranchDetails" style="background-color:white;font-weight:bold;color:black;" onclick='displayVcbranch("<%=rs.getString("Booking_no")%>");' ></font></td>
<td style="background-color:#f4ea9c" align=center><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs.getString("Booking_no")%>","<%=rs.getString("id")%>");' ></td>
<%-- <td style="background-color:#f4ea9c"><input id="hiderow" type="button" size="2" name="delete" value="Cancel" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs.getString("Booking_no")%>");' ></td>
 --%>
</tr> 
 
 <%}else { %>
 <tr>
 
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><%=rs.getString("Booking_no")%></font></td>
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><%=rs.getString("user_name")%></font></td>
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><%=rs.getString("booked_date")%></font></td>
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><%=rs.getString("booking_for_person")%></font></td>
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><center><%=rs.getString("booking_room_type")%></center></font></td>
<%-- <td bgcolor="#d2f7f3" width="500"><font size="2" color="black"><center><%=rs.getString("meeting_type")%></center></font></td>
 --%>
<%-- <td bgcolor="#d2f7f3" width="500" align=center><font size="2" color="black"><input id="hiderow" type="button" class="button" size="2" name="user" value="<%=rs.getString("meeting_type")%>" style="background-color:white;font-weight:bold;color:black;" onclick='displaywebex("<%=rs.getString("Booking_no")%>");' ></font></td>
 --%>
 <%
  if (meetingtype.equals("Web-Ex Meeting")){
%>
<td bgcolor="#f2c8ae" width="500" align=center><font size="2" color="black">
<input id="hiderow" type="button" class="button" size="2" name="user" value="<%=rs.getString("meeting_type")%>" style="background-color:white;font-weight:bold;color:black;" onclick='displaywebex("<%=rs.getString("Booking_no")%>");' ></font></td>

<%} else {%>
<td bgcolor="#f2c8ae" width="200"><font size="2" color="black"><center><%=rs.getString("meeting_type")%></center></font></td>
<%} %>
 
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><center><%=rs.getString("no_of_attendies")%></center></font></td>
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><%=rs.getString("from_date")%>&nbsp <%=rs.getString("from_time")%></font></td>
<td bgcolor="#f2c8ae" width="500"><font size="2" color="black"><%=rs.getString("to_date")%>&nbsp <%=rs.getString("to_time")%></font></td>
<%-- <td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("from_time")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("to_time")%></font></td> --%>
<td bgcolor="#f2c8ae" width="500" align=center><font size="2" color="black"><input id="hiderow" type="button" class="button" size="2" name="user" value="AmenitiesDetails" style="background-color:white;font-weight:bold;color:black;" onclick='displayAmenities("<%=rs.getString("Booking_no")%>");' ></font></td>
<td bgcolor="#f2c8ae" width="500" align=center><font size="2" color="black"><input id="hiderow" type="button" class="button" size="2" name="user" value="VC BranchDetails" style="background-color:white;font-weight:bold;color:black;" onclick='displayVcbranch("<%=rs.getString("Booking_no")%>");' ></font></td>
<td style="background-color:#f2c8ae" align=center><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs.getString("Booking_no")%>","<%=rs.getString("id")%>");' ></td>
<%-- <td style="background-color:#f2c8ae"><input id="hiderow" type="button" size="2" name="delete" value="Cancel" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs.getString("Booking_no")%>");' ></td> --%>

</tr>  <%}%>
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