<%@page import="CON2.AutoSendingMessageAllcomplaints"%>
<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.Calendar" %> 
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page import="java.net.InetAddress"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>

<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<%@page import="CON2.AutoSendingMessage"%>
<%@page import="CON2.AutoSendingMessageAdmin"%>
<%@page import="CON2.AutoSendingMessageAdminAllCalls"%>

<jsp:useBean id="con" class="CON2.Connection2" />
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<jsp:useBean id = "timeDiff" class="CON2.TimeDifference" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="stylelog.css" rel="stylesheet" type="text/css" />
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<link rel="stylesheet" type="text/css" href='css/ForAll.css' />
<script language="javascript"   type="text/javascript" src="js/mainPageHome.js"></script>
<!--  <script language="javascript"   type="text/javascript" src="js/jquery-1.8.2.js"></script> -->
<link rel="shortcut icon" type="image/x-icon" href="images/faviconnnnn.ico">

<script type="text/javascript">
<% 
String msg1 = request.getQueryString();
String disp="";
if(msg1!=null){
String msg[] = msg1.toString().split("=");
	disp = msg[1].toString();
	disp = disp.replace("%20", "");
	disp = disp.replace("%27", " ");
	disp = disp.replace("__","  ");
}else{
	disp = "1";
}
%>

msg = "<%=disp%>";
if(msg!="1"){
	alert(msg);
}
</script>

<script type="text/javascript"> //<![CDATA[ 
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.trust-provider.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>

<script type='text/javascript'>

$(function(){

var overlay = $('<div id="overlay"></div>');

overlay.show();

overlay.appendTo(document.body);

$('.popup').show();

$('.close').click(function(){

$('.popup').hide();

overlay.appendTo(document.body).remove();

return false;

});




$('.x').click(function(){

$('.popup').hide();

overlay.appendTo(document.body).remove();

return false;

});

});

</script>

<script type="text/javascript" language="javascript">

function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}

</script>


<script>
<!--

/*
Auto Refresh Page with Time script
By JavaScript Kit (javascriptkit.com)
Over 200+ free scripts here!
*/

//enter refresh time in "minutes:seconds" Minutes should range from 0 to inifinity. Seconds should range from 0 to 59
var limit="0:30"

if (document.images){
var parselimit=limit.split(":")
parselimit=parselimit[0]*60+parselimit[1]*1
}
function beginrefresh(){
if (!document.images)
return
if (parselimit==1)
window.location.reload()
else{ 
parselimit-=1
curmin=Math.floor(parselimit/60)
cursec=parselimit%60
if (curmin!=0)
curtime=curmin+" minutes and "+cursec+" seconds left until page refresh!"
else
curtime=cursec+" seconds left until page refresh!"
window.status=curtime
setTimeout("beginrefresh()",1000)
}
}

