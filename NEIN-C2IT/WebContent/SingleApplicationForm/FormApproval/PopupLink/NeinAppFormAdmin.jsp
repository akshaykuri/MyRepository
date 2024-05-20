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
<%@page import="java.util.ResourceBundle"%>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Check List</title>
<link rel='stylesheet' type='text/css' href='../../../css/style2.css' />
<script language="javascript" type="text/javascript" src="../../../js/formApprovalColorChange.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../../../css/Calender.css" title="style" />
<script language="javascript" type="text/javascript" src="../../../js/Calendar.js"></script>
<script language="javascript" type="text/javascript" src="../../../js/onSubmitWait.js"></script>
<!-- Help Page pop up starts-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../../../css/FormsHelp.css" title="style" />
<script language="javascript" type="text/javascript" src="../../../js/FormsHelp.js"></script>
<!-- Help Page pop up ends -->

<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("../../../adminlink.jsp?msg="+msg);
}
%>

<script type="text/javascript">
function chkNewinsProg(obj){	
var chk = document.getElementById("text").value;
var chkd= obj;
chk += chkd;
document.getElementById("text").value=chk;
}
</script>

 <script>
 function checkAddress(str)
      {
      var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
      if (re.test(str)) return false;
         return true;
       }
 function checkNumber(string)
      {
      var numericExpression = /^[0-9]+$/;
      if(string.match(numericExpression)) 
          {
          return true;
          }
      else
          {
          return false;
          }
     }
 </script>
 <script>
 
function validate()
{
	try{
	 var clvl = document.form.clvl.value;
	 var clarifyCol = document.form.clarifyCol.value;
     var d1 = document.form.txtmail_msg;
     var d2 = document.form.mail1;
     var sendopt=document.form.senddirect;
     var reqFor=document.form.requestForCheck;
     var clarLen=document.getElementsByName("mailingCheckClarificationStart");
     
     if((document.getElementById("newUser").value=="33") && (reqFor[5].checked==true)){
 	    var d1 = document.form.CheckValues;
     }

     if(document.getElementById("newUser").value=="33"  && (reqFor[5].checked==true)){
     if(((document.form.newinsLevel.value==null)||(document.form.newinsLevel.value=="NULL")||(document.form.newinsLevel.value=="")) && (document.getElementById("newUser").value=="33") && (reqFor[5].checked==true)){
	 	  alert("Please Enter NEWINS Level!");
	 	  document.form.newinsLevel.focus();
	 	  return false;
     }

     if(((d1.value==null)||(d1.value=="NULL")||(d1.value=="")) && (document.getElementById("newUser").value=="33") && (reqFor[5].checked==true)){
	 	  alert("Select Programs to be Added and Blocked !");
	      d1.focus();
	 	  return false;
     }
     }
     
  	if(clvl=="Creater" || clvl=="00" || clarifyCol=="2"){
 	 if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
 	      {
 	          alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
 	          document.getElementsByName("mmdradio")[0].focus();
 	          return false;
           }
  	}else{
  		 if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[2].checked && !document.getElementsByName("mmdradio")[1].checked) 
       	 {
 	         alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
 	         document.getElementsByName("mmdradio")[0].focus();
 	         return false;
          }
  	}
  	var clarCond = 0;
  	if(clvl!="Creater" && clvl!="00" && clarifyCol!="2"){
      if (document.getElementsByName("mmdradio")[2].checked)
 	        {
     	 		for(let zzzz=0; zzzz<clarLen.length; zzzz++){
      	 			if(clarLen[zzzz].checked){
     	 				clarCond = 1;	
      	 			}
     	 		}
     	 		if(clarCond==0){
 				        alert("Select from whome Clarification Required..");
 				        document.getElementsByName("mailingCheckClarificationStart")[0].focus();
 			 		    return false;
     	 		}
 	        }
  	}
     if(sendopt.value=="senddirect")
    	 {
         if (document.getElementsByName("mmdradio")[0].checked)
	         {
	        if (!document.getElementsByName("higherAuthority")[0].checked && !document.getElementsByName("higherAuthority")[1].checked) 
	  		  {  
		      alert("Select Radio Button \n \n For selecting next  Or  approval of Approval Routine \n \n  Else Can not Proceed Further..");
		      document.getElementsByName("higherAuthority")[0].focus();
      		  return false;
	  		  }
	        }
         if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[0].checked && !document.getElementsByName("iddeptadminP1")[0].checked)
	        {
	   	        alert("Select next approver...");
	   	        document.getElementsByName("iddeptadminP1")[0].focus();
   		    	return false;
	        }
           if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[1].checked )
	           {
if(reqFor[0].checked){
   	   var emailID 			= document.form.emailID;
       var passEmail 		= document.form.passEmail;
       var intAcc 			= document.form.intAcc;
       var emailAppRemarks 	= document.form.emailAppRemarks;
       if(emailID.value=="" || emailID.value==null)
       {
       		alert("Please Enter E-Mail ID Created!");
       		emailID.focus();
       		return false;
       }
       if(passEmail.value=="" || passEmail.value==null)
       {
       		alert("Please Enter Email ID Password!");
       		passEmail.focus();
       		return false;
       }
       if((intAcc[0].checked == false) && (intAcc[1].checked == false)){
       	    alert("Please Select Intune Access Provided!");
       	 	intAcc[0].focus();
       	    return false;
       }
       if(emailAppRemarks.value=="" || emailAppRemarks.value==null)
       {
       	    alert("Please Enter Email Remarks!");
       	 	emailAppRemarks.focus();
       	    return false;
       }
}
if(reqFor[1].checked){
   	   var itname = document.form.ITusername;
       var itpwd = document.form.ITpassword;
       var remar = document.form.ITremark;
       if(itname.value==""||itname.value==null)
       {
       		alert("Please Enter Domain Account!");
       		itname.focus();
       		return false;
       }
       if(itpwd.value==""||itpwd.value==null)
       {
       		alert("Please Enter Password!");
       		itpwd.focus();
       		return false;
       }
       if(remar.value==""||remar.value==null)
       {
       	    alert("Please Enter Domain Remarks!");
       	    remar.focus();
       	    return false;
       }
}
if(reqFor[2].checked){
	   var remar = document.form.bioRemark;
	  if(remar.value==""||remar.value==null)
		    {
		    alert("Please Enter BioMetric / Access Card Remarks!");
		    remar.focus();
		    return false;
		    }
}
if(reqFor[3].checked){
	   var remar = document.form.shaRemark;
	  if(remar.value==""||remar.value==null)
		    {
		    alert("Please Enter Shared Folder Access Remarks!");
		    remar.focus();
		    return false;
		    }
}
if(reqFor[4].checked){
	  var remar = document.form.intRemark;
	  if(remar.value==""||remar.value==null)
		    {
		    alert("Please Enter Internet Access / FTP Access Remarks!");
		    remar.focus();
		    return false;
		    }
}
if(reqFor[5].checked){
	  var ITdcode = document.form.ITdcode;
	  var ITdpassword = document.form.ITdpassword;
	  var ITdlevel = document.form.ITdlevel;
	  var gname = document.form.gname;
	  var accessbr = document.form.accessbr;
	  var CheckValues = document.form.CheckValues;
	  var ITdremark = document.form.ITdremark;
      if((ITdcode.value==null) || (ITdcode.value=="")){
          alert("Please Enter NEWINS Operator Code!");
          ITdcode.focus();
          return false;
      }
      if((ITdpassword.value==null) || (ITdpassword.value=="")){
          alert("Please Enter NEWINS Password!");
          ITdpassword.focus();
          return false;
      }
      if((ITdlevel.value==null) || (ITdlevel.value=="")){
          alert("Please Enter NEWINS Level!");
          ITdlevel.focus();
          return false;
      }
/*       if((gname.value==null) || (gname.value=="")){
          alert("Please Select NEWINS Group!");
          gname[0].focus();
          return false;
      } */
      if((accessbr[0].checked == false) && (accessbr[1].checked == false)){
          alert("Please Select Access Provided to Branches! \n \n Yes / No");
          accessbr[0].focus();
          return false;
      }
      if((ITdremark.value == null) || (ITdremark.value == "")){
          alert("Please Enter NEWINS Remarks!");
          ITdremark.focus();
          return false;
      }
}
if(reqFor[6].checked){
	  var nexID = document.form.nexID;
	  var nexPass = document.form.nexPass;
	  var nexRem = document.form.nexRem;
	  if(nexID.value==""||nexID.value==null)
	    {
	    alert("Please Enter NExAS User ID!");
	    nexID.focus();
	    return false;
	    }
	  if(nexPass.value==""||nexPass.value==null)
	    {
	    alert("Please Enter NExAS Password!");
	    nexPass.focus();
	    return false;
	    }
	  if(nexRem.value==""||nexRem.value==null)
	    {
	    alert("Please Enter NExAS Remarks!");
	    nexRem.focus();
	    return false;
	    }
}
if(reqFor[7].checked){
	  var uCode = document.form.uCode;
	  var uPass = document.form.uPass;
	  var gsBCode = document.form.gsBCode;
	  var gsDiv = document.form.gsDiv;
	  var gsPri = document.form.gsPri;
	  var gsUser = document.form.gsUser;
	  var gsRem = document.form.gsRem;
	  if(uCode.value==""||uCode.value==null)
   	  {
   		alert("Please Enter GS-NET User Code!");
   		uCode.focus();
   		return false;
   	  }
	  if(uPass.value==""||uPass.value==null)
   	  {
   		alert("Please Enter GS-NET Password!");
   		uPass.focus();
   		return false;
   	  }
	  
/*	  var bool = true;
	  for(var i=0;i<gsBCode.length;i++){
		  if(document.form.gsBCode[i].checked){
			  bool = false;
		  }
	  }
	  if(bool){
   		alert("Please Select Assigned GS-NET Branch Code!");		  	
   		return false;
	  }
	  
	  var bool1 = true;
	  for(var j=0;j<gsDiv.length;j++){
		  if(document.form.gsDiv[j].checked){
			  bool1 = false;
		  }
	  }
	  if(bool1){
   		alert("Please Select Assigned Division Name!");
   		return false;
	  }
	  
	  var bool2 = true;
	  for(var k=0;k<gsPri.length;k++){
		  if(document.form.gsPri[k].checked){
			  bool2 = false;
		  }
	  }
	  if(bool2){
   		alert("Please Select Assigned Primary Division Name!");
   		return false;
	  }
	  
	  var bool3 = true;
	  for(var l=0;l<gsUser.length;l++){
		  if(document.form.gsUser[l].checked){
			  bool3 = false;
		  }
	  }
	  if(bool3){
   		alert("Please Select Assigned User Role!");
   		return false;
	  }*/

	  if(gsRem.value==""||gsRem.value==null)
   	  {
   		alert("Please Enter GS-NET Remarks!");
   		gsRem.focus();
   		return false;
   	  }
}
if(reqFor[8].checked){
	  var interName = document.form.interName;
	  var interPass = document.form.interPass;
	  var interRem = document.form.interRem;
	  if(interName.value==""||interName.value==null)
	    {
	    alert("Please Enter Internal Application User ID!");
	    interName.focus();
	    return false;
	    }
	  if(interPass.value==""||interPass.value==null)
	    {
	    alert("Please Enter Internal Application Password!");
	    interPass.focus();
	    return false;
	    }
	  if(interRem.value==""||interRem.value==null)
	    {
	    alert("Please Enter Internal Application Remarks!");
	    interRem.focus();
	    return false;
	    }
}
if(reqFor[9].checked){
	  var usbRem = document.form.usbRem;
	  if(usbRem.value==""||usbRem.value==null)
		    {
		    alert("Please Enter USB Access Remarks!");
		    usbRem.focus();
		    return false;
		    }
}
if(reqFor[10].checked){
	  var forti = document.form.forti;
	  if(forti.value=="" || forti.value==null)
		    {
		    alert("Please Enter Forti Token Details for VPN Access!");
		    forti.focus();
		    return false;
		    }
}
	if(reqFor[11].checked){
		  var hardRem = document.form.hardRem;
		  if(hardRem.value=="" || hardRem.value==null)
			    {
			    alert("Please Enter Remarks for HardDisk / PenDrive!");
			  hardRem.focus();
			    return false;
			    }
		}
			if(reqFor[12].checked){
		  var assRem = document.form.assRem;
		  if(assRem.value=="" || assRem.value==null)
			    {
			    alert("Please Enter Remarks for Any Other Asset!");
			  assRem.focus();
			    return false;
			    }
		}
			if(reqFor[13].checked){
				  var glowID = document.form.glowID;
				  var glowPass = document.form.glowPass;
				  var glowAppRemarks = document.form.glowAppRemarks;
				  if(glowID.value=="" || glowID.value==null)
					    {
					    alert("Please Enter User ID for NEx-GLOW!");
					    glowID.focus();
					    return false;
					    }
				  if(glowPass.value=="" || glowPass.value==null)
					    {
					    alert("Please Enter Password for NEx-GLOW!");
					    glowPass.focus();
					    return false;
					    }
				  if(glowAppRemarks.value=="" || glowAppRemarks.value==null)
					    {
					    alert("Please Enter Remarks for NEx-GLOW!");
					    glowAppRemarks.focus();
					    return false;
					    }
			}
	           }
    	 }
    // alert(sendopt.value);//createdomain,sendonly
     if(sendopt.value=="sendonly")
	     {
         if (document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("iddeptadminP1")[0].checked)
	        {
		        alert("Select Next approver Name...");
		        document.getElementsByName("iddeptadminP1")[0].focus();
	   		    return false;
	        }
	     }
     if(sendopt.value=="createdomain")
        {
    	 if (document.getElementsByName("mmdradio")[0].checked)
           {
    		 if(reqFor[0].checked){
    		   	   var emailID 			= document.form.emailID;
    		       var passEmail 		= document.form.passEmail;
    		       var intAcc 			= document.form.intAcc;
    		       var emailAppRemarks 	= document.form.emailAppRemarks;
    		       if(emailID.value==""||emailID.value==null)
    		       {
    		       		alert("Please Enter E-Mail ID Created!");
    		       		emailID.focus();
    		       		return false;
    		       }
    		       if(passEmail.value==""||passEmail.value==null)
    		       {
    		       		alert("Please Enter Email ID Password!");
    		       		passEmail.focus();
    		       		return false;
    		       }
    		       if((intAcc[0].checked == false) && (intAcc[1].checked == false)){
    		       	    alert("Please Enter Intune Access Provided!");
    		       	 	intAcc[0].focus();
    		       	    return false;
    		       }
    		       if(emailAppRemarks.value==""||emailAppRemarks.value==null)
    		       {
    		       	    alert("Please Enter Email Remarks!");
    		       	 	emailAppRemarks.focus();
    		       	    return false;
    		       }
    		}
    		 if(reqFor[1].checked){
    		   	   var itname = document.form.ITusername;
    		       var itpwd = document.form.ITpassword;
    		       var remar = document.form.ITremark;
    		       if(itname.value==""||itname.value==null)
    		       {
    		       		alert("Please Enter Domain Account!");
    		       		itname.focus();
    		       		return false;
    		       }
    		       if(itpwd.value==""||itpwd.value==null)
    		       {
    		       		alert("Please Enter Password!");
    		       		itpwd.focus();
    		       		return false;
    		       }
    		       if(remar.value==""||remar.value==null)
    		       {
    		       	    alert("Please Enter Domain Remarks!");
    		       	    remar.focus();
    		       	    return false;
    		       }
    		}
    		if(reqFor[2].checked){
    			   var remar = document.form.bioRemark;
    			  if(remar.value==""||remar.value==null)
    				    {
    				    alert("Please Enter BioMetric / Access Card Remarks!");
    				    remar.focus();
    				    return false;
    				    }
    		}
    		if(reqFor[3].checked){
    			   var remar = document.form.shaRemark;
    			  if(remar.value==""||remar.value==null)
    				    {
    				    alert("Please Enter Shared Folder Access Remarks!");
    				    remar.focus();
    				    return false;
    				    }
    		}
    		if(reqFor[4].checked){
    			  var remar = document.form.intRemark;
    			  if(remar.value==""||remar.value==null)
    				    {
    				    alert("Please Enter Internet Access / FTP Access Remarks!");
    				    remar.focus();
    				    return false;
    				    }
    		}
    		if(reqFor[5].checked){
    			  var ITdcode = document.form.ITdcode;
    			  var ITdpassword = document.form.ITdpassword;
    			  var ITdlevel = document.form.ITdlevel;
    			  var gname = document.form.gname;
    			  var accessbr = document.form.accessbr;
    			  var CheckValues = document.form.CheckValues;
    			  var ITdremark = document.form.ITdremark;
    		      if((ITdcode.value==null) || (ITdcode.value=="")){
    		          alert("Please Enter NEWINS Operator Code!");
    		          ITdcode.focus();
    		          return false;
    		      }
    		      if((ITdpassword.value==null) || (ITdpassword.value=="")){
    		          alert("Please Enter NEWINS Password!");
    		          ITdpassword.focus();
    		          return false;
    		      }
    		      if((ITdlevel.value==null) || (ITdlevel.value=="")){
    		          alert("Please Enter NEWINS Level!");
    		          ITdlevel.focus();
    		          return false;
    		      }
    		  /*     if((gname.value==null) || (gname.value=="")){
    		          alert("Please Select NEWINS Group!");
    		          gname[0].focus();
    		          return false;
    		      } */
    		      if((accessbr[0].checked == false) && (accessbr[1].checked == false)){
    		          alert("Please Select Access Provided to Branches! \n \n Yes / No");
    		          accessbr[0].focus();
    		          return false;
    		      }
    		      if((ITdremark.value == null) || (ITdremark.value == "")){
    		          alert("Please Enter NEWINS Remarks!");
    		          ITdremark.focus();
    		          return false;
    		      }
    		}
    		if(reqFor[6].checked){
    			  var nexID = document.form.nexID;
    			  var nexPass = document.form.nexPass;
    			  var nexRem = document.form.nexRem;
    			  if(nexID.value==""||nexID.value==null)
    			    {
    			    alert("Please Enter NExAS User ID!");
    			    nexID.focus();
    			    return false;
    			    }
    			  if(nexPass.value==""||nexPass.value==null)
    			    {
    			    alert("Please Enter NExAS Password!");
    			    nexPass.focus();
    			    return false;
    			    }
    			  if(nexRem.value==""||nexRem.value==null)
    			    {
    			    alert("Please Enter NExAS Remarks!");
    			    nexRem.focus();
    			    return false;
    			    }
    		}
    		if(reqFor[7].checked){
    			  var uCode = document.form.uCode;
    			  var uPass = document.form.uPass;
    			  var gsBCode = document.form.gsBCode;
    			  var gsDiv = document.form.gsDiv;
    			  var gsPri = document.form.gsPri;
    			  var gsUser = document.form.gsUser;
    			  var gsRem = document.form.gsRem;
    			  if(uCode.value==""||uCode.value==null)
    		   	  {
    		   		alert("Please Enter GS-NET User Code!");
    		   		uCode.focus();
    		   		return false;
    		   	  }
    			  if(uPass.value==""||uPass.value==null)
    		   	  {
    		   		alert("Please Enter GS-NET Password!");
    		   		uPass.focus();
    		   		return false;
    		   	  }
    			  
/*    			  var bool = true;
    			  for(var i=0;i<gsBCode.length;i++){
    				  if(document.form.gsBCode[i].checked){
    					  bool = false;
    				  }
    			  }
    			  if(bool){
    		   		alert("Please Select Assigned GS-NET Branch Code!");		  	
    		   		return false;
    			  }
    			  
    			  var bool1 = true;
    			  for(var j=0;j<gsDiv.length;j++){
    				  if(document.form.gsDiv[j].checked){
    					  bool1 = false;
    				  }
    			  }
    			  if(bool1){
    		   		alert("Please Select Assigned Division Name!");
    		   		return false;
    			  }
    			  
    			  var bool2 = true;
    			  for(var k=0;k<gsPri.length;k++){
    				  if(document.form.gsPri[k].checked){
    					  bool2 = false;
    				  }
    			  }
    			  if(bool2){
    		   		alert("Please Select Assigned Primary Division Name!");
    		   		return false;
    			  }
    			  
    			  var bool3 = true;
    			  for(var l=0;l<gsUser.length;l++){
    				  if(document.form.gsUser[l].checked){
    					  bool3 = false;
    				  }
    			  }
    			  if(bool3){
    		   		alert("Please Select Assigned User Role!");
    		   		return false;
    			  }*/

    			  if(gsRem.value==""||gsRem.value==null)
    		   	  {
    		   		alert("Please Enter GS-NET Remarks!");
    		   		gsRem.focus();
    		   		return false;
    		   	  }
    		}
    		if(reqFor[8].checked){
    			  var interName = document.form.interName;
    			  var interPass = document.form.interPass;
    			  var interRem = document.form.interRem;
    			  if(interName.value==""||interName.value==null)
    			    {
    			    alert("Please Enter Internal Application User ID!");
    			    interName.focus();
    			    return false;
    			    }
    			  if(interPass.value==""||interPass.value==null)
    			    {
    			    alert("Please Enter Internal Application Password!");
    			    interPass.focus();
    			    return false;
    			    }
    			  if(interRem.value==""||interRem.value==null)
    			    {
    			    alert("Please Enter Internal Application Remarks!");
    			    interRem.focus();
    			    return false;
    			    }
    		}
    		if(reqFor[9].checked){
    			  var usbRem = document.form.usbRem;
    			  if(usbRem.value==""||usbRem.value==null)
    				    {
    				    alert("Please Enter USB Access Remarks!");
    				    usbRem.focus();
    				    return false;
    				    }
    		}
    		if(reqFor[10].checked){
    			  var forti = document.form.forti;
    			  if(forti.value=="" || forti.value==null)
    				    {
    				    alert("Please Enter Forti Token Details for VPN Access!");
    				    forti.focus();
    				    return false;
    				    }
    		}
     		if(reqFor[11].checked){
  			  var hardRem = document.form.hardRem;
  			  if(hardRem.value=="" || hardRem.value==null)
  				    {
  				    alert("Please Enter Remarks for HardDisk / PenDrive!");
  				    hardRem.focus();
  				    return false;
  				    }
  		}
   		if(reqFor[12].checked){
  			  var assRem = document.form.assRem;
  			  if(assRem.value=="" || assRem.value==null)
  				    {
  				    alert("Please Enter Remarks for Any Other Asset!");
  				    assRem.focus();
  				    return false;
  				    }
  		}
   		if(reqFor[13].checked){
			  var glowID = document.form.glowID;
			  var glowPass = document.form.glowPass;
			  var glowAppRemarks = document.form.glowAppRemarks;
			  if(glowID.value=="" || glowID.value==null)
				    {
				    alert("Please Enter User ID for NEx-GLOW!");
				    glowID.focus();
				    return false;
				    }
			  if(glowPass.value=="" || glowPass.value==null)
				    {
				    alert("Please Enter Password for NEx-GLOW!");
				    glowPass.focus();
				    return false;
				    }
			  if(glowAppRemarks.value=="" || glowAppRemarks.value==null)
				    {
				    alert("Please Enter Remarks for NEx-GLOW!");
				    glowAppRemarks.focus();
				    return false;
				    }
		}
         }
     }
  if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	    {
	    alert("Enter Remarks !");
	    d1.focus();
	    return false;
	    }
    else{
    	return true;
    }
	}catch(err){
		alert(err);
	  	return false;
	}
   }
