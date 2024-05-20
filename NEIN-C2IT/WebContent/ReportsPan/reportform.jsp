<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@page import="java.util.GregorianCalendar" %>
<%@page import="CON2.MgmtReport" %>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>

<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<jsp:useBean id="dateFormat" class="CON2.DateFormat" />
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %>
<%@ page import="java.util.*" %>
    <%-- <%@ page import="com.google.gson.Gson"%>
    <%@ page import="com.google.gson.JsonObject"%>  --%>
<jsp:useBean id = "con" class="CON2.Connection2" />


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports For All Application Forms</title>
	
<link rel='stylesheet' type='text/css' href='../../css/style.css' />
	<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
	<script type='text/javascript' src='../../js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='../../js/example.js'></script>
		<script type='text/javascript' src='../../js/jquery-1.5.1.min.js'></script>
		<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico">
<link rel='stylesheet' type='text/css' href='../css/homePage.css' />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=1200,width=800,location=1,top=500,left=300,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>

<script type="text/javascript">
function ExportToExcel(type, fn, dl) {
    var elt = document.getElementById('main');
    var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
    return dl ?
      XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
      XLSX.writeFile(wb, fn || ('MySheetName.' + (type || 'xlsx')));
 }
</script>

 <style type="text/css"> 
 body{
/*   height:100vh; */
/* background-color:#33cccc; */
/* background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%); */
  font-family:sans-serif;
  background-position:center center;
}
#report{
padding:3px;
}
#C2IT{

border-collapse:collapse;
border-spacing:10px;
margin:8px;
}
#C2IT tr{
height:10px;
}

#C2IT td {

                
                /* text-align:center; */
                border:1px solid black;
                padding:3px;
                
             
            }

#Comm{
margin:2px;
border-spacing:10px;
border-collapse:collapse;
}
#Comm td{

/* text-align:center; */
border:1px solid black;
padding:3px;}

</style>

</head>

<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String req,req2,req3;
	            String total_val=null;
	            
	            int ireq2;
	              Connection2 dbConn = new Connection2();
	             
	    
	            
	%>


     <%
                
	req=request.getParameter("branch");
     req2= request.getParameter("year");
     req3= request.getParameter("month");
     ireq2=Integer.parseInt(req2);
     
     System.out.println("req    " +req);
     System.out.println("req2   "+req2);
     System.out.println("req3   "+req3);

   String [] Mon=req3.split("-");
   String[] dateString = req3.split("-");
     
     System.out.println(dateString[1]);
    
     if (dateString[1].equals("January"))
     {
   	  dateString[1]="01";
     }
     
     if (dateString[1].equals("February"))
     {
   	  dateString[1]="02";
     }
     if (dateString[1].equals("March"))
     {
   	  dateString[1]="03";
     }
     if (dateString[1].equals("April"))
     {
   	  dateString[1]="04";
     }
     if (dateString[1].equals("May"))
     {
   	  dateString[1]="05";
     }
     if (dateString[1].equals("June"))
     {
   	  dateString[1]="06";
     }
     if (dateString[1].equals("July"))
     {
   	  dateString[1]="07";
     }
     if (dateString[1].equals("August"))
     {
   	  dateString[1]="08";
     }
     if (dateString[1].equals("September"))
     {
   	  dateString[1]="09";
     }
     if (dateString[1].equals("October"))
     {
   	  dateString[1]="10";
     }
     if (dateString[1].equals("November"))
     {
   	  dateString[1]="11";
     }
     if (dateString[1].equals("December"))
     {
   	  dateString[1]="12";
     }
     
     String start = req2+"-"+dateString[1]+"-"+dateString[0];
     
String[] dateString1 = req3.split("-");
     
     System.out.println(dateString[1]);
    
     if (dateString1[1].equals("January"))
     {
   	  dateString1[0]="31";
   	  dateString1[1]="01";
     }
     
     if(ireq2%4==0 && dateString1[1].equals("February")){
    	 System.out.println("leap year");
   	  		dateString1[0]="29";
   			dateString1[1]="02";
     }
     if(ireq2%4!=0 && dateString1[1].equals("February")){
    	 System.out.println("Not leap year");
    	 dateString1[0]="28";
    	 dateString1[1]="02";
     }
     
     if (dateString1[1].equals("March"))
     {
   	  dateString1[0]="31";
   	dateString1[1]="03";
     }
     if (dateString1[1].equals("April"))
     {
   	  dateString1[0]="30";
   	dateString1[1]="04";
     }
     if (dateString1[1].equals("May"))
     {
   	  dateString1[0]="31";
   	dateString1[1]="05";
     }
     if (dateString1[1].equals("June"))
     {
   	  dateString1[0]="30";
   	dateString1[1]="06";
     }
     if (dateString1[1].equals("July"))
     {
   	  dateString1[0]="31";
   	dateString1[1]="07";
     }
     if (dateString1[1].equals("August"))
     {
   	  dateString1[0]="31";
   	dateString1[1]="08";
     }
     if (dateString1[1].equals("September"))
     {
   	  dateString1[0]="30";
   	dateString1[1]="09";
     }
     if (dateString1[1].equals("October"))
     {
   	  dateString1[0]="31";
   	dateString1[1]="10";
     }
     if (dateString1[1].equals("November"))
     {
   	  dateString1[0]="30";
   	dateString1[1]="11";
     }
     if (dateString1[1].equals("December"))
     {
   	  dateString1[0]="31";
   	dateString1[1]="12";
     }
     String end = req2+"-"+dateString1[1]+"-"+dateString1[0];
      
   %>
     
<body background="images/u.jpg">
<div id="wrapper">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
    
    </tr>
    <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">MANAGEMENT REPORT</font></strong></td>
</tr>
 
  <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<table width="850" align="center" border="0">
<tr>
<td align="right">
<button onclick="ExportToExcel('xlsx')"><font size="2">Export To Excel</font></button></td></tr>
</table>
<form name="form">  

