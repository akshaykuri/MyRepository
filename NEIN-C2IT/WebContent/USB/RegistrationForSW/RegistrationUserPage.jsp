<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
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

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>USB</title>
	<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
	<!-- <script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->
		<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<!-- Help Page pop up starts  -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	 -->
	<script language="javascript"   type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
	<script language="javascript"   type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
     <script language="javascript"   type="text/javascript" src="../../js/onSubmitWait.js"></script>
	<!-- Help Page pop up ends -->
<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>
<style type="text/css">
input:focus {
	background-color: white;
}
</style>

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

<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
        	  var w=document.form.branch;
        	  var dpt=document.form.depart;
        	  var fn=document.form.full_name;
        	  var rm=document.form.regis_mail;//regis_mail
        	  var ec=document.form.emp_code;
        	  var desg=document.form.designation;
        	 // var roff=document.form.Software;
        	  var rb = document.form.requestBy;
        	 var req=document.form.requestOption;
        	 
         	  var accessFor = document.form.accessFor;
     	       var dscNo=document.form.dscNo;
        	 
        	  var l=document.form.remarks;
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
       	      if ((ec.value==null)||(ec.value=="")){
                  alert("Please Enter Employee Code!");
                  ec.style.bkColor = ec.style.backgroundColor;
                  ec.style.backgroundColor = bkColor;
                  ec.focus()
                  return false
                  }
        	if ((fn.value==null)||(fn.value=="")){
         	     fn.style.bkColor = fn.style.backgroundColor;
                 fn.style.backgroundColor = bkColor;
                 alert("Employee details should must be in HRMS app. !");
                 fn.focus()
                 return false
                 }
            
            if ((w.value==null)||(w.value=="")||(w.value=="Null")){
            	 alert("Employee details should must be in HRMS app. !");
            w.style.bkColor = w.style.backgroundColor;
            w.style.backgroundColor = bkColor;
            w.focus();
            return false
            }
            
           
            
              if ((rm.value==null)||(rm.value=="")){
            	  alert("Employee details should must be in HRMS app. !");
                    rm.style.bkColor = rm.style.backgroundColor;
                    rm.style.backgroundColor = bkColor;
                    fn.style.backgroundColor = bkColor2;
                    rm.focus()
                    return false
                    }
                    if (checkAddress(rm.value)==false){
                    	rm.value=""
                    alert("Invalid Name!");
                    	rm.focus()
                    return false;
                    }
                    if ((desg.value==null)||(desg.value=="")||(desg.value=="Null")){
                    	 alert("Employee details should must be in HRMS app. !");
                        desg.style.bkColor = desg.style.backgroundColor;
                        desg.style.backgroundColor = bkColor;
                        rm.style.backgroundColor = bkColor2;
                        desg.focus()
                        return false
                        }
                        if (checkAddress(desg.value)==false){
                        	desg.value=""
                        alert("Invalid Designation!");
                        	desg.focus()
                        return false;
                        } 
                       
                           
                                if ((rb.value==null)||(rb.value=="")){
                                    alert("Please Enter Requested By whom!");
                                    rb.style.bkColor = rb.style.backgroundColor;
                                    rb.style.backgroundColor = bkColor;
                                    ec.style.backgroundColor = bkColor2;
                                    rb.focus()
                                    return false
                                    }
                                    if (checkAddress(rb.value)==false){
                                    	rb.value=""
                                    alert("Invalid Request!");
                                    	rb.focus()
                                    return false;
                                    }
                    
                       
                            
                          if ((req[0].checked == false ) && (req[1].checked == false ) )
                                {
                                alert("Select Status Of Request! New/Delete");
                                req[0].focus();
                                return false;
                                } 
                          
                          if ((accessFor.value==null)||(accessFor.value=="")){
                              alert("Please Select Access for!");
                            
                              return false	
                              } 
                          
                          if ((dscNo.value==null)||(dscNo.value=="")){
                              alert("Please enter USB Details..");
                          
                              return false	
                              } 
                          
                          
                          
                          
                          
                            if ((l.value==null)||(l.value=="")){
                                alert("Enter Remarks!");
                                l.style.bkColor = l.style.backgroundColor;
                                l.style.backgroundColor = bkColor;
                                rb.style.backgroundColor = bkColor2;
                                l.focus();
                                return false	
                                } 
                          if (mail11.value=="" && mail112.value=="")
                            {
                            alert("Reporting officer dosenot exist...");
                            return false;
                            }  
                      if (empid1.value==""||emp.value==""||desg1.value==""||mail.value==""||levelno.value=="")
                            {
                            alert("Please select the  approver name ...");
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
	msg2="Session__Time__Out__ Login__Again";
	response.sendRedirect("../adminlinkHR.jsp?msg="+msg2);
}
%>
	
             
  <script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) {
	//var x=document.getElementById("idempId").value;
    //alert(x);
    
   // alert("here");
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    
   /*  var l=x.toString().length();
  alert(l); */
    return true;
    }
</script>
<script type="text/javascript">  