window.onload=beginrefresh
//-->
</script>
<title>CS-SOFT</title>
<!-- <meta http-equiv="refresh" content="30" /> -->
</head>
<%--
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(30*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("logout.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}


//String b_no2=null;

//b_no2 = (String)session.getAttribute("b_no");

//System.out.println("Sesion converting :"+b_no2);

--%>


<!-- <body bgcolor="" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100" onload="changeHashOnLoad(); ">
 -->
<!-- <body id="bodyleng" bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="5" onload="checkForm() &&  changeHashOnLoad() " > -->

<body leftmargin="110"    marginheight="0" style="overflow-x: hidden; overflow-y: hidden;" onload="checkForm() &&  changeHashOnLoad()">

<form name="form">

<div id="id">
 <table>
<tr>
<td>

<a href="http://neinsoft.nittsu.co.in:8185/NEIN/"><img src="images/logo.png" height="35" width="220" ></a> 
 </td>
<td align="right">
<!-- <img src="images/c2.jpg" height="20" width="100" hspace="796" ></td> -->
<!-- <img src="images/cs-soft.jpg" height="30" width="100" hspace="796" > --></td>
</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr>
 

</table>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><font color="blue"> 
<script>

//Time of day message script- by javascriptkit.com
//Visit JavaScript Kit (http://javascriptkit.com) for script
//Credit must stay intact for use

var Digital=new Date()
var hours=Digital.getHours()

//Configure message below to your own.
if (hours>=5&&hours<=11) //MESSAGE FOR MORNING
document.write('<font color="#2f4377"><b>GOOD MORNING</b></font>')
else if (hours==12) //MESSAGE FOR NOON
document.write('<font color="#2f4377"><b>GOOD AFTERNOON</b></font>')
else if (hours>=13&&hours<=16) //MESSAGE FOR AFTERNOON
document.write('<font color="#2f4377"><b>GOOD AFTERNOON</b></font>')
else if (hours>=17&&hours<=20) //MESSAGE FOR EVENING (6pm-8pm)
document.write('<font color="#2f4377"><b>GOOD EVENING</b></font>')
else if (hours>=21&&hours<=11) //MESSAGE FOR NIGHT (9pm-11pm)
document.write('<font color="#2f4377"><b>Glad to see you this time of the night</b></font>')
else //MESSAGE FOR LATE NIGHT, EARLY MORNING (12pm-4am)
document.write('<font color="#2f4377"><b>Wow, thanks for choosing to visit C2IT over sleep!</b></font>')

</script></font>
</td>

<!-- <td width="1118" align="right"><blink style="font-size:2ex;color: blue;">Hit Ctrl+D to Bookmark</blink>
 <a href="http://neinsoft.nittsu.co.in:8185/NEIN/" id="hiderow">Home</a>
</td> -->
<td width="1118" align="right"  > 

<%String url = request.getRequestURL().toString();
	   // System.out.println("URL  : "+url);
	    if(url.equals("https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp"))
	           {%>
               <a href="https://neinsoft.nittsu.co.in:8185/NEIN/" class="top" title="Back to NEIN home page"><img width="35" src="images/homeforAll.jpg"></a>
                <%}else{ %>
               <a href="https://neinsoft.nittsu.co.in:8185/NEIN/" class="top" title="Back to NEIN home page"><img width="35" src="images/homeforAll.jpg"></a>
                 <%}%>






<!-- <a class="top" href="logout.jsp" class="top" title="Log out"><img width="35" src="images/icon_log.png"></a> -->
</td> 
</tr> 
</table>

<table width="1118" height="0" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="30" align="justify" valign="top"></td>
    <td width="40" align="justify" valign="top"></td>
   
  <td width="90" align="justify" valign="top"></td>
<!--  <td width="960" align="justify" height="20" valign="top"> -->

 <td width="800" height="380" align="justify" valign="top">
 <center>
				<table id="tableData" name="tableData" width="100%" cellspacing="1" border="1" style="border-collapse: collapse;">
				<!-- <tr><td colspan="4" align="center" bgcolor="grey">DASH BOARD</td></tr> -->
				<tr><td colspan="5" align="center" bgcolor="#1a005d" class="tdColor"><font color="white" ><label class="logC"><b>SYSTEM ADMINISTRATION COMPLAINT STATUS</b></label></font></td></tr>
				<tr><td width="70" align="center"  height="21" bgcolor="#8ec300" class="tdColor"><font color="white" size="2"><b>SYS ADMIN</b></font></td>
				
						<td width="70" align="center"  height="21" colspan="2" bgcolor="#8ec300" class="tdColor"><font color="white" size="2"><b>TODAYS CALLS</b></font></td>		
						<td width="70" align="center"  height="21" bgcolor="#8ec300" class="tdColor"><font color="white" size="2"><b>PREVIOUS CALLS</b></font></td>	
						<td width="70" align="center"  height="21" bgcolor="#8ec300" rowspan="2" class="tdColor"><font color="white" size="2"><b>AVAILABILITY</b></font></td>		
				</tr>
				<tr>
				<td width="67" align="center"  height="21" bgcolor="#8ec300" class="fonter"><font color="white" size="2"><b>NAME</b></font></td>
				<td width="67" align="center"  height="21" bgcolor="#8ec300" class="fonter"><font color="white" size="2"><b>RESOLVED</b></font></td>
				<td width="67" align="center"  height="21" bgcolor="#8ec300" class="fonter"><font color="white" size="2"><b>PENDING</b></font></td>
				<td width="67" align="center"  height="21" bgcolor="#8ec300" class="fonter"><font color="white" size="2"><b>PENDING</b></font></td>
				<!-- <td width="67" align="center"  height="21" bgcolor="lightgrey" class="fonter">AVAILABLE</td> -->
				</tr>
			
				  <%!String empp=null,status=null,notstatus=null,truestatus=null,allPending=null;
				  ArrayList<String> arrayListMail = new ArrayList<String>(); 
				  Connection2 dbConn = new Connection2();
				  int k=0,m=0;
					Connection cn02 = null,cn600=null,cn02A=null;
					Statement st02 = null,st600=null,st02A=null; 
					ResultSet rs02 = null,rs600=null,rs02A=null;
					String Note=null,Notename=null;
				    PreparedStatement psmt=null,psmmmt=null,psmtTime=null,psmtOneMoreTime=null,psmtToAllCall=null,psmtT=null;
				    ResultSet rsPsmt=null,rsTime=null,rsOneMoreTime=null,rsPsmtT=null;
				    Connection conn = null;
				  %>
					<% 
					
					AutoSendingMessage mailMessage = new AutoSendingMessage();
					AutoSendingMessageAllcomplaints mailMessageT = new AutoSendingMessageAllcomplaints();
					AutoSendingMessageAdmin mailMessageAdmin = new AutoSendingMessageAdmin();
					AutoSendingMessageAdminAllCalls mailMessageAdminAllCalls = new AutoSendingMessageAdminAllCalls();
					 String message = null,messageT=null,messageallCalls=null;
						String cs_date;
						Date cs_dateNew;
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						Date date = new Date();
						cs_date = dateFormat.format(date);
						String[] branchArray={"AHEMDABAD - 31","HEAD OFFICE - 90","BANGALORE - 10","DELHI - 20","MUMBAI - 30","CHENNAI - 40","KOLKATA - 51","HYDRABAD - 54"};
						String[] colorArray={"#AED6F1","#AED6F1","#AED6F1","#AED6F1","#AED6F1","#AED6F1","#AED6F1","#AED6F1"};
						String curbranch="not";
						int i=-1;
						/* DateFormat dateFormatr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");cyan,yellow,DarkSalmon,LightBlue,HotPink
						Date dater = new Date();
						System.out.println("NEW DATE SYSTEM DATE IN TIME STAMP FORMAT : "+dateFormatr.format(dater)); */
						
						
						
						//System.out.println("DATE"+cs_date);
						
						//System.out.println("C2IT- CS_dAte : "+cs_date);
						
						
					    conn = dbConn.getConnection2();
						try{
							cn02 = con.getConnection2();
							st02=cn02.createStatement();
							
							cn02A = con.getConnection2();
							st02A=cn02A.createStatement();
							
							cn600 = con.getConnection2();
							st600=cn600.createStatement();
					        rs600 = st600.executeQuery("SELECT note,name FROM notemaster where ndate='"+cs_date+"' AND status='done' AND id in (SELECT MAX(id) FROM notemaster) ORDER BY id DESC");
						while(rs600.next())
						{
							Note=rs600.getString("Note");
							Notename=rs600.getString("name");
						}
						//rs02 = st02.executeQuery("SELECT Nname,Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2,(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending FROM nentryho WHERE DESG_NO ='"+2+"' ORDER BY Nname ASC");
						/* rs02 = st02.executeQuery("SELECT DISTINCT n.Nname,n.Nmail,l.about, "+
						"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp, "+
						"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2, "+
						"(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending "+ 
						"FROM nentryho n LEFT JOIN availability l ON(n.Nname=l.name) WHERE n.DESG_NO ='2' ORDER BY n.Nname ASC"); */
						/* for(i=0;i<branchArray.length;i++)
					     { */
							rs02 = st02.executeQuery("SELECT NEHo.Nname,SubQ.Nname,SubQ.Nmail,SubQ.count_comp,SubQ.count_comp2,SubQ.allPending,SubQ.avb,NEHo.NpostingCo from nentryho NEHo LEFT JOIN "+
								        "(SELECT DISTINCT n.Nname,n.Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp, "+
										"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2, "+
										"(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=n.Nname AND  complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending, "+
										"(SELECT l.about FROM availability l WHERE n.Nname=l.name AND DATE(NOW()) between l.date1 and l.date2) as avb "+
										"FROM nentryho n  WHERE n.DESG_NO ='2' ORDER BY n.Nname ASC) as SubQ On NEHo.Nname = SubQ.Nname WHERE NEHo.DESG_NO='2' AND NEHo.department='IT SUPPORT' AND SubQ.Nname is NOT null  ORDER BY NEHo.NpostingCo ASC" );
						//SELECT Nname,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='2014-02-17') as count_comp FROM nentryho
						
						while(rs02.next())
						{k++;m++;
							empp = rs02.getString(1);//Nname
							//System.out.println("emp "+empp);
							notstatus = rs02.getString("count_comp");
							truestatus = rs02.getString("count_comp2");
							allPending = rs02.getString("allPending");
							//arrayListMail.add(rs02.getString("Nmail"));
							String available = rs02.getString(7);//avability
							String postingbranch = rs02.getString(8);
							//System.out.println("Npoting :"+postingbranch);
							//if(available.equals("Casual Leave"))
								//Comp Off,Sick Leave,On Duty
							if(available==null)
							{
								available = "Present";
							}
				
							
							
				    if(!postingbranch.equals(curbranch))
							{
				    	    i++;
				    	    curbranch=postingbranch;
							}
				    else
				            {
				    	    curbranch=postingbranch;
				            }
						
				  
				  
					if(!empp.equals("PRASANNA KUMAR")){%>
				    <tr >
				   
				    <td width="420" align=left  bgcolor=<%=colorArray[i]%>><input type="hidden" name="<%=k%>" value="<%=empp%>" />
   					            <font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><b><%=empp%></b></a></font> </td> 
   					<td width="67" align="center"  height="21" id="aaad" >.<%=truestatus%></td>
					<td width="67" align="center"  height="21" >g<%=notstatus%></td>
					<td width="67" align="center"  height="21" >,,<%=allPending%></td>
					<td width="67" align="center"  height="21"><font size="2"><%=available%></font></td>
				   </tr>		
				   
			
				
				<%}}%>
				
				
				<%-- rs02 = st02.executeQuery("SELECT NEHo.Nname,SubQ.Nname,SubQ.Nmail,SubQ.count_comp,SubQ.count_comp2,SubQ.allPending,SubQ.avb from nentryho NEHo LEFT JOIN "+
								        "(SELECT DISTINCT n.Nname,n.Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp, "+
										"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2, "+
										"(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=n.Nname AND  complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending, "+
										"(SELECT l.about FROM availability l WHERE n.Nname=l.name AND DATE(NOW()) between l.date1 and l.date2) as avb "+
										"FROM nentryho n  WHERE n.DESG_NO ='2' ORDER BY n.Nname ASC) as SubQ On NEHo.Nname = SubQ.Nname WHERE NEHo.DESG_NO='2' AND NEHo.department='IT SUPPORT' AND SubQ.Nname is NOT null and NEHo.NpostingCo='BANGALORE - 10'");
						//SELECT Nname,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='2014-02-17') as count_comp FROM nentryho
						
						while(rs02.next())
						{k++;m++;
							empp = rs02.getString(1);//Nname
							//System.out.println("emp "+empp);
							notstatus = rs02.getString("count_comp");
							truestatus = rs02.getString("count_comp2");
							allPending = rs02.getString("allPending");
							//arrayListMail.add(rs02.getString("Nmail"));
							String available = rs02.getString(7);//avability
							//if(available.equals("Casual Leave"))
								//Comp Off,Sick Leave,On Duty
							if(available==null)
							{
								available = "Present";
							}
							/* else if(available!=null && available.equals("Casual Leave"))
							{
								available = "CL";
							}
							else if(available!=null && available.equals("Sick Leave"))
							{
								available = "SL";
							} */
						%>
				    <tr bgcolor="yellow">
				    <td width="420" align=center  ><input type="hidden" name="<%=k%>" value="<%=empp%>" />
   					            <font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><%=empp%></a></font> </td> 
   					<td width="67" align="center"  height="21" id="aaad" >.<%=truestatus%></td>
					<td width="67" align="center"  height="21" >g<%=notstatus%></td>
					<td width="67" align="center"  height="21" >,,<%=allPending%></td>
					<td width="67" align="center"  height="21"><font size="2"><%=available%></font></td>
				   </tr>		
				   
			
				
				<%}rs02 = st02.executeQuery("SELECT NEHo.Nname,SubQ.Nname,SubQ.Nmail,SubQ.count_comp,SubQ.count_comp2,SubQ.allPending,SubQ.avb from nentryho NEHo LEFT JOIN "+
								        "(SELECT DISTINCT n.Nname,n.Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp, "+
										"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2, "+
										"(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=n.Nname AND  complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending, "+
										"(SELECT l.about FROM availability l WHERE n.Nname=l.name AND DATE(NOW()) between l.date1 and l.date2) as avb "+
										"FROM nentryho n  WHERE n.DESG_NO ='2' ORDER BY n.Nname ASC) as SubQ On NEHo.Nname = SubQ.Nname WHERE NEHo.DESG_NO='2' AND NEHo.department='IT SUPPORT' AND SubQ.Nname is NOT null and NEHo.NpostingCo='DELHI - 20'");
						//SELECT Nname,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='2014-02-17') as count_comp FROM nentryho
						
						while(rs02.next())
						{k++;m++;
							empp = rs02.getString(1);//Nname
							//System.out.println("emp "+empp);
							notstatus = rs02.getString("count_comp");
							truestatus = rs02.getString("count_comp2");
							allPending = rs02.getString("allPending");
							//arrayListMail.add(rs02.getString("Nmail"));
							String available = rs02.getString(7);//avability
							//if(available.equals("Casual Leave"))
								//Comp Off,Sick Leave,On Duty
							if(available==null)
							{
								available = "Present";
							}
							/* else if(available!=null && available.equals("Casual Leave"))
							{
								available = "CL";
							}
							else if(available!=null && available.equals("Sick Leave"))
							{
								available = "SL";
							} */
						%>
				    <tr bgcolor="DarkSalmon ">
				    <td width="420" align=center  ><input type="hidden" name="<%=k%>" value="<%=empp%>" />
   					            <font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><%=empp%></a></font> </td> 
   					<td width="67" align="center"  height="21" id="aaad" >.<%=truestatus%></td>
					<td width="67" align="center"  height="21" >g<%=notstatus%></td>
					<td width="67" align="center"  height="21" >,,<%=allPending%></td>
					<td width="67" align="center"  height="21"><font size="2"><%=available%></font></td>
				   </tr>		
				   
			
				
				<%}rs02 = st02.executeQuery("SELECT NEHo.Nname,SubQ.Nname,SubQ.Nmail,SubQ.count_comp,SubQ.count_comp2,SubQ.allPending,SubQ.avb from nentryho NEHo LEFT JOIN "+
								        "(SELECT DISTINCT n.Nname,n.Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp, "+
										"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2, "+
										"(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=n.Nname AND  complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending, "+
										"(SELECT l.about FROM availability l WHERE n.Nname=l.name AND DATE(NOW()) between l.date1 and l.date2) as avb "+
										"FROM nentryho n  WHERE n.DESG_NO ='2' ORDER BY n.Nname ASC) as SubQ On NEHo.Nname = SubQ.Nname WHERE NEHo.DESG_NO='2' AND NEHo.department='IT SUPPORT' AND SubQ.Nname is NOT null and NEHo.NpostingCo='MUMBAI - 30'");
						//SELECT Nname,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='2014-02-17') as count_comp FROM nentryho
						
						while(rs02.next())
						{k++;m++;
							empp = rs02.getString(1);//Nname
							//System.out.println("emp "+empp);
							notstatus = rs02.getString("count_comp");
							truestatus = rs02.getString("count_comp2");
							allPending = rs02.getString("allPending");
							//arrayListMail.add(rs02.getString("Nmail"));
							String available = rs02.getString(7);//avability
							//if(available.equals("Casual Leave"))
								//Comp Off,Sick Leave,On Duty
							if(available==null)
							{
								available = "Present";
							}
							/* else if(available!=null && available.equals("Casual Leave"))
							{
								available = "CL";
							}
							else if(available!=null && available.equals("Sick Leave"))
							{
								available = "SL";
							} */
						%>
				    <tr bgcolor="LightBlue">
				    <td width="420" align=center  ><input type="hidden" name="<%=k%>" value="<%=empp%>" />
   					            <font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><%=empp%></a></font> </td> 
   					<td width="67" align="center"  height="21" id="aaad" >.<%=truestatus%></td>
					<td width="67" align="center"  height="21" >g<%=notstatus%></td>
					<td width="67" align="center"  height="21" >,,<%=allPending%></td>
					<td width="67" align="center"  height="21"><font size="2"><%=available%></font></td>
				   </tr>		
				   
			
				
				<%}rs02 = st02.executeQuery("SELECT NEHo.Nname,SubQ.Nname,SubQ.Nmail,SubQ.count_comp,SubQ.count_comp2,SubQ.allPending,SubQ.avb from nentryho NEHo LEFT JOIN "+
								        "(SELECT DISTINCT n.Nname,n.Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Pending') as count_comp, "+
										"(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=n.Nname AND complain_master_item.cm_date='"+cs_date+"' AND complain_master_item.cm_status='Resolved') as count_comp2, "+
										"(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=n.Nname AND  complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"') as allPending, "+
										"(SELECT l.about FROM availability l WHERE n.Nname=l.name AND DATE(NOW()) between l.date1 and l.date2) as avb "+
										"FROM nentryho n  WHERE n.DESG_NO ='2' ORDER BY n.Nname ASC) as SubQ On NEHo.Nname = SubQ.Nname WHERE NEHo.DESG_NO='2' AND NEHo.department='IT SUPPORT' AND SubQ.Nname is NOT null and NEHo.NpostingCo='CHENNAI - 40'");
						//SELECT Nname,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='2014-02-17') as count_comp FROM nentryho
						
						while(rs02.next())
						{k++;m++;
							empp = rs02.getString(1);//Nname
							//System.out.println("emp "+empp);
							notstatus = rs02.getString("count_comp");
							truestatus = rs02.getString("count_comp2");
							allPending = rs02.getString("allPending");
							//arrayListMail.add(rs02.getString("Nmail"));
							String available = rs02.getString(7);//avability
							//if(available.equals("Casual Leave"))
								//Comp Off,Sick Leave,On Duty
							if(available==null)
							{
								available = "Present";
							}
							/* else if(available!=null && available.equals("Casual Leave"))
							{
								available = "CL";
							}
							else if(available!=null && available.equals("Sick Leave"))
							{
								available = "SL";
							} */
						%>
				    <tr bgcolor="HotPink">
				    <td width="420" align=center  ><input type="hidden" name="<%=k%>" value="<%=empp%>" />
   					            <font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><%=empp%></a></font> </td> 
   					<td width="67" align="center"  height="21" id="aaad" >.<%=truestatus%></td>
					<td width="67" align="center"  height="21" >g<%=notstatus%></td>
					<td width="67" align="center"  height="21" >,,<%=allPending%></td>
					<td width="67" align="center"  height="21"><font size="2"><%=available%></font></td>
				   </tr>		
				   
			
				
				<%}%> --%>
				
				
				
				
				
				
				
				</table>
			
					
					   	<%                     
											java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy");
											String TodaysDate =  po_date.format(new java.util.Date());
										//	System.out.println("TodaysDate  :"+TodaysDate);
											//System.out.println("TodaysDate  LENGTH :"+TodaysDate.length());
											String PendingFromQueryDate=null;
											Timestamp t1 =null;
											//System.out.println("Before Preparement Statement");
												psmtTime=conn.prepareStatement("SELECT id,SentDate,DATE_FORMAT(SentDate,'%e/%m/%Y') as datu FROM sendingautomail WHERE depart='IT SUPPORT' ORDER BY id DESC LIMIT 1");
												//System.out.println("After Preparement Statement");
												rsTime = psmtTime.executeQuery();
												//System.out.println("After Preparement Statement Execution");
												while(rsTime.next())
												{
													//System.out.println("While Preparement Statement");
													int ddd = rsTime.getInt(1);
													//Timestamp timeer = rsTime.getTimestamp(2);
													 t1 = rsTime.getTimestamp(2);
													 PendingFromQueryDate = rsTime.getString(3);
													// System.out.println("MAX ID************** :"+ddd);
													// System.out.println("timeer************** :"+timeer);
													// System.out.println("t1************** :"+t1);
												//	System.out.println("DATE FROM SendingAutoMail Master  :"+timeer);
												//	System.out.println("PendingFromQueryDate :"+PendingFromQueryDate);
												//	System.out.println("PendingFromQueryDate LENGTH :"+PendingFromQueryDate.length());
												}
												 //  System.out.println("\n SendingAutoMail 1 Executived:");
												Date dateg= new Date();
										         //getTime() returns current time in milliseconds
											 long timeg = dateg.getTime();
										         //Passed the milliseconds to constructor of Timestamp class 
											 Timestamp tsg = new Timestamp(timeg);
											// System.out.println("Current Time Stamp: "+tsg);
												
											 long timeNow = System.currentTimeMillis();
											// System.out.println("timeNow "+timeNow);
												String diffTimeeer = timeDiff.getTimeDifference2(t1.toString(),tsg.toString());
											//	System.out.println("Diff Timer ********************* :"+diffTimeeer);
												 long milliseconds1 = t1.getTime();
												 long milliseconds2 = date.getTime();
												 long diff = milliseconds2 - milliseconds1;
												// System.out.print("t1 : "+t1);//Past Time // FROM query
												// System.out.print("date : "+date);//Todays Date //SYSTEM DATE
												// System.out.print("milliseconds1 : "+milliseconds1);
												// System.out.print("milliseconds2 : "+milliseconds2);
												// System.out.print("Diff :"+diff);
												
												 int difftDate = (int) diff;//3770845//5962858//60770007//61610104
												 String Department=null;
												 int eighthours = 28800000;//60000
												// System.out.print("\n difftDate :"+difftDate);
												// System.out.print("\n eighthours :"+eighthours);
												// int eighthours = 6000000;//60000
												 
												//  System.out.println("\n emppp :"+empp);
												
												 
												//if((difftDate >= eighthours )) // TRUEEEEE Done sent time and present time 
												//	if(PendingFromQueryDate != TodaysDate)// TRUEEEEEEE - done : if Records already sent/Present in database // if not present then it will send 
													 if((PendingFromQueryDate != TodaysDate) && (difftDate >= eighthours ))
												              {  
													
														 System.out.println("\n To send Auto reminder mail : if its not same date and more then 8 hours.");
														 String AutoPending = "Pending";
														// System.out.println("arrayListMail PPPPPPP :"+arrayListMail);
														// System.out.println("\n TRUEEEEEE :"+empp);
														 //psmtOneMoreTime = conn.prepareStatement("SELECT Nname,Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status=?) as count_comp,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status=?) as count_comp2,(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_status=? AND complain_master_item.cm_date <> ?) as allPending  FROM nentryho WHERE DESG_NO =? ORDER BY Nname ASC");
														 //psmtOneMoreTime = conn.prepareStatement("SELECT Nname,Nmail,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status=?) as count_comp,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date=? AND complain_master_item.cm_status=?) as count_comp2,(select count(complain_master_item.emp) as Numbee FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_status=? AND complain_master_item.cm_date <> ?) as allPending  FROM nentryho WHERE DESG_NO =? ORDER BY Nname ASC");
														// psmtOneMoreTime = conn.prepareStatement("select DISTINCT complain_master_item.emp,complain_master_item.mail FROM complain_master_item INNER JOIN nentryho ON(complain_master_item.emp=nentryho.Nname) where complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> ?");
														psmtOneMoreTime = conn.prepareStatement("select DISTINCT complain_master_item.emp,complain_master_item.mail,complain_master_item.reportTo from complain_master_item INNER JOIN assigned_master ON(complain_master_item.emp=assigned_master.Locname) INNER JOIN nentryho ON(assigned_master.Locname=nentryho.Nname) WHERE nentryho.Npost='IT SUPPORT' AND nentryho.department='IT SUPPORT' AND complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> '"+cs_date+"' GROUP BY complain_master_item.emp");
													//	psmtOneMoreTime = conn.prepareStatement("select DISTINCT complain_master_item.emp,complain_master_item.mail from complain_master_item INNER JOIN assigned_master ON(complain_master_item.emp=assigned_master.Locname) INNER JOIN nentryho ON(assigned_master.Locname=nentryho.Nname) WHERE nentryho.Npost='IT SUPPORT' AND complain_master_item.cm_status='Pending' AND complain_master_item.cm_date <> ? AND cm_time < NOW() - INTERVAL 8 HOUR GROUP BY complain_master_item.emp");
														/*  psmtOneMoreTime.setString(1,cs_date);
														 psmtOneMoreTime.setString(2,"Pending");
														 psmtOneMoreTime.setString(3,cs_date);
														 psmtOneMoreTime.setString(4,"Resolved");
														 psmtOneMoreTime.setString(5,"Pending");
														 psmtOneMoreTime.setString(6,cs_date);
														 psmtOneMoreTime.setString(7,"2"); */
														// psmtOneMoreTime.setString(1,"Pending");
														// psmtOneMoreTime.setString(1,cs_date);
														 
														 rsOneMoreTime = psmtOneMoreTime.executeQuery();
														 while(rsOneMoreTime.next())
															{
															 String emppOneMoreTime = rsOneMoreTime.getString("emp");
															 Department = rsOneMoreTime.getString("reportTo");
															System.out.println("-------------------------emppOneMoreTime Paramater in home page:"+emppOneMoreTime);
													 					
															 
															            psmt = conn.prepareStatement("SELECT DISTINCT emp,mail,cm_time,cm_date,DATE_FORMAT(cm_time,'%e-%m-%Y %h:%i') as datu,cm_location,cm_mail,cm_name FROM complain_master_item WHERE cm_time < NOW() - INTERVAL 8 HOUR AND desg='IT SUPPORT' AND cm_status='Pending' AND emp='"+emppOneMoreTime+"' GROUP BY emp ORDER BY cm_date ASC ");
																	    //psmt.setString(1,emppOneMoreTime);
																	   // psmt.setString(1,"bbb");
																	   //emppOneMoreTime = emppOneMoreTime.replaceAll("[\\s.]", "");
																	    rsPsmt = psmt.executeQuery();
																	  	
																	  	String AutoMail=null;
																	  	String AutoEmp=null;
																	  	String AutoCity=null;
																	  	String UserMail=null;
																	  	String UserName=null;
																		while(rsPsmt.next())
																		{
																			Date cm_timeee =rsPsmt.getDate(5);
																			Timestamp time = rsPsmt.getTimestamp("cm_time");
																		     AutoEmp = rsPsmt.getString("emp");
																				 AutoMail = rsPsmt.getString("mail");
																				 AutoCity =rsPsmt.getString("cm_location");
																				 UserMail = rsPsmt.getString("cm_mail");
																				 UserName = rsPsmt.getString("cm_name");
																				 
																				message = mailMessage.getMailAutoSendingMessage(AutoEmp);
																				//System.out.println("message : "+message);
																				//postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234",AutoMail,"NEIN-C2IT Pending Calls - Reminder : To Mr."+AutoEmp+"",  "<font color=red> Close respective pending calls and update us back.:</font><br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
																				//postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234",UserMail,"NEIN-C2IT Pending Calls - Reminder : Copy of Mail to User ",  "<font color=red> : Close respective pending calls and update us back.</font><br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
																				//System.out.println("AFTER POST MAIL  ");
																			 
																	
																		}// System.out.println("\n TRUEEEEEE 2 :"+empp);
																		                            /*   //Whether its pending or solved mail should be sent to SR.MANAGER IT AND SHETTY emp wise
																										psmtT = conn.prepareStatement("SELECT DISTINCT emp,mail,cm_time,cm_date,DATE_FORMAT(cm_time,'%e-%m-%Y %h:%i') as datu,cm_location,cm_mail,cm_name FROM complain_master_item WHERE cm_time < NOW() - INTERVAL 8 HOUR AND desg='IT SUPPORT' AND emp='"+emppOneMoreTime+"' GROUP BY emp ORDER BY cm_date ASC ");
																										String AutoMailT=null;
																									  	String UserNameT=null;
																										 rsPsmtT = psmt.executeQuery();
																										 while(rsPsmtT.next())
																										 {
																											 AutoMailT = rsPsmtT.getString("mail");
																											 UserNameT = rsPsmtT.getString("cm_name");
																											 messageT = mailMessageT.getMailAutoSendingMessageAll(AutoEmp);
																												//System.out.println("message : "+message);
																											 	//postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234",AutoMail,"NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red> Close respective pending calls and update us back.:</font><br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
																												//postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234",UserMail,"NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red> Copy of Mail to User : Close respective pending calls and update us back.</font><br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
																											
																												postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","farooq.s@nittsu.co.in","NEIN-C2IT All Calls Assigned to : "+"AutoEmp",  "<font color=red> Close respective pending calls and update us back.:</font><br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
																												postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","farooq.s@nittsu.co.in","NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red> Copy of Mail to User : Close respective pending calls and update us back.</font><br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
																										 } */
																		 
																		 
																		 
																		 
																		 
																		 
																		 
																		// System.out.println("AUTO MAIL : "+AutoMail);
																		 System.out.println("AUTO EMP : "+AutoEmp);
																		    psmmmt = conn.prepareStatement("insert into sendingautomail(AutoMail,AutoEmp,depart) values(?,?,?)");//SentDate
																		    psmmmt.setString(1,AutoMail);
																		    psmmmt.setString(2,AutoEmp);
																		    psmmmt.setString(3,"IT SUPPORT");
																		    int li=psmmmt.executeUpdate();	
																		    System.out.println("System admin auto sending mail : entered \n SendingAutoMail 2 Executived:");
																		    
																		    
																		    
																			  
																			  	
																			   
															}
														 /*   message = mailMessageAdmin.getMailAutoSendingMessageAdmin(AutoPending.trim());
														   postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","prasanna.v@nittsu.co.in","NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
														 //postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","farooq.s@nittsu.co.in","NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
														   System.out.println("Mail sent to Prasanna as a pending reminder.");  */
														   
														   message = mailMessageAdmin.getMailAutoSendingMessageAdmin(AutoPending.trim());
														   
															//  postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","prasanna.v@nittsu.co.in","NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
															 //  postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","prasanna.shetty@nittsu.co.in","NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
															// postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","farooq.s@nittsu.co.in","NEIN-C2IT Pending Calls - Reminder : ",  "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"+message);
															//   System.out.println("Mail sent to Prasanna as a pending reminder.");
															 
														    messageallCalls = mailMessageAdminAllCalls.getMailAutoSendingMessageAllCalls(cs_date.trim(),"IT SUPPORT");//sending mail to ITMANAGER of complaints which are resolved or not
														 //  postMail.postMail("prasanna.v@nittsu.co.in","Pending Calls - Reminder","pass1234","prasanna.v@nittsu.co.in","NEIN-C2IT All Calls - Reminder : ",  "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+messageallCalls);
														 // postMail.postMail("neinsoft@nittsu.co.in","All Calls - Reminder","pass1234","farooq.s@nittsu.co.in","NEIN-C2IT All Calls - Reminder : ", Department+ "<font color=red>Close these pending calls and update us back.</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+messageallCalls);
												              }
															 else{
																// System.out.println("\n TRUEEEEEE IN ELSE  :"+empp);
																 System.out.println("\n**************Auto Pending Complaints Mail Already Sent************");
															 }
													// System.out.println("\n TRUEEEEEE OUTSIDE  :"+empp);
												%>	
					
					
										
				
				
				<%-- <table width="100%" cellspacing="1" border="2">
				<tr>
				<td  width="67" align="center"  height="21" bgcolor="lightgrey" class="fonter">NAME</td>
				<td  width="67" align="center"  height="21" bgcolor="lightgrey" class="fonter">AVALIABILITY</td>
				</tr>
				<% 
				String nameAva=null,avalab=null;int p=0;
				rs02A= st02A.executeQuery("Select DISTINCT NEHo.Nname,SubQ.about from nentryho NEHo left join (SELECT a.about,n.Nname,a.name FROM nentryho n left join availability a ON ( n.Nname= a.name) WHERE DATE(NOW()) between date1 and date2) as SubQ On NEHo.Nname = SubQ.name WHERE NEHo.DESG_NO='2'");
				while(rs02A.next())
						{p++;
						nameAva = rs02A.getString(1);
						avalab = rs02A.getString(2);
						%>
				    <tr><td width="420" align=center  ><input type="hidden" name="<%=p%>" value="<%=nameAva%>" />
   					 <font color="white" size="2" ><a href="#" onclick="linkAvai(<%=p%>);"  title="click for more details"><%=nameAva%></a></font> </td> 
   					 <td width="67" align="center"  height="21" id="aaad">.<%=avalab%></td>
				    </tr>		
				<%}%>
				</table> --%>
				
				
				
				
				
				
				
				
				
				
				
				<% 
						
						
						}catch (SQLException ex) {ex.printStackTrace();}
						finally {
							DbUtil.closeDBResources(rs02,st02,cn02);
							DbUtil.closeDBResources(rs02A,st02A,cn02A);
							DbUtil.closeDBResources(rs600,st600,cn600);
							DbUtil.closeDBResources(rsOneMoreTime,psmtOneMoreTime,conn);
							DbUtil.closeDBResources(rsPsmt,psmmmt,null);
							DbUtil.closeDBResources(rsTime,psmtTime,null);
							DbUtil.closeDBResources(null,psmt,null);
					}
					
				%>
			
				

<!-- <strong><a href="complainPage.jsp?msg=1"><font size=2><blink>COMPLAINS ? CLICK HERE</blink></font></a></strong> -->
	</center>
	
	
	   <center>
		<!-- <strong ><a href="workInProgress.jsp?msg=1" onclick="return popitup('workInProgress.jsp?msg=1')"><font size=2>OFFICE ADMINISTRATION PAGE</font></a></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<strong ><a href="HRadmin.jsp?msg=1"><font size=2>OFFICE ADMINISTRATION</font></a></strong><!-- <span class="red-tag"><sup>New</sup></span> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong><a href="SoftwareDeveloper.jsp?msg=1"><font size=2>SOFTWARE DEVELOPMENT</font></a><!-- <span class="red-tag"><sup>New</sup></span> --></strong>
	</center>
</td>

<%-- <table width="100%" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr> --%>
	
		  <td width="200" align="justify" valign="top"></td>
		 
		<td width="400" height="130" align="justify" valign="top">
		<img vspace="15" src="images/NipponHomePage.JPG" width="530" height="300" border="1">
		
	   <center>
		<strong ><a href="loginho.jsp?msg=1"><font size=2>SYSTEM ADMINISTRATION PAGE</font></a></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong><a href="adminlink.jsp?msg=1"><font size=2>APPROVAL / ADMINISTRATION PAGE</font></a></strong>
	</center>
	<center>
	<br />
	<strong >
<!-- <img  src="images/mail.jpg" width="35" height="" border="1"> -->
	<!-- <strong><a href="assetManagement/loginAssetPage.jsp?msg=1"><font size=2>ASSET MGMT</font></a></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	<!-- <strong><a href="assetManagement/loginAssetPage.jsp?msg=1"><font size=2>ASSET MGMT</font></a></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	<a href="complaintPage.jsp?msg=1" ><font size=2>LOG COMPLAINTS</font></a></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<strong><a href="adminlinkHR.jsp?msg=1"><font size=2>APPLICATION FORMS</font></a></strong>
	<strong>&nbsp;&nbsp;&nbsp;<a href="Conference/LoginConRoom.jsp?msg=1" ><font size=2>CONFERENCE ROOM BOOKING</font></a></strong>
		
	</center>
	
	<%-- <center>
	<br /><fieldset >	<strong ><font size="2" color="grey">
	<%	if(Notename==null)
	{
		Notename="C2IT";
	} 
	if(Note==null)
	{
		Note="Have a Successful Day";
	} %>
<%=Notename %> says : &nbsp; <%=Note %> </font></strong></fieldset>

	</center> --%>
		</td>
	<%-- 	<td width="300" align="justify" valign="top">
		
		<table width="100%" cellspacing="1" border="2">
				<tr>
				<td  width="67" align="center"  height="21" bgcolor="lightgrey" class="fonter">NAME</td>
				<td  width="67" align="center"  height="21" bgcolor="lightgrey" class="fonter">AVALIABILITY</td>
				</tr>
				<% 
				String nameAva=null,avalab=null;int p=0;
				rs02A= st02A.executeQuery("Select DISTINCT NEHo.Nname,SubQ.about from nentryho NEHo left join (SELECT a.about,n.Nname,a.name FROM nentryho n left join availability a ON ( n.Nname= a.name) WHERE DATE(NOW()) between date1 and date2) as SubQ On NEHo.Nname = SubQ.name WHERE NEHo.DESG_NO='2' ORDER BY Nname ASC");
				while(rs02A.next())
						{p++;
						nameAva = rs02A.getString(1);
						avalab = rs02A.getString(2);
						%>
				    <tr><td width="420" align=center  ><input type="hidden" name="<%=p%>" value="<%=nameAva%>" />
   					 <font color="white" size="2" ><a href="#" onclick="linkAvai(<%=p%>);"  title="click for more details"><%=nameAva%></a></font> </td> 
   					 <td width="67" align="center"  height="21" id="aaad">.<%=avalab%></td>
				    </tr>		
				<%}%>
				</table>
		
		</td> --%>
</tr>
</table>





<br>



<div id="layer05_holder">


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center"> <td class="greenLine" style="font-style: italic;" colspan="2"></td></tr>
   <tr align="center"><td class="blueLine" style="font-style: italic;" colspan="2"></td></tr>
   <tr align="right">
    <td align="left">Version 1.2 </td>
    <td >
        <script language="JavaScript" type="text/javascript">
          TrustLogo("images/sectigo_trust.png", "CL1", "none");
        </script>
    </td>
    
  </tr>
</table> 

<%
//<%@page import="java.net.InetAddress"
//InetAddress ip;
       // String hostname;
try {
/*    InetAddress addr = InetAddress.getLocalHost();
  String bla = addr.getHostAddress();         
  System.out.println("IP ADDRESS OF PRESENT USER SYSTEM: C2IT : "+bla); */
 // System.out.println("IP ADDRESS OF PRESENT USER SYSTEM: P2P-SOFT bla : "+bla);
  String ipAddress =  request.getRemoteAddr();
 // System.out.println("PRESENT USER SYSTEM: C2IT -> IP ADDRESS HOST NAME :- "+ipAddress);
  /* String clintHost = request.getRemoteHost();
  System.out.println("IP clintHost : "+clintHost); */
  String localhostname = java.net.InetAddress.getLocalHost().getHostName();
  System.out.println("PRESENT USER SYSTEM: C2IT -> IP ADDRESS :- "+ipAddress+"  HOST NAME :- "+localhostname);
  /* String a = request.getLocalAddr();
  String b = request.getRemoteAddr();
  String c = request.getRemoteHost();
  System.out.println("A : "+a);
  System.out.println("B : "+b);
  System.out.println("C : "+c);
  java.net.InetAddress localMachine = java.net.InetAddress.getLocalHost();
  System.out.println("Hostname of local machine: " + localMachine.getHostName());
   */

/*   ip = InetAddress.getLocalHost();
 // hostname = ip.getHostName();
  System.out.println("PRESENT USER SYSTEM: C2IT -> IP ADDRESS HOST NAME :- " + ip);
  //System.out.println("Your current Hostname : " + hostname); */
} catch (Exception e) {
} %>
 

 </div> <!--end wrapper--></div>
</form>
</body>
</html>