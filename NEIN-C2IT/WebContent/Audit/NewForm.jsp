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
	<title>New Form</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<!-- <script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->
		<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<!-- Help Page pop up starts  -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	 -->
	<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script language="javascript"   type="text/javascript" src="../js/jquery-1.6.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
     <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
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
	<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
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
	 /*  alert(part5); */
	  if(val!="")
		  {
		  document.getElementById("idempid1").value=part1;
		  document.getElementById("idroname").value=part2;
	  	  document.getElementById("idrodesg").value=part3;
		  document.getElementById("idromail").value=part4;
		  document.getElementById("Hlevelno").value=part5;
		  }
	  else
		  {
		  document.getElementById("idrodesg").value="";
	      document.getElementById("idroname").value="";
	      document.getElementById("idromail").value="";
	      document.getElementById("idempid1").value="";
	      document.getElementById("Hlevelno").value="";
		  }
    }
</script>
<script language="javascript"   type="text/javascript" src="../../../js/DynamicMR.js"></script>		<script>
		var id =0;
		
		$(document).ready(function() {
			
			
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
			//alert("Alert");
				var master = $(this).parents("table.dynatable");
				
				// Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "")
				prot.find(".id").attr("value", id);
/* 				prot.find(".incText").attr("id","iditemName"+id); 
				
			//	prot.find(".incText").attr("id","iditemName"+id); 
				prot.find(".incHead").attr("id","idHead"+id); 
				prot.find(".incSelect").attr("id",id);
			//	prot.find(".incSel").attr("id",id); 
				
				prot.find(".incSel").attr("id",id); 
				prot.find(".incRate").attr("id","rate"+id); */
				/* prot.find(".incQuantity").attr("id","quantity"+id); 
				prot.find(".incTotal").attr("id","total"+id); */
				master.find("tbody").append(prot);
			});
			
			// Remove button functionality
			$("table.dynatable button.remove").live("click", function() {
				$(this).closest("tr").remove();
				id--;
			});
			
		});



</script>