</script>
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
<script type="text/javascript">
function OtherAdmin()
{
	
document.form.action="NeinAppFormAdminBack.jsp";
document.form.method="post";
document.form.submit();
}
function ITManager()
{
document.form.action="NeinAppFormAdminPrasannaBack.jsp";
document.form.method="post";
document.form.submit();
}
</script>
<script type="text/javascript">
function cancel()
{
  // close();
	history.back();
}
</script>
<script type="text/javascript">
function showTR()
{
var status = document.getElementById('idstatus').value;
if (status!="true")
  {
    alert("you are not authorized person");
    return false;
  }
else{
	 document.getElementById('idApproved').style.display = 'block';
	 document.getElementById('idApproved1').style.display="none";
	 document.getElementById('idApproved2').style.display="none";
	 return true;
 }
}
	
function hideTR(obj){
	var status = document.getElementById('idstatus').value;
	if (status!="true"){
		alert("you are not authorized person");
		return false;
	}else{
		if(obj=="Not Approved"){
			document.getElementById('idApproved').style.display = 'none';
			document.getElementById('idApproved1').style.display="block";
			document.getElementById('idApproved2').style.display = 'none';
			return true;
		}else if(obj=="Clarification Required"){
			document.getElementById('idApproved').style.display = 'none';
			document.getElementById('idApproved1').style.display="none";
			document.getElementById('idApproved2').style.display="block";
			return true;
		}
	}
}

function hideHigherTR(val)
{
document.getElementById('send').style.display = 'block';
document.getElementById('dontSend').style.display="none";
}
function showHigherTR(val)
{
document.getElementById('dontSend').style.display="block";
document.getElementById('send').style.display="none";
}

function dirApprove(){
	var higherAuthority = document.form.higherAuthority;
	var val = document.form.higherAuthority.value;
	if(higherAuthority[0].checked==true){
		hideHigherTR(val);
	}else if(higherAuthority[1].checked==true){
		showHigherTR(val);
		hiddenTables2(document.form.requestForCheck);
		bcc();
	}
}


</script>
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
                       }       var url="../../../selEmpForms.jsp";  
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
                       }       var url="../../../selectMailId.jsp";  
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
<script language="javascript" type="text/javascript">
 function hideBcc()
 {
	 document.getElementById('idBcc').style.display="table-row";
	 document.getElementById('idBcc').style.visibility="visible";
	 document.getElementById('idBcc2').style.display="table-row";
	 document.getElementById('idBcc2').style.visibility="visible";
 }
 function hideBcc2()
 {
	 document.getElementById('idBcc').style.display="none";
	 document.getElementById('idBcc').style.visibility="hidden";
	 document.getElementById('idBcc2').style.display="none";
	 document.getElementById('idBcc2').style.visibility="hidden";
 }
 </script>
  <script language="javascript" type="text/javascript"> 

