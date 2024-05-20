<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import="java.util.ResourceBundle"%>
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
<%@ include file="../../../banner.jsp" %>
<jsp:useBean id ="con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="C2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>CCD</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
<!-- 	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->

<link rel="shortcut icon" href="../images/faviconnnnn.ico" />
	
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
     <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
	<!-- Help Page pop up ends -->
<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				/* width: 100px; */
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
			
			
			.dynatable1 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable1 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				/* width: 100px; */
				text-align: center;
			}
			.dynatable1 .prototype1 {
				display:none;
			}
			
			
			
			
			
			
			.dynatable2 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable2 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				/* width: 100px; */
				text-align: center;
			}
			.dynatable2 .prototype2 {
				display:none;
			}
		</style>

 <script language="javascript" type="text/javascript">
	
 function validate()
   {
	  
	  
	   var ff=document.form.flowtype;
	   var d1 = document.form.txtmail_msg;
	   var d2 = document.form.mail1;
	  
	   
	   var k=document.form.HiddenChanges;
	   var s=document.form.phase;
	   var lno=document.form.dlevelno;
	   
	   

	
	   if(s!=null && s!="" && s.value=="00"){
		   if(id==0){
			   alert("Please Click Add button to insert Employee Details");
			   return false;
		   }
		  
		   var c=document.form.pCount.value;
		for(var f=1;f<=c;f++){

			   var i="eid"+f;
			   var ed=document.getElementById(i);
			 
			   if(ed.value==""){
				   alert("Please Enter Employee Id for row"+f);
				   return false;
				   }
			   }
		   }
	  
	   
	   if(s!=null && s!="" && s.value=="01"){
		   
		   var f=document.form.feedback;
		   if(f.value==""){
			   alert("Please give Suggestions/Feedback");
			   f.focus();
			   return false;
			   }
		  }
   if(s!=null && s!="" && s.value=="02"){
	   var q=document.form.finalfile;
	   if(q.files.length==0){
		   alert("Please Select File");
		   q.focus();
		   return false;
		   }
	   if(!document.getElementsByName("RoDetail")[0].checked){
		   alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
		   document.getElementsByName("RoDetail")[0].focus();
		   return false;
		   }
	   }
	 

  if(ff!=null && ff!="" && ff=="Normal" && d2.value=="")
	  {
	  if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	   {
	  alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
	  document.getElementsByName("mmdradio")[0].focus();
	  return false;
	  }  
      if (((d2.value==null)||(d2.value=="")) && !document.getElementsByName("mmdradio")[1].checked)
           {
           alert("Please select the next approver name !");
           d2.focus();
           return false;
           }
      
	  }


 if(ff!=null && ff!="" && ff.value=="Selecting")
	  {
	   
	   var dev = document.form.Developer;
	   var send=dev.value;
		   document.getElementById("iddeptadminP11").innerHTML=send;
	   var date1=document.form.date1;
	   var date2=document.form.date11;
	   if (dev.value=="")
	         {
	         alert("Please Select Developer Name !");
	         dev.focus();
	         return false;
	         }
	   if (date1.value=="")
             {
             alert("Please Select Start Date !");
             date1.focus();
             return false;
             }
	   if(date2.value==""){
		   alert("Please Select CompletionDate !");
		   date2.focus();
		   return false;
		   }
	   }
 
var type=document.form.Type
 if(lno.value!=null && lno.value!="" && lno.value=="1"){
	 if(!document.getElementsByName("Hradio")[0].checked && !document.getElementsByName("Hradio")[1].checked){
		 alert("Please Click On Radio Button For Further Process");
		 return false;
	 }  
	 if(document.getElementsByName("Hradio")[0].checked){
		 var itN=document.form.ITadmin;
		 var hsd=document.form.HSdate;
		 var hed=document.form.HEdate;
		 if(itN.value==null || itN.value==""){
			 alert("Please Select IT Admin Name");
			 return false;
		 }
		 if(hsd.value==null || hsd.value==""){
			 alert("Please Select Start Date");
			 return false;
		 }
		 if(hed.value==null || hed.value==""){
			 alert("Please Select Date For Completion");
			 return false;
		 }
	 }
 }
 

 if(lno.value!=null && lno.value!="" && lno.value=="100"){
	 if(id2==0){
		   alert("Please Click ADD button ");
		   return false;
	   }
	 var frm=document.forms[0],flds=[frm['devfile']];
		for(var z0=1;z0<flds[0].length;z0++)
		{
			if(flds[0][z0].files.length== null || flds[0][z0].files.length=="" || flds[0][z0].value.length == 1 )
			 {
				
			    
			     alert("Select the file for the row : "+[z0]);
			     flds[0][z0].focus();
			     return false;
		}
			
		}
 }

if(lno.value!=null && lno.value!="" && lno.value=="101"){
	if(!document.getElementsByName("Developing")[0].checked && !document.getElementsByName("Developing")[1].checked){
		alert("Please Select Radio Button For Further Process");
		return false;
	}
	if(document.getElementsByName("Developing")[0].checked){  
		var td=document.form.TSdate;
		var td1=document.form.TEdate;
		if(td.value=="" || td.value==null){
			alert("Please Select Start Date For Testing");
			return false;
		}
		if(td1.value=="" || td1.value==null){
			alert("Please Select Completion Date For Testing");
			return false;
		}
		
	}
	if(document.getElementsByName("Developing")[1].checked){
		var dd=document.form.DDelaydate;
		if(dd.value=="" || dd.value==null){
			alert("Please Select Completion Date For Developing");
			return false;
		}
	}
	
}

if(lno.value!=null && lno.value!="" && lno.value=="102"){
	if(!document.getElementsByName("Testing")[0].checked && !document.getElementsByName("Testing")[1].checked){
		alert("Please Select Radio Button For Further Process");
		return false;
	}  
	if(document.getElementsByName("Testing")[0].checked){
		var ud=document.form.USdate;
		var ud1=document.form.UEdate;
		var tl=document.form.TLink;
		var uname=document.form.uname;
		var upass=document.form.upass;
		if(ud.value=="" || ud.value==null){
			alert("Please Select Start Date For UAT");
			return false;
		}
		if(ud1.value=="" || ud1.value==null){
			alert("Please Select Completion Date For UAT");
			return false;
		}
		if(tl.value=="" || tl.value==null){
			alert("Please Enter Test Server Link");
			return false;
		}
		if(uname.value==null || uname.value==""){
			alert("Please Enter User Name");
			return false;
		}
		if(upass.value==null || upass.value==""){
			alert("Please Enter Password");
			return false;
		}
		
	}
	
	if(document.getElementsByName("Testing")[1].checked){
		var tdd=document.form.TDelaydate;
		if(tdd.value=="" || tdd.value==null){
			alert("Please Select Completion Date For Testing");
			return false;
		}
	}
}

if(lno.value!=null && lno.value!="" && lno.value=="103"){
	var uchanges=document.form.uatChanges;
	if(uchanges!=null || uchanges!=""){
		alert("Please Enter Changes or feedback for project");
		return false;
	}
	
	
}
if(lno.value!=null && lno.value!="" && lno.value=="104"){
	var CDS=document.form.CDSdate;
	var	CDE=document.form.CDEdate;
	if(CDS.value==null || CDS.value==""){
		alert("Please Select Start Date For UAT Development");
		return false;
	}
	if(CDE.value==null || CDS.value==""){
		alert("Please Select Completion Date For UAT Development");
		return false;
	}
}
if(lno.value!=null && lno.value!="" && lno.value=="105"){
	if(!document.getElementsByName("cDeveloping")[0].checked && !document.getElementsByName("cDeveloping")[1].checked){
		alert("Please Click On Radio Button For Further Process");
		return false;
	}
	if(document.getElementsByName("cDeveloping")[0].checked){  
		var cts=document.form.TSdate;
		var cte=document.form.TEdate;
		if(cts.value==null || cts.value==""){
			alert("Please Select Start Date For Testing");
			return false;
		}
		if(cte.value==null || cte.value==""){
			alert("Please Select Completion Date For Testing");
			return false;
		}
	}
	if(document.getElementsByName("cDeveloping")[1].checked){
		var udd=document.form.DDelaydate;
		if(udd.value==null || udd.value==""){
			alert("Please Select Completion Date For Developing");
			return false;
		}
	}

}
if(lno.value!=null && lno.value!="" && lno.value=="106"){
	
	if(!document.getElementsByName("Versions")[0].checked && !document.getElementsByName("Versions")[1].checked){
		alert("Please Click On Radio Button For Further Process");
		return false;
	}
	if(document.getElementsByName("Versions")[0].checked){  
		var cv=document.form.cVersion;
		var uv=document.form.uVersion;
		if(cv.value==null || cv.value==""){
			alert("Please Enter Current Version");
			return false;
		}
		if(uv.value==null || uv.value==""){
			alert("Please Enter Updated Version");
			return false;
		}
		
	}
	if(document.getElementsByName("Versions")[1].checked){
		var udt=document.form.CTEdate;
		if(udt.value==null || udt.value==""){
			alert("Please Select Completion Date For Testing");
			return false;
		}
	}
	
}
if(lno.value!=null && lno.value!="" && lno.value=="107"){
var psl=document.form.psLink;
if(psl.value==null || psl.value==""){
	alert("Please Enter Server Link");
	return false;
	}
}
 
  if (d1.value=="")
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


</script>
<script type="text/javascript">
function showTR()
	{
	var status = document.getElementById('idstatus').value;
	
	alert("status is  "+status);
	if (status!="true")
	    {
	    alert("you are not authorized person");
	    return false;
	    }
	else
	    {
		document.getElementById('idApprovedd').style.display="table-row";
	   	document.getElementById('idApprovedd').style.visibility="visible";
	   	document.getElementById('idA').style.display="table-row";
	   	document.getElementById('idA1').style.display="table-row";
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
document.getElementById('idApprovedd').style.hidden="table-row";
document.getElementById('idApprovedd').style.visibility="hidden";
document.getElementById('idA').style.display="none";
document.getElementById('idA1').style.display="none";
return true;
 }
}
  
function showHA(){
	document.getElementById('Hid').style.display="table-row";
	document.getElementById('Hid1').style.display="table-row";
}
function hideHA(){
	document.getElementById('Hid1').style.display="none";
	document.getElementById('Hid').style.display="none";		
}

function showH(){
	document.getElementById('HC').style.display="table-row";
	document.getElementById('HNC').style.display="none";
}
function hideH(){
	document.getElementById('HNC').style.display="table-row";
	document.getElementById('HC').style.display="none";		
}


function testing(){
	/* alert("testing"); */
	document.getElementById('Testing').style.display="table-row";
	document.getElementById('NotReason').style.display="none";
	
}
function testing1(){
	/* alert("testing1"); */
	document.getElementById('NotReason').style.display="table-row";
	document.getElementById('Testing').style.display="none";
}
function UAT(){
	document.getElementById('UAT').style.display="table-row";
	document.getElementById('TestServer').style.display="table-row";
	document.getElementById('Treason').style.display="none";
}
function UAT1(){
	document.getElementById('Treason').style.display="table-row";
	document.getElementById('UAT').style.display="none";
	document.getElementById('TestServer').style.display="none";
	document.getElementById('version').style.display="none";
}
function TestServer(){
	document.getElementById('TestServer').style.display="table-row";
	document.getElementById('Ureason').style.display="none";
	
}
function TestServer1(){
	document.getElementById('Ureason').style.display="table-row";
	document.getElementById('TestServer').style.display="none";
	
}
function version(){
	document.getElementById('version').style.display="table-row";
	document.getElementById('CTreason').style.display="none";
	
}
function version1(){
	document.getElementById('CTreason').style.display="table-row";
	document.getElementById('version').style.display="none";
}
function sync(val)
{
	alert(val);
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

function hideHigherTR()
{
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.visibility="visible";
 alert("Select Designation And Name");
}
 function showHigherTR()
{
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.display="none";
 alert("Mail Will Be Sent To IT (Head Office)");
}
</script>
<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
	
{	
String msg=null;
msg="Session__Time__out__Login__In__Again ";
response.sendRedirect("../adminlink.jsp?msg="+msg);
}
%>
<%-- <script  type="text/javascript">

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
</script> --%>
<script>


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
                          	    var url="developer.jsp";  
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
                                                   
                                                   document.getElementById("resultFromAjax2").innerHTML = str2;//full_name,branch,depart,designation,sow
                                                   document.getElementById("iddevname").value =  document.getElementById("p1").value;
                                                   document.getElementById("iddevdesg").value =  document.getElementById("p2").value;
												   document.getElementById("iddevmail").value =  document.getElementById("p6").value;
												   document.getElementById("iddeptadminP11").value =  document.getElementById("p6").value;
                                          		   document.getElementById("iddevempid").value =  document.getElementById("p8").value;
                                          		 
                                         		
                                             		 }
                                              else
                               	                 {
                               	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                                                 document.getElementById("iddevname").value = "";
                                                 document.getElementById("iddevdesg").value =""; 
												 document.getElementById("iddevmail").value =  "";
												 document.getElementById("iddeptadminP11").value = "";
												 document.getElementById("iddevempid").value = "";
                                      		     
                            		                 }
                                       } 