<center>

   <%

String b;
Connection cn3 = null;
Statement st1=null,st3= null,st2=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st10=null,st11=null,st12=null,st13=null,st14=null,st15=null,st16=null; 
ResultSet rs1=null,rs3 = null,rs2=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null,rs12=null,rs13=null,rs14=null,rs15=null,rs16=null;
String osd=null,domain=null,Email=null,Access=null,Shared=null,incident=null,Gsnet=null,nexas=null,USB=null,nein=null,Com=null,newins=null,name=null,bno=null,VPN=null;
int iosd=0,idomain=0,iemail=0,iaccess=0,ishared=0,igsnet=0,inexas=0,iusb=0,inein=0,ilog=0,inewins=0,iincident=0,ivpn=0;
try{
%>

<div id="main">
<table border="3" width="850" bgcolor="#F0F0F0" align="center" id="C2IT">
<tr>
<td colspan="14" align="center"><b><font color="black" size="3">MONTHLY REPORT</font></b></td>
</tr>
<tr>
<td colspan="14" align="right"><b><font color="black" size="3"><%=Mon[1]%> <%=req2%></font></b></td>
</tr>
	
	<tr bgcolor="#adad85">

			<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Branch</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>OSD</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Domain</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Email</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Access Card</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Shared Folder</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>GSNET</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Nexas</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>USB</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>VPN</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>NEIN Internal S/W</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Log Complaints</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Newins</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Incident Report</b></font></td>	
					
				</tr>	
				<%
				conn = con.getConnection2();
				if(!req.equals("ALL")){			
					st14=conn.createStatement();
					rs14=st14.executeQuery("select * From branch_master_main where m_b_name = '"+req+"'");
					while(rs14.next()){
						int adom=0,aosd=0,aemail=0,aacess=0,ashared=0,agsnet=0,anexas=0,ausb=0,anein=0,acom=0,aincident=0,anewins=0,avpn=0;
						String df=null,df1=null,df2="",of=null,of1=null,of2="",ef=null,ef1=null,ef2="",af=null,af1=null,af2="",sf=null,sf1=null,sf2=""
						,gf=null,gf1=null,gf2="",nf=null,nf1=null,nf2="",uf=null,uf1=null,uf2="",nef=null,nef1=null,nef2="",cf=null,cf1=null,cf2="",inf=null,inf1=null,inf2=""
						,newf=null,newf1=null,newf2="",vf=null,vf1=null,vf2="";
						 name=rs14.getString("m_b_name");
						 bno=rs14.getString("m_b_no");
						System.out.println(name);
						System.out.println(bno);
				if(bno.equals("90") || bno.equals("10") || bno.equals("31") || bno.equals("51")){
					System.out.println("Working");
				st6=conn.createStatement();
				 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')group by form1_no");
				while(rs6.next()){
					osd=rs6.getString("Total");
					of=rs6.getString(2);
					of1=of.concat(",");
					of2=of2+of1;
					iosd=Integer.parseInt(osd);
					aosd=aosd+iosd;//for getting count
					System.out.println("The OSD VAlues.."+of2 +aosd);
				}
				%>
<%
st5=conn.createStatement();
rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%' And "+
"applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')group by form2_no)");

while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
}
%>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')group by form3_no)");

while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
	
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')group by form4_no)");

while(rs3.next()){
	 Access=rs3.getString(1);
	 af=rs3.getString(2);
	 af1=af.concat(",");
	 af2=af2+af1;
	 iaccess=Integer.parseInt(Access);
	 aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')group by form5_no)");

while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");

while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')group by form10_no)");

while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')group by form10_no)");

while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')group by complain_id");
while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
	
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')group by form9_no");
while(rs12.next()){
	incident=rs12.getString(1);
	inf=rs12.getString(2);
	inf1=inf.concat(",");
	inf2=inf2+inf1;
	iincident=Integer.parseInt(incident);
	aincident=aincident+iincident;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')group by form7_no)");

while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
}
%>
<tr>
<td width="" align="left"     style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"   onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
</tr>



 <%}else if(bno.equals("30")){
	 System.out.println("Mumbai1......");
	 st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
 <%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%' "+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')group by form2_no)");
	 
	while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')group by form3_no)");

while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')group by form4_no)");

while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')group by form5_no)");

while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");

while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL (SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%' "+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>

<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
	 <td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="2"><a  href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
	<td width="" align="center"   style="vertical-align:middle"><font size="2"><a 	href="#"  onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
	   <td width="" align="center"   style="vertical-align:middle"><font size="2"><a  href="#" onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
	   <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
	   <td width="" align="center"   style="vertical-align:middle"><font size="2"><a  href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
	    <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"   onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
	    <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"   onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
	    <td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"    onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>

<%}else if(bno.equals("40")){
	
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%' "+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43') group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+ 
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;

}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"   onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>                                                                  