function resendMail(mail,form2_no,email_id,sessionName)
  		 {
	
  		if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){
           alet("Creating html http object");    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){    
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="../../../ResendMailDomain?mail="+mail+","+form2_no+","+email_id+","+sessionName+"";  
                          // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                           //url +="?mail="+mailId;   
                              xmlHttp.onreadystatechange = mailStateChange;  
                           //  alert("before sending mail");
                                  xmlHttp.open("POST", url, true); 
                                  
                                //  alert("MAIL SENT");
                                     xmlHttp.send(null);
                                     
                                     alert("MAIL RESENT");
                                       } 
		function mailStateChange()
		{ 
 		//alert("mail state change");    
 		  if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
  		 {   
    	  // document.getElementById("idmailStatus").innerHTML=xmlHttp.responseText
   			 //  alert("xmlHttp.responseText      :"+xmlHttp.responseText);
   			   document.getElementById("idmailStatus").value=xmlHttp.responseText;
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

<script type="text/javascript">
function deleteRecord(id)
{  
if(confirm('You are about to delete Program Blocked'))
{
var f=document.form;    
f.method="post";    
//f.action='AssignedLocationDelete.jsp?id='+id;    
f.action='NewinsBlockedDelete.jsp?id='+id;
f.submit();
}
else
{
	return false;
}
}

function deleteRecord2(id)
{  
if(confirm('You are about to delete Program Allowed'))
{
var f=document.form;    
f.method="post";    
f.action='NewinsAllowedDelete.jsp?id='+id;;    
f.submit();
}
else
{
	return false;
	}
}
</script>

<script language = "Javascript">
function showMob()
{
 	  if(document.getElementById("cmp").value=="Yes"){
 	  document.getElementById('compTD').colSpan="1";
	  document.getElementById('mob1').style.display="table-cell";
	  document.getElementById('mob1').style.visibility="visible";
	  document.getElementById('mob2').style.display="table-cell";
	  document.getElementById('mob2').style.visibility="visible";
 	  }else{
	  document.getElementById('compTD').colSpan="3";
	  document.getElementById('mob1').style.display="none";
	  document.getElementById('mob1').style.visibility="hidden";
	  document.getElementById('mob2').style.display="none";
	  document.getElementById('mob2').style.visibility="hidden"; 		  
 	  }
}

function showSim()
{
 	  if(document.getElementById("cmpSim").value=="Yes"){
 	  document.getElementById('compSim').colSpan="1";
	  document.getElementById('sim1').style.display="table-cell";
	  document.getElementById('sim1').style.visibility="visible";
	  document.getElementById('sim2').style.display="table-cell";
	  document.getElementById('sim2').style.visibility="visible";
 	  }else{
	  document.getElementById('compSim').colSpan="3";
	  document.getElementById('sim1').style.display="none";
	  document.getElementById('sim1').style.visibility="hidden";
	  document.getElementById('sim2').style.display="none";
	  document.getElementById('sim2').style.visibility="hidden"; 		  
 	  }
}
</script>

<script language = "Javascript">
function showTR1()
{
	if(document.form.newinsRequest.value=="Change"){
	  document.getElementById('idDelete').style.display="table-row";
	  document.getElementById('idDelete').style.visibility="visible";
	}else{
	 document.getElementById('idDelete').style.display="none";
	 document.getElementById('idDelete').style.visibility="hidden";
	}
}
</script>


<script>
function hiddenTables(obj){
	var type=obj;
	var newin=document.getElementById("newUser").value;
	var level=document.getElementById("ftype1").value;

	var get = document.form.requestForCheck;
	if((type[0].value.trim()=="Email ID") && (get[0].checked==true) && newin!="33"){
		var email 		= document.getElementById("requestForCheck_email");
		var emdt		= document.getElementById("email_details");
		if(email.checked==true){
			emdt.style.display 		= "inline";
			emdt.style.visibility 	= "visible";
		}else{
			emdt.style.display 		= "none";
			emdt.style.visibility	= "hidden";
		}
	}
	if((type[1].value.trim()=="Domain Account") && (get[1].checked==true) && newin!="33" && level!="1"){
		var domain		= document.getElementById("requestForCheck_dom");
		var dmdt		= document.getElementById("dom_details");
		if(domain.checked==true){
			dmdt.style.display = "inline";
		}else{
			dmdt.style.display = "none";
		}
	}
	if((type[2].value.trim()=="Biometric / Access Card") && (get[2].checked==true) && newin!="33" && level!="1"){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt		= document.getElementById("bio_details");
		if(biometric.checked==true){
			biodt.style.display = "inline";
		}else{
			biodt.style.display = "none";
		}
	}
	if((type[3].value.trim()=="Shared Folder") && (get[3].checked==true) && newin!="33" && level!="1"){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt		= document.getElementById("sha_details");
		if(shared.checked==true){
			shadt.style.display = "inline";
		}else{
			shadt.style.display = "none";
		}
	}
	if((type[4].value=="Internet Access / FTP Access") && (get[4].checked==true) && newin!="33" && level!="1"){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt		= document.getElementById("int_details");
		if(internet.checked==true){
			intdt.style.display = "inline";
		}else{
			intdt.style.display = "none";			
		}
	}
	if((type[5].value=="NEWINS") && (get[5].checked==true) && level!="1"){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt		= document.getElementById("new_details");
		if(newins.checked==true){
			newdt.style.display = "inline";
		}else{
			newdt.style.display = "none";
		}
		var chaNew = document.getElementById("changeNew").value;
		if(chaNew=="Yes" && newin=="33"){
			oldPrograms();
		}
	}
	if((type[6].value=="NExAS") && (get[6].checked==true) && level!="1"){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt		= document.getElementById("nex_details");
		if(nexas.checked==true){
			nexdt.style.display = "inline";
		}else{
			nexdt.style.display = "none";
		}
	}
	if((type[7].value=="GS-NET") && (get[7].checked==true) && level!="1"){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt		= document.getElementById("gs_details");
		if(gsnet.checked==true){
			gsdt.style.display = "inline";
		}else{
			gsdt.style.display = "none";	
		}
	}
	if((type[8].value=="Internal Application") && (get[8].checked==true) && newin!="33" && level!="1"){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt		= document.getElementById("inter_details");
		if(internal.checked==true){
			interdt.style.display = "inline";
		}else{
			interdt.style.display = "none";	
		}
	}
	if((type[9].value=="USB Access") && (get[9].checked==true) && newin!="33" && level!="1"){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt		= document.getElementById("usb_details");
		if(usb.checked==true){
			usbdt.style.display = "inline";
		}else{
			usbdt.style.display = "none";	
		}
	}
	if((type[10].value=="VPN Access") && (get[10].checked==true) && newin!="33" && level!="1"){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt		= document.getElementById("vpn_details");
		if(vpn.checked==true){
			vpndt.style.display = "inline";
		}else{
			vpndt.style.display = "none";	
		}
	}
	if(type[11].value=="HardDisk / PenDrive" && (get[11].checked==true) && newin!="33" && level!="1"){
		var hard 		= document.getElementById("requestForCheck_hard");
		var harddt		= document.getElementById("hard_details");
		if(hard.checked==true){
			harddt.style.display = "inline";
		}else{
			harddt.style.display = "none";			
		}
	}
	if(type[12].value=="Any Other Asset" && (get[12].checked==true) && newin!="33" && level!="1"){
		var any 		= document.getElementById("requestForCheck_assets");
		var anydt		= document.getElementById("asset_details");
		if(any.checked==true){
			anydt.style.display = "inline";
		}else{
			anydt.style.display = "none";			
		}
	}
	if(type[13].value=="NEx-GLOW" && (get[13].checked==true) && level!="1"){
		var gl 		= document.getElementById("requestForCheck_glow");
		var gldt		= document.getElementById("glow_details");
		if(gl.checked==true){
			gldt.style.display = "inline";
		}else{
			gldt.style.display = "none";			
		}
	}
}

function intunedisplay(obj){
	var intune = obj.value;
	var yesNo  = document.getElementById("intuneYes");
	var yesNo111  = document.getElementById("intuneYes111");
	var yesNo11  = document.getElementById("intuneYes11");
	var yesNo1 = document.getElementById("intuneYes1");
	var yesNo12 = document.getElementById("intuneYes12");
	var yesNo13 = document.getElementById("intuneYes13");
	var yesNo2 = document.getElementById("intuneYes2");
	var yesNo21 = document.getElementById("intuneYes21");
	if(intune=="Yes"){
		  document.getElementById('mobInt').colSpan="1";
		  document.getElementById('emailRow').rowSpan="8";
		  yesNo.style.display="table-cell";
		  yesNo.style.visibility="visible";
		  yesNo11.style.display="table-cell";
		  yesNo11.style.visibility="visible";
		  yesNo1.style.display="table-row";
		  yesNo1.style.visibility="visible";
		  yesNo111.style.display="table-row";
		  yesNo111.style.visibility="visible";
		  yesNo12.style.display="table-cell";
		  yesNo12.style.visibility="visible";
		  yesNo13.style.display="table-cell";
		  yesNo13.style.visibility="visible";
		  yesNo2.style.display="table-cell";
		  yesNo2.style.visibility="visible";
		  yesNo21.style.display="table-cell";
		  yesNo21.style.visibility="visible";
	}else{
		  document.getElementById('mobInt').colSpan="3";
		  document.getElementById('emailRow').rowSpan="6";
		  yesNo.style.display="none";
		  yesNo.style.visibility="hidden";
		  yesNo11.style.display="none";
		  yesNo11.style.visibility="hidden";
		  yesNo1.style.display="none";
		  yesNo1.style.visibility="hidden";
		  yesNo111.style.display="none";
		  yesNo111.style.visibility="hidden";
		  yesNo12.style.display="none";
		  yesNo12.style.visibility="hidden";
		  yesNo13.style.display="none";
		  yesNo13.style.visibility="hidden";
		  yesNo2.style.display="none";
		  yesNo2.style.visibility="hidden";
		  yesNo21.style.display="none";
		  yesNo21.style.visibility="hidden";
	}
}

</script>

<script>

function oldPrograms(){
	var proA 	= document.getElementById("proAll").value;
	var proAch 	= document.getElementsByName("progAllowed");
	var proB 	= document.getElementById("proBlo").value;
	var proBch 	= document.getElementsByName("progBlocked");
	var proA1 = proA.split(",");
	var proB1 = proB.split(",");
	
	for(let jjj=0;jjj<proAch.length;jjj++){
		for(let jj=0;jj<proA1.length;jj++){
		if(((proA1[jj]).trim())==((proAch[jjj].value).trim())){
			document.getElementById("progAllowed"+proAch[jjj].value).checked=true;
		}
		}
	}
	for(let kkk=0;kkk<proBch.length;kkk++){
		for(let kk=0;kk<proB1.length;kk++){
		if(((proB1[kk]).trim())==((proBch[kkk].value).trim())){
			document.getElementById("progBlocked"+proBch[kkk].value).checked=true;
		}
		}
	}
	progValid();
}

function progValid(){
	var allPro = document.form.progAllowed;
	var bloPro = document.form.progBlocked;
	var text = "";
	for(let a=0;a<allPro.length;a++){
		if(allPro[a].checked==true){
			text += allPro[a].value;
		}
	}
	for(let b=0;b<bloPro.length;b++){
		if(bloPro[b].checked==true){
			text += bloPro[b].value;
		}
	}
	document.getElementById("text").value=text;	
}

</script>

<script>
function hiddenTables1(obj){
	var type2=obj;
	if((type2[0].value=="Email ID") && (document.getElementById("requestForCheck_email").checked==true)){
		var email		= document.getElementById("requestForCheck_email");
		var email1		= document.getElementById("email_details1");
		if(email.checked==true){
			email1.style.display = "inline";
			email1.style.visibility 	= "visible";
		}else{
			email1.style.display = "none";
			email1.style.visibility 	= "hidden";
		}
	}
	if((type2[1].value.trim()=="Domain Account") && (type2[1].checked==true)){
		var domain		= document.getElementById("requestForCheck_dom");
		var dmdt1		= document.getElementById("dom_details1");
		if(domain.checked==true){
			dmdt1.style.display 	= "inline";
			dmdt1.style.visibility 	= "visible";
		}else{
			dmdt1.style.display 	= "none";
			dmdt1.style.visibility 	= "hidden";
		}
	}
	if((type2[2].value.trim()=="Biometric / Access Card") && (type2[2].checked==true)){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt1		= document.getElementById("bio_details1");
		if(biometric.checked==true){
			biodt1.style.display = "inline";
		}else{
			biodt1.style.display = "none";			
		}
	}
	if((type2[3].value.trim()=="Shared Folder") && (type2[3].checked==true)){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt1		= document.getElementById("sha_details1");
		if(shared.checked==true){
			shadt1.style.display = "inline";
		}else{
			shadt1.style.display = "none";			
		}
	}
	if((type2[4].value=="Internet Access / FTP Access") && (type2[4].checked==true)){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt1		= document.getElementById("int_details1");
		if(internet.checked==true){
			intdt1.style.display = "inline";
		}else{
			intdt1.style.display = "none";			
		}
	}
	if((type2[5].value=="NEWINS") && (type2[5].checked==true)){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt1		= document.getElementById("new_details1");
		if(newins.checked==true){
			newdt1.style.display = "inline";
		}else{
			newdt1.style.display = "none";
		}
	}
	if((type2[6].value=="NExAS") && (type2[6].checked==true)){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt1		= document.getElementById("nex_details1");
		if(nexas.checked==true){
			nexdt1.style.display = "inline";
		}else{
			nexdt1.style.display = "none";
		}
	}
	if((type2[7].value=="GS-NET") && (type2[7].checked==true)){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt1		= document.getElementById("gs_details1");
		if(gsnet.checked==true){
			gsdt1.style.display = "inline";
		}else{
			gsdt1.style.display = "none";	
		}
	}
	if((type2[8].value=="Internal Application") && (type2[8].checked==true)){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt1		= document.getElementById("inter_details1");
		if(internal.checked==true){
			interdt1.style.display = "inline";
		}else{
			interdt1.style.display = "none";	
		}
	}
	if((type2[9].value=="USB Access") && (type2[9].checked==true)){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt1		= document.getElementById("usb_details1");
		if(usb.checked==true){
			usbdt1.style.display = "inline";
		}else{
			usbdt1.style.display = "none";	
		}
	}
	if((type2[10].value=="VPN Access") && (type2[10].checked==true)){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt1		= document.getElementById("vpn_details1");
		if(vpn.checked==true){
			vpndt1.style.display = "inline";
		}else{
			vpndt1.style.display = "none";	
		}
	}
	if((type2[11].value=="HardDisk / PenDrive") && (type2[11].checked==true)){
		var hard 		= document.getElementById("requestForCheck_hard");
		var hardt1		= document.getElementById("hard_details1");
		if(hard.checked==true){
			hardt1.style.display = "inline";
		}else{
			hardt1.style.display = "none";	
		}
	}
	if((type2[12].value=="Any Other Asset") && (type2[12].checked==true)){
		var any 		= document.getElementById("requestForCheck_assets");
		var anydt1		= document.getElementById("asset_details1");
		if(any.checked==true){
			anydt1.style.display = "inline";
		}else{
			anydt1.style.display = "none";	
		}
	}
	if((type2[13].value=="NEx-GLOW") && (type2[13].checked==true)){
		var gl 		= document.getElementById("requestForCheck_glow");
		var gldt1		= document.getElementById("glow_details1");
		if(gl.checked==true){
			gldt1.style.display = "inline";
		}else{
			gldt1.style.display = "none";	
		}
	}
}
</script>

<script>
function hiddenTables2(obj){
	var type1=obj;
	if((type1[0].value=="Email ID") && (document.getElementById("requestForCheck_email").checked==true)){
		var email		= document.getElementById("requestForCheck_email");
		var email1		= document.getElementById("email_details1");
		if(email.checked==true){
			email1.style.display = "inline";
			email1.style.visibility 	= "visible";
		}else{
			email1.style.display = "none";
			email1.style.visibility 	= "hidden";
		}
	}
	if((type1[1].value=="Domain Account") && (type1[1].checked==true)){
		var domain1		= document.getElementById("requestForCheck_dom");
		var dmdt111		= document.getElementById("dom_details1");
		if(domain1.checked==true){
			dmdt111.style.display 	= "inline";
			dmdt111.style.visibility 	= "visible";
		}else if(domain1.checked==false){
			dmdt111.style.display 	= "none";
			dmdt111.style.visibility 	= "hidden";
		}
	}
	if((type1[2].value=="Biometric / Access Card") && (type1[2].checked==true)){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt11		= document.getElementById("bio_details1");
		if(biometric.checked==true){
			biodt11.style.display = "inline";
		}else{
			biodt11.style.display = "none";			
		}
	}
	if((type1[3].value=="Shared Folder") && (type1[3].checked==true)){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt11		= document.getElementById("sha_details1");
		if(shared.checked==true){
			shadt11.style.display = "inline";
		}else{
			shadt11.style.display = "none";			
		}
	}
	if((type1[4].value=="Internet Access / FTP Access") && (type1[4].checked==true)){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt11		= document.getElementById("int_details1");
		if(internet.checked==true){
			intdt11.style.display = "inline";
		}else{
			intdt11.style.display = "none";			
		}
	}
	if((type1[5].value=="NEWINS") && (type1[5].checked==true)){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt11		= document.getElementById("new_details1");
		if(newins.checked==true){
			newdt11.style.display = "inline";
		}else{
			newdt11.style.display = "none";
		}
	}
	if((type1[6].value=="NExAS") && (type1[6].checked==true)){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt11		= document.getElementById("nex_details1");
		if(nexas.checked==true){
			nexdt11.style.display = "inline";
		}else{
			nexdt11.style.display = "none";
		}
	}
	if((type1[7].value=="GS-NET") && (type1[7].checked==true)){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt11		= document.getElementById("gs_details1");
		if(gsnet.checked==true){
			gsdt11.style.display = "inline";
		}else{
			gsdt11.style.display = "none";	
		}
	}
	if((type1[8].value=="Internal Application") && (type1[8].checked==true)){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt11		= document.getElementById("inter_details1");
		if(internal.checked==true){
			interdt11.style.display = "inline";
		}else{
			interdt11.style.display = "none";	
		}
	}
	if((type1[9].value=="USB Access") && (type1[9].checked==true)){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt11		= document.getElementById("usb_details1");
		if(usb.checked==true){
			usbdt11.style.display = "inline";
		}else{
			usbdt11.style.display = "none";	
		}
	}
	if((type1[10].value=="VPN Access") && (type1[10].checked==true)){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt11		= document.getElementById("vpn_details1");
		if(vpn.checked==true){
			vpndt11.style.display = "inline";
		}else{
			vpndt11.style.display = "none";	
		}
	}
	if((type1[11].value=="HardDisk / PenDrive") && (type1[11].checked==true)){
		var hard 		= document.getElementById("requestForCheck_hard");
		var hardt11		= document.getElementById("hard_details1");
		if(hard.checked==true){
			hardt11.style.display = "inline";
		}else{
			hardt11.style.display = "none";	
		}
	}
	if((type1[12].value=="Any Other Asset") && (type1[12].checked==true)){
		var any 		= document.getElementById("requestForCheck_assets");
		var anydt11		= document.getElementById("asset_details1");
		if(any.checked==true){
			anydt11.style.display = "inline";
		}else{
			anydt11.style.display = "none";	
		}
	}
	if((type1[13].value=="NEx-GLOW") && (type1[13].checked==true)){
		var gl 		= document.getElementById("requestForCheck_glow");
		var gldt11		= document.getElementById("glow_details1");
		if(gl.checked==true){
			gldt11.style.display = "inline";
		}else{
			gldt11.style.display = "none";	
		}
	}
}
</script>

<script>
function bcc(){
	var bcc = document.getElementById("bcc");
	bcc.style.display="inline";
}

function showTROnload(){
	var mmdradio = document.form.mmdradio;
	var status = document.getElementById('idstatus').value;
	var senddirect = document.form.senddirect.value;
if(mmdradio[0].checked==true){
	if (status!="true")
	{
	    alert("you are not authorized person");
	    return false;
	}
	else{
		document.getElementById('idApproved').style.display = 'block';
		if(senddirect=="createdomain"){
			hiddenTables1(document.form.requestForCheck);
			bcc();
		}
		document.getElementById('idApproved1').style.display="none";
		document.getElementById('idApproved2').style.display="none";
		return true;
	 }
}else if(mmdradio[1].checked==true){
	if (status!="true")
	{
		alert("you are not authorized person");
		return false;
	}
	else{
		document.getElementById('idApproved').style.display = 'none';
		document.getElementById('idApproved1').style.display="block";
		document.getElementById('idApproved2').style.display="none";
	 	return true;
	}
}else if(mmdradio[2].checked==true){
	if (status!="true")
	{
		alert("you are not authorized person");
		return false;
	}
	else{
		document.getElementById('idApproved').style.display = 'none';
		document.getElementById('idApproved1').style.display="block";
		document.getElementById('idApproved2').style.display="none";
	 	return true;
	}
}
}


//NeinAppFormAdminBack.jsp
</script>
</head>


<body onload="checkForm();hiddenTables(document.form.requestForCheck);intunedisplay(document.form.onintune);showMob();showSim();showTR1();showTROnload();dirApprove();">
<form name="form" method="post" action="NeinAppFormAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cnB=null,cnH=null,cnExtra=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,st12=null,stnext=null,stB=null,stH=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rs12=null,rsnext=null,rsB=null,rsH=null;
String req=null;
String empD=null;
String SessionSuperAdmin=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
admin =  (String) session.getAttribute("admin");

SessionSuperAdmin = (String) session.getAttribute("AdminRights");
email_id = (String) session.getAttribute("Nmail");

Connection cn5 = null,cn11=null,cnNew=null;
Statement st5 = null,st11=null,stNew=null; 
ResultSet rs5 = null,rs11=null,rsNew=null; 
PreparedStatement psmt=null;
try{
String SessionnewinsUser=(String) session.getAttribute("newinsUser")==null?"No":(String) session.getAttribute("newinsUser");
System.out.println("SessionnewinsUser=========>"+SessionnewinsUser);
%>

<%

String form2_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null,reqBranch=null,emp_type=null,emp_contract_type=null,reqFor=null,requestFor_change=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null;
String req = request.getParameter("form_no");

cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from neinapplicationform WHERE applicationNo='"+req+"'"); 
while(rs100.next())
{
    form2_no = rs100.getString("applicationNo");
    f_date = rs100.getString("applicationDate");
    idextend = rs100.getString("idextend");
    branch = rs100.getString("branch");
    depart = rs100.getString("department");
    full_name = rs100.getString("full_name");
    designation = rs100.getString("designation");
    scopeOfWork = rs100.getString("scope_of_work");
    emp_code = rs100.getString("employee_code");
    reporting_officer = rs100.getString("report_officer");
    requestOption = rs100.getString("request_type");
    requestBy = rs100.getString("requested_by");
    remarks = rs100.getString("neinRemarks");
    reqBranch = rs100.getString("requested_branch");
    emp_type = rs100.getString("emp_type");
    emp_contract_type = rs100.getString("emp_contract_type");
    reqFor = rs100.getString("requestFor");
    requestFor_change = rs100.getString("requestFor_change");

	 i_name = rs100.getString("i_name");
	 i_desg = rs100.getString("i_desg");
	 i_city = rs100.getString("i_city");
	 i_b_no = rs100.getString("i_b_no");
	 i_admin = rs100.getString("i_admin");
	 i_email_id = rs100.getString("i_email_id");


	 desg = rs100.getString("desg");
	 emp = rs100.getString("emp");
	 mail = rs100.getString("mail");
	
}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907" cellspacing="0" cellpadding="0" bgcolor="grey">
<tr>
<td><center><font size="5">
<b><label>
APPLICATION FORM FROM EMPLOYEE</label>
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
<table width="900"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
<td>
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
//System.out.println("b_no :"+b_no);
%>

<%
cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

cnB=con.getConnection2();
stB=cnB.createStatement();
rsB=stB.executeQuery("select m_b_name,m_b_location from branch_master_main where m_b_no='"+reqBranch+"' ORDER BY m_b_name Asc");
if(rsB.next()){
	reqBranch=rsB.getString("m_b_name");
}

String emailDomain=null,employeeType=null,reqMailID=null,mobIntune=null,mobileNo=null,imei1=null,imei2=null,domainRemarks=null,bioRemarks=null,folderRemarks=null;
String internetReqType=null,internetRemarks=null,newinsBranchCode=null,newinsOpCode=null,newinsRequest=null,newinsRemarks=null,nexasCompCode=null,nexasCCName=null;
String nexasCCCode=null,nexasOPRange=null,nexasReqType=null,nexasOptionalMenu=null,nexasRemarks=null,gsnetBranchCode=null,gsnetDivName=null,gsnetPrimaryDiv=null;
String gsnetUserRole=null,gsnetRemarks=null,internalApplication=null,internalRemarks=null,usbAccessFor=null,usbDetails=null,usbRemarks=null,vpnDomainID=null,level=null,passChan=null,chanReqBio=null,selBioBranches=null,changesNewins=null,previousBranchesNewins=null,changesGSNet=null,prevBRCodesGSNet=null,prevDivGSNet=null,prevPDivGSNet=null,prevRoleGSNet=null,newinsLevel=null;
String vpnEmailID=null,vpnMPLS=null,group_name=null,mailIDCreated=null,intuneAccessProvided=null,emailRemarks=null,hardPenRemarks=null,otherAssetRemarks=null,CompanyProvMobile=null,makeAndModel=null,simCard=null,simNo=null,project=null,warehouse=null,glowRemarks=null;
cnH=con.getConnection2();
stH=cnH.createStatement();
rsH=stH.executeQuery("select * from neinapplicationform_requestfor where app_no='"+req+"' ORDER BY req_id Asc");
while(rsH.next()){
	emailDomain=rsH.getString("emailDomain")==null?"":rsH.getString("emailDomain");
	employeeType=rsH.getString("employeeType")==null?"":rsH.getString("employeeType");
	reqMailID=rsH.getString("reqMailID")==null?"":rsH.getString("reqMailID");
	mobIntune=rsH.getString("mobIntune")==null?"":rsH.getString("mobIntune");
	mobileNo=rsH.getString("mobileNo")==null?"":rsH.getString("mobileNo");
	imei1=rsH.getString("imei1")==null?"":rsH.getString("imei1");
	imei2=rsH.getString("imei2")==null?"":rsH.getString("imei2");
	group_name=rsH.getString("group_name")==null?"":rsH.getString("group_name");
	mailIDCreated=rsH.getString("mailIDCreated")==null?"":rsH.getString("mailIDCreated");
	intuneAccessProvided=rsH.getString("intuneAccessProvided")==null?"":rsH.getString("intuneAccessProvided");
	emailRemarks=rsH.getString("emailRemarks")==null?"":rsH.getString("emailRemarks");
	passChan=rsH.getString("passReset")==null?"":rsH.getString("passReset");
	domainRemarks=rsH.getString("domainRemarks")==null?"":rsH.getString("domainRemarks");
	chanReqBio=rsH.getString("chanReqBio")==null?"":rsH.getString("chanReqBio");
	selBioBranches=rsH.getString("selBioBranches")==null?"":rsH.getString("selBioBranches");
	bioRemarks=rsH.getString("bioRemarks")==null?"":rsH.getString("bioRemarks");
	folderRemarks=rsH.getString("folderRemarks")==null?"":rsH.getString("folderRemarks");
	internetReqType=rsH.getString("internetReqType")==null?"":rsH.getString("internetReqType");
	internetRemarks=rsH.getString("internetRemarks")==null?"":rsH.getString("internetRemarks");
	newinsBranchCode=rsH.getString("newinsBranchCode");
	newinsOpCode=rsH.getString("newinsOpCode")==null?"":rsH.getString("newinsOpCode");
	newinsLevel=rsH.getString("newinsLevel")==null?"":rsH.getString("newinsLevel");
	newinsRequest=rsH.getString("newinsRequest")==null?"":rsH.getString("newinsRequest");
	newinsRemarks=rsH.getString("newinsRemarks")==null?"":rsH.getString("newinsRemarks");
	nexasCompCode=rsH.getString("nexasCompCode")==null?"":rsH.getString("nexasCompCode");
	nexasCCName=rsH.getString("nexasCCName")==null?"":rsH.getString("nexasCCName");
	nexasCCCode=rsH.getString("nexasCCCode")==null?"":rsH.getString("nexasCCCode");
	nexasOPRange=rsH.getString("nexasOPRange")==null?"":rsH.getString("nexasOPRange");
	nexasReqType=rsH.getString("nexasReqType")==null?"":rsH.getString("nexasReqType");
	nexasOptionalMenu=rsH.getString("nexasOptionalMenu")==null?"":rsH.getString("nexasOptionalMenu");
	nexasRemarks=rsH.getString("nexasRemarks")==null?"":rsH.getString("nexasRemarks");
	gsnetBranchCode=rsH.getString("gsnetBranchCode");
	gsnetDivName=rsH.getString("gsnetDivName");
	gsnetPrimaryDiv=rsH.getString("gsnetPrimaryDiv");
	gsnetUserRole=rsH.getString("gsnetUserRole");
	gsnetRemarks=rsH.getString("gsnetRemarks")==null?"":rsH.getString("gsnetRemarks");
	internalApplication=rsH.getString("internalApplication")==null?"":rsH.getString("internalApplication");
	internalRemarks=rsH.getString("internalRemarks")==null?"":rsH.getString("internalRemarks");
	usbAccessFor=rsH.getString("usbAccessFor")==null?"":rsH.getString("usbAccessFor");
	usbDetails=rsH.getString("usbDetails")==null?"":rsH.getString("usbDetails");
	usbRemarks=rsH.getString("usbRemarks")==null?"":rsH.getString("usbRemarks");
	vpnDomainID=rsH.getString("vpnDomainID")==null?"":rsH.getString("vpnDomainID");
	vpnEmailID=rsH.getString("vpnEmailID")==null?"":rsH.getString("vpnEmailID");
	vpnMPLS=rsH.getString("vpnMPLS")==null?"":rsH.getString("vpnMPLS");
	hardPenRemarks=rsH.getString("hardPenRemarks")==null?"":rsH.getString("hardPenRemarks");
	otherAssetRemarks=rsH.getString("otherAssetRemarks")==null?"":rsH.getString("otherAssetRemarks");
	CompanyProvMobile=rsH.getString("CompanyProvMobile")==null?"":rsH.getString("CompanyProvMobile");
	makeAndModel=rsH.getString("makeAndModel")==null?"":rsH.getString("makeAndModel");
	simCard=rsH.getString("compProvSimCard")==null?"":rsH.getString("compProvSimCard");
	simNo=rsH.getString("compProvSimNumber")==null?"":rsH.getString("compProvSimNumber");
	project=rsH.getString("glowProject")==null?"":rsH.getString("glowProject");
	warehouse=rsH.getString("glowWarehouse")==null?"":rsH.getString("glowWarehouse");
	glowRemarks=rsH.getString("glowRemarks")==null?"":rsH.getString("glowRemarks");
	changesNewins=rsH.getString("changesNewins")==null?"":rsH.getString("changesNewins");
	previousBranchesNewins=rsH.getString("previousBranchesNewins")==null?"":rsH.getString("previousBranchesNewins");
	changesGSNet=rsH.getString("changesGSNet")==null?"":rsH.getString("changesGSNet");
	prevBRCodesGSNet=rsH.getString("prevBRCodesGSNet")==null?"":rsH.getString("prevBRCodesGSNet");
	prevDivGSNet=rsH.getString("prevDivGSNet")==null?"":rsH.getString("prevDivGSNet");
	prevPDivGSNet=rsH.getString("prevPDivGSNet")==null?"":rsH.getString("prevPDivGSNet");
	prevRoleGSNet=rsH.getString("prevRoleGSNet")==null?"":rsH.getString("prevRoleGSNet");
}

String selBioBranches1="";
if(!selBioBranches.equalsIgnoreCase("") && !selBioBranches.equalsIgnoreCase(null)) {
rsH=stH.executeQuery("select m_b_name from branch_master_main where m_b_no in ("+selBioBranches+") ORDER BY m_b_name Asc");
while(rsH.next()){
	selBioBranches1 += rsH.getString(1)+", ";
}
}

if(!selBioBranches1.equals("")){
	selBioBranches1 = selBioBranches1.substring(0,selBioBranches1.length()-2);
}

String nexasReqType1="";
if(nexasReqType.equalsIgnoreCase("HOAcUser")){
	nexasReqType1 = "HO Acounting User";
}if(nexasReqType.equalsIgnoreCase("BRAcUser")){
	nexasReqType1 = "Branch Acounting User";
}if(nexasReqType.equalsIgnoreCase("ITUser")){
	nexasReqType1 = "IT User";
}if(nexasReqType.equalsIgnoreCase("RepoDispOnly")){
	nexasReqType1 = "Report display only User";
}

String nexasOptionalMenu1 = "";
if(nexasOptionalMenu.contains("paymentProp")) {
	nexasOptionalMenu1+= "Payment Proposal"+", ";
}if(nexasOptionalMenu.contains("paymentAppr")) {
	nexasOptionalMenu1+= "Payment Approval"+", ";	
}if(nexasOptionalMenu.contains("openCloseSch")) {
	nexasOptionalMenu1+= "Open/Close Schedule"+", ";
}if(nexasOptionalMenu.contains("voidCheq")) {
	nexasOptionalMenu1+= "Void Cheque"+", ";
}if(nexasOptionalMenu.contains("issueCheq")) {
	nexasOptionalMenu1+= "Issue Cheque"+", ";
}if(nexasOptionalMenu.contains("taxRepo")) {
	nexasOptionalMenu1+= "Tax Report"+", ";
}if(nexasOptionalMenu.contains("ExchangRateMa")) {
	nexasOptionalMenu1+= "Exchange Rate Maintainance"+", ";
}if(nexasOptionalMenu.contains("offsetAc")) {
	nexasOptionalMenu1+= "Offset Account"+", ";
}if(nexasOptionalMenu.contains("addfreeMaster")) {
	nexasOptionalMenu1+= "Addfree master Maintainance"+", ";
}if(nexasOptionalMenu.contains("paymentOpeBranch")) {
	nexasOptionalMenu1+= "Payment operation of branch"+", ";
}if(nexasOptionalMenu.contains("batchInput")) {
	nexasOptionalMenu1+= "Batch Input"+", ";
}if(nexasOptionalMenu.contains("SEPABACS")) {
	nexasOptionalMenu1+= "SEPA.BACS data Download"+", ";
}

if(!nexasOptionalMenu1.equals("")){
	nexasOptionalMenu1 = nexasOptionalMenu1.substring(0, nexasOptionalMenu1.length()-2);
}

rsH = stH.executeQuery("select max(levelno) from neinapplicationform_item where form2_no='"+req+"'");
if(rsH.next()){
	level = rsH.getString(1);
}

/* if(!newinsBranchCode.equals("")){	
newinsBranchCode=newinsBranchCode.substring(0,newinsBranchCode.length()-1);
}
if(!previousBranchesNewins.equals("")){	
previousBranchesNewins=previousBranchesNewins.substring(0,previousBranchesNewins.length()-1);
}
if(!internalApplication.equals("")){	
internalApplication=internalApplication.substring(0,internalApplication.length()-1);
} */
%>	 
<input type="hidden" value="<%=level%>" name="level" id="level">
<table width="895">
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >NAME:</td>
<td style="text-align:left;" colspan="3" bgcolor="grey"><input name="AppName" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >DESIGNATION :</td>
<td style="text-align:left;" colspan="3" bgcolor="grey"><input name="appDesg" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" colspan="3" bgcolor="grey"><input name="appFormNo" value="<%=form2_no%>" size="31" readonly="readonly"/> </td>
</tr>
<%
if(emp_contract_type.equalsIgnoreCase("On Roll")){
%>
<tr>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>

</tr>	
<tr>
<td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
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
<td  style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;"><input type="text" name="sow" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" /></td>
<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;"><input type="text" name="reqBy"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" /></td>				        
</tr>
<tr>
<td style="text-align: right;">Employee Type :</td>
<td style="text-align:left;"><input type="text" name="emplType" value="<%=emp_type%>" readonly="readonly"  readonly="readonly" /></td>
<td style="text-align: right;">Employee Contract Type :</td>
<td style="text-align:left;"><input type="text" name="emplCont"  value="<%=emp_contract_type%>" readonly="readonly" readonly="readonly" /></td>				        
</tr>
<tr>
<td align="right">Request  :</td>
<td style="text-align:left;" colspan="3"><input style="" type ="text" name = "requestOption" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
<input type ="hidden" name = "requestBranch" readonly="readonly" value ="<%=reqBranch%>"/>
</tr>
<%}else{%>
<tr>
<td style="text-align: right;">Employee Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
<td style="text-align: right;width: 215px;">Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" readonly="readonly"/> </td>
</tr>	
<tr>
<td style="text-align: right;width: 175px;">Department :</td>
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/> 
<td style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" value="<%=designation%>" readonly="readonly"/></td>
</td> 
</tr>
<tr>
<td style="text-align:right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>
<td style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;"><input type="text" name="sow" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" /></td>
</tr>
<tr>
<td style="text-align: right;">Requested By:</td>
<td style="text-align:left;"><input type="text" name="reqBy"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" /></td>				        
<td style="text-align: right;">Employee Contract Type :</td>
<td style="text-align:left;"><input type="text" name="emplCont"  value="<%=emp_contract_type%>" readonly="readonly" readonly="readonly" /></td>				        
</tr>
<tr>
<td align="right">Request  :</td>
<td style="text-align:left;" colspan="3"><input style="" type ="text" name = "requestOption" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
<input type ="hidden" name = "requestBranch" readonly="readonly" value ="<%=reqBranch%>"/>
</tr>
<%}%>
</table>
<br>
<%
String chk1=null,chk2=null,chk3=null,chk4=null,chk5=null,chk6=null,chk7=null,chk8=null,chk9=null,chk10=null,chk11=null,chk12=null,chk13=null,chk14=null;
String[] reqFor1 = reqFor.split(",");
for(int i=0;i<reqFor1.length;i++){
	if(reqFor1[i].trim().equalsIgnoreCase("Email ID")){
		chk1="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Domain Account")){
		chk2="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Biometric / Access Card")){
		chk3="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Shared Folder")){
		chk4="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Internet Access / FTP Access")){
		chk5="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("NEWINS")){
		chk6="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("NExAS")){
		chk7="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("GS-NET")){
		chk8="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Internal Application")){
		chk9="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("USB Access")){
		chk10="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("VPN Access")){
		chk11="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("HardDisk / PenDrive")){
		chk12="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("Any Other Asset")){
		chk13="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("NEx-GLOW")){
		chk14="checked";
	}
}
%>