<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
function validate(){
var ec=document.form.emp_code;
var type=document.form.requestOption;
var type1=document.form.requestOption1;
var Hname=document.form.Hname;
var Hbranch=document.form.Hbranch;
var newName=document.form.newName;
var newDept=document.form.newDepart;
var newDesc=document.getElementById("newDesc");
var chaName=document.form.chaName;
var chaModule=document.form.chaModule;
var chaDesc=document.form.chaDesc;
var mgmt=document.form.Management;
var Hname=document.form.Hname;
var Hsname=document.form.Hsname;
var Hbranch=document.form.Hbranch;
var hDesc=document.form.hDesc;
var hPatchange=document.form.HManagement;
var Nfile=document.form.Nfile;
var Cfile=document.form.Cfile;
var Hfile=document.form.Hfile;
var empid1=document.form.empid1;
var levelno=document.form.levelno;
var mail11=document.form.mail11;
var mail112=document.form.mail112;
var mail1=document.form.mail1;
var d1=document.form.remarks;




if ((ec.value==null)||(ec.value=="")){
	alert("Please Enter Employee Code!");
	ec.focus();
    return false;
}
if((type[0].checked==false)&&(type[1].checked==false)){
	alert("Please Select Type! Software/Hardware");
	return false;
}
if(type[0].checked==true){
	if((type1[0].checked==false)&&(type1[1].checked==false)){
		alert("Please Select New/Changes");
		return false;
	}
}
if(type1[0].checked==true){
	if(newName.value==null || newName.value==""){
		alert("Please Enter Application Name");
		return false;
	}
	
	
	if(newDept.value==null || newDept.value==""){
		alert("Please Select Department Name");
		return false;
	}
	if(newDesc.value==null || newDesc.value==""){
		alert("Please Provide Information About Application");
		return false;
	}
	var frm=document.forms[0],flds=[frm['file']];
	if(id==0)
		   {
		   alert("Please Click ADD button to Insert New Details");
		   return false;
		   }
	for (var z0=1;z0<flds[0].length;z0++)
	{
		if(flds[0][z0].files.length== null || flds[0][z0].files.length=="" || flds[0][z0].value.length == 1 )
		 {
			
		    
		     alert("Select the file for the row : "+[z0]);
		     flds[0][z0].focus();
		     return false;
	}
		
	}
	if (d1.value==null||d1.value=="")
	{
	alert("Enter Remarks !");
	d1.focus();
	return false;
	}
}
if(type1[1].checked==true){
	if(chaName.value==null || chaName.value==""){
		alert("Please Select Application Name");
		return false;
	}
	
	if(chaModule.value==null || chaModule.value==""){
		alert("Please Enter Module Name");
		return false;
	}
	if(chaDesc.value==null || chaDesc.value==""){
		alert("Please Provide Information About Changes");
		return false;
	}
	if(mgmt.value==null || mgmt.value==""){
		alert("Please Select pathch/Change Management");
		return false;
	}
	var frm=document.forms[0],flds=[frm['file']];
	if(id==0)
		   {
		   alert("Please Click ADD button to Insert New Details");
		   return false;
		   }
	for (var z0=1;z0<flds[0].length;z0++)
	{
		if(flds[0][z0].files.length== null || flds[0][z0].files.length=="" || flds[0][z0].value.length == 1 )
		 {
			
		    
		     alert("Select the file for the row : "+[z0]);
		     flds[0][z0].focus();
		     return false;
	}
		
	}
	if (d1.value==null||d1.value=="")
	{
	alert("Enter Remarks !");
	d1.focus();
	return false;
	}
	
	
}

if(type[1].checked==true){
	if(Hbranch.value==null || Hbranch.value==""){
		alert("Please Select Branch Name");
		return false;
	}
	if(Hname.value==null || Hname.value==""){
		alert("Please Select Hardware Category");
		return false;
	}
	
	if(Hsname.value==null || Hsname.value==""){
		alert("Please Select Hardware Sub_Category");
		return false;
	}
	
	if(hPatchange.value==null || hPatchange.value==""){
		alert("Please Select Patch or Change Management");
		return false;
	}
	if(hDesc.value==null || hDesc.value==""){
		alert("Please Provide Information About Changes");
		return false;
	}
	
	var frm=document.forms[0],flds=[frm['file']];
	if(id==0)
		   {
		   alert("Please Click ADD button to Insert New Details");
		   return false;
		   }
	for (var z0=1;z0<flds[0].length;z0++)
	{
		if(flds[0][z0].files.length== null || flds[0][z0].files.length=="" || flds[0][z0].value.length == 1 )
		 {
			
		    
		     alert("Select the file for the row : "+[z0]);
		     flds[0][z0].focus();
		     return false;
	}
		
	}
	if (d1.value==null||d1.value=="")
	{
	alert("Enter Remarks !");
	d1.focus();
	return false;
	}
	if (empid1.value==""||emp.value==""||desg1.value==""||mail.value==""||levelno.value=="")
    {
    alert("Please select the  approver name ...");
    return false;
    } 
	
}

else{
	return true;
}
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
                      		/*  document.getElementById("iddeptadminP").value =  document.getElementById("p8").value;
                    		 document.getElementById("iddeptadminP11").value =  document.getElementById("p9").value;
                    		 document.getElementById("iddeptadminP2").value =  document.getElementById("p10").value;
                    		 document.getElementById("iddeptadminP22").value =  document.getElementById("p11").value; */
                   		
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("full_name").value = "";
                             document.getElementById("designation").value =""; 
      		                 document.getElementById("branch").value = "";
      		                 document.getElementById("depart").value =  "";
      		                 document.getElementById("sow").value =  "";
      		                 /* document.getElementById("iddeptadminP").value = "";
                 		     document.getElementById("iddeptadminP11").value = "";
                 		     
                 		     document.getElementById("iddeptadminP2").value = "";
                		     document.getElementById("iddeptadminP22").value = "";
                 		     document.getElementById("idrodesg").value="";
              	             document.getElementById("idroname").value="";
              	             document.getElementById("idromail").value="";
              	             document.getElementById("idempid1").value="";
              	             document.getElementById("idlevelno").value=""; */
      		                 }
                 }
  
function Version(v){
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
var url="Version.jsp";  
  url +="?aname=" +v;
  xmlHttp.onreadystatechange =getVersion;  
  xmlHttp.open("GET", url, true);   
  xmlHttp.send(null);    
}  
function getVersion()
{     
var str3=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
              {
	document.getElementById("resultFromAjax4").innerHTML = str3;
    document.getElementById("CSCvers").value =  document.getElementById("p1").value;
	
              }else{
            	  document.getElementById("resultFromAjax3").innerHTML =str3;
            	    document.getElementById("CSCvers").value = "";
            	  
              }
	
}
 


	 
function clearsubcategory(){
		 document.getElementById("Hname").value="";
		 
	 }
  
  
  
  
  
  
  
 function subcategory()  
  {
	 
	var hb=document.form.Hbranch.value;
  	var hn=document.form.Hname.value;
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
   var url="HardwareSubType.jsp?t="+hb+ "&k="+hn;  
	    
	    /* alert(url); */
	    xmlHttp.onreadystatechange = getsubcategory;  
	    xmlHttp.open("GET", url, true);   
	    xmlHttp.send(null);    
    }
  function getsubcategory()
  {     
 
  if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                 {
	  /* alert(xmlHttp.responseText); */
	  document.getElementById("hardsubcat").innerHTML=xmlHttp.responseText; 
                 }
                 } 
   
  