<% 
}else if(bno.equals("54")){
	System.out.println("Remainin");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>

<%
}else{
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
" And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>

<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>


<%}
				}
		}
				
				else{
					int sum_osd=0,sum_domain=0,sum_email=0,sum_acard=0,sum_shared=0,sum_gsnet=0,sum_nexas=0,sum_usb=0,sum_nein=0,sum_log=0,sum_newins=0,sum_incident=0,sum_vpn=0;
		             
				
					
				
					st14=conn.createStatement();
					rs14=st14.executeQuery("select * From branch_master_main where m_b_no in ('90','10','31','30','51','20','54','40')");
					while(rs14.next()){
						System.out.println("loop1");
						
						int adom=0,aosd=0,aemail=0,aacess=0,ashared=0,agsnet=0,anexas=0,ausb=0,anein=0,acom=0,aincident=0,anewins=0,avpn=0;
						String df=null,df1=null,df2="",of=null,of1=null,of2="",ef=null,ef1=null,ef2="",af=null,af1=null,af2="",sf=null,sf1=null,sf2=""
							,gf=null,gf1=null,gf2="",nf=null,nf1=null,nf2="",uf=null,uf1=null,uf2="",nef=null,nef1=null,nef2="",cf=null,cf1=null,cf2="",inf=null,inf1=null,inf2="",newf=null,newf1=null,newf2="",vf=null,vf1=null,vf2="";
						 name=rs14.getString("m_b_name");
						 bno=rs14.getString("m_b_no");
						System.out.println(name);
						System.out.println(bno);
				if(bno.equals("90") || bno.equals("10") || bno.equals("31") || bno.equals("51")){
					
					System.out.println("Working");
				st6=conn.createStatement();
				 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')group by form1_no");
				while(rs6.next()){
					osd=rs6.getString("Total");
					of=rs6.getString(2);
					of1=of.concat(",");
					of2=of2+of1;
					iosd=Integer.parseInt(osd);
					aosd=aosd+iosd;
					sum_osd=sum_osd+iosd;
					
				}
				%>
<%
st5=conn.createStatement();
rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')group by form2_no)");

while(rs5.next()){
	
	domain=rs5.getString(1);
	df=rs5.getString(2);
	
	df1=df.concat(",");
	df2=df2+df1;
	
	System.out.println("The Value Of df....."   +df2);
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	sum_domain=sum_domain+idomain;
	
	
}
%>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')group by form3_no)");
while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
	sum_email=sum_email+iemail;
	
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')group by form4_no)");
while(rs3.next()){
	 Access=rs3.getString(1);
	 af=rs3.getString(2);
	 af1=af.concat(",");
	 af2=af2+af1;
	 iaccess=Integer.parseInt(Access);
	 aacess=aacess+iaccess;
	 sum_acard=sum_acard+iaccess;
	 
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')group by form5_no)");
while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
	sum_shared=sum_shared+ishared;
	
}
%>
<%
st7=conn.createStatement();
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
	sum_gsnet=sum_gsnet+igsnet;
	
	
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
	sum_nexas=sum_nexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')group by form10_no)");
while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
	sum_usb=sum_usb+iusb;
	
	
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn=sum_vpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')group by form10_no)");
while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
	sum_nein=sum_nein+inein;
	
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')group by complain_id");
while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
	sum_log=sum_log+ilog;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')group by form9_no");
while(rs12.next()){
	incident=rs12.getString(1);
	inf=rs12.getString(2);
	inf1=inf.concat(",");
	inf2=inf2+inf1;
	iincident=Integer.parseInt(incident);
	aincident=aincident+iincident;
	sum_incident=sum_incident+iincident;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')group by form7_no)");
while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
	sum_newins=sum_newins+inewins;
	
}
%>
<tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
</tr>



 <%}else if(bno.equals("30")){
	 System.out.println("Mumbai2......");
	 st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;
		sum_osd=sum_osd+iosd;
	}
	%> 
	 
 <%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	
	df1=df.concat(",");
	df2=df2+df1;
	
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	sum_domain=sum_domain+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
sum_email=sum_email+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
sum_acard=sum_acard+iaccess;

}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
sum_shared=sum_shared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+ 
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
sum_gsnet=sum_gsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
sum_nexas=sum_nexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
sum_usb=sum_usb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn=sum_vpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
sum_nein=sum_nein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
sum_log=sum_log+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
sum_newins=sum_newins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);

inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
sum_incident=sum_incident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>

<%}else if(bno.equals("40")){

	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;
		sum_osd=sum_osd+iosd;
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	sum_domain=sum_domain+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')group by form3_no)");

while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
sum_email=sum_email+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
sum_acard=sum_acard+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
sum_shared=sum_shared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
sum_gsnet=sum_gsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
sum_nexas=sum_nexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
sum_usb=sum_usb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn=sum_vpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
sum_nein=sum_nein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
sum_log=sum_log+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
sum_newins=sum_newins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
sum_incident=sum_incident+iincident;

}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name %></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>

<% 
}else if(bno.equals("54")){
	System.out.println("Remainin");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;
		sum_osd=sum_osd+iosd;
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' "+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	sum_domain=sum_domain+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
sum_email=sum_email+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')group by form4_no)");

while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
sum_acard=sum_acard+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')group by form5_no)");

while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
sum_shared=sum_shared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
sum_gsnet=sum_gsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
sum_nexas=sum_nexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
sum_usb=sum_usb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn=sum_vpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
sum_nein=sum_nein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
sum_log=sum_log+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
sum_newins=sum_newins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
sum_incident=sum_incident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>

	 </tr>

<%
}else{
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;
		sum_osd=sum_osd+iosd;
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	sum_domain=sum_domain+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
sum_email=sum_email+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
sum_acard=sum_acard+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
sum_shared=sum_shared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
sum_gsnet=sum_gsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
sum_nexas=sum_nexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
sum_usb=sum_usb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn=sum_vpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
sum_nein=sum_nein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
sum_log=sum_log+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
sum_newins=sum_newins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
sum_incident=sum_incident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:left"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>
<%	}
					}
				
				%>
<tr bgcolor="#adad85">
<td width="" align="left"   style="vertical-align:left"><font size="3" color="black"><b>TOTAL</b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_osd%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_domain%></b></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_email%></b></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_acard%></b></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_shared%></b></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_gsnet%></b></font></td>
	  <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_nexas%></b></font></td>
	   <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_usb%></b></font></td>
	   <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_vpn%></b></font></td>
	   <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_nein%></b></font></td>
	    <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_log%></b></font></td>
	    <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_newins%></b></font></td>
	    <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_incident%></b></font></td>
	    </tr>
	    <%} %>

</table>
<br/>			






<!--This Is For Another Table  -->



<%
 start=req2+"-"+"01"+"-"+"01";



%>





<tr>
<td>
<table border="3" width="850" align="center" bgcolor="#F0F0F0" id="Comm">
<tr>
<td colspan="14" align="center"><b><font color="black" size="3">CUMULATIVE REPORT</font></b></td>
</tr>
<tr>
<td colspan="14" align="right"><b><font color="black" size="3">YTD--<%=Mon[1]%> <%=req2%></font></b></td>
</tr>