<table width="895">
<tr>
<input type="hidden" name="requestFor_change" value="<%=requestFor_change%>">
<td style="text-align: right;width:15%;" rowspan="3">Request For :</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk1%> disabled="disabled" name="requestForCheck" id="requestForCheck_email" value="Email ID">Email ID</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk2%> disabled="disabled" name="requestForCheck" id="requestForCheck_dom" value="Domain Account">Domain Account</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk3%> disabled="disabled" name="requestForCheck" id="requestForCheck_bio" value="Biometric / Access Card">Biometric / Access Card</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk4%> disabled="disabled" name="requestForCheck" id="requestForCheck_sha" value="Shared Folder">Shared Folder</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk5%> disabled="disabled" name="requestForCheck" id="requestForCheck_int" value="Internet Access / FTP Access">Internet Access / FTP Access</td>
<tr>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk6%> disabled="disabled" name="requestForCheck" id="requestForCheck_newins" value="NEWINS">NEWINS</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk7%> disabled="disabled" name="requestForCheck" id="requestForCheck_nexas" value="NExAS">NExAS</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk8%> disabled="disabled" name="requestForCheck" id="requestForCheck_gs" value="GS-NET">GS-NET</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk9%> disabled="disabled" name="requestForCheck" id="requestForCheck_internal" value="Internal Application">Internal Application</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk10%> disabled="disabled" name="requestForCheck" id="requestForCheck_usb" value="USB Access">USB Access</td>
</tr>
<tr>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk11%> disabled="disabled" name="requestForCheck" id="requestForCheck_vpn" value="VPN Access">VPN Access</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk12%> disabled="disabled" name="requestForCheck" id="requestForCheck_hard" value="HardDisk / PenDrive">HardDisk / PenDrive</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk13%> disabled="disabled" name="requestForCheck" id="requestForCheck_assets" value="Any Other Asset">Any Other Asset</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk14%> disabled="disabled" name="requestForCheck" id="requestForCheck_glow" value="NEx-GLOW">NEx-GLOW</td>
<td colspan="1"></td>
</tr>
</tr>
</table>
<br>