</script>                      
   <script type="text/javascript"> //  body onloade()
   
   
function cleartext()
    {
    var checkboxes = document.getElementById("checkboxes");
    checkboxes.style.display = "none";
    }
function soft(val){
	document.getElementById("ForSoft").style.display="block";
	document.getElementById("softmail").style.display="block";
	document.getElementById("hardmail").style.display="none";
	document.getElementById("changsoft").style.display="none";
	document.getElementById("Hard").style.display="none";
	document.getElementById("newsoft").style.display="none";
	document.getElementById("files").style.display="none";
	
}
function newsoft(val){
	document.getElementById("newsoft").style.display="block";
	document.getElementById("changsoft").style.display="none";
	document.getElementById("Hard").style.display="none";
	document.getElementById("files").style.display="block";
	document.getElementById("softmail").style.display="block";
	document.getElementById("hardmail").style.display="none";
}
function changsoft(val){
	document.getElementById("changsoft").style.display="block";
	document.getElementById("newsoft").style.display="none";
	document.getElementById("Hard").style.display="none";
	document.getElementById("files").style.display="block";
	document.getElementById("softmail").style.display="block";
	document.getElementById("hardmail").style.display="none";
}
function Hard(val){
	var ab=document.getElementById("New");
	ab.checked=false;
	var bb=document.getElementById("Changes");
	bb.checked=false;
	document.getElementById("Hard").style.display="block";
	document.getElementById("newsoft").style.display="none";
	document.getElementById("changsoft").style.display="none"; 
	document.getElementById("ForSoft").style.display="none";
	document.getElementById("files").style.display="block";
	document.getElementById("hardmail").style.display="block";
	document.getElementById("softmail").style.display="none";
}
</script>              
</head>

<body onload="cleartext()">
<form action="Newformback.jsp" method="post" enctype="multipart/form-data" name="form">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
int h=0,s=0;%>
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
		NEW FORM</label>
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
<table width="907" border="1"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
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
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn10=null;
Statement st1= null,st2=null,st3=null,st4=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null;Connection cn5 = null,cn6=null,cn7=null; 
Statement st5 = null,st6=null,st7=null,st10=null; 
ResultSet rs5 = null,rs6=null,rs7=null,rs10=null; 
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


cn6=con.getConnection2();
st6=cn6.createStatement();
rs6=st6.executeQuery("SELECT * FROM `prob_master` WHERE department NOT IN('SOFTWARE DEVELOPMENT')");

cn7=con.getConnection2();
st7=cn7.createStatement();
rs7=st7.executeQuery("SELECT Category FROM `hardware_master`");





String new_id = null;
int id=0;
String id2=null;
cn3 = con.getConnection2();
st3=cn3.createStatement();
//rs3 = st3.executeQuery("SELECT max(idextend),substr(form1_it_clearance.form1_no,18,4),substr(form1_it_clearance.form1_no,1,17) From form1_it_clearance WHERE '"+b_no+"'=substr(form1_it_clearance.form1_no,15,2) GROUP BY form1_no");
rs3 = st3.executeQuery("SELECT max(idextend) FROM Audit_form WHERE form_no IN(SELECT form_no FROM Audit_form LEFT JOIN branch_master b ON(substr(form_no,10,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form_no)");
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
 			id2="NEIN/NEW/"+b_no+"-";
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
		 new_id = "NEIN/NEW/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
%>	 
		
<table width="895">
<tr >
	<td bgcolor="grey" style="text-align: right;width:23%;">
	<input name="form_no" readonly="readonly" value="<%=new_id%>" size="25" />
	</td>
	</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="10" maxlength="14" onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"/><font color="red"> <div id="mydiv2"></div></font></td>

<td  style="text-align: right;"><font color=red>*</font>Full Name :</td>

<td style="text-align: left;"><input type="text" size="29" name="full_name"  id="full_name" maxlength="44" readonly/></td>
				

				
</tr>	
	
<tr>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="<%=id%>" /></td>

<td style="text-align: left;"><input type="text" size="29" name="branch"  id="branch" maxlength="44" readonly/></td>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>

<td style="text-align: left;"><input type="text" size="29" name="depart"  id="depart" maxlength="44" readonly/></td>