</script>

<script>



function sendInfo2(v)  
{
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
	    xmlHttp.onreadystatechange = getInfo2;  
	    xmlHttp.open("GET", url, true);   
	    xmlHttp.send(null);    
  }  
function getInfo2()    
  {     
  var str2=xmlHttp.responseText;
  if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                 { 
                  /* alert("jhdfdfjdfjdfj"); */
                  document.getElementById("resultFromAjax3").innerHTML = str2;//full_name,branch,depart,designation,sow
				document.getElementById("iddeptadminP11").value =  document.getElementById("p9").value;
				document.getElementById("iddeptadminP").value = document.getElementById("p8").value; 
				document.getElementById("Rodesg").value=document.getElementById("p11").value;
 	             document.getElementById("Roname").value=document.getElementById("p10").value;
 	             document.getElementById("Romail").value=document.getElementById("p12").value;
 	             document.getElementById("Roempid1").value=document.getElementById("p13").value;
 	             document.getElementById("Rolevelno").value=document.getElementById("p14").value;

         		 
        		
            		 }
             else
	                 {
            	/*  alert("else"); */
	                 document.getElementById("resultFromAjax3").innerHTML = str2;
	                document.getElementById("iddeptadminP").value =  ""; 
            		 document.getElementById("iddeptadminP11").value =  "";
            		 document.getElementById("idrodesg").value="";
      	             document.getElementById("idroname").value="";
      	             document.getElementById("idromail").value="";
      	             document.getElementById("idempid1").value="";
      	             document.getElementById("idlevelno").value="";
     		     
	                 }
      } 
