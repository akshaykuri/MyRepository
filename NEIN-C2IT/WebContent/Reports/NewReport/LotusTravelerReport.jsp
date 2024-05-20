<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>BRANCH DATE TO DATE WISE LOTUS REPORT</title>
	
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
/* function link(form_no) 
{
   var f=document.form;  
alert(form_no);
	f.method="post";   
	
	f.action='ITclearanceLocalAllAdmin.jsp?form_no='+form_no;
	window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    f.target='formpopup';
	f.submit(); 
	} */
function link(form_no)
{    
var f=document.form;    
f.method="post";    
f.action='LotusLocalTravelerAllAdmin.jsp?form_no='+form_no;;    
f.submit();
}
</script>
<script language="javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function popitup(url) {
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
	    /*         // String transId = null;  
	             
	            // String textArea1,textArea2,txtDate,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,mr_idpo,mr_assetpo,itemhead;
	           // String idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks;
	            String s_no=null,s_sExecutive=null,s_date=null,customer=null,s_person=null,s_contact=null,s_mail=null,s_add=null,s_web=null,s_industry=null;
				String s_compet=null,s_weight=null,s_abbre=null,s_lead_source=null,s_value=null,s_valueCurrency=null,s_lead_allocated=null,s_stage=null,s_expectedDate=null,s_profit=null;
				String s_profitCurrency=null,remarks=null,operation_date=null;
	            Timestamp cm_time,cm_time2,cm_time_diff=null;
	            
	           // Timestamp time1=null,time2=null;
	            String newDate,newDate2; */
	            
	            String form_name=null,form_no=null,initiator=null,initiatorDesg=null,forBranch=null,SentBy=null,SentByDesg=null,SentByRemarks=null,datee=null;
	            String forfullname=null,forDesignation=null,forReportingOfficer=null,requestOption=null;
	%>


     <%
                 // transId = "abc"+String.valueOf(Math.random()); 
     req = request.getParameter("lotusTraveler");
     req2 = request.getParameter("dateLT");
     req3 = request.getParameter("dateLTT");
     
     
     System.out.println("req   "+req);
     System.out.println("req2   "+req2);
     System.out.println("req3   "+req3);
     //System.out.println("Request payload: "+ req2);
     String reqResult =null;
    // reqResult = req.substring(req.length()-2,req.length());
     System.out.println("reqResult   "+reqResult);
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
     
     String dateF = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
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
     
     String dateFF = dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
      
   %>
     
<body background="images/u.jpg">

 <form name="form">  

<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="10" align="left"><center><b><font size="3" style="font-size: medium;">
LOTUS TRAVELER REPORT</font></b></center></td></tr>
</table>



<br />
   <%