</tr>

<tr>
<td  style="text-align: right;"><font color=red>*</font>Designation :</td>

<td style="text-align: left;"><input type="text" size="29" name="designation"  id="designation" maxlength="44" readonly/></td>					
<td style="text-align: right;"><font color=red>*</font>Mail ID :</td>
<td style="text-align: left;"><input type="text" size="29" name="regis_mail" value="" id="sow" maxlength="44" readonly/>	</td>					

</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Type:</td>
<td style="font-style:italic;width:23%;" colspan="3"> 
     <input style="" type ="radio" name = "requestOption" value ="Software" id="" onclick="soft(this.value)"/>Software
    <input type ="radio" name = "requestOption" value ="Hardware" onclick="Hard(this.value)" />Hardware
    </td>
    
</tr>
</table>
<div style="display:none;" id="ForSoft">

<table  width="895">
<tr align="center">
<td style="font-style:italic;width:23%;" colspan="3"> 
     <input style="" type ="radio" name = "requestOption1" value ="New" id="New" onclick="newsoft(this.value)"/>New
    <input type ="radio" name = "requestOption1" value ="Changes" id="Changes" onclick="changsoft(this.value)" />Changes
    </td>
</tr>
</table>
</div>
<div  style="display:none;" id="newsoft">
<table  width="895">
<tr>
<td  style="text-align: right;width: 23%;"><font color="red">*</font>Application Name:</td>
<td style="text-align: left;width: 27%;"><input type="text" size="29" name="newName"  id="newName" maxlength="100"/></td>
<td style="text-align: right;width: 23%;"><font color="red">*</font>Department:</td>
<td style="text-align: left;width: 27%;"><select name="newDepart">
<option value="">SELECT</option>
<%while(rs2.next()){ %> 
										        
										         <option ><%=rs2.getString(1)%> </option>
										        <%}%> 
										        </select>
</td>					
</tr>


<tr>
<td style="text-align: right;"><font color=red>*</font>Description</td>	
<td style="text-align: left;" colspan="3"><input type="text" size="29" name="newDesc"  id="newDesc" maxlength="250"/></td>
<!-- <td style="text-align: right;">Current Version</td>	
<td style="text-align: left;"><input type="text" size="29" name="NCvers"  id="newDesc" value="1.0" maxlength="50"/></td>
</tr>
<tr>
<td style="text-align: right;">Updated Version</td>	
<td style="text-align: left;"><input type="text" size="29" name="NUvers"  id="newDesc" maxlength="50"/></td>
</tr> -->
</table>
</div>
<div style="display:none;" id="changsoft">
<table  width="895" >
<tr>
<td  style="text-align: right;width: 23%;"><font color=red>*</font>Application Name</td>

<td style="text-align: left;width: 27%;"><select name="chaName" id="chaName" onchange="Version(this.value)" style="width: 100%;">
<option value="">SELECT</option>
<%while(rs5.next()){ %> 
										        
										         <option ><%=rs5.getString("app_name")%> </option>
										        <%}%> 
										        </select>

</td>					
<td style="text-align: right;width: 23%;"><font color=red>*</font>Module</td>	
<td style="text-align: left;width: 27%;"><input type="text" size="29" name="chaModule" id="newDesc" maxlength="50"/></td>
</tr>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Description</td>	
<td style="text-align: left;"><input type="text" size="29" name="chaDesc"  id="chaDesc" maxlength="250"/></td>
<td style="text-align: right;"><font color=red>*</font>Patch/Change Management</td>	
<td style="text-align: left;"><select name="Management" style="width: 100%;">
<option value="">SELECT</option>
<option value="Patch Management">Patch Management</option>
<option value="change Management">Change Management</option>
</select>
</td>
</tr>
<tr>
<td style="text-align: right;">Current Version</td>	
<td style="text-align: left;" colspan="3"><input type="text" size="29" name="CSCvers"  id="CSCvers" maxlength="50"/></td>
<!-- <td style="text-align: right;">Updated Version</td>	
<td colspan="3" style="text-align: left;"><input type="text" size="29" name="CSUvers"  id="newDesc" maxlength="50"/></td> -->
</tr>
</table>
</div>
<div style="display:none;" id="Hard">
<table  width="895" >
<tr>
<td style="text-align: right;width: 23%;"><font color=red>*</font>Branch</td>
<td style="text-align: left;width: 27%;"><select name="Hbranch" id="Hbranch" onchange="clearsubcategory()" style="width:100%;">
<option value="">SELECT</option>
<%while(rs1.next()){ %> 
										        
										         <option ><%=rs1.getString("b_name")%> </option>
										        <%}%> 
										        </select>
