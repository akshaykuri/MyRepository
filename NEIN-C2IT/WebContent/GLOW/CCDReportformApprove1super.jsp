<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.util.ResourceBundle"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>NExAS Form</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
  


    <link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
  	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
    <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
 
  
                     <!--    Date Picker -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>






 <script language="javascript" type="text/javascript">
	 
   function validate()
   {//txtmail_msg
   var d1 = document.form.txtmail_msg;
   var d2 = document.form.mail1;
   var ff=document.form.aabbcc;
   if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	   {
       alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
       document.getElementsByName("mmdradio")[0].focus();
       return false;
       } 
  if (document.getElementsByName("mmdradio")[0].checked)
	 {
	  if (!document.getElementsByName("higherAuthority")[0].checked ) 
	  		{  
		    alert("Select Radio Button For send Higher Authority ..");
		    document.getElementsByName("higherAuthority")[0].focus();
      		return false;
	  		}
	  }
  //alert("D2c :"+d2.value);
  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[0].checked && d2.value=="")
	 {
	        alert("Select next approver....");
	       // d2.focus();
   		    return false;
	  }
  if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	{
	 alert("Enter Remarks !");
	         d1.focus();
	 return false;
	 }
else
return true;
   }
</script>

<script type="text/javascript">
function OtherAdmin()
    {
    //document.form.action="DomainUserAdminBack.jsp";
    document.form.action="CCDReportformApproval1Back.jsp";
    document.form.method="post";
    document.form.submit();
    }
</script>
<script type="text/javascript">
function showTR()
	{
	var status = document.getElementById('idstatus').value;
	//alert("status is  "+status);
	if (status!="true")
	    {
	    alert("you are not authorized person");
	    return false;
	    }
	else
	    {
	    //alert("Send to Higher Authority");
		document.getElementById('idApproved').style.display="table-row";
	   	document.getElementById('idApproved').style.visibility="visible";
	 	document.getElementById('idPwd').style.display="table-row";
		document.getElementById('idPwd').style.visibility="visible";
		return true;
	    }
	}
function hideTR()
    {
    var status = document.getElementById('idstatus').value;
   //alert("status is  "+status);
   if (status!="true")
      {
      alert("you are not authorized person");
      return false;
      }
   else
      {
      document.getElementById('idApproved').style.hidden="table-row";
      document.getElementById('idApproved').style.visibility="hidden";
      document.getElementById('idApproved1').style.hidden="table-row";
      document.getElementById('idApproved1').style.visibility="hidden";
      document.getElementById('idApprovedd').style.hidden="table-row";
      document.getElementById('idApprovedd').style.visibility="hidden";
      return true;
      }
   }

function hideHigherTR()
   {
   document.getElementById('idApprovedd').style.display="table-row";
   document.getElementById('idApprovedd').style.visibility="visible";
   //alert("Select Designation And Name");
   }
 function showHigherTR()
   {
   document.getElementById('idApprovedd').style.display="table-row";
   document.getElementById('idApprovedd').style.display="none";
   alert("Mail Will Be Sent To IT (Head Office)");
   }

 function sync(val)
 {
 //alert(val);
 var parts = val.split(",");
 var part1 = parts[0]; 
 var part2 = parts[1]; 
 var part3 = parts[2]; 
 var part4 = parts[3];  
 var part5 = parts[4]; 
 if(val!="")
	  {
 	  document.getElementById("idrodesg").value=part3;
     document.getElementById("idroname").value=part2;
     document.getElementById("idromail").value=part4;
     document.getElementById("idempid1").value=part1;
     document.getElementById("idlevelno").value=part5;
	  }
 else
	  {
	  document.getElementById("idrodesg").value="";
     document.getElementById("idroname").value="";
     document.getElementById("idromail").value="";
     document.getElementById("idempid1").value="";
     document.getElementById("idlevelno").value="";
	  }
}



</script>




<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
	
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("adminlink.jsp?msg="+msg);
}
%>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";
    if(msg!="1")
		{
        alert(msg);
		}
</script>
	<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="../selEmpForms.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
            
            
     function Mail(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="../selectMailId.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText   
                                                      } 
                                                              
            } 
            

            
                </script> 
 
</head>
<body>