</script>




<script>
		var id1 =0;
		
		$(document).ready(function() {
			
			
			
			$("table.dynatable1 button.add").click(function() {
				id1++;
			
				var master = $(this).parents("table.dynatable1");
				
				
				var prot = master.find(".prototype1").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value", id1);
				master.find("tbody").append(prot);
			});
			
			
			$("table.dynatable1 button.remove").live("click", function() {
				$(this).closest("tr").remove();
				id1--;
			});
			
		});



</script>

<script>
		var id2 =0;
		
		$(document).ready(function() {
			
			
			
			$("table.dynatable2 button.add").click(function() {
				id2++;
			
				var master = $(this).parents("table.dynatable2");
				
				
				var prot = master.find(".prototype2").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value", id2);
				master.find("tbody").append(prot);
			});
			
			
			$("table.dynatable2 button.remove").live("click", function() {
				$(this).closest("tr").remove();
				id2--;
			});
			
		});



</script>






<script>
		var id =0;
		
		$(document).ready(function() {
			
			
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
			//alert("Alert");
			document.getElementById("len").value=id;
				var master = $(this).parents("table.dynatable");
				
				// Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value", id);       
				prot.find(".eid").attr("id","eid"+id);                       
				prot.find(".ename").attr("id","ename"+id);        
				prot.find(".edesg").attr("id","edesg"+id);        
				prot.find(".email").attr("id","email"+id);  
				
				prot.find(".eid").attr("name","eid"+id);     
				prot.find(".ename").attr("name","ename"+id);        
				prot.find(".edesg").attr("name","edesg"+id);        
				prot.find(".email").attr("name","email"+id);  

				master.find("tbody").append(prot);
				
				
			});
			
			// Remove button functionality
			$("table.dynatable button.remove").live("click", function() {
				$(this).closest("tr").remove();
				id--;
				document.getElementById("len").value=id;
			});
			
			
			
			
			
		});

		
		
		
