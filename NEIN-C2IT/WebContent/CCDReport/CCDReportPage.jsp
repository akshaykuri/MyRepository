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
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>CCD Report FORM</title>
	
  
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
 <script type="text/javascript">
$(document).ready(function () 
    {
	$("#iddate_time").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy ' }).val();  
	$("#iddate_time1").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val();  
	
    });

</script>
 
         <script language = "Javascript">
         function validate()
              { 
        	 //  empid,full_name,depart,branch,designation,reporting_officer,empmailid,emp_mob,requestBy,linc_branh, se1,se1text,se2,se2text,date_time,date_time1,remarks
              // mail11, mail1,  empid1, emp, desg, mail, levelno      
     
        	  var empid=document.form.empid;
        	  var fn=document.form.full_name;
          	  var roff=document.form.reporting_officer;
        	  var dbName=document.form.dbName;
        	  
        	  
        	  var se1=document.form.se1;
        	  var se1text=document.form.se1text;
          	  var se2=document.form.se2;
        	  var se2text=document.form.se2text;
        	  
        	  
        	  var datefrom=document.form.date_time;
        	  var dateto = document.form.date_time1;
        	  var remarks=document.form.remarks;
        	  var mail=document.form.mail;
        	  var desg1=document.form.desg;
          	  var emp=document.form.emp;
          	  var empid1=document.form.empid1;
        	  var levelno=document.form.levelno;
        	  var mail11=document.form.mail11;
        	  var mail112=document.form.mail112;
        	  var mail1=document.form.mail1;
        	
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
                dpt.style.backgroundColor = bkColor2;
                fn.focus();
                return false;
                }
            
            if ((roff.value==null)||(roff.value==""))
                {
                alert("Please Enter Reporting Officer Name HRMS!");
                roff.style.bkColor = roff.style.backgroundColor;
                roff.style.backgroundColor = bkColor;
                desg.style.backgroundColor = bkColor2;
                roff.focus();
                return false;
                }
          if ((dbName.value==null)||(dbName.value==""))
            {
            alert("Please select the branch option!");
            return false;
            }  
         // alert("se1.value :"+se1.value);
          if (se1.value=="" && se2.value=="" )
            {
            alert("Please select the any search option!");
            return false;
            }  
         
         
         
         
         if (se1.value!="")
              {
        	  if(se1text.value=="")
        		   {
                   alert("Please Enter the value of "+se1.value);
                   se1text.style.bkColor =se1text.style.backgroundColor;
                   se1text.style.backgroundColor = bkColor;
                   se1text.focus();
                   return false;
        		   }
               } 
          if (se1text.value!="")
               {
    	       if(se1.value=="")
    		        {
                    alert("Please select search on1 option");
                    se1.style.bkColor =se1.style.backgroundColor;
                    se1.style.backgroundColor = bkColor;
                    se1.focus();
                    return false;
    		        }
             } 
          if (se2.value!="")
              {
        	  if(se2text.value=="")
   		           {
        		   alert("Please Enter the value of "+se2.value);
        		   se2text.style.bkColor =se2text.style.backgroundColor;
        		   se2text.style.backgroundColor = bkColor;
        		   se2text.focus();
                   return false;
   		           }
              } 
          if (se2text.value!="")
              {
    	      if(se2.value=="")
		           {
    	    	   alert("Please select search on2 option");
    		       se2.style.bkColor =se2.style.backgroundColor;
    		       se2.style.backgroundColor = bkColor;
    		       se2.focus();
                   return false;
		           }
          } 
          if ((datefrom.value==null)||(datefrom.value==""))
                {
                alert("Please Select the From Date!");
                datefrom.style.bkColor =datefrom.style.backgroundColor;
                datefrom.style.backgroundColor = bkColor;
                datefrom.focus();
                return false;
                } 
          if ((dateto.value==null)||(dateto.value==""))
                {
                alert("Please Select the To Date!");
                dateto.style.bkColor =dateto.style.backgroundColor;
                dateto.style.backgroundColor = bkColor;
                dateto.focus();
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
          
        if (mail11.value=="" && mail112.value=="")
                {
                alert("Reporting officer dosenot exist...");
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
         
         
         
    function clearfiled()
          {
    	   //  empid,full_name,depart,branch,designation,reporting_officer,empmailid,emp_mob,requestBy,linc_branh, se1,se1text,se2,se2text,date_time,date_time1,remarks
           // mail11, mail1,  empid1, emp, desg, mail, levelno      
    	 var empid=document.form.empid;
    	 empid.value="";
   	     var fn=document.form.full_name;
   	     fn.value="";
     	 var roff=document.form.reporting_officer;
     	 roff.value="";
     	var depart=document.form.depart;
     	depart.value="";
     	var branch=document.form.branch;
     	branch.value="";
     	var designation=document.form.designation;
     	designation.value="";
     	var empmailid=document.form.empmailid;
     	empmailid.value="";
     	var emp_mob=document.form.emp_mob;
     	emp_mob.value="";
     	document.getElementById("se1").selectedIndex = "0";
     	document.getElementById("se2").selectedIndex = "0";
     	 var dbName=document.form.dbName;
   	     dbName.value="";
   	     var se1=document.form.se1;
   	     var se1text=document.form.se1text;
   	     se1text.value="";
     	 var se2=document.form.se2;
   	     var se2text=document.form.se2text;
   	     se2text.value="";
   	     var datefrom=document.form.date_time;
         datefrom.value="";
   	     var dateto = document.form.date_time1;
   	     dateto.value="";
   	     var remarks=document.form.remarks;
   	     remarks.value="";
   	     var mail=document.form.mail;
   	     mail.value="";
   	     var desg1=document.form.desg;
   	     desg1.value="";
     	 var emp=document.form.emp;
     	 emp.value="";
     	 var empid1=document.form.empid1;
     	 empid1.value="";
   	     var levelno=document.form.levelno;
   	     levelno.value="";
   	     var mail11=document.form.mail11;
   	     mail11.value="";
   	     var mail1=document.form.mail1;
   	     mail1.value="";
   	     document.getElementById("All").checked = false;
   	  document.getElementById("one").checked = false;
   	document.getElementById("two").checked = false;
   	document.getElementById("three").checked = false;
   	document.getElementById("four").checked = false;
   	document.getElementById("five").checked = false;
   	document.getElementById("six").checked = false;
   	document.getElementById("seven").checked = false;
   	document.getElementById("eight").checked = false;
   	document.getElementById("nine").checked = false;
   	document.getElementById("ten").checked = false;
   	document.getElementById("eleven").checked = false;
   	document.getElementById("twelve").checked = false;
   	document.getElementById("thirteen").checked = false;     
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
	msg2="Session__Time__Out__Login__Again";
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
function sync1()
{
//alert("Here......."+v);
document.getElementById("idnextapproverchecked").value= "1";
}

function showCheckboxes(id) 
{
//	alert(id);
var ids = ["one","two","three","four","five","six","seven","eight","nine","ten","eleven", "twelve","thirteen"];
var val = document.getElementById(id).value;
var i=0;
var totalBranch = "";
var all=document.getElementById("All").value;
if(document.getElementById("All").checked == true)
	 {
	 while(i<13)
	   {
	 totalBranch=totalBranch+","+document.getElementById(ids[i]).value;
	 i++;
	   } 
}
else
	 {
while(i<13)
	   {
	   if(document.getElementById(ids[i]).checked == true)
		   totalBranch=totalBranch+","+document.getElementById(ids[i]).value;
	   i++;
	   }
}
//alert("I came here 2 :"+totalBranch);
if(document.getElementById("All").checked == true)
	 {
     document.getElementById("iddbName").value="All_branch";
	 }
else
	 {
	 document.getElementById("iddbName").value=totalBranch;
	 }
}


</script>

<script>
$(document).ready(function(){
    $('.group1').on('change', function(){        
        if($('.group1:checked').length){
            $('.group').prop('disabled', true);
            $('.group').prop('checked', false);
            return;
        }
        $('.group').prop('disabled', false);
    });
    
    $('.group').on('change', function(){        
        if($('.group:checked').length){
            $('.group1').prop('disabled', true);
            $('.group1').prop('checked', false);
            return;
        }
        $('.group1').prop('disabled', false);
    });
});
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
                             document.getElementById("fname").value =  document.getElementById("p1").value;
                             document.getElementById("iddesg").value =  document.getElementById("p2").value;
                      		 document.getElementById("idbranch").value =  document.getElementById("p3").value;
                      		 document.getElementById("iddept").value =  document.getElementById("p4").value;
                      		 document.getElementById("rofficer").value =  document.getElementById("p5").value;
                      		 document.getElementById("idempmailid").value =  document.getElementById("p6").value;
                     		 document.getElementById("idemp_mob").value =  document.getElementById("p7").value;
                     		 document.getElementById("iddeptadminP").value =  document.getElementById("p8").value;
                     		 document.getElementById("iddeptadminP11").value =  document.getElementById("p9").value;
                     		 
                     		document.getElementById("iddeptadminP2").value =  document.getElementById("p10").value;
                   		    document.getElementById("iddeptadminP22").value =  document.getElementById("p11").value;
                    		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("fname").value = "";
                             document.getElementById("iddesg").value =""; 
      		                 document.getElementById("idbranch").value = "";
      		                 document.getElementById("iddept").value =  "";
      		                 document.getElementById("rofficer").value =  "";
      		                 document.getElementById("idemp_mob").value = "";
                   		     document.getElementById("idempmailid").value = "";
                   		     document.getElementById("iddeptadminP").value = "";
                   		     document.getElementById("iddeptadminP11").value = "";
                   		     
                   		     document.getElementById("iddeptadminP2").value = "";
               		         document.getElementById("iddeptadminP22").value = "";
                   		     document.getElementById("idrodesg").value="";
                	         document.getElementById("idroname").value="";
                	         document.getElementById("idromail").value="";
                	         document.getElementById("idempid1").value="";
                	         document.getElementById("idlevelno").value="";
                  	         }
                 } 
</script>
              
</head>
<body onload="clearfiled()">
<form action="CCDReportPageBack.jsp" method="post" name="form" >
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
    <table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	 <tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>APPLICATION FORM FOR CCD REPORTS</label>
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
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
<td>
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
<br />
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn11=null,cn6=null,cn5 = null;
Statement st1= null,st2=null,st3=null,st4=null,st11=null, st5 = null,st6=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs11=null,rs5 = null,rs6=null; 

try
  {
  %>	 
		
<table  width="895">
   
   <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Emp ID :<input type="hidden" name="idextend" value="" /></td>
     <td align="left"><input type="text" name="empid" value="" id="idempid"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"><font color="red"> <div id="mydiv2"></div></font></td>
     <td></td><td></td>
    
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
    <td style="text-align:left;"><input type="text" name="full_name" size="29" id="fname" maxlength="44" readonly/></td>
    <td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
    <td style="text-align: left;"><input type="text" name="depart" id="iddept" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="" /></td>
     <td style="text-align: left;"><input type="text" name="branch" id="idbranch" size="28" maxlength="44" readonly/>	</td>
     <td  style="text-align: right;"><font color=red>*</font>Designation :</td>
     <td style="text-align: left;"><input type="text" name="designation" id="iddesg" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
     <td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer" size="28" maxlength="44" readonly/></td>
     <td style="text-align: right;"><font color=red>*</font>Emails ID :</td>
	 <td style="text-align: left;"><input type="text" name="empmailid"	id="idempmailid" size="28" maxlength="44" readonly/></td>
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Mobile No :</td>
    <td style="text-align:left;"><input type="text" name="emp_mob" id="idemp_mob" maxlength="44" size="29"/ readonly></td>
    <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
    <td style="text-align:left;"><input type="text" name="requestBy" id="req" value='<%=Name%>' size="28" maxlength="44" readonly/></td>
  </tr>
 
 
</table>
<br />







<table id="it" width="895">
  
             <tr>
                <td align="left"><font color=red>*</font>Select Branch :</td>
                <td>
                <table width="100%">
                <tr>
                <td width="50%">
	               <input name="linc_branh" type="checkbox" id="All" onclick="showCheckboxes(this.id)" class="group1" value="All_branch" />ALL BRANCH<br>
                   <input name="linc_branh" type="checkbox" id="one" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Air_IMP" />BANGALORE_Air_IMP<br>
                   <input name="linc_branh" type="checkbox" id="two" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Icon"/>BANGALORE_Icon<br>
                   <input name="linc_branh" type="checkbox" id="three" onclick="showCheckboxes(this.id)" class="group" value="DELHI"/>DELHI<br>
                   <input name="linc_branh" type="checkbox" id="four" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Air_Imp"/>CHENNAI_Air_Imp<br>
                   <input name="linc_branh" type="checkbox" id="five" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Sea_Imp"/>CHENNAI_Sea_Imp<br>
                </td>
                <td width="50%">
                   <input name="linc_branh" type="checkbox" id="six" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Air"/>MUMBAI_Air<br>
                   <input name="linc_branh" type="checkbox" id="seven" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Sea"/>MUMBAI_Sea<br>
                   <input name="linc_branh" type="checkbox" id="eight" onclick="showCheckboxes(this.id)" class="group" value="AHMEDABAD"/>AHMEDABAD<br>
                   <input name="linc_branh" type="checkbox" id="nine" onclick="showCheckboxes(this.id)" class="group" value="KOLKATA"/>KOLKATA<br>
                   <input name="linc_branh" type="checkbox" id="ten" onclick="showCheckboxes(this.id)" class="group" value="COCHIN"/>COCHIN<br>
                   <input name="linc_branh" type="checkbox" id="eleven" onclick="showCheckboxes(this.id)" class="group" value="COIMBATORE"/>COIMBATORE<br>
                   <input name="linc_branh" type="checkbox" id="twelve" onclick="showCheckboxes(this.id)" class="group" value="HYDERABAD"/>HYDERABAD<br>
                   <input name="linc_branh" type="checkbox" id="thirteen" onclick="showCheckboxes(this.id)" class="group" value="PUNE"/>PUNE
              </td>
               <!-- <td width="50%">
	               <input name="linc_branh" type="checkbox" id="All" onclick="showCheckboxes(this.id)" class="group1" value="All_branch" />ALL BRANCH<br>
                   <input name="linc_branh" type="checkbox" id="one" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000054" />BANGALORE_Air_IMP<br>
                   <input name="linc_branh" type="checkbox" id="two" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000816"/>BANGALORE_Icon<br>
                   <input name="linc_branh" type="checkbox" id="three" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000860"/>DELHI<br>
                   <input name="linc_branh" type="checkbox" id="four" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000224"/>CHENNAI_Air_Imp<br>
                   <input name="linc_branh" type="checkbox" id="five" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000223"/>CHENNAI_Sea_Imp<br>
                   <input name="linc_branh" type="checkbox" id="thirteen" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000002234"/>PUNE
                </td>
                <td width="50%">
                   <input name="linc_branh" type="checkbox" id="six" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000485"/>MUMBAI_Air<br>
                   <input name="linc_branh" type="checkbox" id="seven" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000628"/>MUMBAI_Sea<br>
                   <input name="linc_branh" type="checkbox" id="eight" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000002340"/>AHMEDABAD<br>
                   <input name="linc_branh" type="checkbox" id="nine" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000000875"/>KOLKATA<br>
                   <input name="linc_branh" type="checkbox" id="ten" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000002115"/>COCHIN<br>
                   <input name="linc_branh" type="checkbox" id="eleven" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000002116"/>COIMBATORE<br>
                   <input name="linc_branh" type="checkbox" id="twelve" onclick="showCheckboxes(this.id)" class="group" value="VisualIMPEX_VI0000002114"/>HYDERABAD<br>
                   
              </td> -->
           
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
                        <option value="">Select</option>
                        <option value="IECode">IECODE NO</option>
                        <option value="JobNO">JOB NO</option>
                        <option value="ImpName">IMPORTER NAME</option>
                    </select>
                    <input type="text" name="se1text" id="se1text" value="" size=50></input>
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
                        <option value="">Select</option>
                        <option value="ProDesc">PRODUCT DESCRIPTION</option>
                        <option value="CTHNo">CTH NO</option>
                    </select>
                    <input type="text" name="se2text" id="se2text" value="" size=50></input>
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
                     From :<input type="text" name="date_time" maxlength="99" id="iddate_time" class="date_time" value="" size=15 />
                     To :<input type="text" name="date_time1" maxlength="99" id="iddate_time1" class="date_time1" value="" size=15 />
                 </td>
            </tr>
         <tr>
      <td align="left"><font color=red>*</font>Remarks  :</td>
      <td><textarea name="remarks" rows="3" cols="124" id="ta" maxlength="400" title="Remarks 400 characters"></textarea></td>
  </tr>
</table>

    <b><font color=red>*</font>Send To RO :</b>
	<br />
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
 
          
        <tr> 
           <td> 
              <input align="left" type="radio" value="" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
              <input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP" value="" size="50"/>
   	       </td>
   	        <td> 
              <input align="left" type="radio" value="" id="iddeptadminP23" onclick="sync(iddeptadminP2.value);"/>
              <input type="text" name="mail112" id="iddeptadminP22" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP2" value="" size="50"/>
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
            <input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate(); " />
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