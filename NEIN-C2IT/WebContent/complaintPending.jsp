<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.Calendar" %> 
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
<%@ include file="../../../../Session/SuperAdminSession.jsp"%>
<jsp:useBean id="con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINISTRATOR</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />

<script language="javascript"   type="text/javascript" src="js/popWindowAtCenter.js"></script>
<script type="text/javascript" src="API/Js/jquery-1.8.2.js"></script>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />


<style type="text/css">
div#iddd
 {
  width:100px;
  height:100px;
  }
</style>

<script type="text/javascript">
/* function link(form_no) 
{
   var f=document.form;  

	f.method="post";   
	
	f.action='DisplayPendingFormPopUp.jsp?form_no='+form_no;
	window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    f.target='formpopup';
	f.submit(); 
	} */
function link(complaint_no) 
{
var f=document.form;  


	f.method="post";   
	
	f.action='complaint_resolve.jsp?complaint_no='+complaint_no;
	window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    f.target='formpopup';
	f.submit();
	}
	


function linkITAdmin(form_no1)
	{
	var g = document.form;
	g.method = "post";
	g.action = 'DisplayITPendingReminder.jsp?form_no='+form_no1;
	//newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    //form.target = 'formpopup';
    g.target='formpopup';
	g.submit();
	
	}

</script>
<script  type="text/javascript">