function sendInfo1(v,id1)  
         {
//	  alert("iddddddddddddddddddd:"+id1); 
 document.getElementById("curid").value =id1;
			 // alert("empid :"+v);
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
  	    var url="getKeyPersonDetails.jsp";  
  		    url +="?EMP_NO=" +v;
  		    xmlHttp.onreadystatechange = getInfo1;  
  		    xmlHttp.open("GET", url, true);   
  		    xmlHttp.send(null);    
           }  
function getInfo1()
           { 
      	 
      	    // idEmpId1
      	    
      	    var k=document.getElementById("curid").value;
      	    let a =k.substr(3,k.length);
      	    //alert("aaaaaaaaaaaaaaaaa : "+a); 
      	   // a="1";
      	    
      	    
            var str2=xmlHttp.responseText;
           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                          { 
        	  // alert("aaaaaaaaaaaaaaaaa : "+a);


                           document.getElementById("resultFromAjax1").innerHTML = str2;//full_name,branch,depart,designation,sow
                           document.getElementById("ename"+a).value =  document.getElementById("p1").value;
                         document.getElementById("edesg"+a).value =  document.getElementById("p2").value;
						 document.getElementById("email"+a).value =  document.getElementById("p6").value;
        	      			}
                          
                  		 
                 		
                     		 
                      else
       	                 {
                    	//  alert("aaaaaaaaaaaaaaaaa : "+a);
       	                 document.getElementById("resultFromAjax1").innerHTML = str2;
                         document.getElementById("ename"+a).value = "";
                         document.getElementById("edesg"+a).value =""; 
						 document.getElementById("email"+a).value =  "";
						 
              		     
    		                 }
               } 


</script>

<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=1200,width=800,location=1,top=500,left=300,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>


	
 
