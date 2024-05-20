<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>TMS FORM</title>
	
  
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
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
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'dd,mm,yy' });
  } );
  </script>
 
                      <!--  Date Picker close-->
 
 
 <script type="text/javascript">  
function featchIT(v)  
          { 
	      document.getElementById("idempid1").value ="";
	      document.getElementById("idroname").value ="";
	      document.getElementById("idrodesg").value ="";
	      document.getElementById("idromail").value ="";
	       document.getElementById("idlevelno").value ="";
	      //alert("here"+v);
           	        if (typeof XMLHttpRequest != "undefined")
    	              {    
    		          xmlHttp= new XMLHttpRequest();    
    		          }
    	        else if (window.ActiveXObject)
    	              {    
    		          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		          } 
    	       if (xmlHttp==null)
    	              {   
    		          alert("Browser does not support XMLHTTP Request");   
    		          return;     
    		          }      
    	        var url="getITPerson.jsp";  
    		    url +="?loc="+v;
    		    xmlHttp.onreadystatechange = deptadmin;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
            }  
    function deptadmin()
            { //alert("here1");
    	          var str21=xmlHttp.responseText;
    	          if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                                 { 
                                 document.getElementById("resultFromAjaxdeptAdmin").innerHTML = str21;
                                 document.getElementById("iddeptadminP").value =  document.getElementById("approvP").value;
                                 document.getElementById("iddeptadminP11").value =  document.getElementById("approvP1").value;
                                 }
    	                      else
    	        	             {
    	                    	  document.getElementById("resultFromAjaxdeptAdmin").innerHTML = str2;
    	                    	  document.getElementById("iddeptadminP").value ="";
    	                    	  document.getElementById("iddeptadminP11").value ="";
    	                    	  }
    	          
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
	  	  document.getElementById("idrodesg").value=part1;
	      document.getElementById("idroname").value=part2;
	      document.getElementById("idromail").value=part3;
	      document.getElementById("idempid1").value=part4;
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
 
 

 
 
 
 
         <script language = "Javascript">
         function checkAddress(str)
              {
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
              }
         function validate()
              {
        	 //emp_mob,empmailid,emptype
        	  var emptype1=document.form.emptype.value;
        	
        	 if(emptype1=="Confirmed")
        		 {
        	     var empid=document.form.empidConfirmed;
        	    // alert("empid value :"+empid.value);
        	     var w=document.form.branchConfirmed;
        	     var dpt=document.form.departConfirmed;
        	     var fn=document.form.full_nameConfirmed;
        	     var desg=document.form.designationConfirmed;
        	     var roff=document.form.reporting_officerConfirmed;
        	     var emp_mob=document.form.emp_mobConfirmed;
        	     var empmailid=document.form.empmailidConfirmed;
        	     var rb = document.form.requestByConfirmed;
        	     var req=document.form.requestOptionConfirmed;
        	     var deptType=document.form.deptTypeConfirmed;
        	     var req_Branch=document.form.req_BranchConfirmed;
        		 }
        	 else
        		 {
        		 var empid=document.form.empidContract;
           	     //alert("empid value :"+empid.value);
           	     var w=document.form.branchContract;
           	     var dpt=document.form.departContract;
           	     var fn=document.form.full_nameContract;
           	     var desg=document.form.designationContract;
           	     var roff=document.form.reporting_officerContract;
           	     var emp_mob=document.form.emp_mobContract;
           	     var empmailid=document.form.empmailidContract;
           	     var rb = document.form.requestByContract;
           	     var req=document.form.requestOptionContract;
           	     var deptType=document.form.deptTypeContract;
           	     var req_Branch=document.form.req_BranchContract;
        		 }
        	 
        	  var remarks=document.form.remarks;
        	  var mail=document.form.mail;
        	  var desg1=document.form.desg;
          	  var emp=document.form.emp;
          	  var empid1=document.form.empid1;
        	  var levelno=document.form.levelno;
        	  var mail11=document.form.mail11;
        	  
        	  var bkColor = "red";
          	  var bkColor2 = "white";
          	  if ((empid.value==null)||(empid.value==""))
          	     {
                 alert("Please Enter EmpID!");
                 empid.style.bkColor = empid.style.backgroundColor;
                 empid.style.backgroundColor = bkColor;
                 empid.focus();
                 return false;
                 }
          	 if ((fn.value==null)||(fn.value==""))
             {
             alert("Please Enter Full Name!");
             fn.style.bkColor = fn.style.backgroundColor;
             fn.style.backgroundColor = bkColor;
             fn.focus();
             return false;
             }
          	 if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null"))
             {
             alert("Please Enter Department!");
             dpt.style.bkColor = dpt.style.backgroundColor;
             dpt.style.backgroundColor = bkColor;
             dpt.focus();
             return false;
             }
            if ((w.value==null)||(w.value=="")||(w.value=="Null"))
                 {
                 alert("Please Select Branch!");
                 w.style.bkColor = w.style.backgroundColor;
                 w.style.backgroundColor = bkColor;
                 w.focus();
                 return false
                 }
           
            if ((desg.value==null)||(desg.value=="")||(desg.value=="Null"))
            {
            alert("Please Enter Designation!");
            desg.style.bkColor = desg.style.backgroundColor;
            desg.style.backgroundColor = bkColor;
           desg.focus();
            return false;
            }
          
            
            if ((roff.value==null)||(roff.value==""))
                {
                alert("Please Enter Reporting Officer Name!");
                roff.style.bkColor = roff.style.backgroundColor;
                roff.style.backgroundColor = bkColor;
                roff.focus();
                return false;
                }
            if ((empmailid.value==null)||(empmailid.value==""))
            {
            alert("Please Enter EMail ID!");
            empmailid.style.bkColor = empmailid.style.backgroundColor;
            empmailid.style.backgroundColor = bkColor;
            empmailid.focus();
            return false;
            }
            if ((emp_mob.value==null)||(emp_mob.value==""))
            {
            alert("Please Enter Mobile Number!");
            emp_mob.style.bkColor = emp_mob.style.backgroundColor;
            emp_mob.style.backgroundColor = bkColor;
            emp_mob.focus();
            return false;
            }
         
           
          if ((rb.value==null)||(rb.value==""))
                {
                alert("Please Enter Requested By whom!");
                rb.style.bkColor = rb.style.backgroundColor;
                rb.style.backgroundColor = bkColor;
                rb.focus();
                return false;
                }
           
           if ((req_Branch.value==null)||(req_Branch.value==""))
                {
                alert("Please select Requested branch!");
                req_Branch.style.bkColor = req_Branch.style.backgroundColor;
                req_Branch.style.backgroundColor = bkColor;
                req_Branch.focus();
                return false;
                } 
          if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false )  )
                {
                alert("Select  Request Type! \n \n New/Delete/Change");
                req[0].focus();
                return false;
                }
          if ((deptType[0].checked == false ) && (deptType[1].checked == false )  && (deptType[2].checked == false ) && (deptType[3].checked == false ) )
                {
                alert("Select  Dept Type! \n \n Transport/Warehouse/IT/Finance");
                deptType[0].focus();
                return false;
                } 
          
        
          
          
           if ((remarks.value==null)||(remarks.value==""))
                {
                alert("Enter Remarks!");
                remarks.style.bkColor = remarks.style.backgroundColor;
                remarks.style.backgroundColor = bkColor;
                remarks.focus();
                return false;
                } 
     
          if (mail11.value=="")
                {
                alert("Branch IT dosenot exists in master table ...");
                return false;
                } 
          if (empid1.value==""||emp.value==""||desg1.value==""||mail.value==""||levelno.value=="")
                {
                alert("Please select the next approver name ...");
                return false;
                } 
         
           else
               return true;
        }
   </script>
  
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
    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
    {	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../adminlinkHR.jsp?msg="+msg2);
    }
    %>
	
