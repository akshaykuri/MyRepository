<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import= "CON2.Connection2" %> 
<%@ page import="java.io.*" %>   

<%--
   String name = request.getParameter( "tho" );
   String Nname = request.getParameter( "nameee" );
   session.setAttribute( "theName", name );
   session.setAttribute( "Nname", Nname );
--%>  
<%
   String name = request.getParameter( "tho" );
   session.setAttribute( "theName", name );
%>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HO</title>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
</head>
<body>


<%
int f=0;
Connection cn =null; 
Statement st = null; 
ResultSet rs = null; 
String sn=null;
String msg=null;
String sn1=null;
String desg = null,realname = null,Initiator=null;
Object noo=null;


String req = request.getParameter("txtCalendar");
//   req2 = request.getParameter("txtCalendar");
     System.out.println("Request payload: "+ req);
     
     String[] dateString = req.split("-");
     
     System.out.println(dateString[1]);
    
     if (dateString[1].equals("Jan"))
     {
   	  dateString[1]="01";
     }
     if (dateString[1].equals("Feb"))
     {
   	  dateString[1]="02";
     }
     if (dateString[1].equals("Mar"))
     {
   	  dateString[1]="03";
     }
     if (dateString[1].equals("Apr"))
     {
   	  dateString[1]="04";
     }
     if (dateString[1].equals("May"))
     {
   	  dateString[1]="05";
     }
     if (dateString[1].equals("Jun"))
     {
   	  dateString[1]="06";
     }
     if (dateString[1].equals("Jul"))
     {
   	  dateString[1]="07";
     }
     if (dateString[1].equals("Aug"))
     {
   	  dateString[1]="08";
     }
     if (dateString[1].equals("Sep"))
     {
   	  dateString[1]="09";
     }
     if (dateString[1].equals("Oct"))
     {
   	  dateString[1]="10";
     }
     if (dateString[1].equals("Nov"))
     {
   	  dateString[1]="11";
     }
     if (dateString[1].equals("Dec"))
     {
   	  dateString[1]="12";
     }
     
     String dateF = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
     System.out.println("Check List view Date "+dateF);














try
{
cn = con.getConnection2();
System.out.println("------------------"+cn);
st=cn.createStatement();

noo = session.getAttribute("b_no");
System.out.println("Location no "+noo+"Date : "+dateF);

//rs = st.executeQuery("SELECT * FROM nentryho INNER JOIN branch_master ON(nentryho.NpostingCo=branch_master.b_name) where idd = '"+n+"' and Npwd = '"+p+"'");

//rs = st.executeQuery("select DISTINCT ims_id,Send_date  from ims_master WHERE '"+noo+"'=e_Location AND Send_date='"+dateF+"' GROUP BY ims_id");
rs = st.executeQuery("SELECT DISTINCT ims_id,Send_date FROM assigned_master a INNER JOIN branch_master b ON(a.delet=b.b_name) INNER JOIN ims_master i ON((substr(i.ims_id,13,2))=b.b_no) WHERE (substr(i.ims_id,13,2))='"+noo+"' AND Send_date='"+dateF+"'");

%>

<%if(!rs.next())
{ 

	msg="__Sorry__IMS__Report__Not__Exist";

	   response.sendRedirect("imsSelectionBranchAdmin.jsp?msg="+msg);	

} 
else
{
	%>
	
	<input type="text" name="DateIms" value="<%=req%>" />
	<%
	String Send_date = rs.getString("Send_date");
	String ims_id = rs.getString("ims_id");
	session.setAttribute("ims_id",ims_id);
	session.setAttribute("CalIms",req);
	System.out.println("calender date ;;;;;;;;;;;;;; "+req);
	System.out.println("ims_id  --------------"+ims_id+"            date ^^^^^^^^^^^^^^^^^^^^^   "+dateF);
	//response.sendRedirect("IMSViewTextBranchForm.jsp?msg="+ims_id);	
	response.sendRedirect("SelectImsAdmin.jsp?msg=1");
}


%>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<form name="form" method="post" action="SelectIms.jsp"> 
<input type="text" name="DateIms" value="<%=req%>" />
<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="5" color="white"><b></b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="5" color="white">CS-SOFT</font></strong></td></tr>
</table>



<br />
<br />
<br />
<br />
<br />

<table width="1120" height="63" border="0" cellpadding="0" cellspacing="0" ID="Table1">
  <tr>
    
    <td align="right" valign="top">
    
    <table width="290" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr>
		<td height="11" align="right" valign="top">
		<img src="bullet_button.gif" width="11" height="11" border="0"><a><span class="link12b">-ENTER VALID ID and PASSWORD</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
		<img src="bullet_button.gif" width="11" height="11" border="0"><a><span class="link12b">-try again</span></a> </td>
	</tr>
	
	</table></td>
</tr>
</table>
		<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,cn);

  }
	%>

<br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="45" width="45"></a> <address>HOME</address>
</td> 

<td width="115" align="right"> 
<a href="adminbom.jsp?msg=1"><img src="bakk.png" border="0" height="45" width="45"></a><address>BACK</address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 






</div>
</form>
</body>
</html>