Connection cn3 = null;
Statement st3= null,st2=null; 
ResultSet rs3 = null,rs2=null;
try{
%>


<table border="1" width="1100" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr style="background: lightgrey">
	
	<td  colspan="1"  align=center><font color="black" size="2">From Date:</font></td>
	<td  colspan="1" align=center><font color="black" size="2"><b><%=req2%></b></font></td>
		<td  colspan="1"  align=center><font color="black" size="2">To Date:</font></td>
	<td  colspan="1" align=center><font color="black" size="2"><b><%=req3%></b></font></td>
	<td></td>
	<td  colspan="1"  align=center><font color="black" size="2">Branch:</font></td>
	<td  colspan="2" align=center><font color="black" size="2"><b><%=req%></b></font></td>
	</tr>
	<tr>
	<td colspan="10" bgcolor=""></td>
	</tr>
	<tr>

			<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2" color="black"><b>Sl No..</b></font></td>
				<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>FORM NO.</b></font></td>
				<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>REQUESTED DATE</b></font></td>
						<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>REQUESTED FOR</b></font></td>
				<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>INITIATOR NAME</b></font></td>
				
					<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>INITIATOR DESIGNATION</b></font></td>
					<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>BRANCH</b></font></td>
					
					<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>USER NAME</b></font></td>
					<td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>DESIGNATION</b></font></td>
					<!-- <td bgcolor="white" width="100" align=center style="vertical-align:middle" ><font size="2"><b>REPORTING OFFICER</b></font></td> -->
					
					
					
					
		
		</tr>			    
				    <%int flag=0;
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				            st3 = conn.createStatement();
				         //   rs2 = st2.executeQuery("select * from sales_master WHERE substr(s_no,12,2) = '"+reqResult+"' and s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' ORDER BY s_no ASC ");
				            //rs2 = st2.executeQuery("select DISTINCT s.s_no,s.s_sExecutive,s.s_date,s.customer,s.s_person,s.s_contact,s.s_mail,s.s_add,s.operation_date,s.s_stage,s.s_add,s.s_web,CONCAT(s.s_value,' ',s.s_valueCurrency) AS Svalue,CONCAT(s.s_weight,' ',s.s_abbre) AS Sweight,CONCAT(s.s_profit,' ',s.s_profitCurrency) AS Sprofit,s.s_compet,GROUP_CONCAT(DISTINCT s.s_product) as pproduct,GROUP_CONCAT(DISTINCT s.s_country) AS cs_customer,GROUP_CONCAT(DISTINCT s.s_country2) AS ds_customer FROM sales_master s  WHERE substr(s.s_no,12,2) = '"+reqResult+"' and s.s_date >= '"+dateF+"' AND s.s_date<='"+dateFF+"' GROUP BY s.s_no ORDER BY s.s_no ASC  ");
				   //refer :rs2 = st2.executeQuery("select          s.s_no,s.s_sExecutive,s.s_date,s.customer,s.s_person,s.s_contact,s.s_mail,s.s_add,s.operation_date,s.s_stage,s.s_add,s.s_web,CONCAT(s.s_value,' ',s.s_valueCurrency) AS Svalue,CONCAT(s.s_weight,' ',s.s_abbre) AS Sweight,CONCAT(s.s_profit,' ',s.s_profitCurrency) AS Sprofit,s.s_compet,m.m_m_date,m.m_m_stage,s.s_product,s.s_country,s.s_country2 FROM sales_master s INNER JOIN sales_meeting m ON (s.s_no=m.s_no) WHERE s.s_sExecutive = '"+req+"' and m.m_m_date >= '"+dateF+"' AND m.m_m_date<='"+dateFF+"' ORDER BY m.m_m_date ASC ");
				           if(req!=null && req.equals("all"))
				           {
				        	   System.out.println("ALL BRANCH "+req);
				            rs2 = st2.executeQuery("SELECT form_name,form8_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(Approval_f_date,'%d/%m/%Y'),full_name,designation,requestOption FROM  form8_lotus_traveler WHERE f_date >= '"+dateF+"' AND f_date<='"+dateFF+"' AND deleted='no' ORDER BY id ASC   ");
				           }
				           else
				           {
				        	   System.out.println("Specific BRANCH "+req);
				        	   rs2 = st2.executeQuery("SELECT form_name,form8_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(Approval_f_date,'%d/%m/%Y'),full_name,designation,requestOption  FROM  form8_lotus_traveler WHERE branch='"+req+"' AND f_date >= '"+dateF+"' AND f_date<='"+dateFF+"' AND deleted='no' ORDER BY id ASC   ");
				           }
				            //SELECT s.s_no,s.s_sExecutive,s.s_date,s.customer,s.s_person,s.s_contact,s.s_mail,m.m_m_date,m.m_m_stage FROM sales_master s INNER JOIN sales_meeting m ON s.s_no=m.s_no  WHERE s.s_sExecutive='FAROOQ SHAIKH' AND YEAR(s.s_date)='2014'
				           // rs2 = st2.executeQuery("select * from sales_meeting WHERE m_m_name  = '"+req+"'");
				          // java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
				          // java.text.SimpleDateFormat sdf2 = new SimpleDateFormat("dd/mm/yyyy");
				            while(rs2.next()){
				            	flag=1;
				        						k++;
				        						//s_no=null,s_sExecutive=null,s_date=null,customer=null,s_person=null,s_contact=null,s_mail=null,s_add=null
				            				form_name = rs2.getString("form_name");
							form_no = rs2.getString("form8_no");
							
							//System.out.println("emp "+empp);
							initiator = rs2.getString("i_name");
							initiatorDesg = rs2.getString("i_desg");
							forBranch = rs2.getString("branch");
							
							forfullname = rs2.getString("full_name");
							forDesignation = rs2.getString("designation");
							//forReportingOfficer = rs2.getString("reporting_officer");
							requestOption = rs2.getString("requestOption");
							
							SentBy = rs2.getString("Approval_empp");
							SentByDesg = rs2.getString("Approval_desgg");
							SentByRemarks = rs2.getString("Approval_remarks");
							datee = rs2.getString(9);
				            					 
				            				
				    			        	        i++;
				        		    	   		     
				            	       		    		 
				            %>
				            <script>id++; </script>
				    <tr>
				    <td align="center" style="vertical-align:middle" ><%=i%>
				      <input type="hidden" name="<%=k%>" value="<%=form_no%>" />
				    </td>
				  
				    <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><font size="2"><%=form_no%></font></a></font> </td>  
   				    <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=datee%></font></td>
   				    <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=requestOption%></font></td>
   					 <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=initiator%></font></td>
   				
   					 
					<td width="" align="center"   style="vertical-align:middle"><font size="2"><%=initiatorDesg%></font></td>
						<td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forBranch%></font></td>
						
						<td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forfullname%></font></td>
						<td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forDesignation%></font></td>
						<%-- <td width="" align="center"   style="vertical-align:middle"><font size="2"><%=forReportingOfficer%></font></td> --%>
						
						
					
					
					</tr>
				 <% }%>
				
<tr>
<!-- <td width="1118" align="right" colspan="9"> 
    <center><p style="font-size:16px;color:black"> 
        <a href="javascript:location.replace('CollageAllReports.jsp')"><b>Back</b></a></p></center>
</td> -->
<td style="font-size:1" align="right" colspan="4"></td>
<td style="font-size:1" align="right" colspan="1">&nbsp;&nbsp;<input style="background-color:white;font-weight:bold;color:black;" height="60" width="55" type="button"  value="BACK" onclick="window.location.href='CollageAllReports.jsp'"/>
     <!-- <a  href="javascript:history.back()">BACK</a> -->
      </td>
 <td align="center" id="hiderow" colspan="1">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td> 
<td style="font-size:1" align="right" colspan="3"></td>
</tr> 
</table>
	 <font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! Data Not Exist ");
				            }
				 %></font>
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