<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) 
    {
	evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    return true;
    }

</script>

<script type="text/javascript">  
 function sendInfo(v)  
           { // alert("empid :"+v);
    	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="getEmployee.jsp";  
    		    url +="?EMP_NO=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
	         var str2=xmlHttp.responseText;
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
                             // alert("here");//idname,iduid,idpass,idnmail
                             document.getElementById("resultFromAjax2").innerHTML = str2;//fname,iddept,idbranch,iddesg
                             document.getElementById("fnameConfirmed").value =  document.getElementById("p1").value;
                             document.getElementById("iddesgConfirmed").value =  document.getElementById("p2").value;
                      		 document.getElementById("idbranchConfirmed").value =  document.getElementById("p3").value;
                      		 document.getElementById("iddeptConfirmed").value =  document.getElementById("p4").value;
                      		 document.getElementById("rofficerConfirmed").value =  document.getElementById("p5").value;
                      		 document.getElementById("idempmailidConfirmed").value =  document.getElementById("p6").value;
                     		 document.getElementById("idemp_mobConfirmed").value =  document.getElementById("p7").value;
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("fnameConfirmed").value = "";
                             document.getElementById("iddesgConfirmed").value =""; 
      		                 document.getElementById("idbranchConfirmed").value = "";
      		                 document.getElementById("iddeptConfirmed").value =  "";
      		                 document.getElementById("rofficerConfirmed").value =  "";
      		                 document.getElementById("idemp_mobConfirmed").value = "";
                   		     document.getElementById("idempmailidConfirmed").value = "";
      		                 }
                 } 
  
  
  function selectConfCont(val)
      {
      //fname,iddept,idbranch,iddesg,rofficer,idempmailid,idemp_mob,
	  if(val=="Confirmed")
		  {
		  document.getElementById("conf").style.display= "block";
		  document.getElementById("cont").style.display = "none";
		  
		  document.getElementById("idempidConfirmed").value = "";
		  document.getElementById("fnameConfirmed").value = "";
		  document.getElementById("iddeptConfirmed").value = "";
		  document.getElementById("idbranchConfirmed").value = "";
		  document.getElementById("iddesgConfirmed").value = "";
		  document.getElementById("rofficerConfirmed").value = "";
		  document.getElementById("idempmailidConfirmed").value = "";
		  document.getElementById("idemp_mobConfirmed").value = "";
		  
		  document.getElementById("fnameConfirmed").readOnly = true;
		  document.getElementById("iddeptConfirmed").readOnly = true;
		  document.getElementById("idbranchConfirmed").readOnly = true;
		  document.getElementById("iddesgConfirmed").readOnly = true;
		  document.getElementById("rofficerConfirmed").readOnly = true;
		  document.getElementById("idempmailidConfirmed").readOnly = true;
		  document.getElementById("idemp_mobConfirmed").readOnly = true;
		  
		  }
	  else if(val=="Contract")
		  {
		  document.getElementById("conf").style.display= "none";
		  document.getElementById("cont").style.display = "block";
		  
		  document.getElementById("idempidContract").value = "";
		  document.getElementById("fnameContract").value = "";
		  document.getElementById("iddeptContract").value = "";
		  document.getElementById("idbranchContract").value = "";
		  document.getElementById("iddesgContract").value = "";
		  document.getElementById("rofficerContract").value = "";
		  document.getElementById("idempmailidContract").value = "";
		  document.getElementById("idemp_mobContract").value = "";
		  
		  document.getElementById("fnameContract").readOnly = false;
		  document.getElementById("iddeptContract").readOnly = false;
		  document.getElementById("idbranchContract").readOnly = false;
		  document.getElementById("iddesgContract").readOnly = false;
		  document.getElementById("rofficerContract").readOnly = false;
		  document.getElementById("idempmailidContract").readOnly = false;
		  document.getElementById("idemp_mobContract").readOnly = false;
		  }
	  else
		  {//cont,conf
		  
		  document.getElementById("emptype").selectedIndex = "0";
		  document.getElementById("conf").style.display= "block";
		  document.getElementById("cont").style.display = "none";
		  
		  document.getElementById("idempidConfirmed").value = "";
		  document.getElementById("fnameConfirmed").value = "";
		  document.getElementById("iddeptConfirmed").value = "";
		  document.getElementById("idbranchConfirmed").value = "";
		  document.getElementById("iddesgConfirmed").value = "";
		  document.getElementById("rofficerConfirmed").value = "";
		  document.getElementById("idempmailidConfirmed").value = "";
		  document.getElementById("idemp_mobConfirmed").value = "";
		  
		  document.getElementById("req_Branch").selectedIndex = "0";
		  
		  document.getElementById("fnameConfirmed").readOnly = true;
		  document.getElementById("iddeptConfirmed").readOnly = true;
		  document.getElementById("idbranchConfirmed").readOnly = true;
		  document.getElementById("iddesgConfirmed").readOnly = true;
		  document.getElementById("rofficerConfirmed").readOnly = true;
		  document.getElementById("idempmailidConfirmed").readOnly = true;
		  document.getElementById("idemp_mobConfirmed").readOnly = true;
		  }
	  
      }
  