<form  name="form" method="post"  >
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,stl=null,stl1=null,stnext=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rsl=null,rsl1=null,rsnext=null;
String req=null;
String empD=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");
/* System.out.println("-------------------------------------");
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------"); */
Connection cn5 = null,cn11=null; 
Statement st5 = null,st11=null,st0=null; 
ResultSet rs5 = null,rs11=null,rsO=null; 
try{
%>

<%
String form2_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;
String filepath=null,fileName=null,mailid=null,mobno=null,i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,req_Branch="";
String req = request.getParameter("req");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form13_ccdreport WHERE form_no='"+req+"'"); 
while(rs100.next())
        {
	    form2_no = rs100.getString("form_no");
	    f_date = rs100.getString("form_date");
	    idextend = rs100.getString("idextend");
        branch = rs100.getString("empBranch");
	    depart = rs100.getString("depart");
	    full_name = rs100.getString("full_name");
	    designation = rs100.getString("designation");
	    mailid = rs100.getString("empmail");
	    mobno = rs100.getString("emp_mob");
	    emp_code = rs100.getString("empid");
	    reporting_officer = rs100.getString("r_officer");
	    requestOption = rs100.getString("requestOption");
	    requestBy = rs100.getString("requestBy");
	    req_Branch = rs100.getString("req_Branch");
	    filepath = rs100.getString("filepath");
	    fileName = rs100.getString("fileName");
        }
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td ><center><font size="3">
		<b><label>
		CCD REPOT FORM </label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=SessionName%>" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="hidden" name="i_city" value="<%=city%>" />
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form1_no" value="<%=form2_no%>" />
		<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
		</td>
		
	</tr>
</table>
<table width="600"  border=1 cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td>

<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>

<%
cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 
cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 


%>	 
		
	<table border=1 width="895">
	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >NAME:</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >DESIGNATION :</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=form2_no%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>

</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/>
 
					</td> 
</tr>


<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" value="<%=designation%>" readonly="readonly"/></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>


</tr>
<tr>
<td  style="text-align: right;">Emp Mail id :</td>
<td style="text-align:left;"><input type="text"  width=20 name="designation" value="<%=mailid%>" readonly="readonly"/></td>

<td  style="text-align: right;">EmpMob No :</td>
<td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=mobno%>" readonly="readonly"/></td>


</tr>
<tr>
<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  style="width: 15em"  name="d_reliving"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
	
		</td> 	
		<td align="right">Request  :</td>
<td  > 
     <input style="" type ="text" name = "requestOption" readonly="readonly" value ="<%=requestOption%>" id=""/></td>				        
</tr>

</table>
<br>
<!-- //////////////////////////////// /////////////////////////////////////////////////////////////-->

<%

String selOption1="",selOption1Txt="",selOption2="",selOption2Txt="",fromDate="",toDate="",opvalo="";
st0=cn100.createStatement();
rsO= st0.executeQuery("select * from form13_ccdreport_otherval WHERE form_no='"+req+"'"); 
while(rsO.next())
        {
	    selOption1 = rsO.getString("selOption1");
		selOption1Txt = rsO.getString("selOption1Txt");
	    selOption2 = rsO.getString("selOption2");
		selOption2Txt = rsO.getString("selOption2Txt");
		fromDate = rsO.getString("fromDate");
		toDate = rsO.getString("toDate");
		opvalo = rsO.getString("selBranch");
		System.out.println("OP VAlue1 :"+opvalo);
        }
//System.out.println("OP value :"+opval);
String opval="";
if(!opvalo.equals("All_branch"))
     opval = opvalo.substring(1);
else
	  opval=opvalo;
String [] opval1 = opval.split(",");
int l=opval1.length;
//System.out.println("L :"+l);
String [] opval3= new String[14];
int k=0;
String [] opval2={"All_branch","BANGALORE_Air_IMP","BANGALORE_Icon","DELHI","CHENNAI_Air_Imp","CHENNAI_Sea_Imp","MUMBAI_Air","MUMBAI_Sea","AHMEDABAD","KOLKATA","COCHIN","COIMBATORE","HYDERABAD","PUNE"};
for(int f=0;f<14;f++)
    {
  	if((opval1[k].equals(opval2[f]))  )
	   {
	   opval3[f]=opval1[k];	
	  // System.out.println("opval3 :"+opval3[f]);
	   if(k<l-1)
	       ++k;
	   }
	else
	   {
		opval3[f]=" ";
		//System.out.println("opval3 :"+opval3[f]);
	   }
   }
	


%>
<table width="895" border="1" bgcolor="lightgrey">
  
             <tr>
                <td align="left"><font color=red>*</font>Select Branch :</td>
                <td>
                <table width="100%">
                <tr>
                <td width="50%">
                   <%if(opval3[0].equals("All_branch")){%>   
                          <input name="linc_branh" type="checkbox" id="All" onclick="showCheckboxes(this.id)" class="group1" value="All_branch" checked/>ALL BRANCH<br>
                    <%}else{%>  
                          <input name="linc_branh" type="checkbox" id="All" onclick="showCheckboxes(this.id)" class="group1" value="All_branch" />ALL BRANCH<br>
                  <%}if(opval3[1].equals("BANGALORE_Air_IMP")){%>   
                         <input name="linc_branh" type="checkbox" id="one" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Air_IMP" checked/>BANGALORE_Air_IMP<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="one" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Air_IMP" />BANGALORE_Air_IMP<br>
                  <%}if(opval3[2].equals("BANGALORE_Icon")){%>   
                        <input name="linc_branh" type="checkbox" id="two" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Icon" checked/>BANGALORE_Icon<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="two" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Icon"/>BANGALORE_Icon<br>
                   <%}if(opval3[3].equals("DELHI")){%>   
                        <input name="linc_branh" type="checkbox" id="three" onclick="showCheckboxes(this.id)" class="group" value="DELHI" checked/>DELHI<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="three" onclick="showCheckboxes(this.id)" class="group" value="DELHI"/>DELHI<br>
                   <%}if(opval3[4].equals("CHENNAI_Air_Imp")){%>   
                         <input name="linc_branh" type="checkbox" id="four" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Air_Imp" checked/>CHENNAI_Air_Imp<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="four" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Air_Imp"/>CHENNAI_Air_Imp<br>
                   <%}if(opval3[5].equals("CHENNAI_Sea_Imp")){%>   
                        <input name="linc_branh" type="checkbox" id="five" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Sea_Imp" checked/>CHENNAI_Sea_Imp<br>
                   <%}else{%>
                       <input name="linc_branh" type="checkbox" id="five" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Sea_Imp"/>CHENNAI_Sea_Imp<br>  
                      <%} %>
                </td>
                <td width="50%">
                <%if(opval3[6].equals("MUMBAI_Air")){%>   
                       <input name="linc_branh" type="checkbox" id="six" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Air" checked/>MUMBAI_Air<br>
                   <%}else{%>  
                       <input name="linc_branh" type="checkbox" id="six" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Air"/>MUMBAI_Air<br>
                   <%}if(opval3[7].equals("MUMBAI_Sea")){%>   
                       <input name="linc_branh" type="checkbox" id="seven" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Sea" checked/>MUMBAI_Sea<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="seven" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Sea"/>MUMBAI_Sea<br>
                   <%}if(opval3[8].equals("AHMEDABAD")){%>   
                        <input name="linc_branh" type="checkbox" id="eight" onclick="showCheckboxes(this.id)" class="group" value="AHMEDABAD" checked/>AHMEDABAD<br>
                   <%}else{%>
                        <input name="linc_branh" type="checkbox" id="eight" onclick="showCheckboxes(this.id)" class="group" value="AHMEDABAD"/>AHMEDABAD<br>  
                   <%}if(opval3[9].equals("KOLKATA")){%>   
                        <input name="linc_branh" type="checkbox" id="nine" onclick="showCheckboxes(this.id)" class="group" value="KOLKATA" checked/>KOLKATA<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="nine" onclick="showCheckboxes(this.id)" class="group" value="KOLKATA"/>KOLKATA<br>
                   <%}if(opval3[10].equals("COCHIN")){%>   
                        <input name="linc_branh" type="checkbox" id="ten" onclick="showCheckboxes(this.id)" class="group" value="COCHIN" checked/>COCHIN<br>
                   <%}else{%>
                        <input name="linc_branh" type="checkbox" id="ten" onclick="showCheckboxes(this.id)" class="group" value="COCHIN"/>COCHIN<br>  
                   <%}if(opval3[11].equals("COIMBATORE")){%>   
                        <input name="linc_branh" type="checkbox" id="eleven" onclick="showCheckboxes(this.id)" class="group" value="COIMBATORE" checked/>COIMBATORE<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="eleven" onclick="showCheckboxes(this.id)" class="group" value="COIMBATORE" />COIMBATORE<br>
                   <%}if(opval3[12].equals("HYDERABAD")){%>   
                        <input name="linc_branh" type="checkbox" id="twelve" onclick="showCheckboxes(this.id)" class="group" value="HYDERABAD" checked/>HYDERABAD<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="twelve" onclick="showCheckboxes(this.id)" class="group" value="HYDERABAD"/>HYDERABAD<br>
                   <%}if(opval3[13].equals("PUNE")){%>   
                       <input name="linc_branh" type="checkbox" id="thirteen" onclick="showCheckboxes(this.id)" class="group" value="PUNE" checked/>PUNE
                   <%}else{%>
                       <input name="linc_branh" type="checkbox" id="thirteen" onclick="showCheckboxes(this.id)" class="group" value="PUNE"/>PUNE
                    <%}%>
              </td>
                </tr>
             </table>
             </td>
              <input type="hidden" name="dbName" id="iddbName" value="">
	    </tr>
              </tr>
             <tr>
                 <td align="left"><font color=red>*</font>Search On1 :</td>
                 <td>
                    <select name="se1" id="se1">
                        <option value=""><%=selOption1%></option>
                        <option value="IECode">IECODE NO</option>
                        <option value="JobNO">JOB NO</option>
                        <option value="ImpName">IMPORTER NAME</option>
                    </select>
                    <input type="text" name="se1text" id="se1text" value="<%=selOption1Txt%>" size=50></input>
                 </td>
                <!--  <td>
                     <input type="radio" name="se1" id="se11" value="IECode" onclick="active(this.value)"></input>IECODE NO.
                     <input type="radio" name="se1" id="se12" value="JobNO" onclick="active(this.value)"></input>JOB NO
                     <input type="radio" name="se1" id="se13" value="ImpName" onclick="active(this.value)"></input>IMPORTER NAME</br>
                     <input type="text" name="se1text" id="se1text" value="" size=100></input>
                 </td> -->
            </tr>
             <tr>
                 <td align="left"><font color=red>*</font>Search On2 :</td>
                 <td>
                    <select name="se2" id="se2">
                        <option value=""><%=selOption2 %></option>
                        <option value="ProDesc">PRODUCT DESCRIPTION</option>
                        <option value="CTHNo">CTH NO</option>
                    </select>
                    <input type="text" name="se2text" id="se2text" value="<%=selOption2Txt %>" size=50></input>
                 </td>
                <!--  <td>
                     <input type="radio" name="se2" id="se21" value="ProDesc" onclick="active(this.value)"></input>PRODUCT DESCRIPTION
                     <input type="radio" name="se2" id="se22" value="CthNo" onclick="active(this.value)"></input>CTH NO</br>
                     <input type="text" name="se2text" id="se2text" value="" size=100></input>
                 </td> -->
            </tr>
             <tr>
                 <td align="left"><font color=red>*</font>Clearance Date :</td>
                 <td>
                     From :<input type="text" name="date_time" maxlength="99" id="iddate_time" class="date_time" value="<%=fromDate %>" size=15 />
                     To :<input type="text" name="date_time1" maxlength="99" id="iddate_time1" class="date_time1" value="<%=toDate %>" size=15 />
                 </td>
            </tr>
        
</table>
<br />

<table width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>

	  </tr>
	  <%
	  String mailD=null,emp_no=null,levelno=null;
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  String statusD=null;
	  rs1 = st1.executeQuery("select form_no,desg,emp,status,remarks,form_date,mail,empid,levelno from form13_ccdreport_item WHERE form_no='"+req+"' ORDER BY id ASC"); 
	  while(rs1.next())
	  {
		  String form2_noD= rs1.getString("form_no");
		  String desgD= rs1.getString("desg");
		  empD= rs1.getString("emp");
		  statusD= rs1.getString("status");
		  String remarksD= rs1.getString("remarks");
		  String f_dateD= rs1.getString("form_date");
		  mailD= rs1.getString("mail");
		  
		  emp_no= rs1.getString("empid");
		  levelno= rs1.getString("levelno");
		  
		  String m = "";
		//   System.out.println("The sseecccoonndd mr_master ");
		
		   if(rs1.getString("mail")!=null)
		   {
		    m =  rs1.getString("mail").trim();
		   }
		 %>
	   <tr>
	   
		<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
		<input id="idStatus" type="hidden" value="<%=statusD%>"/>
		</td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=statusD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
	 </tr>
	  <%} %>
</table>
<% 

/* cn5 = con.getConnection2();
st5 = cn5.createStatement();

String ITdesg=null,ITbno=null;
PreparedStatement psmt=null;
psmt = cn2.prepareStatement("SELECT post,b_no FROM login WHERE b_no=? AND post=?");
psmt.setString(1,"90");
psmt.setString(2,"SR.MANAGER IT");
ResultSet itmang = psmt.executeQuery();
while(itmang.next())
{
	 ITdesg = itmang.getString(1);
	 ITbno = itmang.getString(2);
	
}
 */

/* System.out.println("Name e-------------------------- query : "+ITdesg);
System.out.println("Name ------------------------sessoin   : "+Sessiondesg);
System.out.println("branch no ---------------------------  : "+ITbno);
System.out.println("b_no ------------------------session   : "+Sessionb_no); */

%> 

<%System.out.println("Seeempid");
String sessempid=(String)session.getAttribute("emp_no");
System.out.println("Seeempid"+sessempid);
String flag = c2ITUtil1.getAuthorizedNameCCDREport(form2_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),session.getAttribute("emp_no").toString()); %>