<tr bgcolor="#adad85">

				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Branch</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>OSD</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Domain</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Email</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Access Card</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Shared Folder</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>GSNET</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Nexas</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>USB</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>VPN</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>NEIN Internal S/W</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Log Complaints</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Newins</b></font></td>
				<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Incident Report</b></font></td>	
					
				</tr>
				<%
				conn = con.getConnection2();
				if(!req.equals("ALL")){					
					st14=conn.createStatement();
					rs14=st14.executeQuery("select * From branch_master_main where m_b_name = '"+req+"'");
					while(rs14.next()){
						int adom=0,aosd=0,aemail=0,aacess=0,ashared=0,agsnet=0,anexas=0,ausb=0,anein=0,acom=0,aincident=0,anewins=0,avpn=0;
						String df=null,df1=null,df2="",of=null,of1=null,of2="",ef=null,ef1=null,ef2="",af=null,af1=null,af2="",sf=null,sf1=null,sf2=""
							,gf=null,gf1=null,gf2="",nf=null,nf1=null,nf2="",uf=null,uf1=null,uf2="",nef=null,nef1=null,nef2="",cf=null,cf1=null,cf2="",inf=null,inf1=null,inf2="",newf=null,newf1=null,newf2="",vf=null,vf1=null,vf2="";
						name=rs14.getString("m_b_name");
						 bno=rs14.getString("m_b_no");
						System.out.println(name);
						System.out.println(bno);
				if(bno.equals("90") || bno.equals("10") || bno.equals("31") || bno.equals("51")){
					System.out.println("Working");
				st6=conn.createStatement();
				 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')group by form1_no");
				while(rs6.next()){
					osd=rs6.getString("Total");
					of=rs6.getString(2);
					of1=of.concat(",");
					of2=of2+of1;
					iosd=Integer.parseInt(osd);
					aosd=aosd+iosd;//for getting count
				}
				%>
<%
st5=conn.createStatement();
rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')group by form2_no)");
while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
}
%>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')group by form3_no)");
while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')group by form4_no)");
while(rs3.next()){
	 Access=rs3.getString(1);
	 af=rs3.getString(2);
	 af1=af.concat(",");
	 af2=af2+af1;
	 iaccess=Integer.parseInt(Access);
	 aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')group by form5_no)");
while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')group by form10_no)");
while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')group by form10_no)");
while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')group by complain_id");
while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')group by form9_no");
while(rs12.next()){
	incident=rs12.getString(1);
	inf=rs12.getString(2);
	inf1=inf.concat(",");
	inf2=inf2+inf1;
	iincident=Integer.parseInt(incident);
	aincident=aincident+iincident;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')group by form7_no)");
while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
}
%>
<tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
<%-- <input type="hidden" id="s1" value="<%=name%>"> --%>
</tr>


<%}else if(bno.equals("30")){
	 System.out.println("Mumbai3......");
	 st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
 <%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>

<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>

	 </tr>



<%}else if(bno.equals("40")){
	
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>

<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>

<% 
}else if(bno.equals("54")){
	System.out.println("Remainin");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')group by form4_no)");
while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>

<%
}else{
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form1_no");
	while(rs6.next()){
		osd=rs6.getString("Total");
		of=rs6.getString(2);
		of1=of.concat(",");
		of2=of2+of1;
		iosd=Integer.parseInt(osd);
		aosd=aosd+iosd;//for getting count
	}
	%> 
	 
<%
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	 "UNION ALL(SELECT Count(form2_no)Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form2_no)");
	 while(rs5.next()){
	domain=rs5.getString(1);
	df=rs5.getString(2);
	df1=df.concat(",");
	df2=df2+df1;
	idomain=Integer.parseInt(domain);
	adom=adom+idomain;
	 }
	 %>
<%

st4=conn.createStatement();
rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form3_no)");
while(rs4.next()){
Email=rs4.getString(1);
ef=rs4.getString(2);
ef1=ef.concat(",");
ef2=ef2+ef1;
iemail=Integer.parseInt(Email);
aemail=aemail+iemail;
}
%>
<%
st3=conn.createStatement();
rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form4_no)");

while(rs3.next()){
Access=rs3.getString(1);
af=rs3.getString(2);
af1=af.concat(",");
af2=af2+af1;
iaccess=Integer.parseInt(Access);
aacess=aacess+iaccess;
}
%>
<%
st2=conn.createStatement();
rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form5_no)");
while(rs2.next()){
Shared=rs2.getString(1);
sf=rs2.getString(2);
sf1=sf.concat(",");
sf2=sf2+sf1;
ishared=Integer.parseInt(Shared);
ashared=ashared+ishared;
}
%>
<%
st7=conn.createStatement();    
rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
while(rs7.next()){
Gsnet=rs7.getString(1);
gf=rs7.getString(2);
gf1=gf.concat(",");
gf2=gf2+gf1;
igsnet=Integer.parseInt(Gsnet);
agsnet=agsnet+igsnet;
}
%>
<%
st9=conn.createStatement();
rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
while(rs9.next()){
nexas=rs9.getString(1);
nf=rs9.getString(2);
nf1=nf.concat(",");
nf2=nf2+nf1;
inexas=Integer.parseInt(nexas);
anexas=anexas+inexas;
}
%>
<%
st10=conn.createStatement();
rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
while(rs10.next()){
USB=rs10.getString(1);
uf=rs10.getString(2);
uf1=uf.concat(",");
uf2=uf2+uf1;
iusb=Integer.parseInt(USB);
ausb=ausb+iusb;
}
%>
<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
}
%>
<%
st15=conn.createStatement();
rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
while(rs15.next()){
nein=rs15.getString(1);
nef=rs15.getString(2);
nef1=nef.concat(",");
nef2=nef2+nef1;
inein=Integer.parseInt(nein);
anein=anein+inein;
}
%>
<%
st11=conn.createStatement();
rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')group by complain_id");
while(rs11.next()){
Com=rs11.getString(1);
cf=rs11.getString(2);
cf1=cf.concat(",");
cf2=cf2+cf1;
ilog=Integer.parseInt(Com);
acom=acom+ilog;
}
%>
<%
st13=conn.createStatement();
rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form7_no)");
while(rs13.next()){
newins=rs13.getString(1);
newf=rs13.getString(2);
newf1=newf.concat(",");
newf2=newf2+newf1;
inewins=Integer.parseInt(newins);
anewins=anewins+inewins;
}
%>
<%
st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form9_no");
while(rs12.next()){
incident=rs12.getString(1);
inf=rs12.getString(2);
inf1=inf.concat(",");
inf2=inf2+inf1;
iincident=Integer.parseInt(incident);
aincident=aincident+iincident;
}
%>	 
	 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	 </tr>	