<div id="email_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" id="emailRow" rowspan="6"  style="width:15%"><font size="3"><b>Email ID</b></font></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Email Domain :</td>
<td style="text-align: left;width: 20%;"><input type="text" name="emailDom" id="emailDom" value="<%=emailDomain%>" style="width:100%;" readonly></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Employee Type :</td>
<td style="text-align: left;width: 20%;"><input type="text" name="employType" id="employType" value="<%=employeeType%>" style="width:100%;" readonly></td>
<%-- <td style="text-align: right;width: 20%;"><font color=red>*</font>Group :</td>
<td style="text-align: left;width: 20%;"><input type="text" name="grp" id="grp" value="<%=group_name%>" style="width:100%;" readonly></td> --%>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Requested E-Mail Id :</td>
<td style="text-align: left;width: 20%;" colspan="3"><input type="text" name="reqMailID" id="reqMailID" value="<%=reqMailID%>" size="30" readonly/></td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided Mobile  :</td>
<td style="text-align:left;" id="compTD">
<input type="text" id="cmp" name="mobileOption" value="<%=CompanyProvMobile%>" readonly="readonly" style="width:100%;">
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="mob1"><font color=red>*</font>Mobile Make & Model  :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="mob2"><input type="text" name="makeModel" id="makeModel" value="<%=makeAndModel%>" style="width:100%;" readonly="readonly">
</td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided SIM Card :</td>
<td style="text-align:left;" id="compSim">
<input type="text" id="cmpSim" name="simOption" value="<%=simCard%>" readonly="readonly" style="width:100%;">
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="sim1"><font color=red>*</font>SIM Card Mobile Number :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="sim2"><input type="text" name="simNo" id="simNo" value="<%=simNo%>" style="width:100%;" readonly="readonly">
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Mobile Access (Intune)</td>
<td style="text-align:left;" id="mobInt"><input type="text" value="<%=mobIntune%>" name="onintune" readonly style="width:100%;"></td>
<td style="text-align:right;display: none;" id="intuneYes"><font color=red>*</font>Mobile No. :</td>
<td style="text-align:left;display: none;" id="intuneYes11"><input type="text" name="mobileNo" id="mobileNo" value="<%=mobileNo%>" readonly style="width:100%;"/></td>
</tr>
<tr id="intuneYes1" style="display: none;">
<td style="text-align:center;" colspan="4" class="tdColor"><font color="red">*</font>IMEI No. ('s) :</td>		
</tr>
<tr id="intuneYes111" style="display: none;">
<td style="text-align:right;display: none;" id="intuneYes12" colspan="1"><font color="red">*</font>IMEI No 1 :</td>
<td style="text-align:left;display: none;" id="intuneYes13"><input type="text" name="imei1" id="imei1" value="<%=imei1%>" readonly style="width:100%;"/></td>		
<td style="text-align:right;display: none;" id="intuneYes2" colspan="1"><font color="red">*</font>IMEI No 2 :</td>
<td style="text-align:left;display: none;" id="intuneYes21" colspan="1"><input type="text" name="imei2" id="imei2" value="<%=imei2%>" readonly style="width:100%;"/></td>
</tr>
<tr>
<td align="right"  style="width:20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left"  style="width:20%;" colspan="3"><textarea name="emailRemarks" id="emailRemarks" rows="3" cols="30" maxlength="199" readonly value=""><%=emailRemarks%></textarea></td>
</tr>
</table>
<br />
</div>
<%
String colorBG="",bgcolor="",rowDom="";
if(passChan.equalsIgnoreCase("Yes")){
	colorBG = "#9AA";
	bgcolor = "#9AA";
	rowDom = "3";
}else{
	colorBG = "";
	bgcolor = "grey";
	rowDom = "2";
}
%>
<div id="dom_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor%>" align="center" rowspan="<%=rowDom%>" style="width:15%"><font size="3"><b>Domain Account</b></font></td>
</tr>
<%if(passChan.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right;width:20%;background-color:<%=colorBG%>;"><font color="red">*</font>Password Reset :</td>
<td style="text-align:left;background-color:<%=colorBG%>;" colspan="3">
<input type="text" name="passChan" value="<%=passChan%>" readonly/>
</td>
</tr>
<%}%>
<tr>
<td style="text-align: right;width: 20%;background-color:<%=colorBG%>;"><font color="red">*</font>Remarks :</td>
<td style="text-align:left;width: 60%;background-color:<%=colorBG%>;"><textarea name="remarksDom" rows="3" cols="30" id="domainRem" maxlength="199" readonly><%=domainRemarks%></textarea></td>
</tr>
</table>
<br />
</div>
<%
String colorBG1="",bgcolor1="",rowBio="";
if(chanReqBio.equalsIgnoreCase("Yes")){
	colorBG1 = "#9AA";
	bgcolor1 = "#9AA";
	rowBio	 = "3";
}else{
	colorBG1 = "";
	bgcolor1 = "grey";
	rowBio	 = "2";
}
%>
<div id="bio_details" style="display: none;">
<table id="bio_details" width="895">
<tr>
<td bgcolor="<%=bgcolor1%>" align="center" rowspan="<%=rowBio%>" style="width:15%"><font size="3"><b>Biometric / Access Card</b></font></td>
</tr>
<%if(chanReqBio.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right; width: 20%;background-color:<%=colorBG1%>;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left; width: 20%;background-color:<%=colorBG1%>;">
<input type="text" name="changeBio" value="<%=chanReqBio%>" readonly/>
</td>
<td style="text-align:right;background-color:<%=colorBG1%>;"><font color="red">*</font>Branch ('s):</td>
<td style="text-align: left;background-color:<%=colorBG1%>;">
<input type="text" size="30" name="selBranch" value="<%=selBioBranches1%>" readonly/>
</td>
</tr>
<%}%>
<tr>
<td align="right" style="width: 20%;background-color:<%=colorBG1%>;"><font color="red">*</font>Remarks :</td>
<td align="left" style="width: 60%;background-color:<%=colorBG1%>;" colspan="3"><textarea name="bioRemarks" rows="3" cols="30" id="bioRemarks" maxlength="199" readonly><%=bioRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="sha_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Shared Folder Access</b></font></td>
<td align="right" style="width: 20%;"><font color="red">*</font>Remarks :</td>
<td align="left" style="width: 60%;"><textarea name="sharedRemarks" rows="3" cols="30" id="shareRemarks" maxlength="199" readonly><%=folderRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="int_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internet Access / FTP Access</b></font></td>
<td style="text-align: right;width: 20%;"><font color="red">*</font>Request Type :</td>
<td style="font-weight:bold;font-style:italic;text-align:left;width: 60%;"><input type="text" name="internetReqType" value="<%=internetReqType%>" readonly></td>
</td>
</tr>
<tr>
<td align="right" style="width:20%"><font color="red">*</font>Remarks :</td>
<td align="left" style="width:60%"><textarea name="internetRem" rows="3" cols="30" id="idinternetRem" maxlength="199" readonly><%=internetRemarks%></textarea></td>
</tr>
</table>
<br />
</div>
<%
String colorBG2="",bgcolor2="",rowNEW="";
if(changesNewins.equalsIgnoreCase("Yes")){
	colorBG2 = "#9AA";
	bgcolor2 = "#9AA";
	rowNEW	 = "6";
}else if(changesNewins.equalsIgnoreCase("Yes")){
	colorBG2 = "#9AA";
	bgcolor2 = "#9AA";
	rowNEW	 = "6";
}else{
	colorBG2 = "";
	bgcolor2 = "grey";
	rowNEW	 = "4";
}
%>
<div id="new_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor2%>" align="center" rowspan="<%=rowNEW%>" style="width:15%"><font size="3"><b>NEWINS</b></font></td>
</tr>
<%if(changesNewins.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right; width: 20%;background-color: <%=colorBG2%>;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;background-color: <%=colorBG2%>;">
<input type="text" name="changeNew" value="<%=changesNewins%>" id="changeNew" readonly/>
</td>
<td style="text-align:right;width: 20%;background-color: <%=colorBG2%>;" colspan="1"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG2%>;">
<input type="text" name="prevNewinBr" id="prevNew" value="<%=previousBranchesNewins%>" readonly>
</td>
</tr>
<%}else{%>
<input type="hidden" name="changeNew" value="" id="changeNew" readonly/>
<%}%>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Requested Branch Code :</td>
<td align="left" style="width: 60%;background-color: <%=colorBG2%>;" colspan="3"><input type="text" name="reqBrCode" size=50 id="idreqBranch" value="<%=newinsBranchCode%>" readonly/>
</td> 
</tr>
<tr>
<td style="text-align: right;width:20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Requested NEWIN's ID / Operator Code :</td>
<td style="text-align:left;width:60%;background-color: <%=colorBG2%>;" colspan="3"><input type="text" name="newinCode" id="ncode" maxlength="44" size="29" value="<%=newinsOpCode%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:60%;background-color: <%=colorBG2%>;" colspan="3"><input type="text" name="newinsRequest" value="<%=newinsRequest%>" readonly></td>
</tr>
<tr style="visibility: hidden;display: none;" id="idDelete">
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Remarks :</td>
<td style="text-align: left;width: 20%;background-color: <%=colorBG2%>;" colspan="3"><textarea name="newRem" rows="3" cols="30" id="newRem" maxlength="99" title="Remarks 100 characters" readonly><%=newinsRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<%

String progBlocked="",progAllowed="";
Connection cnCHNew=null;
Statement stCHNew=null; 
ResultSet rsCHNew=null;
cnCHNew = con.getConnection2();
stCHNew=cnCHNew.createStatement();
if(changesNewins.equalsIgnoreCase("Yes")){	
rsCHNew = stCHNew.executeQuery("SELECT newinProgBlocked,newinProgAllowed FROM neinapplicationformmain WHERE emplCode='"+emp_code+"'");
if(rsCHNew.next()){
	progBlocked = rsCHNew.getString("newinProgBlocked");
	progAllowed = rsCHNew.getString("newinProgAllowed");
}
}

String lvlNo="",newLvlNo="",newFtype="";
String emp_no2 = (String) session.getAttribute("EmpNo");
rsCHNew = stCHNew.executeQuery("select levelno from neinapplicationform_item WHERE form2_no='"+req+"' and empid='"+emp_no2+"' ORDER BY item_id ASC"); 
if(rsCHNew.next())
{
lvlNo = rsCHNew.getString("levelno");
}
System.out.println("lvlNo====>"+lvlNo);
System.out.println("SELECT levelno,ftype FROM formapproval WHERE branch='"+i_b_no+"' and levelno='"+lvlNo+"' and formtype='APPLICATION' and empid='"+emp_no2+"'");

rsCHNew = stCHNew.executeQuery("SELECT levelno,ifnull(ftype,'0') as ftype FROM formapproval WHERE branch='"+i_b_no+"' and levelno='"+lvlNo+"' and formtype='APPLICATION' and empid='"+emp_no2+"'");
if(rsCHNew.next()){
	newLvlNo = rsCHNew.getString("levelno");
	newFtype = rsCHNew.getString("ftype");
}

System.out.println("newLvlNo====>"+newLvlNo);
System.out.println("newFtype====>"+newFtype);

%>
<input type="hidden" value="<%=newFtype%>" name="newUser" id="newUser">
<input type="hidden" value="<%=progBlocked%>" name="proBlo" id="proBlo">
<input type="hidden" value="<%=progAllowed%>" name="proAll" id="proAll">
<%if((newFtype.equals("33")) && (reqFor.contains("NEWINS"))){%>
<table width="895">
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Level  :</td>
<td style="font-weight:bold;font-style:italic;width:60%;background-color: <%=colorBG2%>;" colspan="11"><input type="text" name="newinsLevel" value="<%=newinsLevel%>"></td>
</tr>
<%
Connection cndel1new = null,cndel2new = null,cndel3new = null,cndel4new = null;
Statement stdel1new = null,stdel2new = null,stdel3new = null,stdel4new = null; 
ResultSet rsdel1new = null,rsdel2new = null,rsdel3new = null,rsdel4new = null;

cndel1new = con.getConnection2();
stdel1new=cndel1new.createStatement();
rsdel1new = stdel1new.executeQuery("SELECT b_id,proBlocked,form_no FROM neinnewinsblocked WHERE form_no='"+req+"' ORDER BY proBlocked Asc");
cndel2new = con.getConnection2();
stdel2new=cndel2new.createStatement();
rsdel2new = stdel2new.executeQuery("SELECT a_id,proAllowed,form_no FROM neinnewinsallowed WHERE form_no='"+req+"' ORDER BY proAllowed Asc");
cndel3new = con.getConnection2();
stdel3new=cndel3new.createStatement();
rsdel4new = stdel3new.executeQuery("select pro_name from newins_programs WHERE pro_name NOT IN ( SELECT proBlocked FROM neinnewinsblocked Where form_no='"+req+"') ORDER BY pro_name Asc");
cndel4new = con.getConnection2();
stdel4new=cndel4new.createStatement();
rsdel3new = stdel4new.executeQuery("select pro_name from newins_programs WHERE pro_name NOT IN ( SELECT proAllowed FROM neinnewinsallowed Where form_no='"+req+"') ORDER BY pro_name Asc");
%>
<tr width="100%">
<td align="left" bgcolor="<%=bgcolor2%>" id="idBlockedColor" colspan="11"><font size=2 >Programs to be blocked<font color=red>*</font></font></td>
</tr>
<%  
while(rsdel1new.next()){
String progBlockednew= rsdel1new.getString("proBlocked");
String id = rsdel1new.getString(1);
%>
<tr>
<td bgcolor="white">Previously Blocked Programs</td>
<td colspan="5" bgcolor="#F0F0F0"><input name=Locname style="background-color:#F0F0F0;width:100;color:black;" value="<%=progBlockednew%>" readonly="readonly" /></td>
<td colspan="5" id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rsdel1new.getString(1)%>);" /></td></tr>
<%}%>
<tr>
<td bgcolor="white" style="text-align:left; width: 16%;" rowspan="4"><font color="black" size="2"><b>Program</b></font></td>
</tr>
<%
int count=0,count2=0;
ArrayList<String> pro_nameBlockednew = new ArrayList<String>();
ArrayList<String> pro_nameAllowednew = new ArrayList<String>();
while(rsdel4new.next()){ 
pro_nameBlockednew.add(rsdel4new.getString("pro_name"));
} 
while(rsdel3new.next()){ 
pro_nameAllowednew.add(rsdel3new.getString("pro_name"));
}
int column = 0,column2=0;
for(int row=0;row<pro_nameBlockednew.size();row+=8)
{
%> 
<tr>
<%
for(column=0;column<8;column++){
if(row+column<pro_nameBlockednew.size())
{ 
String temp = pro_nameBlockednew.get(row+column);
%>
<td bgcolor="lightgrey" style="background-color: <%=colorBG2%>;">
<input size="30" width="30" type="checkbox" name="progBlocked" id="progBlocked<%=pro_nameBlockednew.get(row+column)%>" class="check" onclick="chkNewinsProg(this.value)" value="<%=pro_nameBlockednew.get(row+column)%>" /><%=pro_nameBlockednew.get(row+column) %></td>
<%
}
}
%>
</tr>
<%}%>
<tr>
<td align="left" style="background-color: <%=bgcolor2%>;" id="idAllowedColor" colspan="11"><font size=2 >Programs to be Allowed<font color=red>*</font></font></td>
</tr>
<%  
while(rsdel2new.next()){
String progAllowednew= rsdel2new.getString("proAllowed");
String id = rsdel2new.getString(1);
%>
<tr>
<td bgcolor="white">Previously Allowed Programs</td>
<td colspan="5" bgcolor="#F0F0F0"><input  name=Locname style="background-color:#F0F0F0;width:100;color:black;" value="<%=progAllowednew%>" readonly="readonly" /></td>
<td colspan="5" id="hiderow" sty><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord2(<%=rsdel2new.getString(1)%>);" /></td></tr>
<%} %>
<tr>
<td bgcolor="white" style="text-align:left; width: 16%;" rowspan="4"><font color="black" size="2"><b>Program</b></font></td>
<% 
for(int row2=0;row2<pro_nameAllowednew.size();row2+=8)
{
%> 
<tr colspan="10">

<% for(column2=0;column2<8;column2++){
 if(row2+column2<pro_nameAllowednew.size())
 {
 String temp2 = pro_nameAllowednew.get(row2+column2);
 %>
<td style="background-color: <%=colorBG2%>;">
<input type="checkbox" name="progAllowed" id="progAllowed<%=pro_nameAllowednew.get(row2+column2)%>" class="check" onclick="chkNewinsProg(this.value)" value="<%=pro_nameAllowednew.get(row2+column2)%>" /><%=pro_nameAllowednew.get(row2+column2) %></td>
<%
}
}
%>
</tr>
<%} %>
</tr>
<input type="hidden" name="CheckValues" value="" id="text" />
</table>
<br>
<%}%>

<div id="nex_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="8" style="width:15%"><font size="3"><b>NExAS</b></font></td>
<td align="right" style="width:20%;"><font color="red">*</font>Company Code :</td>
<td style="text-align: left;width: 60%;"><input type="text" name="nexasCompCode" value="<%=nexasCompCode%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Cost Center Name:</td>
<td style="text-align: left;width: 60%;"><input type="text" name="nexasCCName" value="<%=nexasCCName%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Cost Center Code:</td>
<td style="text-align: left;width:60%;"><input type="text" name="costCCode" id="idcostCCode" value="<%=nexasCCCode%>" size="10" maxlength="44" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Operation range:</td>
<td style="text-align: left;width:60%;"><input type="text" name="costOPRange"	id="idcostOPRange" value="<%=nexasOPRange%>" size="10" maxlength="44" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Request Type <font color=red>(Please select first)</font></td>
<td style="text-align: left;width: 60%;"><input type="text" name="nexasReqType1" value="<%=nexasReqType1%>" readonly>
<input type="hidden" name="nexasReqType" value="<%=nexasReqType%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;">Optional menu</td>
<td style="text-align: left;width: 60%;"><textarea rows="3" name="nexasOptionalMenu1" cols="65" readonly><%=nexasOptionalMenu1%></textarea><input type="hidden" name="nexasOptionalMenu" value="<%=nexasOptionalMenu%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;"><textarea name="nexasRem" rows="3" cols="30" id="idnexasRem" maxlength="199" readonly><%=nexasRemarks%></textarea></td>
</tr>
<tr>
<td colspan="10">
<font color=red><b><h3>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br /></h3>
</font> 
</td>
</tr>
</table>
<br />
</div>
<%
String colorBG3="",bgcolor3="",rowGS="";
if(changesGSNet.equalsIgnoreCase("Yes")){
	colorBG3 = "#9AA";
	bgcolor3 = "#9AA";
	rowGS	 = "9";
}else{
	colorBG3 = "";
	bgcolor3 = "grey";
	rowGS	 = "6";
}
%>
<div id="gs_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor3%>" align="center" rowspan="<%=rowGS%>" style="width:15%"><font size="3"><b>GS-NET</b></font></td>
<%if(changesGSNet.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right; width: 20%;background-color: <%=colorBG3%>;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;background-color: <%=colorBG3%>;" colspan="3">
<input type="text" name="changeGS" value="<%=changesGSNet%>" id="changeGS" readonly/>
</td>
</tr>
<tr>
<td style="text-align:righ;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="changesGSNet" id="changesGSNet" rows="3" value="<%=prevBRCodesGSNet%>" readonly><%=prevBRCodesGSNet%></textarea>
</td>
<td style="text-align:right;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="prevDivGSNet" id="prevDivGSNet" rows="3" value="<%=prevDivGSNet%>" readonly><%=prevDivGSNet%></textarea>
</td>
</tr>
<tr>
<td style="text-align:right;width: 20%;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="prevPDivGSNet" id="prevPDivGSNet" rows="3" value="<%=prevPDivGSNet%>" readonly><%=prevPDivGSNet%></textarea>
</td>
<td style="text-align:right;width: 20%;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="prevRoleGSNet" id="prevRoleGSNet" rows="3" value="<%=prevRoleGSNet%>" readonly><%=prevRoleGSNet%></textarea>
</td>
</tr>
<%}%>
<tr>    
<td align="right" style="width:20%;background-color: <%=colorBG3%>;"><font color=red>*</font>Requested GSNET Branch Code :</td>
<td align="left" style="width:60%;background-color: <%=colorBG3%>;" colspan="3"><textarea name="gsnetBranchCode" rows="3" cols="65" readonly><%=gsnetBranchCode%></textarea></td>
</tr>

<tr>     
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;"><font color=red>*</font>Requested Division Name :</td>
<td style="text-align: left;width: 60%;background-color: <%=colorBG3%>;" colspan="3"><input type="text" name="gsnetDivName" style="width:75%;" value="<%=gsnetDivName%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;"><font color=red>*</font>Requested Primary Division:</td>
<td style="text-align: left;width: 60%;background-color: <%=colorBG3%>;" colspan="3"><input type="text" name="gsnetPrimaryDiv" style="width:75%;" value="<%=gsnetPrimaryDiv%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;"><font color=red>*</font>Requested User Role  :</td>
<td style="text-align: left;width: 60%;background-color: <%=colorBG3%>;" colspan="3"><input type="text" name="gsnetUserRole" style="width:75%;" value="<%=gsnetUserRole%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;"><font color=red>*</font>Remarks  :</td>
<td style="text-align: left;width: 60%;background-color: <%=colorBG3%>;" colspan="3"><textarea name="gsNetremarks" rows="3" cols="30" id="gsNetremarks" maxlength="199" title="Remarks 200 characters" readonly><%=gsnetRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="inter_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internal Application</b></font></td>
<td align="right" style="width:20%"><font color="red">*</font>Internal Application :</td>
<td align="left" style="width:60%"><textarea name="internalApplication" rows="3" cols="65" readonly><%=internalApplication%></textarea>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;"><textarea name="internalRem" rows="3" cols="30" id="idinternalRem" maxlength="199" readonly><%=internalRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="usb_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>USB Access</b></font></td>
<td style="text-align: right;width:20%;"><font color=red>*</font>Access For :</td>
<td style="text-align: left;width:60%"><input type="text" name="usbAccessFor" value="<%=usbAccessFor%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>USB Details:</td>
<td style="text-align: left;width: 60%;"><input type="text" size="29" name="dscNo" value="<%=usbDetails%>" id="dscNo" maxlength="44" readonly/></td>		
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color="red">*</font>Remarks / Reason :</td>
<td style="text-align:left;width: 60%;"><textarea name="usbRem1" rows="3" cols="30" id="idUSBRem1" maxlength="199" readonly><%=usbRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="vpn_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>VPN Access</b></font></td>
<td style="text-align: right;width:20%;"><font color=red>*</font>Domain ID :</td>
<td style="text-align: left;width: 60%;"><input type="text" name="domID" id="idDOMid" size="29" maxlength="44" value="<%=vpnDomainID%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color="red">*</font>Email ID :</td>
<td style="text-align: left;width: 60%;"><input type="text" name="vpnEmail" id="idvpnEmail" size="29" maxlength="44" value="<%=vpnEmailID%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color="red">*</font>MPLS / NON MPLS :</td>
<td style="text-align: left;width: 60%;"><input type="text" name="vpnMPLS" value="<%=vpnMPLS%>" readonly></td>
</tr>
</table>
<br />
</div>


<div id="hard_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>HardDisk / PenDrive</b></font></td>
<td align="right" style="width: 20%;"><font color="red">*</font>Remarks :</td>
<td align="left" style="width: 60%;"><textarea name="hardRemarks" rows="3" cols="30" id="hardRemarks" maxlength="199" readonly><%=hardPenRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="asset_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Any Other Asset</b></font></td>
<td align="right" style="width: 20%;"><font color="red">*</font>Remarks :</td>
<td align="left" style="width: 60%;"><textarea name="assetRemarks" rows="3" cols="30" id="assetRemarks" maxlength="199" readonly><%=otherAssetRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="glow_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>NEx-GLOW</b></font></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>Project :</td>
<td align="left" style="width: 60%;"><input type="text" name="project" id="project" value="<%=project%>" size="50" readonly></td>
</tr>
<tr>
<td align="right" style="width: 20%;"><font color="red">*</font>Ware-House :</td>
<td align="left" style="width: 60%;"><input type="text" name="warehouse" id="warehouse" value="<%=warehouse%>" size="50" readonly></td>
</tr>
<tr>
<td align="right" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left" colspan="3"><textarea name="glowRemarks" rows="3" cols="30" id="glowRemarks" maxlength="199" readonly><%=glowRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<%
String domAcc="",domPass="",domRemaa="",bioRemaa="",shaRemaa="",internetRemaa="",newOPC="",newPass="",newinLev="",newGrp="",newAccBr="",newRemaa="",nexUID="",nexPass="",nexRemaa="",gsnetCode="",gsnetPass="",gsnetBRC="",gsnetDiv="",gsnetPDIV="",gsnetRole="",gsnetRemaa="",internalID="",internalPass="",internalRemaa="",usbRemaa="",vpnFort="",hardRemaa="",otherRemaa="",newAll="",newBlo="",mailCreate="",intProvided="",emPass="",emRemaa="",glowID="",glowPass="",glowRemaa="";
Statement stExtra = null;
ResultSet rsExtra = null;
cnExtra = con.getConnection2();
stExtra = cnExtra.createStatement();
System.out.println("here====>"+newinsLevel);
rsExtra = stExtra.executeQuery("select mailIDCreated,intuneAccessProvided,emailAppRemarks,emailPassword,domainAccount,domainPassword,domainAppRemarks,bioAppRemarks,sharedAppRemarks,internetAPPRemarks,newinsOPAppCode,newinsPassword,newinsLevel,newinsGroup,newinsAccessedBranches,newinsAppRemarks,nexasID,nexasPassword,nexasAppRemarks,gsnetCode,gsnetPassword,assignedGsnetBranch,assignedGsnetDivName,assignedGsnetPriDiv,assignedGsnetUserRole,gsnetAppRemarks,internalID,internalPassword,internalAppRemarks,usbAppRemarks,vpnFortiToken,hardPenAppRemarks,otherAssetAppRemarks,newinAllowed,newinBlocked,glowID,glowPass,glowAppRemarks from neinapplicationform_requestfor a left outer join neinapplicationform b on a.app_no=b.applicationNo where employee_code='"+emp_code+"' and b.Approval_sttatuss in ('Closed') ");
while(rsExtra.next()){
	if((rsExtra.getString("domainAccount"))!=null){		
		domAcc = rsExtra.getString("domainAccount");
	}if((rsExtra.getString("domainPassword"))!=null){
		domPass = rsExtra.getString("domainPassword");
	}if((rsExtra.getString("domainAppRemarks"))!=null){
		domRemaa = rsExtra.getString("domainAppRemarks");
	}if((rsExtra.getString("bioAppRemarks"))!=null){
		bioRemaa = rsExtra.getString("bioAppRemarks");
	}if((rsExtra.getString("sharedAppRemarks"))!=null){
		shaRemaa = rsExtra.getString("sharedAppRemarks");
	}if((rsExtra.getString("internetAPPRemarks"))!=null){
		internetRemaa = rsExtra.getString("internetAPPRemarks");
	}if((rsExtra.getString("newinsOPAppCode"))!=null){
		newOPC = rsExtra.getString("newinsOPAppCode");
	}if((rsExtra.getString("newinsPassword"))!=null){
		newPass = rsExtra.getString("newinsPassword");
	}if((rsExtra.getString("newinsLevel"))!=null){
		newinLev = rsExtra.getString("newinsLevel");
	}if((rsExtra.getString("newinsGroup"))!=null){
		newGrp = rsExtra.getString("newinsGroup");
	}if((rsExtra.getString("newinsAccessedBranches"))!=null){
		newAccBr = rsExtra.getString("newinsAccessedBranches");
	}if((rsExtra.getString("newinsAppRemarks"))!=null){
		newRemaa = rsExtra.getString("newinsAppRemarks");
	}if((rsExtra.getString("nexasID"))!=null){
		nexUID = rsExtra.getString("nexasID");
	}if((rsExtra.getString("nexasPassword"))!=null){
		nexPass = rsExtra.getString("nexasPassword");
	}if((rsExtra.getString("nexasAppRemarks"))!=null){
		nexRemaa = rsExtra.getString("nexasAppRemarks");
	}if((rsExtra.getString("gsnetCode"))!=null){
		gsnetCode = rsExtra.getString("gsnetCode");
	}if((rsExtra.getString("gsnetPassword"))!=null){
		gsnetPass = rsExtra.getString("gsnetPassword");
	}if((rsExtra.getString("assignedGsnetBranch"))!=null){
		gsnetBRC = rsExtra.getString("assignedGsnetBranch");
	}if((rsExtra.getString("assignedGsnetDivName"))!=null){
		gsnetDiv = rsExtra.getString("assignedGsnetDivName");
	}if((rsExtra.getString("assignedGsnetPriDiv"))!=null){
		gsnetPDIV = rsExtra.getString("assignedGsnetPriDiv");
	}if((rsExtra.getString("assignedGsnetUserRole"))!=null){
		gsnetRole = rsExtra.getString("assignedGsnetUserRole");
	}if((rsExtra.getString("gsnetAppRemarks"))!=null){
		gsnetRemaa = rsExtra.getString("gsnetAppRemarks");
	}if((rsExtra.getString("internalID"))!=null){
		internalID = rsExtra.getString("internalID");
	}if((rsExtra.getString("internalPassword"))!=null){
		internalPass = rsExtra.getString("internalPassword");
	}if((rsExtra.getString("internalAppRemarks"))!=null){
		internalRemaa = rsExtra.getString("internalAppRemarks");
	}if((rsExtra.getString("usbAppRemarks"))!=null){
		usbRemaa = rsExtra.getString("usbAppRemarks");
	}if((rsExtra.getString("vpnFortiToken"))!=null){
		vpnFort = rsExtra.getString("vpnFortiToken");
	}if((rsExtra.getString("hardPenAppRemarks"))!=null){
		hardRemaa = rsExtra.getString("hardPenAppRemarks");
	}if((rsExtra.getString("otherAssetAppRemarks"))!=null){
		otherRemaa = rsExtra.getString("otherAssetAppRemarks");
	}if((rsExtra.getString("newinAllowed"))!=null){
		newAll = rsExtra.getString("newinAllowed");
	}if((rsExtra.getString("newinBlocked"))!=null){
		newBlo = rsExtra.getString("newinBlocked");
	}if((rsExtra.getString("mailIDCreated"))!=null){
		mailCreate = rsExtra.getString("mailIDCreated");
	}if((rsExtra.getString("intuneAccessProvided"))!=null){
		intProvided = rsExtra.getString("intuneAccessProvided");
	}if((rsExtra.getString("emailAppRemarks"))!=null){
		emRemaa = rsExtra.getString("emailAppRemarks");
	}if((rsExtra.getString("emailPassword"))!=null){
		emPass = rsExtra.getString("emailPassword");
	}if((rsExtra.getString("glowID"))!=null){
		glowID = rsExtra.getString("glowID");
	}if((rsExtra.getString("glowPass"))!=null){
		glowPass = rsExtra.getString("glowPass");
	}if((rsExtra.getString("glowAppRemarks"))!=null){
		glowRemaa = rsExtra.getString("glowAppRemarks");
	}
}
%>
<input type="hidden" name="mailCreate" value="<%=mailCreate%>">
<input type="hidden" name="intProvided" value="<%=intProvided%>">
<input type="hidden" name="emRemaa" value="<%=emRemaa%>">
<input type="hidden" name="emPass" value="<%=emPass%>">
<input type="hidden" name="domAcc" value="<%=domAcc%>">
<input type="hidden" name="domPass" value="<%=domPass%>">
<input type="hidden" name="domRemaa" value="<%=domRemaa%>">
<input type="hidden" name="bioRemaa" value="<%=bioRemaa%>">
<input type="hidden" name="shaRemaa" value="<%=shaRemaa%>">
<input type="hidden" name="internetRemaa" value="<%=internetRemaa%>">
<input type="hidden" name="newOPC" value="<%=newOPC%>">
<input type="hidden" name="newPass" value="<%=newPass%>">
<input type="hidden" name="newinLev" value="<%=newinLev%>">
<input type="hidden" name="newGrp" value="<%=newGrp%>">
<input type="hidden" name="newAccBr" value="<%=newAccBr%>">
<input type="hidden" name="newRemaa" value="<%=newRemaa%>">
<input type="hidden" name="nexUID" value="<%=nexUID%>">
<input type="hidden" name="nexPasswo" value="<%=nexPass%>">
<input type="hidden" name="nexRemaa" value="<%=nexRemaa%>">
<input type="hidden" name="gsnetCode" value="<%=gsnetCode%>">
<input type="hidden" name="gsnetPass" value="<%=gsnetPass%>">
<input type="hidden" name="gsnetBRC" value="<%=gsnetBRC%>">
<input type="hidden" name="gsnetDiv" value="<%=gsnetDiv%>">
<input type="hidden" name="gsnetPDIV" value="<%=gsnetPDIV%>">
<input type="hidden" name="gsnetRole" value="<%=gsnetRole%>">
<input type="hidden" name="gsnetRemaa" value="<%=gsnetRemaa%>">
<input type="hidden" name="internalID" value="<%=internalID%>">
<input type="hidden" name="internalPass" value="<%=internalPass%>">
<input type="hidden" name="internalRemaa" value="<%=internalRemaa%>">
<input type="hidden" name="usbRemaa" value="<%=usbRemaa%>">
<input type="hidden" name="vpnFort" value="<%=vpnFort%>">
<input type="hidden" name="hardRemaa" value="<%=hardRemaa%>">
<input type="hidden" name="otherRemaa" value="<%=otherRemaa%>">
<input type="hidden" name="newAll" value="<%=newAll%>">
<input type="hidden" name="newBlo" value="<%=newBlo%>">
<input type="hidden" name="glowID1" value="<%=glowID%>">
<input type="hidden" name="glowPass1" value="<%=glowPass%>">
<input type="hidden" name="glowAppRemaa" value="<%=glowRemaa%>">

<br />
<table id="tableData" name="tableData" width="895" border="1" align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
</tr>
<%
String mailD=null,emp_no=null,levelno=null,form2_noD=null,colChange="red";
cn1 = con.getConnection2();
st1=cn1.createStatement();
String statusD=null;
rs1 = st1.executeQuery("select item_id,form2_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y') as f_date,mail,empid,levelno from neinapplicationform_item WHERE form2_no='"+req+"' ORDER BY item_id ASC"); 
while(rs1.next())
{
form2_noD= rs1.getString("form2_no");
String desgD= rs1.getString("desg");
empD= rs1.getString("emp");
statusD= rs1.getString("status");
String remarksD= rs1.getString("remarks");
String f_dateD= rs1.getString("f_date");
mailD= rs1.getString("mail");
String m = "";
emp_no= rs1.getString("empid");
levelno= rs1.getString("levelno");
if(rs1.getString("mail")!=null)
{
m =  rs1.getString("mail").trim();
}

if(statusD.equalsIgnoreCase("Initiator")){
	colChange = "#0066FF";
}else if(statusD.equalsIgnoreCase("Approved") || statusD.equals("Clarification Required")){
	colChange = "lightgreen";
}else if(statusD.equalsIgnoreCase("Pending")){
	colChange = "#FF6600";
}else{
	colChange = "#FF0000";
}
%>
<tr>
<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
<input id="idStatus" type="hidden" value="<%=statusD.trim()%>"/>
</td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
<td bgcolor="white" width="100" class="fonter" style="background-color: <%=colChange%>"><%=statusD.trim()%></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
</tr>
<%}%>
</table>
<%
String emp_no1 = (String) session.getAttribute("EmpNo");
%> 
<%String flag =c2ITUtil1.getAuthorizedNameAPPForm(form2_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(), emp_no1); %>
<%
System.out.println("FLAG value --------------------- : "+flag);
%>
<%
String crlvl="",clarifyCol="";
rs1 = st1.executeQuery("select distinct levelno,clarifyCol from neinapplicationform_item WHERE form2_no='"+req+"' and empid='"+emp_no2+"' ORDER BY item_id desc");
if(rs1.next()){
	crlvl 		= rs1.getString(1);
	clarifyCol 	= rs1.getString(2);
}
System.out.println("crlvl====>"+crlvl);
%>
<input type="hidden" value="<%=crlvl%>" name="clvl" id="clvl">
<input type="hidden" value="<%=clarifyCol%>" name="clarifyCol" id="clarifyCol">

<br></br>
<table align="center" class="dynatable" width="895" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
<input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
<input type="hidden" value="<%= session.getAttribute("form2_no") %>" id="idmrId"/>
<input type="hidden" id="idstatus" value="<%= flag %>" />

<tr>
<td align="left" colspan="11">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="showTR();<%if(levelno.equals("Creater")){%>hiddenTables1(document.form.requestForCheck);<%}%>bcc();"/>Approved 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR(this.value));" />Not Approved