<table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
 
 <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
 <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
  <input type="hidden" value="<%= session.getAttribute("form2_no") %>" id="idmrId"/>
<input type="hidden" id="idstatus" value="<%= flag %>" />

  
  <tr>
    <td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(showTR());"/>Approved
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR());" />Not Approved
    </td>
   </tr>  
  <tr style="visibility: hidden;display: none;" id="idApproved" >
   <td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="higherAuthority" id="idIT" onclick="hideHigherTR();" />Send To :
      <!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="directApprove" id="idmNon" onclick="showHigherTR();"/>Direct Approve -->
    </td>
  </tr>
  
  <tr style="visibility: hidden;display: none;" id="idApprovedd" >
  <% ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
  
  
  
  
     Class.forName(driver).newInstance();   
     cn5 = DriverManager.getConnection(url+dbName,userName,password);   
     Connection connhrms = null;
     ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
 	String userNamel = dbPropertiesl.getString("leavemanagement.username");
 	String passwordl = dbPropertiesl.getString("leavemanagement.password");
 	String urll = dbPropertiesl.getString("leavemanagement.url");
 	//String driverl = dbPropertiesl.getString("leavemanagement.driverName");
 	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");

     String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
     connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
     Statement nstmt = connhrms.createStatement();  
    
     String maxlevel="";
     stl = cn5.createStatement();  
     //rs5 = st5.executeQuery("Select * from desg");emp_no,levelno
     rsl = stl.executeQuery("SELECT max(levelno) FROM formapproval WHERE branch='"+req_Branch+"' and formtype='CCDReport'  ORDER BY levelno ASC");
     if(rsl.next())
         { 
         maxlevel=rsl.getString(1);
         }
   System.out.println("Max Level no :"+maxlevel);
     String allopt="",dirappro="";
     stl1 = cn5.createStatement();  
     //rs5 = st5.executeQuery("Select * from desg");emp_no,levelno
     rsl1 = stl1.executeQuery("SELECT alloptions,directApprove FROM formapproval WHERE branch='"+req_Branch+"' and empid='"+sessempid+"' and formtype='CCDReport'");
     if(rsl1.next())
         { 
         allopt=rsl1.getString(1);
         dirappro=rsl1.getString(2);
         }
     int nextlevel=0;
     st5 = cn5.createStatement(); 
     System.out.println("Current Level no :"+levelno);
     nextlevel=Integer.parseInt(levelno)+1;
     //System.out.println("Next  Level no :"+nextlevel);
     
     
     /* ////////////////////////// Skeeping level code  ////////////////////////////////// */
      String nextemp="";
      stnext = cn5.createStatement(); 
      rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='"+req_Branch+"' and levelno='"+nextlevel+"' and formtype='CCDReport' ORDER BY levelno ASC");
      if(rsnext.next())
           {
    	   nextemp=rsnext.getString(5);
           }
      if(emp_no.equals(nextemp))
          {
    	  nextlevel++;
          }
     /* ////////////////////////// end Skeeping level code  ////////////////////////////////// */

     
     
     
     
     
     
     
     if(allopt.equals("0") || allopt.equals(""))
           {
    	   System.out.println("Next  Level no :"+nextlevel);
    	   rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+req_Branch+"' and levelno='"+nextlevel+"' and formtype='CCDReport' ORDER BY levelno ASC");
    	   if(rs5.next())
                {
    		     ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString(5) + "' ) AND u.employee_status = 'yes' ");
    		     if(nrs.next())
    		            { 
    		  	         nuname=nrs.getString(1);
    		             ndesg=nrs.getString(2);
    		             nmailid=nrs.getString(6);
    		            }
    		     napproval=rs5.getString(5)+","+nuname+","+ndesg+","+nmailid+","+nextlevel;
    		     napproval1=nuname+" ("+nmailid+")";
    		     System.out.println("Next approval :"+napproval); 
               %>
                  <td> 
                      <input align="left" type="radio" value="<%=napproval%>" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
                      <input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
                      <input type="hidden" name="mail12" id="iddeptadminP" value="<%=napproval%>" size="30"/>
   	              </td>
            
                                       <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail1" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
              <%}else
              {
            	  System.out.println("direct Approve level **************************************************************************");%>
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	    <!--  <input type="hidden" name="higherAuthority" value="directApprove" id="idmNon"></input>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="directApprove" id="idmNon" onclick="showHigherTR();"/>Direct Approve(Mail will go to all)
                     <br>Upload CCD ReportFile  :<input type="file" name="file" id="filename" size="15" value="" class="incTotal" />
                      -->
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	  
            	<% System.out.println("direct Approve level **************************************************************************");
              }
          }
     else
          {
    	 int curlev=Integer.parseInt(levelno);
    	 int next=0;
    	  while(curlev<=Integer.parseInt(maxlevel))
    	     {
    		  next=curlev+1;
    	     rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+req_Branch+"' and levelno='"+next+"'  ORDER BY levelno ASC");
         	 if(rs5.next())
                 {
		         ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString(5) + "' ) AND u.employee_status = 'yes' ");
		         if(nrs.next())
		              { 
		  	          nuname=nrs.getString(1);
		              ndesg=nrs.getString(2);
		              nmailid=nrs.getString(6);
		              }
		        napproval=rs5.getString(5)+","+nuname+","+ndesg+","+nmailid+","+next;
		        napproval1=nuname+" ("+nmailid+")";
		       // System.out.println("Next approval :"+napproval); 
                %>
                <td> 
                   <input align="left" name="approver" type="radio" value="<%=napproval%>" id="iddeptadminP1" onclick="sync(iddeptadminP<%=next%>.value);"/>
                   <input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
                   <input type="hidden" name="mail12" id="iddeptadminP<%=next%>" value="<%=napproval%>" size="30"/>
               </td>
              <%} 
          curlev++;
          }%>
    	 
    	  <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
          <input type="hidden" name="emp" id="idroname" value="" readonly/> 
          <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
          <input type="hidden" name="mail1" id="idromail" value="" readonly/>
          <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
    	<%}%>
  
  
  
  
  
  
  </tr>
  
 
  <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="3" cols="100"></textarea></div></td>
  </tr>
  
 
 </table>


 
</br>
                                                                
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" >
  <tr>
     <td style="size:1">
          <div id="formsubmitbutton">
                 <input type="submit"  value="SUBMIT" name="save1" id="save1" onclick="return (validate()  && ButtonClicked() && OtherAdmin())" /></td>
          </div>  
          <div id="buttonreplacement" style="display:none;">
                <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	       </div>  
     <td style="font-size:1"> <a href="javascript:history.back()">BACK</a></td>
   	</tr>
 
</table> 	
<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs3,st3,cn3);
	DbUtil.closeDBResources(rs4,st4,cn4);
	DbUtil.closeDBResources(rs5,st5,cn5);
	DbUtil.closeDBResources(rs11,st11,cn11);
	DbUtil.closeDBResources(rs100,st100,cn100);

  }
%>
</center>
	<br /><br /><br />
	
</div>

</form>	

</body>

</html>