<%}
				}
}
	else{
						
		int sum_osd1=0,sum_domain1=0,sum_email1=0,sum_acard1=0,sum_shared1=0,sum_gsnet1=0,sum_nexas1=0,sum_usb1=0,sum_nein1=0,sum_log1=0,sum_newins1=0,sum_incident1=0,sum_vpn1=0; 		
						st14=conn.createStatement();
						rs14=st14.executeQuery("select * From branch_master_main where m_b_no in ('90','10','31','30','51','20','54','40')");
						while(rs14.next()){
							int adom=0,aosd=0,aemail=0,aacess=0,ashared=0,agsnet=0,anexas=0,ausb=0,anein=0,acom=0,aincident=0,anewins=0,avpn=0;
							String df=null,df1=null,df2="",of=null,of1=null,of2="",ef=null,ef1=null,ef2="",af=null,af1=null,af2="",sf=null,sf1=null,sf2=""
								,gf=null,gf1=null,gf2="",nf=null,nf1=null,nf2="",uf=null,uf1=null,uf2="",nef=null,nef1=null,nef2="",cf=null,cf1=null,cf2="",inf=null,inf1=null,inf2="",newf=null,newf1=null,newf2="",vf=null,vf1=null,vf2="";
							 name=rs14.getString("m_b_name");
							 bno=rs14.getString("m_b_no");
							System.out.println(name);
							System.out.println(bno);
					if(bno.equals("90") || bno.equals("10") || bno.equals("31") || bno.equals("51")){
						System.out.println("Working");
					st6=conn.createStatement();
					 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')group by form1_no");
					while(rs6.next()){
						osd=rs6.getString("Total");
						of=rs6.getString(2);
						of1=of.concat(",");
						of2=of2+of1;
						iosd=Integer.parseInt(osd);
						aosd=aosd+iosd;
						sum_osd1=sum_osd1+iosd;
					}
					%>
	<%
	st5=conn.createStatement();
	rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')group by form2_no)");
	while(rs5.next()){
		domain=rs5.getString(1);
		df=rs5.getString(2);
		df1=df.concat(",");
		df2=df2+df1;
		
		idomain=Integer.parseInt(domain);
		adom=adom+idomain;
		sum_domain1=sum_domain1+idomain;
	}
	%>
	<%

	st4=conn.createStatement();
	rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')group by form3_no)");
	while(rs4.next()){
		Email=rs4.getString(1);
		ef=rs4.getString(2);
		ef1=ef.concat(",");
		ef2=ef2+ef1;
		iemail=Integer.parseInt(Email);
		aemail=aemail+iemail;
		sum_email1=sum_email1+iemail;
	}
	%>
	<%
	st3=conn.createStatement();
	rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')group by form4_no)");
	while(rs3.next()){
		 Access=rs3.getString(1);
		 af=rs3.getString(2);
		 af1=af.concat(",");
		 af2=af2+af1;
		 iaccess=Integer.parseInt(Access);
		 aacess=aacess+iaccess;
		 sum_acard1=sum_acard1+iaccess;
	}
	%>
	<%
	st2=conn.createStatement();
	rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')group by form5_no)");
	while(rs2.next()){
		Shared=rs2.getString(1);
		sf=rs2.getString(2);
		sf1=sf.concat(",");
		sf2=sf2+sf1;
		ishared=Integer.parseInt(Shared);
		ashared=ashared+ishared;
		sum_shared1=sum_shared1+ishared;
	}
	%>
	<%
	st7=conn.createStatement();
	rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
	
	while(rs7.next()){
		Gsnet=rs7.getString(1);
		gf=rs7.getString(2);
		gf1=gf.concat(",");
		gf2=gf2+gf1;
		igsnet=Integer.parseInt(Gsnet);
		agsnet=agsnet+igsnet;
		sum_gsnet1=sum_gsnet1+igsnet;
	}
	%>
	<%
	st9=conn.createStatement();
	rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')group by form_no)");
	while(rs9.next()){
		nexas=rs9.getString(1);
		nf=rs9.getString(2);
		nf1=nf.concat(",");
		nf2=nf2+nf1;
		inexas=Integer.parseInt(nexas);
		anexas=anexas+inexas;
		sum_nexas1=sum_nexas1+inexas;
	}
	%>
	<%
	st10=conn.createStatement();
	rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')group by form10_no)");
	while(rs10.next()){
		USB=rs10.getString(1);
		uf=rs10.getString(2);
		uf1=uf.concat(",");
		uf2=uf2+uf1;
		iusb=Integer.parseInt(USB);
		ausb=ausb+iusb;
		sum_usb1=sum_usb1+iusb;
	}
	%>
	<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn1=sum_vpn1+ivpn;
}
%>
	<%
	st15=conn.createStatement();
	rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')group by form10_no)");
	while(rs15.next()){
		nein=rs15.getString(1);
		nef=rs15.getString(2);
		nef1=nef.concat(",");
		nef2=nef2+nef1;
		inein=Integer.parseInt(nein);
		anein=anein+inein;
		sum_nein1=sum_nein1+inein;
	}
	%>
	<%
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')group by complain_id");
	while(rs11.next()){
		Com=rs11.getString(1);
		cf=rs11.getString(2);
		cf1=cf.concat(",");
		cf2=cf2+cf1;
		ilog=Integer.parseInt(Com);
		acom=acom+ilog;
		sum_log1=sum_log1+ilog;
	}
	%>
	<%
	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')group by form9_no");
	while(rs12.next()){
		incident=rs12.getString(1);
		inf=rs12.getString(2);
		inf1=inf.concat(",");
		inf2=inf2+inf1;
		iincident=Integer.parseInt(incident);
		aincident=aincident+iincident;
		sum_incident1=sum_incident1+iincident;
	}
	%>
	<%
	st13=conn.createStatement();
	rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"' GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')group by form7_no)");
	while(rs13.next()){
		newins=rs13.getString(1);
		newf=rs13.getString(2);
		newf1=newf.concat(",");
		newf2=newf2+newf1;
		inewins=Integer.parseInt(newins);
		anewins=anewins+inewins;
		sum_newins1=sum_newins1+inewins;
	}
	%>
	<tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
	</tr>
	


	 <%}else if(bno.equals("30")){
		 System.out.println("Mumbai4......");
		 st6=conn.createStatement();
		 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')group by form1_no");
		while(rs6.next()){
			osd=rs6.getString("Total");
			of=rs6.getString(2);
			of1=of.concat(",");
			of2=of2+of1;
			iosd=Integer.parseInt(osd);
			aosd=aosd+iosd;
			sum_osd1=sum_osd1+iosd;
		}
		%> 
		 
	 <%
		 st5=conn.createStatement();
		 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
		 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
		 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
		 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')group by form2_no)");
		 while(rs5.next()){
		domain=rs5.getString(1);
		df=rs5.getString(2);
		df1=df.concat(",");
		df2=df2+df1;
		idomain=Integer.parseInt(domain);
		adom=adom+idomain;
		sum_domain1=sum_domain1+idomain;
		 }
		 %>
	<%

	st4=conn.createStatement();
	rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')group by form3_no)");
	while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
	sum_email1=sum_email1+iemail;
	}
	%>
	<%
	st3=conn.createStatement();
	rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')group by form4_no)");
	while(rs3.next()){
	Access=rs3.getString(1);
	af=rs3.getString(2);
	af1=af.concat(",");
	af2=af2+af1;
	iaccess=Integer.parseInt(Access);
	aacess=aacess+iaccess;
	sum_acard1=sum_acard1+iaccess;
	}
	%>
	<%
	st2=conn.createStatement();
	rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')group by form5_no)");
	while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
	sum_shared1=sum_shared1+ishared;
	}
	%>
	<%
	st7=conn.createStatement();    
	rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
	sum_gsnet1=sum_gsnet1+igsnet;
	}
	%>
	<%
	st9=conn.createStatement();
	rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')group by form_no)");
	while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
	sum_nexas1=sum_nexas1+inexas;
	}
	%>
	<%
	st10=conn.createStatement();
	rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')group by form10_no)");
	while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
	sum_usb1=sum_usb1+iusb;
	}
	%>
	<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn1=sum_vpn1+ivpn;
}
%>
	<%
	st15=conn.createStatement();
	rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')group by form10_no)");
	while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
	sum_nein1=sum_nein1+inein;
	}
	%>
	<%
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')group by complain_id");
	while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
	sum_log1=sum_log1+ilog;
	}
	%>
	<%
	st13=conn.createStatement();
	rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')group by form7_no)");
	while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
	sum_newins1=sum_newins1+inewins;
	}
	%>
	<%
	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')group by form9_no");
	while(rs12.next()){
		incident=rs12.getString(1);
		inf=rs12.getString(2);
		inf1=inf.concat(",");
		inf2=inf2+inf1;
		iincident=Integer.parseInt(incident);
		aincident=aincident+iincident;
		sum_incident1=sum_incident1+iincident;
	}
	%>	 
		 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
		 </tr>

	<%}else if(bno.equals("40")){
		
		st6=conn.createStatement();
		 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')group by form1_no");
		while(rs6.next()){
			osd=rs6.getString("Total");
			of=rs6.getString(2);
			of1=of.concat(",");
			of2=of2+of1;
			iosd=Integer.parseInt(osd);
			aosd=aosd+iosd;
			sum_osd1=sum_osd1+iosd;
			
		}
		%> 
		 
	<%
		 st5=conn.createStatement();
		 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
		 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
		 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
		 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')group by form2_no)");
		 while(rs5.next()){
		domain=rs5.getString(1);
		df=rs5.getString(2);
		df1=df.concat(",");
		df2=df2+df1;
		idomain=Integer.parseInt(domain);
		adom=adom+idomain;
		sum_domain1=sum_domain1+idomain;
		 }
		 %>
	<%

	st4=conn.createStatement();
	rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')group by form3_no)");
	while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
	sum_email1=sum_email1+iemail;
	}
	%>
	<%
	st3=conn.createStatement();
	rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')group by form4_no)");
	while(rs3.next()){
	Access=rs3.getString(1);
	af=rs3.getString(2);
	af1=af.concat(",");
	af2=af2+af1;
	iaccess=Integer.parseInt(Access);
	aacess=aacess+iaccess;
	sum_acard1=sum_acard1+iaccess;
	}
	%>
	<%
	st2=conn.createStatement();
	rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')group by form5_no)");
	while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
	sum_shared1=sum_shared1+ishared;
	}
	%>
	<%
	st7=conn.createStatement();    
	rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
	sum_gsnet1=sum_gsnet1+igsnet;
	}
	%>
	<%
	st9=conn.createStatement();
	rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')group by form_no)");
	while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
	sum_nexas1=sum_nexas1+inexas;
	}
	%>
	<%
	st10=conn.createStatement();
	rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')group by form10_no)");
	while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
	sum_usb1=sum_usb1+iusb;
	}
	%>
	<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn1=sum_vpn1+ivpn;
}
%>
	<%
	st15=conn.createStatement();
	rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')group by form10_no)");
	while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
	sum_nein1=sum_nein1+inein;
	}
	%>
	<%
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')group by complain_id");
	while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
	sum_log1=sum_log1+ilog;
	}
	%>
	<%
	st13=conn.createStatement();
	rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')group by form7_no)");
	while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
	sum_newins1=sum_newins1+inewins;
	}
	%>
	<%
	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')");
	while(rs12.next()){
		incident=rs12.getString(1);
		inf=rs12.getString(2);
		if(inf!=null && inf!="NULL" && inf!=""){
		inf1=inf.concat(",");
		}
		inf2=inf2+inf1;
		iincident=Integer.parseInt(incident);
		aincident=aincident+iincident;
		sum_incident1=sum_incident1+iincident;
	}
	%>	 
		 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
		 </tr>

	<% 
	}else if(bno.equals("54")){
		System.out.println("Remainin");
		st6=conn.createStatement();
		 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')group by form1_no");
		while(rs6.next()){
			osd=rs6.getString("Total");
			of=rs6.getString(2);
			of1=of.concat(",");
			of2=of2+of1;
			iosd=Integer.parseInt(osd);
			aosd=aosd+iosd;
			sum_osd1=sum_osd1+iosd;
		}
		%> 
		 
	<%
		 st5=conn.createStatement();
		 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
		 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
		 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
		 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')group by form2_no)");
		 while(rs5.next()){
		domain=rs5.getString(1);
		df=rs5.getString(2);
		df1=df.concat(",");
		df2=df2+df1;
		idomain=Integer.parseInt(domain);
		adom=adom+idomain;
		sum_domain1=sum_domain1+idomain;
		 }
		 %>
	<%

	st4=conn.createStatement();
	rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')group by form3_no)");
	while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
	sum_email1=sum_email1+iemail;
	}
	%>
	<%
	st3=conn.createStatement();
	rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')group by form4_no)");
	
	while(rs3.next()){
	Access=rs3.getString(1);
	af=rs3.getString(2);
	af1=af.concat(",");
	af2=af2+af1;
	iaccess=Integer.parseInt(Access);
	aacess=aacess+iaccess;
	sum_acard1=sum_acard1+iaccess;
	}
	%>
	<%
	st2=conn.createStatement();
	rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')group by form5_no)");
	while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
	sum_shared1=sum_shared1+ishared;
	}
	%>
	<%
	st7=conn.createStatement();    
	rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
	sum_gsnet1=sum_gsnet1+igsnet;
	}
	%>
	<%
	st9=conn.createStatement();
	rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')group by form_no)");
	
	while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
	sum_nexas1=sum_nexas1+inexas;
	}
	%>
	<%
	st10=conn.createStatement();
	rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')group by form10_no)");
	while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
	sum_usb1=sum_usb1+iusb;
	}
	%>
	<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn1=sum_vpn1+ivpn;
}
%>
	<%
	st15=conn.createStatement();
	rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')group by form10_no)");
	while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
	sum_nein1=sum_nein1+inein;
	}
	%>
	<%
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')group by complain_id");
	while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
	sum_log1=sum_log1+ilog;
	}
	%>
	<%
	st13=conn.createStatement();
	rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')group by form7_no)");
	while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
	sum_newins1=sum_newins1+inewins;
	}
	%>
	<%
	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')group by form9_no");
	while(rs12.next()){
		incident=rs12.getString(1);
		inf=rs12.getString(2);
		inf1=inf.concat(",");
		inf2=inf2+inf1;
		iincident=Integer.parseInt(incident);
		aincident=aincident+iincident;
		sum_incident1=sum_incident1+iincident;
	}
	%>	 
		 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
		 </tr>

	<%
	}else{
		st6=conn.createStatement();
		 rs6=st6.executeQuery("SELECT Count(form1_no)as Total,form1_no From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form1_no");
		while(rs6.next()){
			osd=rs6.getString("Total");
			of=rs6.getString(2);
			of1=of.concat(",");
			of2=of2+of1;
			iosd=Integer.parseInt(osd);
			aosd=aosd+iosd;
			sum_osd1=sum_osd1+iosd;
		}
		%> 
		 
	<%
		 st5=conn.createStatement();
		 rs5=st5.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Domain%'"+
		 "And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
		 "UNION ALL(SELECT Count(form2_no)as Total,form2_no From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
		 "AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form2_no)");
		 while(rs5.next()){
		domain=rs5.getString(1);
		df=rs5.getString(2);
		df1=df.concat(",");
		df2=df2+df1;
		idomain=Integer.parseInt(domain);
		adom=adom+idomain;
		sum_domain1=sum_domain1+idomain;
			 }
		 %>
	<%

	st4=conn.createStatement();
	rs4=st4.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Email%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form3_no)as Total,form3_no From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form3_no)");
	while(rs4.next()){
	Email=rs4.getString(1);
	ef=rs4.getString(2);
	ef1=ef.concat(",");
	ef2=ef2+ef1;
	iemail=Integer.parseInt(Email);
	aemail=aemail+iemail;
	sum_email1=sum_email1+iemail;
	}
	%>
	<%
	st3=conn.createStatement();
	rs3=st3.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Biometric%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form4_no)as Total,form4_no From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form4_no)");
	while(rs3.next()){
	Access=rs3.getString(1);
	af=rs3.getString(2);
	af1=af.concat(",");
	af2=af2+af1;
	iaccess=Integer.parseInt(Access);
	aacess=aacess+iaccess;
	sum_acard1=sum_acard1+iaccess;
	}
	%>
	<%
	st2=conn.createStatement();
	rs2=st2.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Shared%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form5_no)as Total,form5_no From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form5_no)");
	while(rs2.next()){
	Shared=rs2.getString(1);
	sf=rs2.getString(2);
	sf1=sf.concat(",");
	sf2=sf2+sf1;
	ishared=Integer.parseInt(Shared);
	ashared=ashared+ishared;
	sum_shared1=sum_shared1+ishared;
	}
	%>
	<%
	st7=conn.createStatement();    
	rs7=st7.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%GS-NET%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	gf=rs7.getString(2);
	gf1=gf.concat(",");
	gf2=gf2+gf1;
	igsnet=Integer.parseInt(Gsnet);
	agsnet=agsnet+igsnet;
	sum_gsnet1=sum_gsnet1+igsnet;
	}
	%>
	<%
	st9=conn.createStatement();
	rs9=st9.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form_no)as Total,form_no From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form_no)");
	while(rs9.next()){
	nexas=rs9.getString(1);
	nf=rs9.getString(2);
	nf1=nf.concat(",");
	nf2=nf2+nf1;
	inexas=Integer.parseInt(nexas);
	anexas=anexas+inexas;
	sum_nexas1=sum_nexas1+inexas;
	}
	%>
	<%
	st10=conn.createStatement();
	rs10=st10.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%USB%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
	
	while(rs10.next()){
	USB=rs10.getString(1);
	uf=rs10.getString(2);
	uf1=uf.concat(",");
	uf2=uf2+uf1;
	iusb=Integer.parseInt(USB);
	ausb=ausb+iusb;
	sum_usb1=sum_usb1+iusb;
	}
	%>
	<%
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo");
while(rs16.next()){
	VPN=rs16.getString(1);
	vf=rs16.getString(2);
	vf1=vf.concat(",");
	vf2=vf2+vf1;
	ivpn=Integer.parseInt(VPN);
	avpn=avpn+ivpn;
	sum_vpn1=sum_vpn1+ivpn;
}
%>
	<%
	st15=conn.createStatement();
	rs15=st15.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%Internal%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form10_no)as Total,form10_no From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form10_no)");
	while(rs15.next()){
	nein=rs15.getString(1);
	nef=rs15.getString(2);
	nef1=nef.concat(",");
	nef2=nef2+nef1;
	inein=Integer.parseInt(nein);
	anein=anein+inein;
	sum_nein1=sum_nein1+inein;
	}
	%>
	<%
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT  Count(complain_id)as Total,complain_id From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')group by complain_id");
	while(rs11.next()){
	Com=rs11.getString(1);
	cf=rs11.getString(2);
	cf1=cf.concat(",");
	cf2=cf2+cf1;
	ilog=Integer.parseInt(Com);
	acom=acom+ilog;
	sum_log1=sum_log1+ilog;
	}
	%>
	<%
	st13=conn.createStatement();
	rs13=st13.executeQuery("(SELECT COUNT(applicationNo),applicationNo FROM `neinapplicationform` where requestFor LIKE '%NEWINS%'"+
	"And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28') GROUP BY applicationNo)"+
	"UNION ALL(SELECT Count(form7_no)as Total,form7_no From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved'"+
	"AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form7_no)");
	
	while(rs13.next()){
	newins=rs13.getString(1);
	newf=rs13.getString(2);
	newf1=newf.concat(",");
	newf2=newf2+newf1;
	inewins=Integer.parseInt(newins);
	anewins=anewins+inewins;
	sum_newins1=sum_newins1+inewins;
	}
	%>
	<%
	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(form9_no)as Total,form9_no From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')group by form9_no");
	while(rs12.next()){
		incident=rs12.getString(1);
		inf=rs12.getString(2);
		inf1=inf.concat(",");
		inf2=inf2+inf1;
		iincident=Integer.parseInt(incident);
		aincident=aincident+iincident;
		sum_incident1=sum_incident1+iincident;
	}
	%>	 
		 <tr>