<% 
    String msg2[] = request.getQueryString().toString().split("=");
    String disp = msg2[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27"," ");
    disp = disp.replace("__","  ");
    %>
    msg2 = "<%=disp%>";

     if(msg2!="1")
		{
           alert(msg2);
		}
</script>
<!-- <script>

//Auto Refresh Page with Time script By JavaScript Kit (javascriptkit.com) Over 200+ free scripts here!


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

</script> -->
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden;" onload="changeHashOnLoad();">
<div id="iddd" >
<form name="form" >
<table>
<tr>
<td>
<img src="images/logo.png" height="35" width="220"> </td>

</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	SYSTEM ADMINISTRATOR </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr> 
  
  
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 

<tr>
<td width="1118" align="right"> 

<!-- 
<a href="adminbom.jsp?msg=1"><img width="35" src="images/master2.jpg">Masters</a>
<a href="feedbackUser.jsp?msg=1" onclick="return popitup2('feedbackUser.jsp?msg=1')" id="hiderow"><img width="35" src="images/doubt.jpg">Feedback</a>
<a href="thoughtMaster.jsp?msg=1" onclick="return popitup2('thoughtMaster.jsp?msg=1')" id="hiderow"><img width="35" src="images/face.jpg">Message</a>
<a href="changePwdAdmin.jsp?msg=1" onclick="return popitup2('changePwdAdmin.jsp?msg=1')" id="hiderow"><img width="35" src="images/passChange.jpg">Change Password</a>
 --><a class="a_link" href="logout.jsp"><img width="35" src="images/icon_log.png">Logout</a>
</td> 

</tr> 
</table>


<br />



<%!String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,SessionSuperAdmin=null,SessionSubCity=null,department=null; %>


				<table width="1118" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<tr>
<td colspan="10">
				 <font > Welcome :<%
 
 SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
SessionSuperAdmin = (String) session.getAttribute("AdminRights");
SessionSubCity =(String) session.getAttribute("SubCity");
department = (String) session.getAttribute("department");
%>
<%=SessionName %>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%=department %>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%=Sessioncity %>
</font>
		
</td>
</tr>		
				<tr><td colspan="10" align="center" bgcolor="grey" class="tdColor">DASH BOARD</td></tr>
				<tr><td colspan="10" align="center" bgcolor="lightgrey" class="tdColor">PENDING STATUS OF COMPLAINTS</td></tr>
	
				<tr>
						<!-- <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">COMPLAINT NO.</font></td> -->
				    <td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">COMPLAINT NO.</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">PRIORITY</font></td>
				    <td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR NAME</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FOR LOCATION</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">PROBLEM TYPE</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATED DATE</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT TO</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT MAIL ID</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">STATUS</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REMARKS</font></td>
					
				</tr>
					<% 
						String cs_date,datee=null;
						//DateFormat dateFormat = new SimpleDateFormat("yyyy-dMM-d");
						DateFormat dateFormat = new SimpleDateFormat("MM");
						Date date = new Date();
						cs_date = dateFormat.format(date);
						//System.out.println("DATE"+cs_date);
						//String empp=null,status=null,notstatus=null,truestatus=null,allPending=null;
					//	String form_name=null,form_no=null,initiator=null,initiatorDesg=null,forBranch=null,SentBy=null,SentByDesg=null,SentByRemarks=null;
					String complaint_no=null,Intitated_by=null,From_location=null,Problem_type=null,comp_date=null,sent_to=null,sent_to_mail_id=null,Initator_mail_id=null,Problem_descrip=null;
						int k=0;
						int flag=0;
						Connection cn02 = null;
						Statement st02 = null; 
						ResultSet rs02 = null;
						 try 
						  
						  {
				
						cn02 = con.getConnection2();
						st02=cn02.createStatement();
					/* rs02 = st02.executeQuery("select form1_no AS form,emp,desg,remarks,f_date from form1_it_clearance_item where status = 'pending' AND emp='RAMKI'  and MONTH(f_date)='"+cs_date+"' "+ 
								"union select form2_no AS form,emp,desg,remarks,f_date from form2_domain_item where status = 'pending' AND emp='RAMKI' and MONTH(f_date)='"+cs_date+"' " +  
								"union select form3_no AS form,emp,desg,remarks,f_date from form3_lotus_item where status = 'pending' AND emp='RAMKI' and MONTH(f_date)='"+cs_date+"' "+ 
								"union select form4_no AS form,emp,desg,remarks,f_date from form4_accesscard_item where status = 'pending' AND emp='RAMKI' and MONTH(f_date)='"+cs_date+"'"+  
								"union select form5_no AS form,emp,desg,remarks,f_date from form5_folder_item where status = 'pending' AND emp='RAMKI' and MONTH(f_date)='"+cs_date+"'"); */
						
	     rs02 = st02.executeQuery("select DISTINCT complain_master_item.complain_id,complain_master_item.cm_name,complain_master_item.cm_location,complain_master_item.cm_problem"+
	    		 					",complain_master_item.cm_date,complain_master_item.emp,complain_master_item.mail,complain_master_item.cm_mail,complain_master_item.cm_type,complain_master_item.cm_status,complain_master_item.priority from complain_master_item "+
	    		 					"INNER JOIN assigned_master ON(complain_master_item.emp=assigned_master.Locname) INNER JOIN nentryho ON(assigned_master.Locname=nentryho.Nname)"+
	    		 					//"WHERE assigned_master.assignedLocation LIKE '%"+SessionSubCity+"%' AND nentryho.Npost='IT SUPPORT' AND complain_master_item.cm_status='Pending' ORDER BY complain_master_item.cm_date DESC ");
	    		 					"WHERE assigned_master.assignedLocation='"+SessionSubCity+"' AND nentryho.Npost='IT SUPPORT' AND nentryho.department='"+department+"' AND complain_master_item.cm_status='Pending' AND complain_master_item.emp='"+SessionName+"' ORDER BY complain_master_item.cm_date DESC ");
								//"UNION SELECT form7_no,emp,desg,status FROM form7_newins_item WHERE status='Pending' AND emp='"+SessionName+"' AND desg='"+Sessiondesg+"'");
										
						String statuss=null,priority=null;	
						//SELECT Nname,(select count(complain_master_item.emp) as Numb FROM complain_master_item where  complain_master_item.emp=nentryho.Nname AND complain_master_item.cm_date='2014-02-17') as count_comp FROM nentryho
						while(rs02.next())
						{k++;
						  flag=1;
						  complaint_no = rs02.getString(1);
							Intitated_by = rs02.getString(2);
							
							//System.out.println("emp "+empp);
							From_location = rs02.getString(3);
							Problem_descrip = rs02.getString(4);
							comp_date = rs02.getString(5);
							sent_to = rs02.getString(6);
							sent_to_mail_id = rs02.getString(7);
							Initator_mail_id = rs02.getString(8);
							Problem_type = rs02.getString(9);
							statuss = rs02.getString(10);
							priority = rs02.getString(11);
							//System.out.println("DATEEEEEEEEEEEEEEEEEEEE :"+datee);
						%>
				<tr><input type="hidden" name="<%=k%>" value="<%=complaint_no%>" />
	                <%--  <td width="" align="center"  height="21" ><font size="2"><%=complaint_no%></font></td> --%>
   					 <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><font size="2"><%=complaint_no%></font></a></font> </td> 
   					 <%if((priority!=null) && (priority.equals("HIGH"))) {%>
   					 <td width="" align="center"  height="21" bgcolor="red" ><font size="2" color="black"><%=priority%></font></td>
   					 <%} else {%>
   					 <td width="" align="center"  height="21" ><font size="2"><%=priority%></font></td>
   					 <%} %>
   					 <td width="" align="center"  height="21" ><font size="2"><%=Intitated_by%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=From_location%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=Problem_type%></font></td>
					 <td width="" align="center"  height="21" ><font size="2"><%=comp_date%></font></td>
					 <td width="" align="center"  height="21" ><font size="2"><%=sent_to%></font></td>
					 <td width="" align="center"  height="21" ><font size="2"><%=sent_to_mail_id%></font></td>
					 <td width="67" align="center"  height="21" ><font size="2"><%=statuss%></font></td> 
					 <td><textarea rows="1" cols="15" title="Remarks" readonly="readonly" onclick="this.style.height='200px';this.style.width='200px';" onblur="this.style.height='';this.style.width='140px';"><%=Problem_descrip%></textarea></td>
				</tr>		<%}%>
				</table>
				
			<%}catch (Exception e) {
		 		 System.out.println(e);
			}
			finally{
				DbUtil.closeDBResources(rs02,st02,cn02);

				}%>
<table width="1111"><tr>
<td>				
<center>
 <font color="red" size="2">
				 <%
				            if(flag==0){
				            	out.println("...................No Pending FORMS at present.....................");
				            }
				 %></font>
</center>
</td>
</tr>
</table>
<br>





<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address> 
</td> 
 
<td width="115" align="right"> 
<a href="OtherPage.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>
</div>




</body>
</html>