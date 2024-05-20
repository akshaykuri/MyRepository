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
     
     String dateF = dateString[0]+"-"+dateString[1]+"-"+dateString[2];
     System.out.println("Check List view Date "+dateF);














try
{
cn = con.getConnection2();
System.out.println("------------------"+cn);
st=cn.createStatement();
String n = request.getParameter("txtCalendar");
noo = session.getAttribute("b_no");
System.out.println("Location no "+noo+"Date : "+dateF);
String p = request.getParameter("t2");
String q = request.getParameter("nameee");
//rs = st.executeQuery("SELECT * FROM nentryho INNER JOIN branch_master ON(nentryho.NpostingCo=branch_master.b_name) where idd = '"+n+"' and Npwd = '"+p+"'");

rs = st.executeQuery("select DISTINCT cs_id,e_Location,cs_date from cs_master WHERE '"+noo+"'=e_Location AND cs_date='"+dateF+"' GROUP BY cs_id");
//System.out.println("HO LOGIN ID Name: "+n);
%>

<%if(!rs.next())
{ 
  
	msg="__Sorry__Check__Sheet__Not__Exist";
	System.out.println("Location No  "+noo+" Date: "+dateF);
	   response.sendRedirect("CheckSheetSelectionHO.jsp?msg="+msg);	

} 
else
{
	String date = rs.getString("cs_date");
	String cs_id = rs.getString("cs_id");
	session.setAttribute("CalCS",req);
	session.setAttribute("cs_id",cs_id);
	System.out.println("cs id  --------------"+cs_id+"            date ^^^^^^^^^^^^^^^^^^^^^   "+date);
	//response.sendRedirect("CheckListViewTextFormBranch.jsp?msg="+cs_id);	
	response.sendRedirect("SelectCheckListHO.jsp?msg=1");
	
}

 
}



catch(Exception e)
{
	e.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,cn);

}
%>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="5" color="white"><b>BANGALORE HEAD OFFICE</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="5" color="white">PURCHASE ORDER MANAGMENT SYSTEM (PO-SOFT)</font></strong></td></tr>
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


<br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="45" width="45"></a> <address>HOME</address>
</td> 

<td width="115" align="right"> 
<a href="loginho.jsp?msg=1"><img src="bakk.png" border="0" height="45" width="45"></a><address>BACK</address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 






</div>
</body>
</html>

