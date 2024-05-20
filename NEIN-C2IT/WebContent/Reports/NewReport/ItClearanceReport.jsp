<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
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
<jsp:useBean id = "con" class="CON2.Connection2" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BRANCH DATE TO DATE WISE CRM</title>
<link rel='stylesheet' type='text/css' href='../../css/style.css' />
<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
<script type='text/javascript' src='../../js/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='../../js/example.js'></script>
<script type='text/javascript' src='../../js/jquery-1.5.1.min.js'></script>
 <style type="text/css"> 
 td{
    text-align: center;
}
textarea.special { 
font-family:arial; 

font-size:11px; 
overflow: auto;
}

select {
    font-size:0.8em;
     /* border-color:#999;  without this, it won't work */
}

input[type="text"][readonly],
textarea[readonly] {
  background-color: #ccc;
}
</style>
<script type="text/javascript">
function link(form_no)
	{    
	var f=document.form;    
	f.method="post";    
	f.action='ITclearanceLocalAllAdmin.jsp?form_no='+form_no;;    
	f.submit();
	}
</script>
<script language="javascript">
function printit()
	{  
	if (window.print) {
	    window.print() ;  
	} else {
	    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
	    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
	}
	}
function popitup(url) 
    {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
    } 
</script>
		
</head>

                  <%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String req,req2,req3;
	              String total_val=null;
	              Connection2 dbConn = new Connection2();
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	              String form_name=null,form_no=null,initiator=null,initiatorDesg=null,forBranch=null,SentBy=null,SentByDesg=null,SentByRemarks=null,datee=null;
	              String forfullname=null,forDesignation=null,forReportingOfficer=null;
	              %>


     <%
     req = request.getParameter("branch1");
     req2 = request.getParameter("date1");
     req3 = request.getParameter("date11");
     System.out.println("req   "+req);
     System.out.println("req2   "+req2);
     System.out.println("req3   "+req3);
     String reqResult =null;
   
     String[] dateString = req2.split("-");
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
     String[] dateString2 = req3.split("-");
     System.out.println(dateString2[1]);
     if (dateString2[1].equals("Jan"))
     {
   	  dateString2[1]="01";
     }
     if (dateString2[1].equals("Feb"))
     {
   	  dateString2[1]="02";
     }
     if (dateString2[1].equals("Mar"))
     {
   	  dateString2[1]="03";
     }
     if (dateString2[1].equals("Apr"))
     {
   	  dateString2[1]="04";
     }
     if (dateString2[1].equals("May"))
     {
   	  dateString2[1]="05";
     }
     if (dateString2[1].equals("Jun"))
     {
   	  dateString2[1]="06";
     }
     if (dateString2[1].equals("Jul"))
     {
   	  dateString2[1]="07";
     }
     if (dateString2[1].equals("Aug"))
     {
   	  dateString2[1]="08";
     }
     if (dateString2[1].equals("Sep"))
     {
   	  dateString2[1]="09";
     }
     if (dateString2[1].equals("Oct"))
     {
   	  dateString2[1]="10";
     }
     if (dateString2[1].equals("Nov"))
     {
   	  dateString2[1]="11";
     }
     if (dateString2[1].equals("Dec"))
     {
   	  dateString2[1]="12";
     }
     String dateFF = dateString2[0]+"-"+dateString2[1]+"-"+dateString2[2];
     %>
     
<body background="images/u.jpg">
<form name="form">  
<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="10" align="left"><center><b><font size="3" style="font-size: medium;">
     Outstanding Dues & Handover Report</font></b></center></td></tr>