<td width="" align="left"   style="vertical-align:middle"><font size="2"><%=name%></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=of2 %>')"><%=aosd%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=df2%>')"><%=adom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=ef2%>')"><%=aemail%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=af2%>')"><%=aacess%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=sf2%>')"><%=ashared %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=gf2%>')"><%=agsnet %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#" onclick="popitup('ReportDetails.jsp?f=<%=nf2%>')"><%=anexas%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=uf2%>')"><%=ausb %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=vf2%>')"><%=avpn %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=nef2%>')"><%=anein %></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=cf2%>')"><%=acom%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=newf2%>')"><%=anewins%></a></font></td>
<td width="" align="center"   style="vertical-align:middle"><font size="2"><a href="#"  onclick="popitup('ReportDetails.jsp?f=<%=inf2%>')"><%=aincident %></a></font></td>
		 </tr>
<%}
					}
	
						%>
						<tr bgcolor="#adad85">
<td width="" align="left"   style="vertical-align:left"><font size="3" color="black"><b>TOTAL</b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_osd1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_domain1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_email1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_acard1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_shared1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_gsnet1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_nexas1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_usb1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_vpn1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_nein1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_log1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_newins1%></b></font></td>
	 <td width="" align="center"   style="vertical-align:middle"><font size="3" color="black"><b><%=sum_incident1%></b></font></td>
	    </tr>
	    <%} %>
</table>
</div>

	 <%
	
				
													
				}
					
catch(Exception e)
{
	e.printStackTrace();
}
finally{
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(rs3,st3,cn3);
	DbUtil.closeDBResources(rs2,st2,null);
	DbUtil.closeDBResources(rs3,st3,null);
	DbUtil.closeDBResources(rs4,st4,null);
	DbUtil.closeDBResources(rs5,st5,null);
	DbUtil.closeDBResources(rs6,st6,null);
	DbUtil.closeDBResources(rs7,st7,null);
	DbUtil.closeDBResources(rs8,st8,null);
	DbUtil.closeDBResources(rs9,st9,null);
	DbUtil.closeDBResources(rs10,st10,null);
	
}
%>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118" > 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../ReportsPan/Applicationformreports.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 
</form>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>


</body>

</html>