<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page import="org.codehaus.groovy.ast.stmt.CatchStatement"%>
<%@page import="sun.misc.Perf.GetPerfAction"%>
<%@page import="org.apache.poi.hssf.record.formula.functions.Replace"%>
<html>
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


<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>STATUS DATE TO DATE WISE CRM</title>
	

<!-- 	<script language="javascript"   type="text/javascript" src="../../js/ScriptLink.js"></script> -->
	<!-- <script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->
	<script type="text/javascript">
	function link(s_no) 
{
var f=document.form;  
	f.method="post";   
	f.action='IncidentLogLocalAllAdmin.jsp?s_no='+s_no;
	window.open('', 'formpopup','height=1100,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    form.target = 'formpopup';
    f.submit();
	}
	</script>
 <style type="text/css"> 
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
	newwindow=window.open(url,'name','height=1100,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} 
</script>
		
</head>

<%!
Connection conn = null;

String req2,req3;

//String req11=null,req12=null,req13=null;
String branch=null,person=null,status=null;

Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
// String transId = null;  

	            // String textArea1,textArea2,txtDate,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,mr_idpo,mr_assetpo,itemhead;
	           // String idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks;
	            String s_no=null,s_sExecutive=null,s_date=null,customer=null,s_person=null,s_contact=null,s_mail=null,s_add=null,s_web=null,s_industry=null;
				String s_compet=null,s_weight=null,s_abbre=null,s_lead_source=null,s_value=null,s_valueCurrency=null,s_lead_allocated=null,s_stage=null,s_expectedDate=null,s_profit=null;
				String s_profitCurrency=null,remarks=null,operation_date=null;
	            Timestamp cm_time,cm_time2,cm_time_diff=null;
	            
	           // Timestamp time1=null,time2=null;
	            String newDate,newDate2;
	%>


     <%
                 // transId = "abc"+String.valueOf(Math.random()); 
     //branch,txtCalendar,person,status
     
     req2 = request.getParameter("date4");//date one
     req3 = request.getParameter("date44");//date two
     branch = request.getParameter("branch");
     System.out.println("BRANCH   before  "+branch);
     if (branch.length() > 0){
    	// branch= branch.substring("String name".length() - 1);
    	  branch = branch.substring(Math.max(branch.length() - 2, 0));
    	}
     System.out.println("BRANCH   after   "+branch);
     person = request.getParameter("person");
     System.out.println("PERSON LENGTH :"+person.length());
     
     status = request.getParameter("status");
     
     
 
   
     System.out.println("req2   "+req2);
     System.out.println("req3   "+req3);
  
     
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
<tr><td colspan="6" align="left"><center><b><font size="3" style="font-size: medium;">CHECK LIST REPORT</font></b></center></td></tr>
</table>



<br />
   <%


Statement st2=null; 
ResultSet rs2=null;
try{
%>
<table id="invoicetable" width="1000" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	<td></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">FROM DATE:<b><%=req2%></b></font></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">TO DATE:<b><%=req3%></b></font></td>	
	<%if((branch.length()>1)){%>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">BRANCH:<b><%=branch%></b></font></td>
	<%}if((person.length()>1)){%>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">PERSON:<b><%=person%></b></font></td>
	<%}%>

	
	
	
	</tr>
	</table> 
<table  border="1" width="80%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
<%-- 	<tr style="background: lightgrey">
	<td  colspan="2" align=center><font color="black" size="2">STATUS:</font></td>
	<td  colspan="1" align=center><font color="black" size="2"><b><%=req11%></b></font></td>
	<td  colspan="3" align=center ><font color="black" size="2"> STATUS DATE TO DATE WISE REPORT</font></td>
	<td  colspan="1"  align=center><font color="black" size="2">From Date:</font></td>
	<td  colspan="1" align=center><font color="black" size="2"><b><%=req2%></b></font></td>
		<td  colspan="1"  align=center><font color="black" size="2">To Date:</font></td>
	<td  colspan="1" align=center><font color="black" size="2"><b><%=req3%></b></font></td>
	</tr>
	<tr>
	<td colspan="10" bgcolor="black"></td>
	</tr> --%>
	<tr>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>Sl No.</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>FORM NO</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>INITIATOR</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>CREATED DATE</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>BRANCH</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>REMARKS</b></font></td>


		
		</tr>			    
				    <%int flag=0;
				    String form9_no,SessionName,Created_date,from_date,to_date,Approval_status,Approval_remarks;
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				            //rs2 = st2.executeQuery("select * from sales_master WHERE s_stage = '"+req11+"' and s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' ORDER BY s_no ASC ");
				            System.out.println("dateF : "+dateF);
				            System.out.println("dateFF : "+dateFF);
				            System.out.println("req2 : "+req2);
				            System.out.println("req3 : "+req3);
				            System.out.println("branch NAME  : "+branch);
				            System.out.println("person NAME : "+person);
				            System.out.println("sttaus : "+status);
				           
				            
				           /*  if (!req11.equals("NULL") && !req12.equals("NULL") && !req13.equals("NULL"))
					           {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE customer = '"+req11+"' AND s_product='"+req12+"' AND s_stage='"+req13+"' and s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
					           }
				            
				            
				            else if (!req11.equals("NULL") && req12.equals("NULL") && req13.equals("NULL"))
				            {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE customer = '"+req11+"' AND s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				            }
				            else if (req11.equals("NULL") && !req12.equals("NULL") && req13.equals("NULL"))
				            {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE s_product='"+req12+"' AND s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				            }
				            else if (req11.equals("NULL") && req12.equals("NULL") && !req13.equals("NULL"))
				            {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE s_stage='"+req13+"' AND s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				            }
				            
				            
				            else if (!req11.equals("NULL") && !req12.equals("NULL") && req13.equals("NULL"))
				            {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE customer = '"+req11+"' AND s_product='"+req12+"' AND s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				            }
				            else if (req11.equals("NULL") && !req12.equals("NULL") && !req13.equals("NULL"))
				            {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE s_product='"+req12+"' AND s_stage='"+req13+"' and s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				 			}
				            else if (!req11.equals("NULL") && req12.equals("NULL") && !req13.equals("NULL"))
				            {
				            	rs2 = st2.executeQuery("select * from sales_master WHERE customer = '"+req11+"' AND s_stage='"+req13+"' and s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				            }
				            
				            
				            else
				            	rs2 = st2.executeQuery("select * from sales_master WHERE s_date >= '"+dateF+"' AND s_date<='"+dateFF+"' AND Ses_branch_no='"+SE_b_no+"' AND s_sExecutive = '"+SE_name+"' ORDER BY s_no ASC ");
				           */
				           
				           PreparedStatement psmt2=null;
				           String query2 = "SELECT cs_id,city,cs_date,e_name,e_designation,e_Location,main_remarks FROM cs_master "+
								           "WHERE "+
								            //"(SUBSTRING(SessionCity,-2) = ? OR ? = '') "+
								            "(e_Location = ? OR ? = '') "+
						        		     "AND (e_name= ? OR ? = '') "+
						        		    // "AND (Approval_status = ?  OR ? = '') "+
						        		    /*  "AND (Ses_branch_no = ? OR ? = '') "+
						        		     "AND (s_sExecutive = ? OR s_accompanied LIKE ? OR ? = '') "+ */
						        		     "AND "+ 
						        		     "cs_date >= ? AND cs_date <= ? ORDER BY id ";
							                               
							    psmt2 = conn.prepareStatement(query2);
							    psmt2.setString(1,branch);
							    psmt2.setString(2,branch);
							    psmt2.setString(3,person);
							    psmt2.setString(4,person);
							/*     psmt2.setString(5,status);
							    psmt2.setString(6,status); */
							  /*   psmt2.setString(1,req11);//Customer
							    psmt2.setString(2,req11);//Customer
							    psmt2.setString(3,req12);//Product
							    psmt2.setString(4,req12);//Product
							    psmt2.setString(5,req13);//s_stage
							    psmt2.setString(6,req13);//s_stage
							    psmt2.setString(7,SE_b_no);//Ses_branch_no
							    psmt2.setString(8,SE_b_no);//Ses_branch_no
							    psmt2.setString(9,SE_name);
							    psmt2.setString(10,"%"+SE_name+"%");
							    psmt2.setString(11,SE_name); */
							    psmt2.setString(5,dateF);//req2
							    psmt2.setString(6,dateFF);//req3
					            rs2 = psmt2.executeQuery();
				           
				        //   rs2 = st2.executeQuery("CALL search_Company_Service_Status(?,?,?)");
				           while(rs2.next()){
				            	flag=1;
				        						k++;
				        						//s_no=null,s_sExecutive=null,s_date=null,customer=null,s_person=null,s_contact=null,s_mail=null,s_add=null
				            					s_no = rs2.getString("cs_id");
				        						
				        						form9_no = rs2.getString("cs_id");
				        						SessionName = rs2.getString("e_name");
				        						Created_date = rs2.getString("cs_date");
				        						
				        						Approval_status = rs2.getString("city");
				        						Approval_remarks = rs2.getString("main_remarks");
				        						i++;
				            	       		    		 
				            %>
				            <script>id++; </script>
				    <tr>
				    <td align="center" ><%=i%></td>
					<input type="hidden" name="<%=k%>" value="<%=s_no%>" />
	         		<td  align=center  ><font color="black" size="2" ><%=form9_no%></font> </td>
					<td align=center><font color="black" size="2"><%=SessionName %></font></td>
					<td align=center><font color="black" size="2"><%=Created_date %></font></td>
					<td align=center><font color="black" size="2"><%=Approval_status%></font></td>
					<td align=center><font color="black" size="2"><%=Approval_remarks%></font></td>
					
				  
					
					</tr>
				 <% }

				 %>
				
	</table> 

	 <font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! Data Not Exist ");
				            }
}catch(SQLException ex)
{
	ex.printStackTrace();
}
				 finally{
					 DbUtil.closeDBResources(rs2,st2,conn);
				 }
				 %></font>
<br /><br /><br />
<table width="" align=center bgcolor="lightgrey">
<tr> 
<td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.history.go(-1); return false;" /></td>
<td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>

<!-- <td><a href="../../HelpPageAdmin.jsp" onclick="return popitup('../../HelpPageAdmin.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td> -->


</tr>
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>