function callFun(val1)
    { 
	//alert(val1);
    var ecode=document.getElementById("ecode").value;
    //alert(ecode);
   if(val1=="PenDrive")   
        {
	    document.getElementById("dscNo").value="";
        }   
   else if(val1=="DSC_CHA")   
	   {
	   getDSCNo(val1,ecode);
	   } 
   else 
	   {
	   getDSCNo(val1,ecode) ;
	   } 
	   
	   
   }
</script>  
   <script type="text/javascript">  
function getDSCNo(v,ecode)  
		{ 
      // alert("type :"+v);
	//	alert("empid :"+ecode);
		
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
         var url="getDSCNo.jsp";  
	    url +="?dsctype="+v;
	    url +="&empcode="+ecode;
	    xmlHttp.onreadystatechange = getInfo1;  
	    xmlHttp.open("GET", url, true);   
	    xmlHttp.send(null);    
		
        }  

		function getInfo1()
		  {     
		  var str2=xmlHttp.responseText;
		  if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		                 { 
		                  //alert("here");//idname,iduid,idpass,idnmail
		                  document.getElementById("resultFromAjax21").innerHTML = str2;
		                  document.getElementById("dscNo").value =  document.getElementById("dscNo1").value;
		                  }
		              else
		            	   {
		            	  document.getElementById("dscNo").value = "";
		            	   }
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
                             document.getElementById("resultFromAjax2").innerHTML = str2;//full_name,branch,depart,designation,sow
                             document.getElementById("full_name").value =  document.getElementById("p1").value;
                             document.getElementById("designation").value =  document.getElementById("p2").value;
                      		 document.getElementById("branch").value =  document.getElementById("p3").value;
                      		 document.getElementById("depart").value =  document.getElementById("p4").value;
                      		 document.getElementById("sow").value =  document.getElementById("p6").value;
                      		 document.getElementById("iddeptadminP").value =  document.getElementById("p8").value;
                    		 document.getElementById("iddeptadminP11").value =  document.getElementById("p9").value;
                    		 document.getElementById("iddeptadminP2").value =  document.getElementById("p10").value;
                    		 document.getElementById("iddeptadminP22").value =  document.getElementById("p11").value;
                   		
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("full_name").value = "";
                             document.getElementById("designation").value =""; 
      		                 document.getElementById("branch").value = "";
      		                 document.getElementById("depart").value =  "";
      		                 document.getElementById("sow").value =  "";
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
   <script type="text/javascript"> //  body onloade()
function cleartext()
    {
    var checkboxes = document.getElementById("checkboxes");
    checkboxes.style.display = "none";
    }
</script>              
</head>

<body onload="cleartext()">
<form action="RegistrationUserPageBack.jsp" method="post" name="form">
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
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>
		 USB ACCESS REQUEST FORM</label>
		</b></font></center> 
		</td>
		</tr>
<tr style="visibility: hidden;display: none;"><td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
		
	</tr>
		<tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<td width="165"><%= po_date.format(new java.util.Date())%></td>
		</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td>
<!-- <br />
<br />
<center>
<label><font color="black"><u><b>IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</b></u></font></label> <br />


</center>
	 <br /> -->
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
	 <br />
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null;
Statement st1= null,st2=null,st3=null,st4=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null;Connection cn5 = null,cn6=null,cn7=null; 
Statement st5 = null,st6=null,st7=null; 
ResultSet rs5 = null,rs6=null,rs7=null; 
try{
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

cn5 = con.getConnection2();
st5=cn5.createStatement();
rs5 = st5.executeQuery("select app_name from software_owner_master ORDER BY app_name Asc"); 

String new_id = null;
int id=0;
String id2=null;
cn3 = con.getConnection2();
st3=cn3.createStatement();
//rs3 = st3.executeQuery("SELECT max(idextend),substr(form1_it_clearance.form1_no,18,4),substr(form1_it_clearance.form1_no,1,17) From form1_it_clearance WHERE '"+b_no+"'=substr(form1_it_clearance.form1_no,15,2) GROUP BY form1_no");
rs3 = st3.executeQuery("SELECT max(idextend) FROM form17_usb_access WHERE form10_no IN(SELECT form10_no FROM form17_usb_access LEFT JOIN branch_master b ON(substr(form10_no,10,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form10_no)");
//rs3 = st3.executeQuery("SELECT MAX(idextend) FROM mr_master WHERE mr_id IN(SELECT mr_id FROM mr_master Left Join branch_master b ON (substr(mr_id,9,2)=b.b_no)  WHERE '"+city_no+"'=b.b_no GROUP BY idextend)");
/* while ( rs_id.next() )
{   */  
	 if(rs3.next()){
	
	try
	{
		id=rs3.getInt(1);
		System.out.println("ID :"+id);
		if(id==0)
 			id=1;
		else
			id++; 
		System.out.println("ID VALUE "+id);
		if(id2==null)
 			id2="NEIN/USB/"+b_no+"-";
		//id2= rs_id.getString(3);
		//System.out.println("ID2 VALUE "+id2);
	            
			//System.out.println("Gen id "  +rs_id.getInt(1));
			//new_id = "" +String.valueOf(id);
			new_id = id2+String.valueOf(id);
			//System.out.println("MR HO "  +new_id);
		
	}
	catch(SQLException ex)
	{
		  System.out.println(ex.toString());
		 new_id = "NEIN/USB/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
%>	 
		
<table  width="895">
<tr >
	<td bgcolor="grey" style="text-align: right;width:23%;">
	<input name="form2_no" readonly="readonly" value="<%=new_id%>" size="25" />
	</td>
	</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="10" maxlength="14" onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"/><font color="red"> <div id="mydiv2"></div></font></td>

<td  style="text-align: right;"><font color=red>*</font>Full Name :</td>

<td style="text-align: left;"><input type="text" size="29" name="full_name"  id="full_name" maxlength="44" readonly/>
				

				
</tr>	
	
<tr>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="<%=id%>" /></td>

<td style="text-align: left;"><input type="text" size="29" name="branch"  id="branch" maxlength="44" readonly/>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>

<td style="text-align: left;"><input type="text" size="29" name="depart"  id="depart" maxlength="44" readonly/>

</tr>

<tr>
<td  style="text-align: right;"><font color=red>*</font>Designation :</td>

<td style="text-align: left;"><input type="text" size="29" name="designation"  id="designation" maxlength="44" readonly/>					
<td style="text-align: right;"><font color=red>*</font>Mail ID :</td>
<td style="text-align: left;"><input type="text" size="29" name="regis_mail" value="" id="sow" maxlength="44" readonly/>	</td>					

</tr>
<tr>

<td style="text-align: right;"><font color=red>*</font>Requested By :</td>
<td style="text-align:left;"><input type="text" name="requestBy" id="req" size="29" maxlength="44" value="<%=Name%>" readonly/></td>
<td align="right"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> 
     <input style="" type ="radio" name = "requestOption" value ="New" id=""/>Enable
    <input type ="radio" name = "requestOption" value ="Delete" />Disable
    </td>
    
</tr>

  <tr>
		<td  style="text-align: right;"><font color=red>*</font>Access For :</td>
		<td style="text-align: left;"> 
		    <select name="accessFor" id="accessFor" onchange="callFun(this.value);">
		          <option value="">Select</option>
		          <option value="PenDrive">PenDrive</option>
		          <option value="DSC_CHA">DSC-CHA</option>
		          <option value="DSC_OTHER">DSC-OTHER</option>
		    </select>
		</td>
		<td style="text-align: right;"><font color=red>*</font>USB Details:</td>
		<td style="text-align: left;"><input type="text" size="29" name="dscNo" value="" id="dscNo" maxlength="44" />	</td>		
  </tr>


<!-- <tr>
<td align="right"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> 
     <input style="" type ="radio" name = "requestOption" value ="New" id=""/>New
     <input type ="radio" name = "requestOption" value ="Delete" />Delete
     <input type ="radio" name = "requestOption" value ="Change" />Change
     <input type ="radio" name = "requestOption" value ="Reset" />Reset</td>
   
</tr> -->
<!-- <tr>
<td style="text-align: right;width:23%;">Reason</td>
<td colspan="3" style="text-align:left;width:33%;"><textarea rows="2" cols="102" ></textarea></td>
</tr> -->
</table>

<br />
<table id="it" width="895">
<tr><td id="ita"><font color=red>*</font>Remarks/Reason</td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199"></textarea></td></tr>
</table>

<b><font color=red>*</font>Send To RO:</b>
	<br />
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
 
          
        <tr> 
           <td> 
              <input align="left" type="radio" value="" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
              <input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP" value="" size="50"/>
   	       </td>
   	     <!--   <td> 
              <input align="left" type="radio" value="" id="iddeptadminP23" onclick="sync(iddeptadminP2.value);"/>
              <input type="text" name="mail112" id="iddeptadminP22" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP2" value="" size="50"/>
   	       </td> -->
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
 
   
      <td style="size:1"> <div id="formsubmitbutton"> <input  type="submit" value="SEND" name="save1" id="save1" onclick="return (validate() && ButtonClicked())" />
        </div>
    <div id="buttonreplacement" style="display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
      
      </td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	  <!-- <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.history.go(-1); return false;"/> </td> -->
   	     	           <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='../../adminHR.jsp?msg=1'"/> </td>
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
	DbUtil.closeDBResources(rs6,st6,cn6);
	DbUtil.closeDBResources(rs7,st7,cn7);
  }
	%>
</center>
	<br /><br /><br />
	
</div>
<div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />


<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR Admin (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>RO/SRO</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>Branch Head</label>
</br>
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>VP</label>
</br>
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>SR.MANAGER IT(HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>SOFTWARE OWNER</label>
<br />

<br />
<br />
</div>
</form>	
<div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax21" style="display:none;">
        
       </div>
</body>

</html>