<%if(!crlvl.equalsIgnoreCase("00") && !crlvl.equalsIgnoreCase("Creater") && !clarifyCol.equalsIgnoreCase("2")){%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Clarification Required" onclick="return(hideTR(this.value));" />Clarification Required
<%}%>

</td> 
</tr> 

<tr style="display: none;" id="idApproved" >
<% 

String mailTrigger = "";
String roapprover="";

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
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
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");

String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);   
Statement nstmt = connhrms.createStatement();  
    
String maxlevel="";
     
cn1 = con.getConnection2();
st12=cn1.createStatement();	  
String i_b_no1=form2_noD.substring(17,19);
rs12= st12.executeQuery("SELECT max(levelno) FROM formapproval WHERE branch='"+i_b_no1+"' and formtype='APPLICATION'  ORDER BY levelno ASC");
if(rs12.next())
{ 
maxlevel=rs12.getString(1);
}
//System.out.println("Max Level no :"+maxlevel);
String allopt="",dirappro="",ftype="";
st11 = cn1.createStatement();  
System.out.println("i_b_no  :"+i_b_no1);

rs11 = st11.executeQuery("SELECT alloptions,directApprove,ftype FROM formapproval WHERE branch='"+i_b_no1+"' and empid='"+emp_no+"' and levelno='"+levelno+"' and formtype='APPLICATION'");
if(rs11.next())
{ 
allopt=rs11.getString(1);
dirappro=rs11.getString(2);
ftype=rs11.getString(3)==null?"0":rs11.getString(3);
}
int nextlevel=0;
st5 = cn5.createStatement(); 
System.out.println("Current Level no :"+levelno);
if(!levelno.equals("Creater"))
{
nextlevel=Integer.parseInt(levelno)+1;
}
else
{
nextlevel=Integer.parseInt(maxlevel);
levelno=maxlevel;
}

rs11 = st11.executeQuery("SELECT levelno,empid,clarifyCol FROM neinApplicationForm_item WHERE clarifyCol='1' and form2_no='"+req+"'");
if(rs11.next())
	{ 
		nextlevel  = rs11.getInt(1);
		roapprover = rs11.getString(2);
		clarifyCol = rs11.getString(3);
	}

