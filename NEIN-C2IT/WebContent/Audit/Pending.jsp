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
		<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
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
				
				
				.dynatable4 {
					border: solid 1px #000; 
					border-collapse: collapse;
				}
				
				.dynatable4 td {
					border: solid 1px #000; 
					padding: 2px 10px;
					/* width: 100px; */
					text-align: center;
				}
				.dynatable4 .prototype4 {
					display:none;
				}
				
	
			</style>
	
	<script language="javascript" type="text/javascript">
	function validate(){
		/* alert("working"); */
	
		var type=document.form.Type;
		var lno=document.form.dlevelno;
	
	if(type.value=="Hardware"){
		if(lno.value=="1"){
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
	if(lno.value=="2"){
		 if(!document.getElementsByName("HCradio")[0].checked && !document.getElementsByName("HCradio")[1].checked){
			 alert("Please Click On Radio Button For Further Process");
			 return false;
		 }
		 if(document.getElementsByName("HCradio")[0].checked){// completed or not completed approved
				if(!document.getElementsByName("config")[0].checked && !document.getElementsByName("config")[1].checked){
					 alert("Please Click On Radio Button For Further Process");
					 return false;
				 }
				if(document.getElementsByName("config")[0].checked){
					/* alert("c"); */
					if(!document.getElementsByName("issue")[0].checked && !document.getElementsByName("issue")[1].checked){
						 alert("Please Click On Radio Button For Further Process");
						 return false;
					 }
					if(document.getElementsByName("issue")[0].checked){
						var is=document.form.configissues;
						var is_Sdate=document.form.ci_Sdate;
						var is_Edate=document.form.ci_Edate;
						if(is.value=="" || is.value==null){
							alert("Please Enter Issue");
							return false;
						}
						if(is_Sdate.value=="" || is_Sdate==null){
							alert("Please Select Start Date For Solving Isuue");
							return false;
						}
						if(is_Edate.value=="" || is_Edate==null){
							alert("Please Select Completion Date For Solving Issue");
							return false;
						}
						}
					if(document.getElementsByName("issue")[1].checked){
						var patch=document.form.patch;
						var hcv=document.form.hcv;
						var huv=document.form.huv;
						var exdate=document.form.ExDate;
						if(exdate.value=="" || exdate.value==null){
							alert("Please Select Expiry/Renewal Date");
							return false;
						}
						if(hcv.value=="" || hcv.value==null){
							alert("Please Enter Current Version");
							return false;
						}
						if(huv.value=="" || huv.value==null){
							alert("Please Enter Updated Version");
							return false;
						}
						if(patch.value=="" || patch.value==null){
							alert("Please Enter Patch Details");
							return false;
						}
					}
					}
				if(document.getElementsByName("config")[1].checked){
					var cfsdate=document.form.Config_Sdate;
					var cfedate=document.form.Config_Edate;
					if(cfsdate.value=="" || cfsdate.value==null){
						alert("Please Select Start Date For Configuration");
						return false;
					}
					if(cfedate.value=="" || cfedate.value==null){
						alert("Please Select Completion Date For Configuration");
						return false;
					}
				}
		 }
		 if(document.getElementsByName("HCradio")[1].checked){
			 var cdate=document.form.hardCD;
				if(cdate.value=="" || cdate.value==null){
					alert("Please Select Date For Completion");
					return false;
				}
		 }
	 }
	}
	
	if(type.value=="Software"){
		/* alert("soft"); */
		var s=document.form.phase;
		
		
		if(s!=null && s!=""){
		if((s.value!=null) && (s.value!="") && (s.value=="00")){
			   if(id==0){
				   alert("Please Click Add button to insert Employee Details");
				   return false;
			   }
			   var c=document.form.pCount.value;
				for(var f=1;f<=c;f++){
					     
					   var i="eid"+f;
					   var i1="ename"+f;
					   var i2="edesg"+f;
					   var i3="email"+f;
					   
					   var ed=document.getElementById(i);
					   var ed1=document.getElementById(i1);
					   var ed2=document.getElementById(i2);
					   var ed3=document.getElementById(i3);
					 
					   if(ed.value=="" || ed1.value=="" || ed2.value=="" || ed3.value==""){
						   alert("Please Enter Valid Employee Id for row"+f);
						   return false;
						   }
					   }
	}
		
		
		 if((s.value!=null) && (s.value!="") && (s.value=="01")){
			   
			   var f=document.form.feedback;
			   if(f.value!=null && f.value==""){
				   alert("Please give Suggestions/Feedback");
				   f.focus();
				   return false;
				   }
			  }
		
			
		
		 if((s.value!=null) && (s.value!="") && (s.value=="02")){
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
		}
		
		
		 
		 
		 var ff=document.form.flowtype;
		 var d2 = document.form.mail1;
		
		 
		 if((ff!=null) && (ff!="") && (d2!="") && (ff.value!=null) && (ff.value!="") && (ff.value=="Normal") && (d2.value==""))
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
		 
		 
		 if((ff!=null) && (ff!="") && (ff.value!=null) && (ff.value!="") && (ff.value=="Selecting") && (lno.value!="100"))
		  {
		 if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
		   {
		  alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
		  document.getElementsByName("mmdradio")[0].focus();
		  return false;
		  } 
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
		
		var lno=document.form.dlevelno;
		
		
		
		 if((lno!=null) && (lno!="") && (lno.value!=null) && (lno.value!="") && (lno.value=="100")){
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
		 
		 
		 if((lno!=null) && (lno!="") && (lno.value!=null) && (lno.value!="") && (lno.value=="101")){
			 if (!document.getElementsByName("DIfiles")[0].checked && !document.getElementsByName("DIfiles")[1].checked) 
			   {
			  alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
			  document.getElementsByName("DIfiles")[0].focus();
			  return false;
			  }
			 if(document.getElementsByName("DIfiles")[0].checked){
				 var kk=document.form.DIchanges;
				 if(kk.value=="" || kk.value==null){
					 alert("Please Enter Changes");
					 kk.focus();
					 return false;
				 }
				 
			 }
			 
		 }		 
		var dp=document.form.devPhase;
		if((dp!=null)&&(dp!="")){
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d102")){
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
		
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d103")){
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
	
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d104")){
			var uchanges=document.form.uatChanges;
			if((uchanges.value==null) || (uchanges.value=="")){
				alert("Please Enter Changes or feedback for project");
				return false;
			}
		}
		
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d105")){
			if(!document.getElementsByName("UChang")[0].checked && !document.getElementsByName("UChang")[1].checked){
				alert("Please Select Radio Button For Further Process");
				return false;
			}
			if(document.getElementsByName("UChang")[0].checked){
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
			if(document.getElementsByName("UChang")[1].checked){  
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
			
		}
		
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d106")){
			if(!document.getElementsByName("cDeveloping")[0].checked && !document.getElementsByName("cDeveloping")[1].checked){
				alert("Please Select Radio Button For Further Process");
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
		
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d107")){
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
		
		if((dp.value!=null) && (dp.value!="") && (dp.value=="d108")){
			var pk=document.form.psLink;
			var pk1=document.form.owner;
			var pk2=document.form.team;
			var pk3=document.form.ReqBy;
			var pk4=document.form.IniBy;
			if(pk.value=="" || pk.value==null){
				alert("Please Enter Server Link");
				return false;
			}
			if(pk1.value=="" || pk1.value==null){
				alert("Please Enter Owner Of The Project");
				return false;
			}
			if(pk2.value=="" || pk2.value==null){
				alert("Please Enter Team Size");
				return false;
			}
			if(pk3.value=="" || pk3.value==null){
				alert("Please Enter Name of the Initiator");
				return false;
			}
			if(pk4.value=="" || pk4.value==null){
				alert("Please Enter Approver Name");
				return false;
			}
			
		}
		}
			
	
		 
	}
	
	
	var d1=document.form.txtmail_msg;
	/* alert(d1.value); */
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
		
		/* alert("status is  "+status); */
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
	function hideH(){
		document.getElementById('HNC').style.display="table-row";
		document.getElementById('ConfigTest').style.display="none";
		document.getElementById('configNo').style.display="none";
		document.getElementById('issues').style.display="none";
		document.getElementById('ConfigIssuesYes').style.display="none";
		document.getElementById('HC').style.display="none";
	}
	function showH(){
		document.getElementById('ConfigTest').style.display="table-row";
		document.getElementById('HNC').style.display="none";
		
	}
	function configyes(){
	
		document.getElementById('issues').style.display="table-row";
		document.getElementById('configNo').style.display="none";
		
	}
	
	function configno(){
	
		
		document.getElementById('configNo').style.display="table-row";
		document.getElementById('issues').style.display="none";
		document.getElementById('ConfigIssuesYes').style.display="none";
		document.getElementById('HC').style.display="none";
	}
	
	function issuesyes(){ 
		document.getElementById('ConfigIssuesYes').style.display="table-row";
		document.getElementById('HC').style.display="none"
		
	}
	
	function issuesno(){
		document.getElementById('HC').style.display="table-row";
		document.getElementById('ConfigIssuesYes').style.display="none"
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
	
	function sug(){
		document.getElementById('DUFC').style.display="table-row";
	}
	
	function sug1(){
		document.getElementById('DUFC').style.display="none";
		
	}
	
	function ChanDev(){
		document.getElementById('ChangesDev').style.display="table-row";
		document.getElementById('version').style.display="none";
		
	}
	
	function ChanDev1(){
		document.getElementById('version').style.display="table-row";
		document.getElementById('ChangesDev').style.display="none";
	}
	
	
	function sync(val)
	{
		/* alert(val); */
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
	response.sendRedirect("../adminlinkHR.jsp?msg="+msg);
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
	           /* alert(msg); */
			}
	</script>
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
			var id4=0;
			
			$(document).ready(function() {
				
				
				
				$("table.dynatable4 button.add").click(function() {
					id4++;
				
					var master = $(this).parents("table.dynatable4");
					
					
					var prot = master.find(".prototype4").clone();
					prot.attr("class", "");
					prot.find(".id").attr("value", id4);
					master.find("tbody").append(prot);
				});
				
				
				$("table.dynatable4 button.remove").live("click", function() {
					$(this).closest("tr").remove();
					id4--;
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
	      	    var k=document.getElementById("curid").value;
	      	    let a =k.substr(3,k.length);
	            var str2=xmlHttp.responseText;
	           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	                          {
	        	   var zz=document.getElementById("p9").value;
	        	   
	        	   if(zz==1){
	        	   document.getElementById("resultFromAjax1").innerHTML = str2;//full_name,branch,depart,designation,sow
	               document.getElementById("ename"+a).value =  document.getElementById("p1").value;
	               document.getElementById("edesg"+a).value =  document.getElementById("p2").value;
				   document.getElementById("email"+a).value =  document.getElementById("p6").value;
	        	   			}else{
	        	   				alert("Please Enter Employee Id  From Your Branch");
	        	   			}
	                          }
	           else{
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
	Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cn6=null,cn7=null,cn8=null;
	Statement st1= null,st2=null,st3=null,st4=null,st100=null,st6=null,st7=null,st8=null; 
	ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rs12=null,rs11=null,rs6=null,rs7=null,rs8=null;
	String req=null;
	String empD=null,TestServer=null,finlevel=null;
	Statement st12=null,st11=null;
	int level=0;
	int f1=0,f2=1,f3=0,f4=0,f5=0;
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
	Connection cn5 = null,cn11=null,cn10=null,cn14=null,cn15=null; 
	Statement st5 = null,st11=null,stnext=null,st10=null,st14=null,st15=null; 
	ResultSet rs5 = null,rs11=null,rsnext=null,rs10=null,rs14=null,rs15=null; 
	try{
	%>
	
	<%
	String form10_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,Type=null,Subtype=null,remarks=null;
	String NSApplicationName=null,NSDepartment=null,NSDescription=null,NSpath=null,NCversion,CSApplicationName=null,CSModule=null,CSDescription=null,CSPatchChange=null,CSpath=null,CCversion=null,emp=null,mail=null,
	Hname=null,Hsname=null,Hbranch=null,Hpatchchange=null,Hdesc=null,HCversion=null,Hattach=null,path=null,filename=null,Phase=null;
	String Ifilename1=null,Ipath1=null,t=null;
	String finalfilename=null,finalfilepath=null,devfinalfilename=null,devfinalfilepath=null;
	int flevel=0,ul=0;
	String itemp=null,itdesg=null,itStatus=null,itRemarks=null,itDate=null,ulevel=null,ffl=null;
	
	String req = request.getParameter("req");
	t=request.getParameter("t");
	System.out.println("the value of t is"+t);
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
	<table width="918"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
		 <tr>
			<td ><center><font size="3">
			<b><label>AUDIT FORM</label>
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
	         <td style="text-align:left;"><input type="text" style="width: 15em" name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
	         <td  style="text-align: right;width: 175px;">Department :</td>
	         <td style="text-align:left;"><input type="text" style="width: 15em" name="depart" value="<%=depart%>" readonly="readonly"/></td> 
	     </tr>
	     <tr>
	        <td  style="text-align: right;">Designation :</td>
	        <td style="text-align:left;"><input type="text" style="width: 15em" name="designation" value="<%=designation%>" readonly="readonly"/></td>
	        <td  style="text-align: right;">Mail ID :</td>
	        <td style="text-align:left;"> <input type="text"  style="width: 15em"  style="width: 15em"  name="d_resignation" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" />
	        </td>
	     </tr>
	    
	 		<tr>
	        <td  style="text-align: right;">Type:</td>
	        <td style="text-align:left;">
	        <input type="text"  style="width: 15em"  name="Type"  value="<%=Type%>" readonly="readonly" readonly="readonly" />
			</td>
			
	 
	 
	 
	 <%
	
	 
	        
	        
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
	        <td colspan="3" style="text-align:left;"><input type="text" style="width: 15em" name="NSDesc" value="<%=NSDescription%>" readonly="readonly"/></td>
	        <input type="hidden" name="appname" value="<%=NSApplicationName%>"/>
	        </tr>
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
	 <%}
	}%>      
	 <%}else if((Type.equals("Software"))&&(Subtype.equals("Changes"))){
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
	        <td style="text-align:left;"><input type="text" style="width: 15em" name="CSPathChange" value="<%=CSPatchChange%>" readonly="readonly"/></td>
	        <td  style="text-align: right;">Description :</td>
	        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="CSDesc" value="<%=CSDescription%>" readonly="readonly"  readonly="readonly" />
	        <input  type="hidden" name="appname" value="<%=CSApplicationName%>"/>
	        </td>
	        </tr>
	        <tr>
	        <td  style="text-align: right;">Current Version :</td>
	        <td style="text-align:left;"><input type="text" style="width: 15em" name="CCversion" value="<%=CCversion%>" readonly="readonly"/></td>
	        </tr>
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
		HCversion=rs100.getString("H_CurrentVersion");
		Hpatchchange=rs100.getString("H_patch_change");%>
			
	        <td  style="text-align: right;">Hardware Category :</td>
	        <td style="text-align:left;"><input type="text" style="width: 15em" name="Hname" value="<%=Hname%>" readonly="readonly"/>
	        <input type="hidden" name="appname" value="<%=Hname%>"/>
	        </td>
	        </tr>
	        <tr>
	        <td  style="text-align: right;">Hardware Sub_Category:</td>
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
		  rs1 = st1.executeQuery("SELECT * From auditform_item where form_no='"+req+"'  ORDER BY `id` ASC");
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
			  levelno= rs1.getString("levelno")==null?"0":rs1.getString("levelno");
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
	cn2=con.getConnection2();
			  st2=cn2.createStatement();
			  rs2=st2.executeQuery("SELECT * FROM `file_paths` WHERE form_no='"+req+"' And empid='"+emp_no+"' And Path Not Like '%Final%'");
			 while(rs2.next()){
				 size++;
			 Ifilename1=rs2.getString("filename");
			  Ipath1=rs2.getString("Path"); 
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
	
	
	<% 
	
	System.out.println("The Value Of F1"+f1+f2+f3);
	cn7 = con.getConnection2();
	st7=cn7.createStatement();
	rs7 = st7.executeQuery("select levelno from branch_requirements  WHERE form_no='"+req+"' And Status='Pending' And empid='"+EmpNo+"' And levelno IS NOT NULL"); 
	while(rs7.next()){
	Phase=rs7.getString(1);
	}
	System.out.println("The Value Of Phase"+Phase);
	System.out.println("The Value Of levelno...."+levelno);
	
	
	
	
	
	
	
	
	if(Type!=null && Type.equals("Hardware") && levelno.equals("0")){
		f2=0;
		 cn6=con.getConnection2();
		    st6=cn6.createStatement();
		    rs6=st6.executeQuery("Select * From Branch_IT where Type in('Hardware','Hardware1')");
	%>
	
	<tr bgcolor='lightgrey'>
	<td align="left" colspan='6'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Hradio" id="Hradio" value="Approved" onclick="return(showHA());"/>Approved 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Hradio" id="Hradio" value="Not Approved" onclick="return(hideHA());" />Not Approved
	</td>
	</tr>
	<tr style="display: none;" id="Hid" bgcolor='lightgrey'>
	<td width="300" colspan="2">
	IT Admin:<select  name="ITadmin"  id="ITadmin" onchange="sendInfo(this.value)">    
	<option value="">SELECT</option> 
	<%while(rs6.next()){ %> 
	<option value="<%=rs6.getString("empid")%>"><%=rs6.getString("empname")%> </option>
	<%} %>	 
	</select>
	</td>
	<td width="283" colspan="2">Start Date:<input type="text"    name="HSdate" style="width: 6em"  id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	<td width="281" colspan="2">Completion Date:<input type="text"    name="HEdate" style="width: 6em" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	</tr>
	     
	       
	<tr style="display: none;" id="Hid1">	   
	<td width="895" bgcolor='lightgrey' colspan='6'>Send To IT-Admin<br>
	<input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
	</td>
	</tr>
	   	             
	                                        <!-- <input type="hidden" name="flowtype" id="idflowtype" value="Selecting" readonly/> -->
	                                       <input type="hidden" name="iddevname" id="iddevname" value="" readonly/> 
	                                       <input type="hidden" name="iddevdesg" id="iddevdesg" value="" readonly/>
	                                       <input type="hidden" name="iddevmail" id="iddevmail" value="" readonly/>
	                                       <input type="hidden" name="iddevempid" id="iddevempid" value="" readonly/>
	                                       <input type="hidden" name="dlevelno" id="dlevelno" value="1" readonly/>
	
	<%}
	
	%>
	
	
	
	
	
	<%
	
	if(Type!=null && Type.equals("Hardware") && levelno.equals("1")){
		f2=0;
	%>
	
	<tr>
	<td align="center" bgcolor="grey" colspan="6"><h3>HARDWARE STATUS</h3></td>
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
	<%} %>	
	
	<tr bgcolor='lightgrey'>
	<td align="left" colspan='6'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="HCradio" id="HCradio" value="Approved" onclick="return(showH());"/>Completed 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="HCradio" id="HCradio" value="Not Approved" onclick="return(hideH());" />Not Completed
	</td>
	</tr>
	
	
	<tr style="display: none;" id="ConfigTest" bgcolor='lightgrey'>
	<td colspan="1">Configuration Tested</td>
	<td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="config" id="config" value="Yes" onclick="return(configyes());"/>Yes
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="config" id="config" value="No" onclick="return(configno());"/>No
	 </td>
	</tr>
	
	
	<tr style="display: none;" id="issues" bgcolor='lightgrey'>
	<td colspan="1">Any Issues</td>
	<td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="issue" id="issue" value="Yes" onclick="return(issuesyes());"/>Yes
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="issue" id="issue" value="No" onclick="return(issuesno());"/>No
	</td>
	</tr>
	<tr style="display: none;" id="ConfigIssuesYes" bgcolor='lightgrey'>
	<td colspan="2">Issue:<textarea name="configissues" rows="2" cols="30"></textarea></td>
	<td colspan="2">Start_Date:<input type="text" name="ci_Sdate" id="ci_Sdate" onclick="showCalendarControl(this)" readonly="readonly"/></td>
	<td colspan="2">Completion_Date:<input type="text" name="ci_Edate" id="ci_Edate" onclick="showCalendarControl(this)" readonly="readonly"/></td>
	</tr>
	
	
	<tr style="display: none;" id="HC" bgcolor='lightgrey'>
	<td colspan="1">Expiry/Renewal Date:<input type="text" name="ExDate" id="ExDate" onclick="showCalendarControl(this)" readonly="readonly"/></td>
	<td colspan="1">Current Version:<input type="text" name="hcv" id="hcv"/></td>
	<td colspan="1">Updated Version:<input type="text" name="huv" id="huv"/></td>
	<td colspan="3">Patch:<textarea name="patch" rows="2" cols="50"></textarea></td>
	
	</tr>
	<tr style="display: none;" id="HNC" bgcolor='lightgrey'>
	<td colspan="6">Completion Date:<input type="text" name="hardCD" style="width: 6em" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	</tr>
	<tr style="display: none;" id="configNo" bgcolor='lightgrey'>
	<td colspan="3">Start_Date:<input type="text" name="Config_Sdate" id="Config_Sdate" onclick="showCalendarControl(this)" readonly="readonly"/></td>
	<td colspan="3">Completion_Date:<input type="text" name="Config_Edate" id="Config_Edate" onclick="showCalendarControl(this)" readonly="readonly"/></td>
	</tr>
	 <input type="hidden" name="dlevelno" id="dlevelno" value="2" readonly/>
	<%	
	}
	%>
	
	<%
	
	if(t.equals("upload")){
		  if(Phase!=null && Phase.equals("00")){
			  f2=0;
	
		System.out.println("It Phase");
		
		cn8=con.getConnection2();
		st8=cn8.createStatement();
		rs8=st8.executeQuery("select form_no,desg,emp,Status,remarks,Date,Mail,empid,levelno from branch_requirements WHERE form_no='"+req+"' And empid ='"+EmpNo+"' And levelno IS NOT NULL");	
		while(rs8.next()){
			itemp=rs8.getString("emp");
			itdesg=rs8.getString("desg");
			itStatus=rs8.getString("Status");
			itRemarks=rs8.getString("remarks");
			itDate=rs8.getString("Date"); 
			
		
		%>
	<tr>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itemp%></font>
	<input id="idStatus" type="hidden" value="<%=itStatus%>"/>
	</td>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itdesg%></font></td>
	<%if(itStatus.equals("Completed")){ %>
	<td bgcolor="green" width="100"><font size="2" color="black"><%=itStatus%></font></td>
	<%}else if(itStatus.equals("Pending")){ %>
	<td bgcolor="orange" width="100"><font size="2" color="black"><%=itStatus%></font></td>
	<%}else{ %>
	<td bgcolor="yellow" width="100"><font size="2" color="black"><%=itStatus%></font></td>
	<%} %>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itRemarks%></font></td>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itDate%></font></td> 
	 <%} %> 
	</tr>
	
	<div  id='Kpdetails'>
	<table class="dynatable" width="895" style="margin-left: auto;margin-right: auto;" align="center" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<input id="len" name="pCount" type="hidden" value=""/>
	<tr>
					    <td width="67" align="center"  height="21" ><button class="add" type='button'>ADD</button></td>
					    <td width="77" align="center"  height="21" >SL.NO</td>
					    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>EMPLOYEE ID</td>
					    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>NAME</td>
					    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>DESIGNATION</td>	
					    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>MAIL</td>	
					    </tr>
	<tr class="prototype">
	<td width="67" align="center"  height="21" >
	   
	
	<button class="remove" type='button'>Remove</button></td>
	<td width="77" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly"/></td>
	<td width="67" align="center"><input type="text" class="eid" name="eid" id="eid"   onkeyup="sendInfo1(this.value,this.id);"  /></td>
	<td width="67" align="center"><input type="text" class="ename" name="ename" id="ename" readonly="readonly" /></td>
	<td width="67" align="center"><input type="text" class="edesg" name="edesg" id="edesg"  readonly="readonly"/></td>
	<td width="67" align="center"><input type="text"  class="email" name="email" id="email" readonly="readonly"/></td>
	
	</tr>
	
	 <tr style="visibility: hidden; display: none;">
	  <td>
	 <input type="hidden" name="phase" value="00"/> 
	  </td>
	  </tr>
	  
	
	 <%
	}%>
	
	
	<%	  
	if(Phase!=null && Phase.equals("01")){
		
		f2=1;
		
	System.out.println("KP Phase");
	cn8=con.getConnection2();
	st8=cn8.createStatement();
	rs8=st8.executeQuery("select form_no,desg,emp,Status,remarks,Date,Mail,empid,levelno from branch_requirements WHERE form_no='"+req+"' And Branch='"+Sessionb_no+"'  ORDER BY `id` ASC ");	
	while(rs8.next()){
		itemp=rs8.getString("emp");
		itdesg=rs8.getString("desg");
		itStatus=rs8.getString("Status");
		itRemarks=rs8.getString("remarks");
		itDate=rs8.getString("Date");
	%>
	<tr>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itemp%></font>
	<input id="idStatus" type="hidden" value="<%=itStatus%>"/>
	
	</td>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itdesg%></font></td>
	<%if(itStatus.equals("Completed")){ %>
	<td bgcolor="green" width="100"><font size="2" color="black"><%=itStatus%></font></td>
	<%}else if(itStatus.equals("Pending")){ %>
	<td bgcolor="orange" width="100"><font size="2" color="black"><%=itStatus%></font></td>
	<%}else{ %>
	<td bgcolor="yellow" width="100"><font size="2" color="black"><%=itStatus%></font></td>
	<%} %>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itRemarks%></font></td>
	<td bgcolor="white" width="100"><font size="2" color="black"><%=itDate%></font></td>
	<%} %> 
	</tr>
	
	<tr bgcolor='lightgrey' ><td colspan="6">SUGGESTIONS / FEEDBACK:
			<div style="overflow:auto;">
		    <textarea  name="feedback"  rows="2" cols="120"></textarea></div></td>
		    
	  </tr>
	  </table>
	<table class="dynatable1" width="895" style="margin-left: auto;margin-right: auto;" align="center" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
					    <td width="67" align="center"  height="21" ><button class="add" type='button'>Add</button></td>
					    <td width="77" align="center"  height="21" >Sl No</td>
					    <td width="67" align="center"  height="21" >Attachments</td>	
					    </tr>
	<tr class="prototype1">
	<td width="67" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>
	<td width="77" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly"/></td>
	<td width="67" align="center"><input type="file"  name="Rfile" id="file"  /></td>
	
	</tr>
	
	 <tr style="visibility: hidden; display: none;">
	  <td>
	  <input type="hidden" name="phase" value="01"/>
	  </td>
	  </tr>
	 <%} 
	%> 
	</table>
	 <%
	 if(Phase!=null && Phase.equals("02")){
		 f2=0;
	
		 System.out.println("Final requirements upload");%>
	
	<table width="895" style="margin-left: auto;margin-right: auto;" align="center">  
	<tr>
	<td><font color=red>*</font>File:</td>
	<td><input type="file" name="finalfile"/></td>
	</tr>
	          
	        <tr>
	        <td><b><font color=red>*</font>Send To RO:</b>
		<br /> </td>
	           <td> 
	              <input align="left" type="radio" value="" id="iddeptadminP1" name="RoDetail" onclick="sendInfo2(emp_code.value)"/>
	              <input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
	              <input type="hidden" name="mail1" id="iddeptadminP" value="" size="50"/>
	   	       </td>
	       </tr>
	        <tr>                           <input type="hidden" name="Roempid1" id="Roempid1" value="" readonly/>
	                                       <input type="hidden" name="Roname" id="Roname" value="" readonly/> 
	                                       <input type="hidden" name="Rodesg" id="Rodesg" value="" readonly/>
	                                       <input type="hidden" name="Romail" id="Romail" value="" readonly/>
	                                       <input type="hidden" name="Rolevelno" id="Rolevelno" value="" readonly/>
	                                       <input type="hidden" name="phase" value="02"/>
	      </tr>
	      
	                      
	
	
	</table>
	<% 
	
	 }
	}	
	%> 
	
	
	
	<!-- Development Details -->
	<%
	level=Integer.parseInt(levelno);
	if(level>=102 && Type.equals("Software")) {%>
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
		
			
	<%} %>		  
			  
	</table>		 
	<%
	
	 } 
	  
	%>
	
	 <!-- Development Details ends-->
	 
	 
	 
	 
		  
		  
		  
	
	 
	<%
	String flag = C2ITUtil1.getAuthorizedNameAudit(form10_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),EmpNo); %>
	<%System.out.println("FLAG value --------------------- : "+flag);
	
	
	%> 
	<table  width="895"   style="margin-left: auto;margin-right: auto;" align="center" bgcolor="#F0F0F0">
	      <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
	      <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
	      <input type="hidden" value="<%= session.getAttribute("form10_no") %>" id="idmrId"/>
	      <input type="hidden" id="idstatus" value="<%= flag %>" />
	   
	<%
	System.out.println("levellllllllll"+level);
	System.out.println("Softwreeeeeeee"+Type);
	System.out.println("Phaseeeeeeeeee"+Phase);
	System.out.println(level<99);
	System.out.println(Type.equals("Software"));
	System.out.println(Phase=="00");
	
	
	
	
	if(level<99 && Type.equals("Software") && Phase==null){ %>
	<tr bgcolor='lightgrey'>
	<td align="left" colspan='3'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(showTR());"/>Approved 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR());" />Not Approved
	</td>
	</tr>
	  <%}
	 %>
	    
	   <tr style="visibility: hidden;display: none;" id="idApprovedd" >
	     <%ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
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
	    
	    
	    cn7 = con.getConnection2();
	    st7=cn7.createStatement();
	    rs7= st7.executeQuery("SELECT * From auditform_item where levelno='"+level+"' And form_no='"+req+"'");  
	    
	    
	     cn1 = con.getConnection2();
		 st12=cn1.createStatement();
		 rs12= st12.executeQuery("SELECT max(levelno) FROM formapproval WHERE branch='"+branch_no+"' and formtype='Audit_Form'  ORDER BY levelno ASC");
	     if(rs12.next())
	         { 
	         maxlevel=rs12.getString(1);
	         }
	     System.out.println("Max Level no :"+maxlevel);
	     String allopt="",dirappro="";
	     st11 = cn1.createStatement();  
	     rs11 = st11.executeQuery("SELECT alloptions,directApprove FROM formapproval WHERE branch='"+branch_no+"' and empid='"+emp_no+"' and formtype='Audit_Form'");
	     if(rs11.next())
	         { 
	         allopt=rs11.getString(1);
	         dirappro=rs11.getString(2);
	         }
	     int nextlevel=0;
	     st5 = cn5.createStatement(); 
	     System.out.println("Current Level no :"+levelno);
	     if(!levelno.equals("Creater"))
	         nextlevel=Integer.parseInt(levelno)+1;
	    String nextemp="";
	      stnext = cn5.createStatement(); 
	      rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='"+branch_no+"' and levelno='"+nextlevel+"' and formtype='Audit_Form' ORDER BY levelno ASC");
	      if(rsnext.next())
	           {
	    	   nextemp=rsnext.getString(5);
	           }
	      if(emp_no.equals(nextemp))
	          {
	    	  nextlevel++;
	          }
	    
	     
	     
	     if(allopt.equals("0") || allopt.equals(""))
	           {
	    	  if(!levelno.equals(maxlevel))
		         {
	    		  if(Phase==null){
	    		   f2=0; 
	    		  }
	    		 System.out.println("Next  Level no :"+level);
	    	     rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+branch_no+"' and levelno='"+nextlevel+"' and formtype='Audit_Form' ORDER BY levelno ASC");
	    	     if(rs5.next() && Phase==null)
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
	   	              </tr>
	   	            
	            
	                                       <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
	                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
	                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
	                                       <input type="hidden" name="mail1" id="idromail" value="" readonly/>
	                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
	                                       <input type="hidden" name="flowtype" id="idflowtype" value="Normal" readonly/>
	               <%
	                
	               
	 }else if(level==99){
		 f2=1;
		 level++;
		 System.out.println("Developer Uploading Files");
	                
	%>
	
	<table class="dynatable2" width="895" style="margin-left: auto;margin-right: auto;" align="center" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
					    <td width="67" align="center"  height="21" ><button class="add" type='button'>Add</button></td>
					    <td width="77" align="center"  height="21" >Sl No</td>
					    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Attachments</td>	
					    </tr>
	<tr class="prototype2">
	<td width="67" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>
	<td width="77" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly"/></td>
	<td width="67" align="center"><input type="file"  name="devfile" id="devfile" /></td>
	</tr>
	<input type="hidden" name="flowtype" id="idflowtype" value="Selecting" readonly/>
	 <tr style="visibility: hidden; display: none;">
	  <td>
	  
	  </td>
	  </tr>
	 
	</table>               
	 
	  <%
	 System.out.println("the t value is"+t); 
	 }else if(level==100 && t.equals("upload")){ 
	 f2=1;
	 level++;
	 %>
	
	<tr>
	<td align="left" colspan="4">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="DIfiles" id="DIfiles" value="Suggestions" onclick="return(sug());"/>Suggestions 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="DIfiles" id="DIfiles" value="No Suggestions" onclick="return(sug1());"/>No Suggestions
	</td>
	</tr>
	<tr style="display: none;" id="DUFC" >
	<td colspan="1" width="50"><font size='3'>Changes</font></td>
	<td><textarea name="DIchanges" rows="2" cols="100"></textarea>
	</td>
	</tr> 
	    
	
	 <%
	                
	               
	 }else if(level==101){
		 f2=1;
		 level++;
		 System.out.println("Developer Uploading Final  Files");
	                
	%>
	<tr>
	<td>
	<table class="dynatable4" width="895" style="margin-left: auto;margin-right: auto;" align="center" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
					    <td width="67" align="center"  height="21" ><button class="add" type='button'>Add</button></td>
					    <td width="77" align="center"  height="21" >Sl No</td>
					    <td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Attachments</td>	
					    </tr>
	<tr class="prototype4">
	<td width="67" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>
	<td width="77" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly"/></td>
	<td width="67" align="center"><input type="file"  name="finaldevfile" id="finaldevfile"  /></td>
	</tr>
	<input type="hidden" name="flowtype" id="idflowtype" value="Selecting" readonly/>
	<input type="hidden" name="dlevelno" id="dlevelno" value="<%=level%>" readonly/>
	 <tr style="visibility: hidden; display: none;">
	  <td>
	  
	  </td>
	  </tr>
	 
	</table>               
	  </td>
	  </tr> 
	
	
	
	            
	<%               
	  }else if(level==102)
		             {
		  f2=0;
		  level++;
	System.out.println("Developer Part"+level);
	%>     
	<tr>
	<td align="left" colspan="4">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Developing" id="Developing" value="Testing" onclick="return(testing());"/>Completed 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Developing" id="Developing" value="Developing" onclick="return(testing1());"/>Not Completed
	</td>
	</tr>
	<input type="hidden" name="devPhase" id="devPhase" value="d102" readonly/>    
	<%
	
	}else if(level==103){
		level++;
		f2=0;
		System.out.println("Testing Part");
	/* 	cn1 = con.getConnection2();
		st12=cn1.createStatement();
		rs12= st12.executeQuery("SELECT * From auditform_item where levelno='"+level+"' And form_no='"+req+"'"); */
			
		
		%>
	
	
	
	<tr>
	<td align="left" colspan="6">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Testing" id="Testing" value="UAT" onclick="return(UAT());"/>Completed 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Testing" id="Testing" value="Testing" onclick="return(UAT1());"/>Not Completed
	</td>
	</tr>
	<input type="hidden" name="devPhase" id="devPhase" value="d103" readonly/>
	<tr style="display: none;" id="UAT">
	<td colspan="2" width="150"><h2>UAT</h2></td>
	<td width="280" colspan="2">Start Date:<input type="text"    name="USdate" style="width: 6em"  id="USdate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	<td width="281" colspan="2">Completion Date:<input type="text"    name="UEdate" style="width: 6em" id="UEdate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	</tr>
	<tr style="display: none;" id="TestServer">
	 <td colspan="3">Test Server Link:
	 <textarea  name="TLink"  rows="2" cols="60"></textarea></td>
	<td width="280">User Name:<input type="text"    name="uname" style="width: 6em"  id="uname"/></td>
	<td width="280">Password:<input type="text"    name="upass" style="width: 6em"  id="upass"/></td>  			        
	 </tr>
	
	<tr style="display: none;" id="Treason">
	<td>Completion Date:<input type="text"    name="TDelaydate" style="width: 6em" id="TDelaydate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	</tr>
	<%         	  
	}else if(level==104 && t.equals("uat")){
		f2=1;
	System.out.println("Changes Level");
	cn7=con.getConnection2();
	st7=cn7.createStatement();
	rs7=st7.executeQuery("Select Test_Server_link From development_status where form_no='"+req+"' AND Stage='UAT' ");
	while(rs7.next()){
		TestServer=rs7.getString(1);
		
	}%>
	 
	<tr>
	<td colspan="6"><font size='3'>Test Server Link:</font><a href="<%=TestServer%>" target="_blank"><%=TestServer%></a></td>
	</tr>
	<tr>
	<td colspan="1" width="50"><font size='3'>Changes/Feedback</font></td>
	<td><textarea name="uatChanges" rows="2" cols="100"></textarea>
	<input type="hidden" name="HiddenChanges" value="uatChanges"/>
	<input type="hidden" name="devPhase" id="devPhase" value="d104"/>
	</td>
	</tr>
	        	  
	 <%        }else if(level==105){
		 System.out.println("The level is 105");
		 level++;
		 f2=1;
	 	
		
		%>
	
	
	<tr>
	<td align="left" colspan="6">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="UChang" id="UChang" value="Changes" onclick="return(ChanDev());"/>Changes 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="UChang" id="UChang" value="No Changes" onclick="return(ChanDev1());"/>No Changes
	</td>
	</tr>
	<tr style="display: none;" id="ChangesDev">
	<td colspan="1" width="150"><h4>CHANGES DEVELOPMENT</h4></td>
	<td width="280">Start Date:<input type="text"    name="CDSdate" style="width: 6em"  id="CDSdate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	<td width="281">Completion Date:<input type="text"    name="CDEdate" style="width: 6em" id="CDEdate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	</tr>	 
	<input type="hidden" name="devPhase" id="devPhase" value="d105"/>	 
		 
		 <%}else if(level==106){
			 level++;
			 f2=0;
	System.out.println("Changes TESTING");	
	
	
	    	     
	    	     %>
	    	     
	<tr>
	<td align="left" colspan="4">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="cDeveloping" id="Developing" value="Testing" onclick="return(testing());"/>Completed 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="cDeveloping" id="Developing" value="Developing" onclick="return(testing1());"/>Not Completed
	</td>
	</tr>
	<input type="hidden" name="devPhase" id="devPhase" value="d106"/>
			 
			 <%	 }else if(level==107){
				 level++;
				 f2=0;
				 
		%>
	<tr>
	<td align="left" colspan="4">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Versions" id="Versions" value="Versions" onclick="return(version());"/>Completed 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Versions" id="Versions" value="Testing" onclick="return(version1());"/>Not Completed
	</td>
	</tr>
	
	<tr style="display: none;" id="CTreason">
	<td width="281">Completion Date:<input type="text"    name="CTEdate" style="width: 6em" id="CTEdate" onclick="showCalendarControl(this)" readonly="readonly"/></td>			        
	</tr>
	<input type="hidden" name="devPhase" id="devPhase" value="d107"/>
			 
	<%	
			 
			 }else if(level==108){
				 level++;
				 f2=0;
			 
				 System.out.println("Live");
				 
	%> 
	<tr>
	<td style="text-align: right" colspan="1"><h3>LIVE</h3></td>
	<td style="text-align: left" colspan="5">Server Link:<textarea  name="psLink"  rows="2" cols="100"></textarea></td>			        
	<input type="hidden" name="live" id="live" value="live"/>
	</tr>
	<tr>
	<td style="text-align: right" colspan="1" >Owner Of Project</td>
	<td style="text-align: left" colspan="2"><input type="text" name="owner" style="width: 15em"  id="owner"/></td>
	<td style="text-align: right" colspan="1">Team Size</td>
	<td style="text-align: left" colspan="2"><input type="text" name="team" style="width: 15em"  id="team"/></td>
	</tr>
	<tr>
	<td style="text-align: right" colspan="1">Requested By</td>
	<td style="text-align: left" colspan="2"><input type="text" name="ReqBy" style="width: 15em"  id="ReqBy"/></td>
	<td  style="text-align: right" colspan="1">Approved By</td>
	<td style="text-align: left" colspan="2"><input type="text" name="IniBy" style="width: 15em"  id="IniBy"/></td>
	</tr>			
	<input type="hidden" name="devPhase" id="devPhase" value="d108"/>
	
		 	 
	<%		 		 
		              }else{
		            	  
		              }
		         }
	               else
	                  {
	            	   System.out.println("rd");
	            	   if(Phase==null){
	            	   
	            	   f2=0;
	            	   System.out.println("Selecting Developer.............");
	    cn6=con.getConnection2();
	    st6=cn6.createStatement();
	    rs6=st6.executeQuery("Select * From Branch_IT where Type='Software'");
	            	   %>
	            	   
	<tr style="display: none;" id="idA" bgcolor='lightgrey'>
	<td width="300">
	Developer:<select  name="Developer"  id="developer" onchange="sendInfo(this.value)">    
	<option value="">SELECT</option> 
	<%while(rs6.next()){ %> 
	<option value="<%=rs6.getString("empid")%>"><%=rs6.getString("empname")%> </option>
	<%} %>	 
	</select>
	</td>
	<td width="283">Start Date:<input type="text"    name="date1" style="width: 6em"  id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	<td width="281">Compilation Date:<input type="text"    name="date11" style="width: 6em" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	</tr>
	        
	       
	<tr style="display: none;" id="idA1">	   
	<td width="895" bgcolor='lightgrey' colspan='3'>Send To Developer<br>
	<input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
	</td>
	</tr>
	   	             
	                                        <input type="hidden" name="flowtype" id="idflowtype" value="Selecting" readonly/>
	                                       <input type="hidden" name="iddevname" id="iddevname" value="" readonly/> 
	                                       <input type="hidden" name="iddevdesg" id="iddevdesg" value="" readonly/>
	                                       <input type="hidden" name="iddevmail" id="iddevmail" value="" readonly/>
	                                       <input type="hidden" name="iddevempid" id="iddevempid" value="" readonly/>
	                                       <input type="hidden" name="dlevelno" id="dlevelno" value="99" readonly/>
	                <%}
	                }
	              
	          }
	
	                %>
	              
	  
	
	<tr style="display: none;" id="Testing">
	<td colspan="1" width="150"><h2>Testing</h2></td>
	<td width="280">Start Date:<input type="text"    name="TSdate" style="width: 6em"  id="TSdate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	<td width="281">Completion Date:<input type="text"    name="TEdate" style="width: 6em" id="TEdate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	</tr>
	
	<tr style="display: none;" id="NotReason">
	<td>Completion Date:<input type="text"    name="DDelaydate" style="width: 6em" id="DDelaydate" onclick="showCalendarControl(this)" readonly="readonly"/></td> 			        
	</tr>
	
	
	  
	
	<tr style="display: none;" id="version">
	<td colspan="1" width="150"><h3>VERSION</h3></td>
	<%if(Subtype!=null && Subtype.equals("New")){ %>
	<td width="280">Current Version:<input type="text"    name="cVersion" style="width: 6em"  id="cVersion" /></td>
	<%
	}
	if(Subtype!=null && Subtype.equals("Changes")){ %>
	<td width="280">Current Version:<input type="text"    name="cVersion" style="width: 6em"  id="cVersion" value="<%=CCversion%>" readonly/></td>
	<td width="281">Updated Version:<input type="text"    name="uVersion" style="width: 6em" id="uVersion" /></td> 
	<%} %>				        
	</tr> 
	  
	  <%
	  
	  if(level>=99){
	  while(rs7.next()){
			String empid=rs7.getString("empid");
			String empname=rs7.getString("emp");
			String empdesg=rs7.getString("desg");
			String empmail=rs7.getString("Mail");
			String emplevel=rs7.getString("levelno"); %>
	  
	 <input type="hidden" name="iddevempid" id="iddevempid" value="<%=empid%>" readonly/>
	             <input type="hidden" name="iddevname" id="iddevname" value="<%=empname %>" readonly/> 
	             <input type="hidden" name="iddevdesg" id="iddevdesg" value="<%=empdesg%>" readonly/>
	             <input type="hidden" name="iddevmail" id="iddevmail" value="<%=empmail%>" readonly/>
	             <input type="hidden" name="dlevelno" id="dlevelno" value="<%=level %>" readonly/>		 
	  
	  <%}
	  }
	  

	    Class.forName(driver).newInstance();
	    
	    Connection connhrms1 = null;
	   connhrms1 = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);
	    Statement nstmt1 = connhrms.createStatement();  
	  
	  
	  cn14=con.getConnection2();
	  st14=cn14.createStatement();
	  rs14=st14.executeQuery("SELECT * FROM `branch_it` where Type='Manager'");
	 if(rs14.next()){
		  String mempid=rs14.getString("empid");
		  ResultSet nrs1 = nstmt1.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name,b.branch_type_code,d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs14.getString("empid") + "' ) AND u.employee_status = 'yes' ");
 	     if(nrs1.next())
 	            {
		  String mempname=nrs1.getString("user_name");
		  String mempdesg=nrs1.getString("role_code");
		  String mempmail=nrs1.getString("email");
	  %>
	
	<input type="hidden" name="mempid" id="mempid" value="<%=mempid%>" readonly/>
	             <input type="hidden" name="mname" id="mname" value="<%=mempname %>" readonly/> 
	             <input type="hidden" name="mdesg" id="mdesg" value="<%=mempdesg%>" readonly/>
	             <input type="hidden" name="mmail" id="mmail" value="<%=mempmail%>" readonly/>
	            <%}
 	     }%>
	
	
	<%
	System.out.println("hghshsdhshds"+f2);
	if(f2==0){%>
	<tr  align="left"     bgcolor='lightgrey' ><td width="895" colspan="6">REMARKS:
			<div style="overflow:auto;">
		    <textarea  name="txtmail_msg"  rows="2" cols="120"></textarea></div></td>
	  </tr>
	<%} %>
	
	 </table> 
	 
	
	 
		
	<%
	 f2=1;
		      
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
		DbUtil.closeDBResources(rs8,st8,cn8);
		DbUtil.closeDBResources(rs10,st10,cn10);
		DbUtil.closeDBResources(rs11,st11,cn11);
		DbUtil.closeDBResources(rs100,st100,cn100);
		DbUtil.closeDBResources(rs14,st14,cn14);
		DbUtil.closeDBResources(rs15,st15,cn15);
	
	  }
	%>
	
	<br/>
	 <table style="margin-left: auto;margin-right: auto;" align="center" >
	    <tr>
	       <td> <div id="formsubmitbutton"> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate() && ButtonClicked());" /></div>
	      <div id="buttonreplacement" style="display:none;">
		       <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
		       </div> 
	      </td>
	       <td style="size:1">&nbsp;&nbsp;<input type="reset" style="background-color:#2f4377;font-weight:bold;color:white;"  value="RESET"/></td>
	       <td style="font-size:1">&nbsp;&nbsp; <a href="javascript:history.back()">BACK</a></td>
	   	</tr>
	 </table> 
	
		</table>
		</table>
	</td>
	</tr>
	</table>
	</center>
	</div>
	
	
	
	<div id="resultFromAjax3" style="display:none;">
	        
	</div>
	<div id="resultFromAjax2" style="display:none;">
	        
	</div>
	<div id="resultFromAjax1" style="display:none;">
	        
	</div>
	
	
	</form>	
	</body>
	
	</html>