</script>
                
              
</head>
<body onload="selectConfCont()">
<form action="TMSPageBack.jsp" method="post" name="form" >
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
/* System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------"); */
%>
<%-- <%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %> --%>
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
    <table width="905"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	 <tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>TMS USER REQUEST FORM</label>
		</b></font></center></td> 
	</tr>
	<tr style="visibility: hidden;display: none;">
	   <td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
	    <%-- 	<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/> --%>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
	</tr>
    <tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<%-- <td width="165"><%= po_date.format(new java.util.Date())%></td> --%>
	</tr>
</table>

<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
//System.out.println("b_no :"+b_no);
%>

<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn11=null,cn6=null,cn5 = null;
Statement st1= null,st2=null,st3=null,st4=null,st11=null, st5 = null,st6=null,st61=null,st62=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs11=null,rs5 = null,rs6=null,rs61=null,rs62=null; 

try
  {


  cn6 = con.getConnection2();
  st6=cn6.createStatement();
  st61=cn6.createStatement();
  st62=cn6.createStatement();
  if(b_no.equals("90"))
      {
	  rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");
	  rs61 = st61.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");
      }
  else
      {
	  rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main where 	m_b_no='"+b_no+"'  ORDER BY m_b_name Asc");
	  rs61 = st61.executeQuery("select m_b_no,m_b_name from branch_master_main where 	m_b_no='"+b_no+"'  ORDER BY m_b_name Asc");
      }
  rs62 = st62.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");

 %>	 
<!-- <table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
<td> -->		
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
    <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Emp Type :<input type="hidden" name="idextend" value="" /></td>
     <td align="left" colspan="3">
          <select name="emptype" id="emptype"  style="font-size : 8pt" onchange="selectConfCont(this.value)">      
              <option value="Confirmed">Confirmed</option> 
              <option value="Contract">Contract</option> 
          </select>  
     </td>
     
  </tr>
</table>
<div id="conf">
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
  <tr>
     <td  style="text-align: right;width:23%;" ><font color=red>*</font>Emp ID :</td>
     <td align="left" colspan="3"><input type="text" name="empidConfirmed" value="" id="idempidConfirmed"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);" /></td>
  
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
    <td style="text-align:left;"><input type="text" name="full_nameConfirmed" size="29" id="fnameConfirmed" maxlength="44" readonly/></td>
    <td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
    <td style="text-align: left;"><input type="text" name="departConfirmed" id="iddeptConfirmed" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="" /></td>
     <td style="text-align: left;"><input type="text" name="branchConfirmed" id="idbranchConfirmed" size="28" maxlength="44" readonly />	</td>
     <td  style="text-align: right;"><font color=red>*</font>Designation :</td>
     <td style="text-align: left;"><input type="text" name="designationConfirmed" id="iddesgConfirmed" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
     <td style="text-align:left;"><input type="text" name="reporting_officerConfirmed" id="rofficerConfirmed" size="28" maxlength="44" readonly/></td>
     <td style="text-align: right;"><font color=red>*</font>Emails ID :</td>
	 <td style="text-align: left;"><input type="text" name="empmailidConfirmed"	id="idempmailidConfirmed" size="28" maxlength="44" readonly/></td>
  </tr>
  <tr >
    <td  style="text-align: right;"><font color=red>*</font>Mobile No :</td>
    <td style="text-align:left;"><input type="text" name="emp_mobConfirmed" id="idemp_mobConfirmed" maxlength="44" size="29"/ readonly></td>
    <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
    <td style="text-align:left;"><input type="text" name="requestByConfirmed" id="reqConfirmed" value='<%=Name%>' size="28" maxlength="44" readonly/></td>
  </tr>
   <tr>
     <td style="text-align: right;"><font color=red>*</font>Requested Branch :</td>
     <td style="text-align:left;">
          <select name="req_BranchConfirmed" id="req_BranchConfirmed"  style="font-size : 8pt" onchange="featchIT(this.value)">      
               <option value="">Select</option>
         <%while(rs6.next()){%>     
              <option value="<%=rs6.getString(1)%>"><%=rs6.getString(2)%></option> 
              <%}%>   
         </select>  
     </td>
   <td style="text-align: right;"><font color=red>*</font>Request Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;"> 
          <input style="" type ="radio" name = "requestOptionConfirmed" value ="New" id="" />New
          <input type ="radio" name = "requestOptionConfirmed" value ="Delete"  />Delete
          <input type ="radio" name = "requestOptionConfirmed" value ="Change"  />Change</td>
  </tr>
  <tr>
    <td style="text-align: right;"><font color=red>*</font>Dept Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> 
          <input style="" type ="radio" name = "deptTypeConfirmed" value ="Trans" id="" />Transport
          <input type ="radio" name = "deptTypeConfirmed" value ="WH"  />Warehouse
          <input style="" type ="radio" name = "deptTypeConfirmed" value ="IT" id="" />IT
          <input type ="radio" name = "deptTypeConfirmed" value ="Finance"  />Finance</td>
  </tr>
  </table>