if(!(reqFor.contains("NEWINS")) && !(reqFor.contains("GS-NET")) && !(reqFor.contains("NEx-GLOW")) && !(reqFor.contains("NExAS")) && Integer.parseInt(levelno)==3 && !i_b_no1.equals("90")){
	nextlevel++;
	nextlevel++;
//System.out.println("here"+nextlevel);
}else if(!(reqFor.contains("NEWINS")) && !(reqFor.contains("GS-NET")) && !(reqFor.contains("NEx-GLOW")) && !(reqFor.contains("NExAS")) && Integer.parseInt(levelno)==1 && i_b_no1.equals("90")){
	nextlevel++;
	nextlevel++;
}

System.out.println("reqFor====>"+reqFor);
System.out.println("employeeType====>"+employeeType);
System.out.println("ftype====>"+ftype);
if(reqFor.contains("Email ID")){
if(!employeeType.equalsIgnoreCase("Expats") && ftype.equals("2")){
    nextlevel++;
    mailTrigger = "";
}else if(!employeeType.equalsIgnoreCase("Expats") && !ftype.equals("2")){
	mailTrigger = "";
}else if(employeeType.equalsIgnoreCase("Expats") && ftype.equals("2")){
	mailTrigger = "emailExpats";
}
}else if(!reqFor.contains("Email ID") && ftype.equals("2")){
	nextlevel++;
    mailTrigger = "";
}

System.out.println("nextlevel====>"+nextlevel);
System.out.println("mailTrigger====>"+mailTrigger);

/* ////////////////////////// Skeeping level code  ////////////////////////////////// */
String nextemp="";
stnext = cn5.createStatement(); 
rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='APPLICATION' ORDER BY levelno ASC");
if(rsnext.next())
{
nextemp=rsnext.getString(5);
newFtype=rsnext.getString("ftype")==null?"0":rsnext.getString("ftype");
}
if(emp_no.equals(nextemp))
{
if(!levelno.equals("Creater")) 
nextlevel++;
}
System.out.println("newFtype====>"+newFtype);

String newUser="";
ResultSet nrnew = st5.executeQuery("select newinsUser from login where Nno='"+nextemp+"'");
if(nrnew.next()){
	newUser = nrnew.getString(1);
}

if(((reqFor.contains("NEWINS")) || (reqFor.contains("GS-NET")) || !(reqFor.contains("NEx-GLOW")) || (reqFor.contains("NExAS"))) && (newFtype.equalsIgnoreCase("33"))){
	mailTrigger = "newins";
}

System.out.println("mailTrigger==========================>"+mailTrigger);

/* ////////////////////////// end Skeeping level code  ////////////////////////////////// */

if(allopt.equals("0") || allopt.equals(""))
{
if(!levelno.equals(maxlevel) && !dirappro.equals("1"))
{
System.out.println("Next  Level no111 :"+nextlevel);

if(clarifyCol.equalsIgnoreCase("1")){    			 
    rs5 = st5.executeQuery("SELECT distinct 1,1,1,1,"+roapprover+" FROM formapproval");
}else{    			 
    rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='APPLICATION' ORDER BY levelno ASC");
}

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
<input type="hidden" name="mailTrigger" value="<%=mailTrigger%>">
<input type="hidden" name="senddirect" id="senddirect" value="sendonly" readonly/>
<td> 
<input align="left" type="radio" value="<%=napproval%>" id="iddeptadminP1" name="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
<input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
<input type="hidden" name="mail12" id="iddeptadminP" value="<%=napproval%>" size="30"/>
</td>
            
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
<%}
}
else
{
System.out.println(" approve section.............");
String app_name=null,developer_name=null,developer_mail=null,napprovalsw="",napprovalsw1="";
/*st2=cn2.createStatement();
rs2 = st2.executeQuery("select app_name,developer_name,developer_mail from software_owner_master where app_name='NEIN-P2P'");
if(rs2.next())
{
app_name = rs2.getString("app_name");
developer_name = rs2.getString("developer_name");
developer_mail = rs2.getString("developer_mail");
}
napprovalsw=developer_name+"("+developer_mail+")";
napprovalsw1="2736"+","+developer_name+","+"Dy. Manager"+","+developer_mail+","+"Creater";
*/

if(!levelno.equals(maxlevel) && dirappro.equals("1"))
{%>
<td colspn="11">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="send" id="idIT" onclick="hideHigherTR(this.value);" />Send To HO (IT) 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="direct" id="idmNon" onclick="showHigherTR(this.value);hiddenTables2(document.form.requestForCheck);bcc();"/>Direct Approve
</td>

<%
rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+maxlevel+"' and formtype='APPLICATION' ORDER BY levelno ASC");
if(rs5.next())
{
ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString(5) + "' ) AND u.employee_status = 'yes' ");
if(nrs.next())
{ 
nuname=nrs.getString(1);
ndesg=nrs.getString(2);
nmailid=nrs.getString(6);
}
napproval=rs5.getString(5)+","+nuname+","+ndesg+","+nmailid+","+"Creater";
napproval1=nuname+" ("+nmailid+")";
System.out.println("Next approval :"+napproval); 
%>
<input type="hidden" name="mailTrigger" value="<%=mailTrigger%>">
<input type="hidden" name="senddirect" id="senddirect" value="senddirect" readonly/>
<td style="display: none;" id="send">Send to HO (IT) for Create Domain<br>
<!-- 
<input align="left" type="radio" value="<%=napprovalsw%>" id="iddeptadminP1" name="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
<input type="text" name="mail11" id="iddeptadminP11" value="<%=napprovalsw%>" size="50" readonly/>
<input type="hidden" name="mail12" id="iddeptadminP" value="<%=napprovalsw1%>" size="30"/>
</td>
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
 -->
 
<input align="left" type="radio" value="<%=napproval%>" id="iddeptadminP1" name="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
<input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
<input type="hidden" name="mail12" id="iddeptadminP" value="<%=napproval%>" size="30"/>
</td>
            
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
 
<%}%>
<td style="display: none;" id="dontSend">
<table id="idFinal1" align="center" width="880" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">