</td>
<td  style="text-align: right;width: 23%;"><font color=red>*</font>Hardware Category</td>
<td style="text-align: left;width: 27%;"><select name="Hname" id="Hname" onchange="subcategory()" style="width: 100%;">
<option value="">SELECT</option>
<%while(rs7.next()){ %> 
										        
										         <option ><%=rs7.getString(1)%> </option>
										        <%}%> 
										        </select>
</td>
</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Hardware Sub_Category</td>
<td style="text-align: left;"><div id="hardsubcat"><select name="Hsname" id="Hsname" style="width:100%;">
<option value="">SELECT</option>
</select>
</div>
</td>
<td style="text-align: right;"><font color=red>*</font>Patch/Change Management</td>	
<td style="text-align: left;"><select name="HManagement" style="width:100%;">
<option value="">SELECT</option>
<option value="Patch Management">Patch Management</option>
<option value="change Management">Change Management</option>
</select>
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Description</td>	
<td style="text-align: left;" colspan="3"><input type="text" size="29" name="hDesc"  id="hDesc" maxlength="250"/></td>

</tr>
<!-- <tr>
<td style="text-align: right;">Current Version</td>	
<td style="text-align: left;"><input type="text" size="29" name="HCvers"  id="newDesc" maxlength="50"/></td>
<td style="text-align: right;">Updated Version</td>	
<td style="text-align: left;"><input type="text" size="29" name="HUvers"  id="newDesc" maxlength="50"/></td>
</tr> -->
</table>
</div>
<div style="display:none;" id='files' >
<table class="dynatable" width="895" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
				    <td width="67" align="center"  height="21" ><button class="add" type='button'>Add</button></td>
				    <td width="77" align="center"  height="21" >Sl No</td>
				    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Attachments</td>	
				    </tr>
<tr class="prototype">
<td width="67" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>
<td width="77" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly"/></td>
<td width="67" align="center"><input type="file"  name="file" id="file"  /></td>
</tr>

 <tr style="visibility: hidden; display: none;">
  <td>
  
  </td>
  </tr>
  
</table>
</div>
<table id="it" width="895">
<tr><td id="ita"><font color=red>*</font>Remarks/Reason</td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199"></textarea></td></tr>
</table>
<div style="display:none;" id="softmail">
<b><font color="red">Mail Will Trigger To All Branches IT Person.</font></b>
<input type="hidden" name="ITlevelno" id="idlevelno" value="00" readonly/>
</div>
<div style="display:none;" id="hardmail">
<b><font color="red">*</font>Send To HO-IT:</b>
	<br />
	<%
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
     
	ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
    Class.forName(driver).newInstance();
    cn5 = DriverManager.getConnection(url+dbName,userName,password); 
    Connection connhrms = null;
    String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
    connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);
    Statement nstmt = connhrms.createStatement();  
    String maxlevel="";
	rs5 = st5.executeQuery("SELECT * FROM `branch_it` where Type='Manager'");
    if(rs5.next())
    {
     ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString("empid") + "' ) AND u.employee_status = 'yes' ");
     if(nrs.next())
            { 
  	         nuname=nrs.getString(1);
             ndesg=nrs.getString(2);
             nmailid=nrs.getString(6);
            }
     napproval=rs5.getString(3)+","+nuname+","+ndesg+","+nmailid+",0";
     napproval1=nuname+" ("+nmailid+")";
     System.out.println("Next approval :"+napproval);  
     }%>
<table width="100%"  cellspacing="0" cellpadding="0" align="left">  
 
          
        <tr> 
           <td> 
              <input align="left" type="radio" value="<%=napproval%>"  id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
              <input type="text" name="mail11" id="iddeptadminP11"value="<%=napproval1%>" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP" value="<%=napproval%>" size="50"/>
   	       </td>
       </tr>
        <tr>                           <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="Hlevelno" value="" readonly/>
      </tr>
      
                      
</table> 
</div>
</br>
</center>                                                                   
   </td>
		
	</tr>
</table>
 <table style="margin-left: auto;margin-right: auto;"><tr>
 
   
      <td style="size:1"> <div id="formsubmitbutton"> <input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate()" />
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
   	     	           <td style="size:1">&nbsp;&nbsp;<input type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp?msg=1'"/> </td>
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
</form>	
<div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax21" style="display:none;">
        
       </div>
       
        <div id="resultFromAjax3" style="display:none;">
        
       </div>
       
        <div id="resultFromAjax4" style="display:none;">
        
       </div>
</body>

</html>