</div>



<div id="cont">
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
  <tr>
     <td  style="text-align: right;width:23%;" ><font color=red>*</font>Contract Emp Code :</td>
     <td align="left" colspan="3"><input type="text" name="empidContract" value="" id="idempidContract"   onkeypress="return isNumber(event)" " /></td>
  
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
    <td style="text-align:left;"><input type="text" name="full_nameContract" size="29" id="fnameContract" maxlength="44" readonly/></td>
    <td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
    <td style="text-align: left;"><input type="text" name="departContract" id="iddeptContract" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="" /></td>
     <td style="text-align: left;"><!-- <input type="text" name="branchContract" id="idbranchContract" size="28" maxlength="44" readonly /> -->
          <select name="branchContract" id="idbranchContract"  style="font-size : 8pt" >      
               <option value="">Select</option>
         <%while(rs62.next()){%>     
              <option value="<%=rs62.getString(1)%>"><%=rs62.getString(2)%></option> 
              <%}%>   
         </select>  
     
     	</td>
     <td  style="text-align: right;"><font color=red>*</font>Designation :</td>
     <td style="text-align: left;"><input type="text" name="designationContract" id="iddesgContract" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
     <td style="text-align:left;"><input type="text" name="reporting_officerContract" id="rofficerContract" size="28" maxlength="44" readonly/></td>
     <td style="text-align: right;"><font color=red>*</font>Emails ID :</td>
	 <td style="text-align: left;"><input type="text" name="empmailidContract"	id="idempmailidContract" size="28" maxlength="44" readonly/></td>
  </tr>
  <tr >
    <td  style="text-align: right;"><font color=red>*</font>Mobile No :</td>
    <td style="text-align:left;"><input type="text" name="emp_mobContract" id="idemp_mobContract" maxlength="44" size="29"/ readonly></td>
    <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
    <td style="text-align:left;"><input type="text" name="requestByContract" id="reqContract" value='<%=Name%>' size="28" maxlength="44" readonly/></td>
  </tr>
   <tr>
     <td style="text-align: right;"><font color=red>*</font>Requested Branch :</td>
     <td style="text-align:left;">
          <select name="req_BranchContract" id="req_BranchContract"  style="font-size : 8pt" onchange="featchIT(this.value)">      
               <option value="">Select</option>
         <%while(rs61.next()){%>     
              <option value="<%=rs61.getString(1)%>"><%=rs61.getString(2)%></option> 
              <%}%>   
         </select>  
     </td>
   <td style="text-align: right;"><font color=red>*</font>Request Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;"> 
          <input style="" type ="radio" name = "requestOptionContract" value ="New" id="" />New
          <input type ="radio" name = "requestOptionContract" value ="Delete"  />Delete
          <input type ="radio" name = "requestOptionContract" value ="Change"  />Change</td>
  </tr>
  <tr>
    <td style="text-align: right;"><font color=red>*</font>Dept Type :</td>
    <td colspan="2" style="font-weight:bold;font-style:italic;width:23%;"> 
          <input style="" type ="radio" name = "deptTypeContract" value ="Trans" id="" />Transport
          <input type ="radio" name = "deptTypeContract" value ="WH"  />Warehouse
          <input style="" type ="radio" name = "deptTypeContract" value ="IT" id="" />IT
          <input type ="radio" name = "deptTypeContract" value ="Finance"  />Finance
          </td>
  </tr>
 
 
  </table>
</div>

<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">  
       <tr> 
      <td align="left"><font color=red>*</font>Remarks  :
      <textarea name="remarks" rows="3" cols="124" id="ta" maxlength="199" title="Remarks 200 characters"></textarea></td>
  </tr>
          
        <tr> 
           <td><b><font color=red>*</font>Send To Branch IT:</b>
                <input align="left" type="radio" value="" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
              <input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP" value="" size="30"/>
   	       </td>
       </tr>
        <tr>                           <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
      </tr>
      
                      
</table>  
</br>
</center>                                                                   
   </td>
</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
     <td style="size:1">
        <div id="formsubmitbutton">
            <input  type="submit" value="SEND" name="save1" id="save1" onClick="return validate();" />
        </div>
        <div id="buttonreplacement" style="display:none;">
	       <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	    </div> 
     </td>
     <td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	 <td style="font-size:1">&nbsp;&nbsp;<input  type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp?msg=1'"/> </td>
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
  }
	%>
</center>
	<br /><br /><br />
	
</div>

</form>	
       <div id="resultFromAjax2" style="display:none;">
       </div>
       <div id="resultFromAjax3" style="display:none;">
       </div>
       <div id="resultFromAjaxdeptAdmin" style="display:none;">
</div>
</body>

</html>