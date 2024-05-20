

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.omg.PortableInterceptor.NON_EXISTENT"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ADMIN PAGE</title>
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function link(empp) 
{
var f=document.form;  

	f.method="post";   
	
	f.action='Displaywatch.jsp?empp='+empp;
	
	f.submit();
	}
</script>

</head>

	



<body bgcolor="#FFFFFF" >
 <form method="post" name="form">



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b> ADMINISTRATION</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET(CS-Soft)</font></strong></td></tr>
</table>


 


 <div id='right_table'>
<table width="30%" cellspacing="1" border="2">
<tr>

<td width="" align="center"  height="21" >EMP</td>
					<td width="67" align="center"  height="21" >NOT RESOLVED</td>					
</tr>
<% 

String cs_date;
 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 //get current date time with Date()
 Date date = new Date();
	
	cs_date = dateFormat.format(date);
	String empp=null,status=null,notstatus=null,allemp=null;

 //System.out.println("cs date we are getting "+cs_date);

 
 
 
 
Connection cn01 = null;
Statement st01 = null; 
ResultSet rs01 = null;
cn01 = con.getConnection2();
st01=cn01.createStatement();
//SELECT emp,count(cm_status) as status FROM complain_master_item WHERE emp='Prasanna Shetty' AND cm_status='Resolved' AND cm_date='2014-02-07'  GROUP BY emp
//rs01 = st01.executeQuery("SELECT emp,count(cm_status) as status FROM complain_master_item WHERE emp='Mathan kumar' AND cm_status='Resolved' AND cm_date='"+cs_date+"'  GROUP BY emp");
//rs01 = st01.executeQuery("SELECT emp,count(cm_status) as status FROM complain_master_item WHERE cm_status='Resolved' AND cm_date='"+cs_date+"'  GROUP BY emp");
rs01 = st01.executeQuery("SELECT DISTINCT Nname FROM nentryho ORDER BY Nname");
//
while(rs01.next())
{
	allemp = rs01.getString("Nname");
	
	System.out.println("emp............."+allemp);
	
	
}
int k=0;



Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
cn02 = con.getConnection2();
st02=cn02.createStatement();
//rs02 = st02.executeQuery("SELECT emp,count(cm_status) as notstatus FROM complain_master_item WHERE emp='Farooq Shaikh' AND cm_status='Not Resolved' GROUP BY emp");
//rs02 = st02.executeQuery("SELECT emp,count(emp) as notstatus FROM complain_master_item WHERE emp='Mathan kumar' AND status='normal' AND cm_date='"+cs_date+"'  GROUP BY emp");
rs02 = st02.executeQuery("SELECT emp,count(emp) as notstatus FROM complain_master_item WHERE status='normal' AND cm_date='"+cs_date+"'  GROUP BY emp");
while(rs02.next())
{k++;
	empp = rs02.getString("emp");
	notstatus = rs02.getString("notstatus");
	
	System.out.println("k value "+k);
	System.out.println("emp value "+empp);
	System.out.println("Ststua s "+notstatus);
	%>
	<tr>
	  <input type="hidden" name="<%=k%>" value="<%=empp%>" />
    <td width="120" align=center  ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"><%=empp%></a></font> </td> 
<%-- <td width="67" align="center"  height="21" ><input type="text" name="name" size="25"  value="<%=empp%>"  /></td> --%>
	<td width="67" align="center"  height="21" ><input type="text" name="status" size="4"  value="<%=notstatus%>"  /></td>
	</tr>		<%
}
%>
			
				
</table>

<%-- 
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="images/21.jpg" height="220" width="240">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"><input value="<%=cs_date%>"/> </td>
<td width="79%"><table width="100%" border="2" > 
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 >  ADMINISTRATOR</font>
</td>
</tr>
   <tr>
   <td><font size="2">ADMINISTRATOR NAME:</font></td>
   <td><input type="text" name="Nname" readonly="readonly" value="<%=emp%>"/></td>
   <td><font size="2">Resolved:</font></td>
   <td><input size="5" type="text" name="Nname" readonly="readonly" value="<%=status%>"/></td>
   <td><font size="2">NotResolved:</font></td>
   <td><input size="5" type="text" name="Nname" readonly="readonly" value="<%=notstatus%>"/></td>
   </tr>
    	
	
	
	</table>
</td>
	
	

	
</tr>

</table> --%>
	                 </div>
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="adminbom.jsp"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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