</head>
<body>
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="Pendingback.jsp"  enctype="multipart/form-data" >
    
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,branch_no=null,admin=null,EmpNo=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cn6=null,cn7=null,cn8=null,cn14=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,st6=null,st7=null,st8=null,st14=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rs12=null,rs11=null,rs6=null,rs7=null,rs8=null,rs14=null;
String req=null;
String empD=null,TestServer=null;
Statement st12=null,st11=null;
String finalfilename=null,finalfilepath=null,Ifilename1=null,Ipath1=null,devfinalfilename=null,devfinalfilepath=null;
int level=0;
int f1=0,f2=0,f3=0,f4=0,f5=0;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
EmpNo=(String) session.getAttribute("EmpNo");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");
Connection cn5 = null,cn11=null,cn6=null,cn7=null,cn10=null,cn15=null; 
Statement st5 = null,st11=null,stnext=null,st6=null,st7=null,st10=null,st15=null; 
ResultSet rs5 = null,rs11=null,rsnext=null,rs6=null,rs7=null,rs10=null,rs15=null; 
try{
%>

<%
String form10_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,Type=null,Subtype=null,remarks=null;
String NSApplicationName=null,NSDepartment=null,NSDescription=null,NSpath=null,NCversion,CSApplicationName=null,CSModule=null,CSDescription=null,CSPatchChange=null,CSpath=null,CCversion,emp=null,mail=null,
Hname=null,Hsname=null,Hbranch=null,Hpatchchange=null,Hdesc=null,HCversion=null,HUversion=null,Renewal_Date=null,Hattach=null,path=null,filename=null,Phase=null,Patch=null,ulevel=null;
int flevel=0,ul=0;

String itemp=null,itdesg=null,itStatus=null,itRemarks=null,itDate=null;
String req = request.getParameter("req");
String values[] = req.split(" -");
System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
req = values[0].replaceAll(" ", "");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from audit_form WHERE form_no='"+req+"'"); 
    while(rs100.next())
        {
	    form10_no = rs100.getString("form_no"); 
	    f_date = rs100.getString("Date");
	    idextend = rs100.getString("idextend");
	    branch = rs100.getString("branch");
	    depart = rs100.getString("empdept");
	    full_name = rs100.getString("empname");
	    designation = rs100.getString("empdesg");
	    scopeOfWork = rs100.getString("empmail");
	    emp_code = rs100.getString("empcode");
	    Type = rs100.getString("Type");
	    Subtype=rs100.getString("Subtype");
	    branch_no=form10_no.substring(9,11);
	    System.out.println("tWHEHHDHSDHDDDDDDDDDDDDG....."+branch_no);
        
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<br /><br /><br /><br />
<center>
 <table width="900" border="1" align="center" style="border-color: white;">
<tr>
<td align="center" style="border-color: white;">
<img src="../images/nip.gif" height="25" width="25" /> 
<font size="5" style="position: static;">
NIPPON EXPRESS (INDIA) PRIVATE LIMITED
</font>
</td>
</tr>
</table>
</center>
<table width="918"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	 <tr>
		<td style="height: 40px;"><center><font size="3">
		<b><label>NEW OR CHANGE REQUEST FORM</label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=SessionName%>" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="hidden" name="i_city" value="<%=city%>" />
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form1_no" value="<%=form10_no%>" />
		<input type="hidden" name="emp_id" value="<%=EmpNo%>" />
		<input type="hidden" id="curid" value="" />
		</td>
	</tr>
</table>
<table width="918"  cellspacing="0" cellpadding="0" bgcolor="lightgrey" style="margin-left: auto;margin-right: auto;" align="center">
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
           cn3=con.getConnection2();
           st3=cn3.createStatement();
           rs3=st3.executeQuery("Select * From Version_Management_Hardware where form_no='"+req+"'");
           
           cn6=con.getConnection2();
           st6=cn6.createStatement();
           rs6=st6.executeQuery("Select * From version_management where form_no='"+req+"'");
           cn15=con.getConnection2();
           st15=cn15.createStatement();
           rs15=st15.executeQuery("SELECT ifnull(levelno,'0') FROM `auditform_item` where form_no='"+req+"' and id in(SELECT max(id) FROM auditform_item group by form_no)");
          %>	 
		
	<table width="895"  style="margin-left: auto;margin-right: auto;" align="center">
      <tr>
<td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
         <td style="text-align:left;" bgcolor="grey" colspan="3"><input name="branch" value="<%=form10_no%>" size="31" readonly="readonly"/> </td>
      </tr>
      <tr>
         <td  style="text-align: right;">Employee Code :</td>
         <td style="text-align:left;"><input type="text" style="width: 15em" name="emp_code" id="ecode" value="<%=emp_code%>"  readonly="readonly" /></td>
         <td  style="text-align: right;">Full Name :</td>
         <td style="text-align:left;"><input type="text" style="width: 15em" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
     </tr>	
     <tr>
 <td  style="text-align: right;width: 215px; "  >Branch :</td>
         <td style="text-align:left;"><input type="text" style="width: 15em" name="branch" value="<%=branch%>"  readonly="readonly"/> </td>
         <td  style="text-align: right;width: 175px;">Department :</td>
         <td style="text-align:left;"><input type="text" style="width: 15em" name="depart" value="<%=depart%>" readonly="readonly"/></td> 
     </tr>
     <tr>
        <td  style="text-align: right;">Designation :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="designation" value="<%=designation%>" readonly="readonly"/></td>
        <td  style="text-align: right;">Mail ID :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="d_resignation" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" />
        </td>
     </tr>
    
 		<tr>
        <td  style="text-align: right;">Type:</td>
        <td style="text-align:left;">
        <input type="text"  style="width: 15em"  name="Type"  value="<%=Type%>" readonly="readonly" readonly="readonly" />
		</td>
		
       <%
        cn11=con.getConnection2();
        st11=cn11.createStatement();
        rs11=st11.executeQuery("SELECT max(levelno) FROM `auditform_item` WHERE form_no='"+req+"'");
        if(rs11.next()){
        	flevel=rs11.getInt(1);
        }
if((Type.equals("Software"))&&(Subtype.equals("New"))){
	NSApplicationName=rs100.getString("NSApplicationName");
 	NSDepartment=rs100.getString("NSDepartment");
 	NSDescription=rs100.getString("NSDescription");
 	/* NSpath=rs100.getString("NSAttachmentsPath"); */
 	NCversion=rs100.getString("NSCurrentVersion");
%>
		<td  style="text-align: right;">SubType :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="Subtype" value="<%=Subtype%>" readonly="readonly"  readonly="readonly" />
        </td> 
        </tr>
        <tr>
        <td  style="text-align: right;">Application Name :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="NSApplication" value="<%=NSApplicationName%>" readonly="readonly"/></td>
        <td  style="text-align: right;">Department :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="NSDept" value="<%=NSDepartment%>" readonly="readonly"  readonly="readonly" />
        </td>
        </tr>
        <tr>
        <td  style="text-align: right;">Description :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="NSDesc" value="<%=NSDescription%>" readonly="readonly"/></td>
        <input type="hidden" name="appname" value="<%=NSApplicationName%>"/>
       
     
     
 <%while(rs6.next()){ %> 
       
        <td  style="text-align: right;">Current Version :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="NCversion" value="<%=rs6.getString("current_version") %>" readonly="readonly"/></td>
        </tr>
<%--         <tr>
        <td  style="text-align: right;">Updated Version :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="NCversion" value="<%=rs6.getString("updated_version") %>" readonly="readonly"/></td>
        </tr>    --%> 
     
<%} %>     
     
     
     <tr>   
  <td style="text-align: right;">BRANCHES IT</td>
<td colspan="5" style="text-align:left;"><a href="#"  onclick="popitup('BranchRequirements.jsp?f=<%=req%>')">Click Here</a></td>
</tr>
<tr>
<td style="text-align: right;">DIVISION HEADS</td>
<td colspan="5" style="text-align:left;"><a href="#"  onclick="popitup('DivisionHeads.jsp?f=<%=req%>')">Click Here</a></td>
</tr>
  <%if(flevel>=0){
	 cn10=con.getConnection2();
	  st10=cn10.createStatement();
	  rs10=st10.executeQuery("SELECT * FROM `file_paths` where form_no='"+req+"' And empid='"+emp_code+"' And Path Like '%Final%'");
	 while(rs10.next()){
		 finalfilename=rs10.getString("filename");
		 finalfilepath=rs10.getString("Path"); 
	 
 
	 %>
<tr>
<td style="text-align: right;">FINAL REQUIREMENTS</td>
<td colspan="5" style="text-align:left;"><a href="downloadfile.jsp?f=<%=finalfilepath%>"><%=finalfilename%></a></td>
</tr>
 <%}
	 }%>         
  
<% 
int size1=0;
cn14=con.getConnection2();
st14=cn14.createStatement();
rs14=st14.executeQuery("SELECT * From file_paths where form_no='"+req+"'  And (Path like '%/DeveloperFinalFiles/%' OR (path like '%/Developer/%' And not EXISTS (SELECT 1 From file_paths where form_no='"+req+"' And path like '%/DeveloperFinalFiles/%')))");
while(rs14.next()){
	size1++;
	devfinalfilename=rs14.getString("filename");
	 devfinalfilepath=rs14.getString("Path");
%>
<%if(size1==1){ %>
<tr>
<td style="text-align: right;">DEVELOPER FILES</td>  
<td colspan="5" style="text-align:left;">
<div style="width:100%; overflow:auto"><font size="2" color="black"><a href="downloadfile.jsp?f=<%=devfinalfilepath%>"><%=devfinalfilename%></a></font>
<%} %>
<%if(size1>=2){ %>
<font size="2" color="black"><a href="downloadfile.jsp?f=<%=devfinalfilepath%>"><%=devfinalfilename%></a></font>
<%
}
		  
}
%>        
  </div>
 </td>
 </tr> 
<%
while(rs15.next()){
	ulevel=rs15.getString(1);
	
		ul=Integer.parseInt(ulevel);
		System.out.println("the ul value is"+ul);
	

System.out.println("the ulevel value is"+ulevel);
if(ul>=104){ %> 
<tr>
<td style="text-align: right;">UAT DEVELOPMENT SUGGESTIONS</td>
<td colspan="5" style="text-align:left;"><a href="#"  onclick="popitup('UATSuggestions.jsp?f=<%=req%>')">Click Here</a></td>
</tr>        
        
<%
}
}
 }else if((Type.equals("Software"))&&(Subtype.equals("Changes"))){
	 CSApplicationName=rs100.getString("CSApplicationName");
		CSModule=rs100.getString("CSModule");
		CSDescription=rs100.getString("CSDescription");
		CSPatchChange=rs100.getString("CSPatchChange");
		/* CSpath=rs100.getString("CSAttachmentsPath"); */
		CCversion=rs100.getString("CSCurrentVersion");
	 %>  
	 	<td  style="text-align: right;">SubType :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="Subtype" value="<%=Subtype%>" readonly="readonly"  readonly="readonly" />
        </td> 
        </tr>    
		<tr>
        <td  style="text-align: right;">Application Name :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="CSAplication" value="<%=CSApplicationName%>" readonly="readonly"/></td>
        <td  style="text-align: right;">Module :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="CSModule" value="<%=CSModule%>" readonly="readonly"  readonly="readonly" />
        </td>
        </tr>
        <tr>
        <td  style="text-align: right;">Patch/Change Management :</td>
        <td style="text-align:left;"><input  type="text" style="width: 15em" name="CSPathChange" value="<%=CSPatchChange%>" readonly="readonly"/></td>
        <td  style="text-align: right;">Description :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="CSDesc" value="<%=CSDescription%>" readonly="readonly"  readonly="readonly" />
        <input  type="hidden" name="appname" value="<%=CSApplicationName%>"/>
        </td>
        </tr>

<%while(rs6.next()){ %> 
        <tr>
        <td  style="text-align: right;">Current Version :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="NCversion" value="<%=rs6.getString("current_version") %>" readonly="readonly"/></td>
        
        <td  style="text-align: right;">Updated Version :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="NCversion" value="<%=rs6.getString("updated_version") %>" readonly="readonly"/></td>
        </tr>    
     
<%} %>     




<tr>       
<td style="text-align: right;">BRANCHES IT</td>
<td colspan="5" style="text-align:left;"><a href="#"  onclick="popitup('BranchRequirements.jsp?f=<%=req%>')">Click Here</a></td>
</tr>
<tr>
<td style="text-align: right;">DIVISION HEADS</td>
<td colspan="5" style="text-align:left;"><a href="#"  onclick="popitup('DivisionHeads.jsp?f=<%=req%>')">Click Here</a></td>
</tr>
  <%if(flevel>=0){
	 cn10=con.getConnection2();
	  st10=cn10.createStatement();
	  rs10=st10.executeQuery("SELECT * FROM `file_paths` where form_no='"+req+"' And empid='"+emp_code+"' And Path Like '%Final%'");
	 while(rs10.next()){
		 finalfilename=rs10.getString("filename");
		 finalfilepath=rs10.getString("Path"); 
	 
 
	 %>
<tr>
<td style="text-align: right;">FINAL REQUIREMENTS</td>
<td colspan="5" style="text-align:left;"><a href="downloadfile.jsp?f=<%=finalfilepath%>"><%=finalfilename%></a></td>
</tr>
 <%}
	 }%>    
     
 <% 
int size1=0;
cn14=con.getConnection2();
st14=cn14.createStatement();
rs14=st14.executeQuery("SELECT * From file_paths where form_no='"+req+"'  And (Path like '%/DeveloperFinalFiles/%' OR (path like '%/Developer/%' And not EXISTS (SELECT 1 From file_paths where form_no='"+req+"' And path like '%/DeveloperFinalFiles/%')))");
while(rs14.next()){
	size1++;
	devfinalfilename=rs14.getString("filename");
	 devfinalfilepath=rs14.getString("Path");
%>
<%if(size1==1){ %>
<tr>
<td style="text-align: right;">DEVELOPER FILES</td>  
<td colspan="5" style="text-align:left;">
<div style="width:100%; overflow:auto"><font size="2" color="black"><a href="downloadfile.jsp?f=<%=devfinalfilepath%>"><%=devfinalfilename%></a></font>
<%} %>
<%if(size1>=2){ %>
<font size="2" color="black"><a href="downloadfile.jsp?f=<%=devfinalfilepath%>"><%=devfinalfilename%></a></font>
<%
}
		  
}
%>        
  </div>
 </td>
 </tr>      
<%
while(rs15.next()){
	ulevel=rs15.getString(1);
	
		ul=Integer.parseInt(ulevel);
		System.out.println("the ul value is"+ul);
	

System.out.println("the ulevel value is"+ulevel);
if(ul>=104){ %>  
<tr>
<td style="text-align: right;">UAT DEVELOPMENT SUGGESTIONS</td>
<td colspan="5" style="text-align:left;"><a href="#"  onclick="popitup('UATSuggestions.jsp?f=<%=req%>')">Click Here</a></td>
</tr>     



<%
}
}
 }else{
Hname=rs100.getString("HardwareName");
Hsname=rs100.getString("Hardware_Sub");
	Hbranch=rs100.getString("H_branch");
	Hdesc=rs100.getString("H_description");
	
	Hpatchchange=rs100.getString("H_patch_change");%>
		
        <td  style="text-align: right;">Hardware Category :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="Hname" value="<%=Hname%>" readonly="readonly"/></td>
        </tr>
        <tr>
        <td  style="text-align: right;">Hardware Sub_Category :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="Hsname" value="<%=Hsname%>" readonly="readonly"  readonly="readonly" />
        </td>
        <td  style="text-align: right;">Branch :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="Hbranch" value="<%=Hbranch%>" readonly="readonly"  readonly="readonly" />
        </td>
        
        
        </tr>
        <tr>
        <td  style="text-align: right;">Patch/Change Management :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="Hpatchchange" value="<%=Hpatchchange%>" readonly="readonly"  readonly="readonly" />
        </td>
        <td  style="text-align: right;">Description :</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="Hdesc" value="<%=Hdesc%>" readonly="readonly"/></td>
       </tr>
<%
}
        }
    
   

   %>
        
 
<%
 if(Type.equals("Hardware")){
 
 while(rs3.next()){
        	 HCversion=rs3.getString("Current_Version");
        	 HUversion=rs3.getString("Updated_Version");
        	 Renewal_Date=rs3.getString("Expiry_Renewal_Date");
        	 Patch=rs3.getString("Patch");
        if(HCversion!=null && HUversion!=null){
        	%>
        	
        	 <tr>
       	<td  style="text-align: right;">Current Version :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="HCversion" value="<%=HCversion%>" readonly="readonly"  readonly="readonly" />
        </td>
       

        <td  style="text-align: right;">Updated Version:</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="Hdesc" value="<%=HUversion%>" readonly="readonly"/></td>
          </tr>
          <tr>
         <td  style="text-align: right;">Patch:</td>
        <td style="text-align:left;"><input type="text" style="width: 15em" name="HPatch" value="<%=Patch%>" readonly="readonly"/></td>
        
        <td  style="text-align: right;">Expiry/Renewal Date:</td>
        <td colspan="3" style="text-align:left;"><input type="text" style="width: 15em" name="Hdesc" value="<%=Renewal_Date%>" readonly="readonly"/></td>
         </tr>
<%}
}
 }%>
	
</table>






<table width="895" style="margin-left: auto;margin-right: auto;" align="center">
       <tr>
		  <td height="20" bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>NAME</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>DESIGNATION</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>STATUS</b></font></td>
		 <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>REMARKS</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>DATE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>FILES</b></font></td>
	  </tr>
	  <%
	  String mailD=null;
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  String statusD=null,emp_no=null,levelno=null;
	  rs1 = st1.executeQuery("select form_no,desg,emp,Status,remarks,Date,Mail,empid,levelno from auditform_item WHERE form_no='"+req+"' order by id ASC");
	  while(rs1.next())
	      {
		  String form10_noD= rs1.getString("form_no");
		  String desgD= rs1.getString("desg");
		  empD= rs1.getString("emp");
		  statusD= rs1.getString("Status");
		  String remarksD= rs1.getString("remarks");
		  String f_dateD= rs1.getString("Date");
		  mailD= rs1.getString("Mail");
		  
		  emp_no= rs1.getString("empid");
		  levelno= rs1.getString("levelno");
		  
		  
		  String m = "";
		  if(rs1.getString("Mail")!=null)
		   {
		    m =  rs1.getString("Mail").trim();
		   }
		 %>




<tr>
<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
<input id="idStatus" type="hidden" value="<%=statusD%>"/>
</td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
<% if(statusD.equals("Approved")){	%>
<td bgcolor="green" width="100"><font size="2" color="black"><%=statusD%></font></td>

<%}else if(statusD.equals("Pending")){	%>
<td bgcolor="orange" width="100"><font size="2" color="black"><%=statusD%></font></td>
<%}else if(statusD.equals("Not Approved")){	%>
<td bgcolor="red" width="100"><font size="2" color="black"><%=statusD%></font></td>
<%}else{ %>
<td bgcolor="yellow" width="100"><font size="2" color="black"><%=statusD%></font></td>
<%} %>

<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
<td bgcolor="white" width="100">
<%int size=0;
cn15=con.getConnection2();
		  st15=cn15.createStatement();
		  rs15=st15.executeQuery("SELECT * FROM `file_paths` WHERE form_no='"+req+"' And empid='"+emp_no+"' And Path Not Like '%Final%'");
		 while(rs15.next()){
			 size++;
		 Ifilename1=rs15.getString("filename");
		  Ipath1=rs15.getString("Path"); 
		  System.out.println("path of file"+Ipath1);
		  
		  		  
		  %>

<%if(statusD.equals("Initiator")){ %>
<%if(size==1){ %>
<div style="width:100%; overflow:auto"><font size="2" color="black"><a href="downloadfile.jsp?f=<%=Ipath1%>"><%=Ifilename1%></a></font>
<%} %>
<%if(size>=2){ %>
<font size="2" color="black"><a href="downloadfile.jsp?f=<%=Ipath1%>"><%=Ifilename1%></a></font>
<%
}
		  
}
		 }
	      }      
%>
</div>
</td>
</tr>

</table>


<%
level=Integer.parseInt(levelno);
if(level>=1 && Type.equals("Hardware")) {%>
<table width="895" border="1" style="margin-left: auto;margin-right: auto;"  align="center" >
<tr>
<td align="center" colspan="6"><h3>HARDWARE STATUS</h3></td>
</tr>
       <tr bgcolor="lightgrey">
		  <td height="20" bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>HARDWARE_NAME</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>STAGE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>STATUS</b></font></td>
		 <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>START_DATE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>COMPLETION_DATE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>REMARKS</b></font></td>
	  </tr>

<% 
cn6=con.getConnection2();
st6=cn6.createStatement();
rs6=st6.executeQuery("Select * From audit_hardware_flow where form_no='"+req+"' order by id asc");
while(rs6.next()){
	String dev_name=rs6.getString("Hardware_Name");
	String stage=rs6.getString("Stage");
	String status=rs6.getString("Status");
	String Start_date=rs6.getString("Start_Date");
	String end_date=rs6.getString("Completion_Date");
	String Dremarks=rs6.getString("remarks");
		  
		  %>

	   <tr>
	   	  <td bgcolor="white" width="100"><font size="2" color="black"><%=dev_name%></font>
		    <input id="idStatus" type="hidden" value="<%=status%>"/>
		  </td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=stage%></font></td>
		   <%if(status.equals("Completed")){ %>
		  <td bgcolor="green" width="100"><font size="2" color="black"><%=status%></font></td>
		  <%}
		  if(status.equals("Pending")){%>
		  <td bgcolor="orange" width="100"><font size="2" color="black"><%=status%></font></td>
		  <%} %>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=Start_date%></font></td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=end_date%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=Dremarks%></font></td>
		  </tr>
	
		
		  
		  
		 
<%
}
%>
 </table>
 <%
 } 
  
%>

 
 
 
<!-- Development Details -->
<%
level=Integer.parseInt(levelno);
if(level>=100) {%>
<table width="895" border="1" style="margin-left: auto;margin-right: auto;"  align="center" >
<tr>
<td align="center" colspan="6"><h3>DEVELOPMENT STATUS</h3></td>
</tr>
       <tr bgcolor="lightgrey">
		  <td height="20" bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>DEVELOPER_NAME</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>STAGE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>STATUS</b></font></td>
		 <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>START_DATE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>COMPLETION_DATE</b></font></td>
		  <td bgcolor="grey" width="120" align="center"><font size="2" color="black"><b>REMARKS</b></font></td>
	  </tr>

<% 
cn6=con.getConnection2();
st6=cn6.createStatement();
rs6=st6.executeQuery("Select * From Development_Status where form_no='"+req+"' order by id asc");
while(rs6.next()){
	String dev_name=rs6.getString("Developer_Name");
	String stage=rs6.getString("Stage");
	String status=rs6.getString("Status");
	String Start_date=rs6.getString("Start_Date");
	String end_date=rs6.getString("End_Date");
	String Dremarks=rs6.getString("remarks");
		  
		  %>

	   <tr>
	   	  <td bgcolor="white" width="100"><font size="2" color="black"><%=dev_name%></font>
		    <input id="idStatus" type="hidden" value="<%=status%>"/>
		  </td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=stage%></font></td>
		  <%if(status.equals("Completed")){ %>
		  <td bgcolor="green" width="100"><font size="2" color="black"><%=status%></font></td>
		  <%}
		  if(status.equals("Pending")){%>
		  <td bgcolor="orange" width="100"><font size="2" color="black"><%=status%></font></td>
		  <%} %>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=Start_date%></font></td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=end_date%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=Dremarks%></font></td>
		  </tr>
	
		
		  
		  
		 
<%
}

 } 
  
%>
 </table>
 <!-- Development Details ends-->
 


 


 
	
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
<table style="margin-left: auto;margin-right: auto;"  align="center" ><tr>
 
     <td style="font-size:1" id="hiderow">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='DomainUserSelectAdmin.jsp?msg=1'"/> --> 
     <a href="javascript:history.back()">BACK</a>
     </td>
    <td align="right" id="hiderow">

<script language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
    
   	</tr>
 
</table> 	

</td>
</tr>
</table>
</center>
</div>
</form>
</body>

</html>