<%if(reqFor.contains("Email ID")){%>
<div id="email_details1" style="display: none;">
<table width="880">
<tr>
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>Email ID</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1">E-Mail ID Created :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10"><input type="text" name="emailID" id="emailID" maxlength="65" /></td>
</tr>
<%
String emailPass = "";
if(emailDomain.equalsIgnoreCase("nipponexpress.com")){
	emailPass = "Mypassword1234";
}else{
	emailPass = "nein*0001";
}
%>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1">Password :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10"><input type="text" readonly value="<%=emailPass%>" name="passEmail" id="passEmail" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Intune Access Provided :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10">
<input id="intAccYes" type="radio" name="intAcc" value="Yes"/>Yes
<input id="intAccNo" type="radio" name="intAcc" value="No"/>No
</td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10"> <input type="text" name="emailAppRemarks" id="emailAppRemarks" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Domain Account")){%>
<div id="dom_details1" style="display: none;">
<table width="880">
<tr>
<td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor%>"><b>Domain</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG%>;" colspan="1">Domain Account :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG%>;" colspan="10"><input type="text" name="ITusername" id="uname" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG%>;" colspan="1">Password :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG%>;" colspan="10"><input type="text" readonly value="nein*0001" name="ITpassword" id="pwd" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG%>;" colspan="10"> <input type="text" name="ITremark" id="rem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%
Connection cn0211 = null;
Statement st0211 = null; 
ResultSet rs0211 = null;
cn0211 = con.getConnection2();
st0211=cn0211.createStatement();
rs0211 = st0211.executeQuery("select * from groupmaster ORDER BY groupName Asc");
%>

<%if(reqFor.contains("Biometric / Access Card")){%>
<div id="bio_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor1%>"><b>Biometric / Access Card</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG1%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG1%>;" colspan="10"> <input type="text" name="bioRemark" id="bioRemark" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Shared Folder")){%>
<div id="sha_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="grey"><b>Shared Folder Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="shaRemark" id="shaRemark" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Internet Access / FTP Access")){%>
<div id="int_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="grey"><b>Internet Access / FTP Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="intRemark" id="intRemark" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("NEWINS")){%>
<div id="new_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor2%>"><b>NEWINS</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1"> Operator Code:</td>
<td class="it2" style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdcode" id="code" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1">Password :</td>
<td class="it2" style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdpassword" id="pwd" maxlength="65"></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1">Level :</td>
<td class="it2" style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdlevel" id="cud" maxlength="65" value="<%=newinsLevel%>" readonly></td></tr>
<%-- <tr>
<%
Connection cn0212 = null;
Statement st0212 = null; 
ResultSet rs0212 = null;
cn0211 = con.getConnection2();
st0211=cn0211.createStatement();
rs0211 = st0211.executeQuery("select * from groupmaster ORDER BY groupName Asc");
%>
<td class="it2" style="text-align: right;width:23%;" colspan="1">Group :</td>
<td colspan="10">
<select name="gname" id="idgname" >
<option value="">Select</option>
<%while(rs0211.next()){ %>
<option value="<%=rs0211.getString("groupName")%>"><%=rs0211.getString("groupName")%></option>
<%}%>
</select>
</td>
</tr> --%>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1">Access Provided to branche ('s) :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10">
<input type="radio" name="accessbr" value="Yes">Yes
<input type="radio" name="accessbr" value="No">No
</td>
</tr>
<%
Connection cndel1 = null,cndel2 = null,cndel3 = null,cndel4 = null;
Statement stdel1 = null,stdel2 = null,stdel3 = null,stdel4 = null; 
ResultSet rsdel1 = null,rsdel2 = null,rsdel3 = null,rsdel4 = null;
String progblok="",progAll="";

cndel3 = con.getConnection2();
stdel3=cndel3.createStatement();
rsdel4 = stdel3.executeQuery("select pro_name from newins_programs WHERE pro_name IN ( SELECT proBlocked FROM neinnewinsblocked Where form_no='"+req+"') ORDER BY pro_name Asc");
cndel4 = con.getConnection2();
stdel4=cndel4.createStatement();
rsdel3 = stdel4.executeQuery("select pro_name from newins_programs WHERE pro_name IN ( SELECT proAllowed FROM neinnewinsallowed Where form_no='"+req+"') ORDER BY pro_name Asc");
%>
<tr width="100%">
<td align="center" bgcolor="<%=bgcolor2%>" id="idBlockedColor" colspan="11"><font size=2 >Programs to be blocked<font color=red>*</font></font></td>
</tr>
<tr>
<td bgcolor="white" style="text-align: right;width:20%;" rowspan="1"><font color="black" size="2"><b>Program</b></font></td>
<%
while(rsdel4.next()){
progblok += rsdel4.getString("pro_name")+",";	
%>
<td bgcolor="lightgrey" style="text-align: left;width:47%;background-color: <%=colorBG2%>;">
<input size="30" width="30" type="checkbox" name="progBlocked" checked disabled class="check" onclick="chkNewinsProg(this.value)" value="<%=rsdel4.getString("pro_name")%>" /><%=rsdel4.getString("pro_name")%></td>
<%}
System.out.println("progblok====>"+progblok);
if(!progblok.equals("")){	
progblok = progblok.substring(0,progblok.length()-1);
}
%>
<input type="hidden" name="progblok" value="<%=progblok%>">
<tr>
<td align="center" bgcolor="<%=bgcolor2%>" id="idAllowedColor" colspan="11"><font size=2 >Programs to be Allowed<font color=red>*</font></font></td>
</tr>
<tr>
<td bgcolor="white" style="text-align: right;width:20%;" rowspan="1"><font color="black" size="2"><b>Program</b></font></td>
<%while(rsdel3.next()){ 
progAll += rsdel3.getString("pro_name")+",";
%>
<td bgcolor="lightgrey" style="text-align: left;width:47%;background-color: <%=colorBG2%>;">
<input size="30" width="30" type="checkbox" name="progAllowed" checked disabled value="<%=rsdel3.getString("pro_name")%>" /><%=rsdel3.getString("pro_name")%></td>
<%}
if(!progAll.equals("")){	
progAll = progAll.substring(0,progAll.length()-1);
}
%>
<input type="hidden" name="progAll" value="<%=progAll%>">
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdremark" id="rem" size="60" maxlength="500"></td>
</tr>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("NExAS")){%>
<div id="nex_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>NExAS</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> NExAS User ID :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="nexID" id="nexID" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Password :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" readonly value="Initpass1" name="nexPass" id="nexPass" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="nexRem" id="nexrem" size="60" maxlength="500"></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("GS-NET")){%>
<div id="gs_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor3%>"><b>GS-NET</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> User Code :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> 
<input type="text" name="uCode" id="uCode" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Password :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> <input type="text" readonly value="12345678" name="uPass" id="uPass" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned GSNET Branch Code :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> <input type="hidden" name="gsBCode1" id="gsBCode1" value="<%=gsnetBranchCode%>">
<%
String[] gsnetBranchCodeArr=null; 
gsnetBranchCodeArr=gsnetBranchCode.split(",");
String brcode="'";
for(int k=0;k<gsnetBranchCodeArr.length;k++){
	brcode+=gsnetBranchCodeArr[k].trim()+"','";	
}
if(!brcode.equals("")){
brcode = brcode.substring(0,brcode.length()-2);
}
Connection congs = null,condiv=null,conpri=null;
ResourceBundle dbPropertiesgs = ResourceBundle.getBundle("csdb");
String userNamegs = dbProperties.getString("csdb.username");
String passwordgs = dbProperties.getString("csdb.password");
String urlgs = dbProperties.getString("csdb.url");
String drivergs = dbProperties.getString("csdb.driverName");
String dbNamegs = dbProperties.getString("csdb.dbName");
Class.forName(drivergs).newInstance();
congs = DriverManager.getConnection(urlgs+dbNamegs,userNamegs,passwordgs); 
Statement stgs=null,stdiv=null,stpri=null;
ResultSet rsgs=null,rsdiv=null,rspri=null; 
String query = "select * from gsnetbranchcodemaster where branchcode in ("+brcode+") ORDER BY branchcode Asc";
stgs = congs.createStatement();
rsgs = stgs.executeQuery(query);
int i=1;

while(rsgs.next()){ 
%>
<input type='checkbox' id='gsBCode' checked disabled name='gsBCode' value="<%=rsgs.getString(2)%>"/><%=rsgs.getString(2)%>
<%
}	
%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned Division Name :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsDiv1" id="gsDiv1" value="<%=gsnetDivName%>">
<% 
try
{
String[] gsnetDivNameArr=null; 
gsnetDivNameArr=gsnetDivName.split(",");
String divcode="'";
for(int k=0;k<gsnetDivNameArr.length;k++){
	divcode+=gsnetDivNameArr[k].trim()+"','";	
}
if(!divcode.equals("")){
divcode = divcode.substring(0,divcode.length()-2);
}

Class.forName(drivergs).newInstance();
condiv = DriverManager.getConnection(urlgs+dbNamegs,userNamegs,passwordgs); 
String query1 = "select * from gsntdivisionmaster where divName in ("+divcode+") ORDER BY divName Asc";
stdiv = condiv.createStatement();
rsdiv = stdiv.executeQuery(query1);
%>
<%while(rsdiv.next()){%>
<input type='checkbox' id='gsDiv' checked disabled name='gsDiv' value="<%=rsdiv.getString(2)%>"/><%=rsdiv.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
//	DbUtil.closeDBResources(rs,st,con);
condiv.close();
}%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned Primary Division :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsPri1" id="gsPri1" value="<%=gsnetPrimaryDiv%>">
<%
String[] gsnetPrimaryDivArr = null;
gsnetPrimaryDivArr=gsnetPrimaryDiv.split(",");
String pridivcode="'";
for(int k=0;k<gsnetPrimaryDivArr.length;k++){
	pridivcode+=gsnetPrimaryDivArr[k].trim()+"','";	
}
if(!pridivcode.equals("")){
pridivcode = pridivcode.substring(0,pridivcode.length()-2);
}
try
{
// id="idBranch"
Class.forName(driver).newInstance();
conpri = DriverManager.getConnection(url+dbName,userName,password); 
String query2 = "select * from gsnetprimarydivmaster where divName in ("+pridivcode+") ORDER BY divName Asc";
stpri = conpri.createStatement();
rspri = stpri.executeQuery(query2);
%>
<%while(rspri.next()){%>
<input type='checkbox' id='gsPri' checked disabled name='gsPri' value="<%=rspri.getString(2)%>"/><%=rspri.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
conpri.close();
}
%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned User Role :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsUser1" id="gsUser1" value="<%=gsnetUserRole%>">
<%
String gsnetUserRole1[] = gsnetUserRole.split(", ");
for(int zz=0;zz<gsnetUserRole1.length;zz++){
%>	
<input type='checkbox' id='gsUser' checked disabled name='gsUser' value="<%=gsnetUserRole1[zz]%>"/><%out.println(gsnetUserRole1[zz]);%>
<%
}
%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> <input type="text" name="gsRem" id="gsRem" size="60" maxlength="500"></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Internal Application")){%>
<div id="inter_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>Internal Application</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> User ID :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="interName" id="interName" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1">Password :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="interPass" id="interPass" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="interRem" id="interRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("USB Access")){%>
<div id="usb_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>USB Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="usbRem" id="usbRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("VPN Access")){%>
<div id="vpn_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>VPN Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Forti Token Details :</td>
<td class="it2"  style="text-align:left;width:50%;" colspan="10"> <input type="text" name="forti" id="forti" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("HardDisk / PenDrive")){%>
<div id="hard_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>HardDisk / PenDrive</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="hardRem" id="hardRem" size="60" maxlength="500"/></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Any Other Asset")){%>
<div id="asset_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>Any Other Asset</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="assRem" id="assRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("NEx-GLOW")){%>
<div id="glow_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>NEx-GLOW</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Project :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowProject" id="glowProject" value="<%=project%>" size="60" readonly maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Ware-House :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowWH" id="glowWH" size="60" value="<%=warehouse%>" readonly maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> User ID :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowID" id="glowID" size="29" maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Password :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowPass" id="glowPass" value="12345678" readonly size="29" maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowAppRemarks" id="glowAppRemarks" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<div id="bcc" style="display: none;">
<table width="880">
<tr>
<td align="left" colspan="11"><b>Send BCC</b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="Yes" onclick="hideBcc();"/>Yes
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="No" onclick="hideBcc2();" checked="checked"/>No
</td>
</tr>
<tr style="visibility: hidden;display: none;" id="idBcc">
<td align="left" colspan="1"><b>Enter Mail ID's with comma:</b></td>
<td colspan="10"><input type="text" name="SendBCCmail" size="50" value="" placeholder="abcd.nittsu.co.in,xyz.nittsulogistics.co.in"/>  
</td>
</tr>  
</table>
</div>
 
</table>
</td>       	     
                           
<%}else{ System.out.println("User creation section........");%>
<input type="hidden" name="mailTrigger" value="<%=mailTrigger%>">
<input type="hidden" name="senddirect" id="senddirect" value="createdomain" readonly/>
<td>
<table id="idFinal" align="center" width="880" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" >


<%if(reqFor.contains("Email ID")){%>
<div id="email_details1" style="display: none;">
<table width="880">
<tr>
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>Email ID</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1">E-Mail ID Created :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10"><input type="text" name="emailID" id="emailID" maxlength="65" /></td>
</tr>
<%
String emailPass = "";
if(emailDomain.equalsIgnoreCase("nipponexpress.com")){
	emailPass = "Mypassword1234";
}else{
	emailPass = "nein*0001";
}
%>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1">Password :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10"><input readonly type="text" name="passEmail" value="<%=emailPass%>" id="passEmail" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Intune Access Provided :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10">
<input id="intAccYes" type="radio" name="intAcc" value="Yes"/>Yes
<input id="intAccNo" type="radio" name="intAcc" value="No"/>No
</td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2" style="text-align:left;width:47%;" colspan="10"> <input type="text" name="emailAppRemarks" id="emailAppRemarks" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Domain Account")){%>
<div id="dom_details1" style="display: none; visibility: hidden;">
<table width="880">
<tr>
<td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor%>"><b>Domain</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG%>;" colspan="1">Domain Account :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG%>;" colspan="10"><input type="text" name="ITusername" id="uname" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG%>;" colspan="1">Password :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG%>;" colspan="10"><input readonly type="text" value="nein*0001" name="ITpassword" id="pwd" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG%>;" colspan="10"> <input type="text" name="ITremark" id="rem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%
Connection cn0211 = null;
Statement st0211 = null; 
ResultSet rs0211 = null;
cn0211 = con.getConnection2();
st0211=cn0211.createStatement();
rs0211 = st0211.executeQuery("select * from groupmaster ORDER BY groupName Asc");
%>

<%if(reqFor.contains("Biometric / Access Card")){%>
<div id="bio_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor1%>"><b>Biometric / Access Card</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG1%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG1%>;" colspan="10"> <input type="text" name="bioRemark" id="bioRemark" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Shared Folder")){%>
<div id="sha_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="grey"><b>Shared Folder Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="shaRemark" id="shaRemark" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Internet Access / FTP Access")){%>
<div id="int_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="grey"><b>Internet Access / FTP Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="intRemark" id="intRemark" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("NEWINS")){%>
<div id="new_details1" style="display: none;">
<table width="880">
<tr><td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor2%>"><b>NEWINS</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1"> Operator Code:</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdcode" id="code" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1">Password :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdpassword" id="pwd" maxlength="65"></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1">Level :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdlevel" id="cud" maxlength="65" value="<%=newinsLevel%>" readonly></td></tr>
<%-- <tr>
<%
Connection cn0212 = null;
Statement st0212 = null; 
ResultSet rs0212 = null;
cn0211 = con.getConnection2();
st0211=cn0211.createStatement();
rs0211 = st0211.executeQuery("select * from groupmaster ORDER BY groupName Asc");
%>
<td class="it2" style="text-align: right;width:23%;" colspan="1">Group :</td>
<td colspan="10">
<select name="gname" id="idgname" >
<option value="">Select</option>
<%while(rs0211.next()){ %>
<option value="<%=rs0211.getString("groupName")%>"><%=rs0211.getString("groupName")%></option>
<%}%>
</select>
</td>
</tr> --%>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1">Access Provided to branche ('s) :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10">
<input type="radio" name="accessbr" value="Yes">Yes
<input type="radio" name="accessbr" value="No">No
</td>
</tr>
<%
Connection cndel1 = null,cndel2 = null,cndel3 = null,cndel4 = null;
Statement stdel1 = null,stdel2 = null,stdel3 = null,stdel4 = null; 
ResultSet rsdel1 = null,rsdel2 = null,rsdel3 = null,rsdel4 = null;
String progblok="",progAll="";

cndel3 = con.getConnection2();
stdel3=cndel3.createStatement();
rsdel4 = stdel3.executeQuery("select pro_name from newins_programs WHERE pro_name IN ( SELECT proBlocked FROM neinnewinsblocked Where form_no='"+req+"') ORDER BY pro_name Asc");
cndel4 = con.getConnection2();
stdel4=cndel4.createStatement();
rsdel3 = stdel4.executeQuery("select pro_name from newins_programs WHERE pro_name IN ( SELECT proAllowed FROM neinnewinsallowed Where form_no='"+req+"') ORDER BY pro_name Asc");
%>
<tr width="100%">
<td align="center" bgcolor="<%=bgcolor2%>" id="idBlockedColor" colspan="11"><font size=2 >Programs to be blocked<font color=red>*</font></font></td>
</tr>
<tr>
<td bgcolor="white" style="text-align: right;width:20%;" rowspan="1"><font color="black" size="2"><b>Program</b></font></td>
<%
while(rsdel4.next()){ 
progblok += rsdel4.getString("pro_name")+",";
%>
<td bgcolor="lightgrey" style="text-align: left;width:47%;background-color: <%=colorBG2%>;">
<input size="30" width="30" type="checkbox" name="progBlocked" checked disabled class="check" onclick="chkNewinsProg(this.value)" value="<%=rsdel4.getString("pro_name")%>" /><%=rsdel4.getString("pro_name")%></td>
<%}
System.out.println("progblok====>"+progblok);
if(!progblok.equals("")){
	progblok = progblok.substring(0,progblok.length()-1);
}
%>
<input type="hidden" name="progblok" value="<%=progblok%>">
<tr>
<td align="center" bgcolor="<%=bgcolor2%>" id="idAllowedColor" colspan="11"><font size=2 >Programs to be Allowed<font color=red>*</font></font></td>
</tr>
<tr>
<td bgcolor="white" style="text-align: right;width:20%;" rowspan="1"><font color="black" size="2"><b>Program</b></font></td>
<%while(rsdel3.next()){ 
progAll += rsdel3.getString("pro_name")+",";
%>
<td bgcolor="lightgrey" style="text-align: left;width:47%;background-color: <%=colorBG2%>;">
<input size="30" width="30" type="checkbox" name="progAllowed" checked disabled value="<%=rsdel3.getString("pro_name")%>" /><%=rsdel3.getString("pro_name")%></td>
<%}
if(!progAll.equals("")){
	progAll = progAll.substring(0,progAll.length()-1);
}
%>
</tr><input type="hidden" name="progAll" value="<%=progAll%>">
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG2%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG2%>;" colspan="10"> <input type="text" name="ITdremark" id="rem" size="60" maxlength="500"></td>
</tr>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("NExAS")){%>
<div id="nex_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>NExAS</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> NExAS User ID :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="nexID" id="nexID" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Password :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input readonly type="text" value="Initpass1" name="nexPass" id="nexPass" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="nexRem" id="nexrem" size="60" maxlength="500"></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("GS-NET")){%>
<div id="gs_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="<%=bgcolor3%>"><b>GS-NET</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> User Code :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> 
<input type="text" name="uCode" id="uCode" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Password :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> <input readonly type="text" value="12345678" name="uPass" id="uPass" maxlength="65"></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned GSNET Branch Code :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsBCode1" id="gsBCode1" value="<%=gsnetBranchCode%>">
<%
String[] gsnetBranchCodeArr=null; 
gsnetBranchCodeArr=gsnetBranchCode.split(",");
String brcode="'";
for(int k=0;k<gsnetBranchCodeArr.length;k++){
	brcode+=gsnetBranchCodeArr[k].trim()+"','";	
}
brcode = brcode.substring(0,brcode.length()-2);

Connection congs = null,condiv=null,conpri=null;
ResourceBundle dbPropertiesgs = ResourceBundle.getBundle("csdb");
String userNamegs = dbProperties.getString("csdb.username");
String passwordgs = dbProperties.getString("csdb.password");
String urlgs = dbProperties.getString("csdb.url");
String drivergs = dbProperties.getString("csdb.driverName");
String dbNamegs = dbProperties.getString("csdb.dbName");
Class.forName(drivergs).newInstance();
congs = DriverManager.getConnection(urlgs+dbNamegs,userNamegs,passwordgs); 
Statement stgs=null,stdiv=null,stpri=null;
ResultSet rsgs=null,rsdiv=null,rspri=null; 
String query = "select * from gsnetbranchcodemaster where branchcode in ("+brcode+") ORDER BY branchcode Asc";
stgs = congs.createStatement();
rsgs = stgs.executeQuery(query);
int i=1;

while(rsgs.next()){ 
if(i!=4)
{%>
<input type='checkbox' id='gsBCode' checked disabled name='gsBCode' value="<%=rsgs.getString(2)%>"/><%=rsgs.getString(2)%>
<%i++;}
else
{
%><br />
<%
i=1;
}
}	
%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned Division Name :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsDiv1" id="gsDiv1" value="<%=gsnetDivName%>">
<% 
try
{
String[] gsnetDivNameArr=null; 
gsnetDivNameArr=gsnetDivName.split(",");
String divcode="'";
for(int k=0;k<gsnetDivNameArr.length;k++){
	divcode+=gsnetDivNameArr[k].trim()+"','";	
}
divcode = divcode.substring(0,divcode.length()-2);

Class.forName(drivergs).newInstance();
condiv = DriverManager.getConnection(urlgs+dbNamegs,userNamegs,passwordgs); 
String query1 = "select * from gsntdivisionmaster where divName in ("+divcode+") ORDER BY divName Asc";
stdiv = condiv.createStatement();
rsdiv = stdiv.executeQuery(query1);
%>
<%while(rsdiv.next()){%>
<input type='checkbox' id='gsDiv' checked disabled name='gsDiv' value="<%=rsdiv.getString(2)%>"/><%=rsdiv.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
//	DbUtil.closeDBResources(rs,st,con);
condiv.close();
}%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned Primary Division :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsPri1" id="gsPri1" value="<%=gsnetPrimaryDiv%>">
<%
String[] gsnetPrimaryDivArr = null;
gsnetPrimaryDivArr=gsnetPrimaryDiv.split(",");
String pridivcode="'";
for(int k=0;k<gsnetPrimaryDivArr.length;k++){
	pridivcode+=gsnetPrimaryDivArr[k].trim()+"','";	
}
pridivcode = pridivcode.substring(0,pridivcode.length()-2);
try
{
// id="idBranch"
Class.forName(driver).newInstance();
conpri = DriverManager.getConnection(url+dbName,userName,password); 
String query2 = "select * from gsnetprimarydivmaster where divName in ("+pridivcode+") ORDER BY divName Asc";
stpri = conpri.createStatement();
rspri = stpri.executeQuery(query2);
%>
<%while(rspri.next()){%>
<input type='checkbox' id='gsPri' checked disabled name='gsPri' value="<%=rspri.getString(2)%>"/><%=rspri.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
conpri.close();
}
%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Assigned User Role :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10">  <input type="hidden" name="gsUser1" id="gsUser1" value="<%=gsnetUserRole%>">
<%
String gsnetUserRole1[] = gsnetUserRole.split(", ");
for(int zz=0;zz<gsnetUserRole1.length;zz++){
%>	
<input type='checkbox' id='gsUser' checked disabled name='gsUser' value="<%=gsnetUserRole1[zz]%>"/><%out.println(gsnetUserRole1[zz]);%>
<%
}
%>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;background-color: <%=colorBG3%>;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;background-color: <%=colorBG3%>;" colspan="10"> <input type="text" name="gsRem" id="gsRem" size="60" maxlength="500"></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Internal Application")){%>
<div id="inter_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>Internal Application</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> User ID :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="interName" id="interName" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1">Password :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="interPass" id="interPass" maxlength="65" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="interRem" id="interRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("USB Access")){%>
<div id="usb_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>USB Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="usbRem" id="usbRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("VPN Access")){%>
<div id="vpn_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>VPN Access</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Forti Token Details :</td>
<td class="it2"  style="text-align:left;width:50%;" colspan="10"> <input type="text" name="forti" id="forti" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("HardDisk / PenDrive")){%>
<div id="hard_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>HardDisk / PenDrive</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="hardRem" id="hardRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("Any Other Asset")){%>
<div id="asset_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>Any Other Asset</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="assRem" id="assRem" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<%if(reqFor.contains("NEx-GLOW")){%>
<div id="glow_details1" style="display: none;">
<table width="880">
<tr colspan="11">
<td style="text-align: center;" colspan="11" bgcolor="grey"><b>NEx-GLOW</b></td></tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Project :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowProject" id="glowProject" value="<%=project%>" size="60" readonly maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Ware-House :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowWH" id="glowWH" size="60" value="<%=warehouse%>" readonly maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> User ID :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowID" id="glowID" size="60" maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Password :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowPass" id="glowPass" value="12345678" readonly size="60" maxlength="500" /></td>
</tr>
<tr>
<td class="it2" style="text-align: right;width:20%;" colspan="1"> Remarks :</td>
<td class="it2"  style="text-align:left;width:47%;" colspan="10"> <input type="text" name="glowAppRemarks" id="glowAppRemarks" size="60" maxlength="500" /></td>
</tr>
</table>
</div>
<%}%>

<div id="bcc" style="display: none;">
<table width="880">
<tr>
<td align="left" colspan="11"><b>Send BCC</b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="Yes" onclick="hideBcc();"/>Yes
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="No" onclick="hideBcc2();" checked="checked"/>No
</td>
</tr>
<tr style="visibility: hidden;display: none;" id="idBcc">
<td align="left" colspan="1"><b>Enter Mail ID's with comma:</b></td>
<td colspan="10"><input type="text" name="SendBCCmail" size="50" value="" placeholder="abcd.nittsu.co.in,xyz.nittsulogistics.co.in"/>  
</td>
</tr>  
</table>
</div>
                  
</table>                   
</td>       	         
                  <%} }
              
          }
     else
          {
//System.out.println("1846====>"+levelno);
    	 int curlev=Integer.parseInt(levelno);
    	 int next=0;
    	  while(curlev<=Integer.parseInt(maxlevel))
    	     {
    		  next=curlev+1;
    	     rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+next+"'  ORDER BY levelno ASC");
         	 if(rs5.next())
                 {
         		 ftype=rs5.getString("ftype")==null?"0":rs5.getString("ftype");
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
                   <input align="left" name="approver" type="radio" value="<%=napproval%>" id="iddeptadminP1" name="iddeptadminP1" onclick="sync(iddeptadminP<%=next%>.value);"/>
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
  <tr style="display: none;" id="idApproved1" >
   <td>
       Mail will be send to All approver.
    </td>
  </tr>
<tr style="display: none;" id="idApproved2">
	<td align="left" colspan="10">
		<b>Send To:</b>
		<%
		cnNew = con.getConnection2();
		stNew=cnNew.createStatement();
		rsNew = stNew.executeQuery("SELECT DISTINCT mail,emp,desg,form2_no,empid,levelno FROM neinApplicationForm_item WHERE form2_no='"+req+"' and empid<>'"+emp_no2+"' ORDER BY item_id DESC");
		while(rsNew.next()){
		  String Mailing=rsNew.getString("mail");
		  String emp1= rsNew.getString("emp");
		  String desg1 = rsNew.getString("desg");
		  String empidclar = rsNew.getString("empid");
		  String levelno1 = rsNew.getString("levelno");
		  String empDesgMail = empidclar+","+emp1+","+desg1+","+Mailing+","+levelno1;%>
	 	  <input type="radio" name="mailingCheckClarificationStart" value="<%=empDesgMail%>" onclick="sync('<%=empDesgMail%>');"/>&nbsp;&nbsp;<%=Mailing%>
		  <%}%>
	</td>
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
</tr>

  <tr><td colspan="1">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="100"></textarea></div></td>
  </tr>
  
 
 </table>


</br>                                                         
   </td>
		
	</tr>
</table> 
<input type="hidden" name="ftype1" id="ftype1" value="<%=ftype%>">
 <table style="margin-left: auto;margin-right: auto;" ><tr>
    <td> <div id="formsubmitbutton"> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate() && ButtonClicked() && OtherAdmin());" />
    </div>
     <div id="buttonreplacement" style="margin-left:30px; display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
    </td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   
  <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	<td style="font-size:1">&nbsp;&nbsp;<input type="button" value="Cancel" onclick="window.location.href='../../../adminPage.jsp?msg=1'" /></td>
   	</tr>
 
</table> 	

</center>
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
	DbUtil.closeDBResources(null,psmt,null);
  }
%>
	
</div>
<div id="dialog" class="web_dialog">
   <table style="width: 895; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />
  <label style="text-align:center;">HR/Admin (Local)</label>
<br />
<label style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>GA(Branch)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HO(IT)</label>
<br />
<br />
<br />
</div>
</form>	
</body>
</html>