</table>
<br />
<%
String requestOption=null,presence=null;
Connection cn3 = null;
Statement st3= null,st2=null,stp=null,stp1=null; 
ResultSet rs3 = null,rs2=null,rsp=null,rsp1=null;
try{
%>
<table border="1" width="1100" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr style="background: lightgrey">
	    <td  colspan="1"  align=center><font color="black" size="2">From Date:</font></td>
		<td  colspan="1" align=center><font color="black" size="2"><b><%=req2%></b></font></td>
		<td  colspan="1"  align=center><font color="black" size="2">To Date:</font></td>
		<td  colspan="1" align=center><font color="black" size="2"><b><%=req3%></b></font></td>
	</tr>
	<tr>
	    <td colspan="11" bgcolor=""></td>
	</tr>
	<tr>
   	    <td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2" color="black"><b>Sl No..</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>FORM NO.</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>REQUESTED DATE</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>REQUESTED FOR</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>INITIATOR NAME</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>INITIATOR DESIGNATION</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>BRANCH</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>RESIGNED EMP</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>DESIGNATION</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>REPORTING OFFICER</b></font></td>
		<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>STATUS</b></font></td>
	 </tr>			    
				    <%int flag=0;
				      int i=0;int k=0;
				      conn = con.getConnection2();
				      st2 = conn.createStatement();
				      stp = conn.createStatement();
				      stp1 = conn.createStatement();
				      st3 = conn.createStatement();
				      if(req!=null && req.equals("all"))
				           {
				           System.out.println("ALL BRANCH "+req);
				           rs2 = st2.executeQuery("SELECT distinct a.form1_no, a.form_name, a.i_name, a.i_desg, a.branch, a.Approval_empp, "+
				        		                  "a.Approval_desgg, a.Approval_remarks, DATE_FORMAT( a.Approval_f_date,  '%d/%m/%Y' ) , "+ 
				        		                  "a.full_name, a.designation, a.r_officer, a.requestOption,a.deleted "+
									              "FROM form1_it_clearance a "+
									           	  "WHERE a.f_date >=  '"+dateF+"' "+
									              "AND a.f_date <=  '"+dateFF+"' "+
									           	  "AND a.deleted IS NULL "+
									           	  "ORDER BY a.id ASC ");
				            }
				         else
				            {
				        	System.out.println("Specific BRANCH "+req);
				        	rs2 = st2.executeQuery("SELECT a.form1_no, a.form_name, a.i_name, a.i_desg, a.branch, a.Approval_empp, a.Approval_desgg, "+ 
				        			               "a.Approval_remarks, DATE_FORMAT( a.Approval_f_date,  '%d/%m/%Y' ) , a.full_name, a.designation, "+
				        			               "a.r_officer, a.requestOption,a.deleted "+
					            		           "FROM form1_it_clearance a "+
					            		           "WHERE a.f_date >=  '"+dateF+"' AND "+
					            		           "a.f_date <=  '"+dateFF+"' AND "+
					            		           "branch='"+req+"' "+
					            		           "AND a.deleted IS NULL "+
					            		           "ORDER BY a.id ASC ");
				           }
				   
				      while(rs2.next())
				           {
				           flag=1;
				           k++;
				       	   form_name = rs2.getString("form_name");
						   form_no = rs2.getString("form1_no");
						   initiator = rs2.getString("i_name");
						   initiatorDesg = rs2.getString("i_desg");
						   forBranch = rs2.getString("branch");
						   requestOption = rs2.getString("requestOption");
						   forfullname = rs2.getString("full_name");
						   forDesignation = rs2.getString("designation");
						   forReportingOfficer = rs2.getString("r_officer");
						   SentBy = rs2.getString("Approval_empp");
						   SentByDesg = rs2.getString("Approval_desgg");
						   SentByRemarks = rs2.getString("Approval_remarks");
						   
						   rsp1 = stp1.executeQuery("SELECT  DATE_FORMAT( f_date,  '%d/%m/%Y' )   FROM form1_it_clearance_item where form1_no='"+form_no+"' ");
						   datee=""; 
						   if(rsp1.next())
				               {
							   datee = rsp1.getString(1);
				               }
						   
						   
						   
						   rsp = stp.executeQuery("SELECT presence  FROM form1_it_clearance_item where form1_no='"+form_no+"' ");
						   presence=""; 
						   while(rsp.next())
				               {
							   presence = rsp.getString("presence");
				               }
						   
						   
						   
						   System.out.println("Presence : "+presence);
                           if(presence==null)
                                {
                                presence = "old";
                                }
						 	else if(presence.equals("over"))
							    {
								presence = "Completed";
							    }
							else if(presence.equals("now"))
							    {
								presence = "Pending";
							    } 
						   i++;
				           %>
				    <script>id++; </script>
				    <tr>
				       <td align="center" style="vertical-align:middle" ><%=i%><input type="hidden" name="<%=k%>" value="<%=form_no%>" /></td>
				       <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><font size="2"><%=form_no%></font></a></font> </td>  
   				       <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=datee%></font></td>
   				       <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=requestOption%></font></td>
   					   <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=initiator%></font></td>
   					   <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=initiatorDesg%></font></td>
					   <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forBranch%></font></td>
				 	   <td width="" align="center"   style="vertical-align:middle"><font size="2" color="red"><%=forfullname%></font></td>
					   <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forDesignation%></font></td>
					   <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forReportingOfficer%></font></td>
					   <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=presence%></font></td>
					</tr>
				 <% }%>
				
                    <tr>
                       <td style="font-size:1" align="right" colspan="4"></td>
                       <td style="font-size:1" align="right" colspan="1">&nbsp;&nbsp;<input style="background-color:white;font-weight:bold;color:black;" height="60" width="55" type="button"  value="BACK" onclick="window.location.href='CollageAllReports.jsp'"/></td>
                       <td align="center" id="hiderow" colspan="1">
                       <SCRIPT Language="Javascript">  
                       var NS = (navigator.appName == "Eclipse");
                       var VERSION = parseInt(navigator.appVersion);
                       if (VERSION > 3) 
                           {
                           document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
                           } 
                      </script>
                      </td> 
                      <td style="font-size:1" align="right" colspan="5"></td>
                   </tr> 
             </table>
	         <font color="red" size="4">
				 <%
			       if(flag==0){
			          	out.println("Sorry...! Data Not Exist ");
			        }
				  %>
		     </font>
      <br />
</center>

 <%}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(rs3,st3,cn3);
	DbUtil.closeDBResources(rs2,st2,null);
}
%>

</form>	

</body>

</html>