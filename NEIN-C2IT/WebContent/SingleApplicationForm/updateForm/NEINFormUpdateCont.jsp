<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import="java.util.Date" %>
<%@page import="java.sql.*" %> 
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="net.sf.jasperreports.view.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@include file="../../banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<jsp:useBean id="conLMS" class="CON2.ConnectionLMS" />
<jsp:useBean id="currentTime" class="CON2.CurrentTime" />

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Application Form</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
<script language="javascript" type="text/javascript" src="../../js/Calendar.js"></script>
<script language="javascript" type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
<script language="javascript" type="text/javascript" src="../../js/FormsHelp.js"></script>
<script language="javascript" type="text/javascript" src="../../js/onSubmitWait.js"></script>
<script language="javascript" type="text/javascript">
function popitup(url) {
newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
if(window.focus){
	newwindow.focus();
}
return false;
}
</script>

<%
session.setMaxInactiveInterval(20*60);
//session.setAttribute("Nname",null);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../adminHR.jsp?msg="+msg2);
	System.out.println(msg2);
}
%>

<style type="text/css">
input:focus {
	background-color: white;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
$('.check').click(function(){
    $("#text").val('');
    $(".check").each(function(){
        if($(this).prop('checked')){
            $("#text").val($("#text").val()+$(this).val()+"");
        }
    });
});
});
</script>
<script type="text/javascript">
$(document).ready(function() {
$('.check2').click(function(){
    $("#text2").val('');
    $(".check2").each(function(){
        if($(this).prop('checked')){
            $("#text2").val($("#text2").val()+$(this).val()+"");
        }
    });
});
});
</script>

<script type="text/javascript">  

function callFun(val1)
{
var ecode=document.getElementById("ecode").value;
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
        	  var sw=document.form.scopeOfWork;
        	  var desg=document.form.designation;
        	  var roff=document.form.reporting_officer;
        	  var rb = document.form.requestBy;
        	  var req=document.form.requestOption;
        	  var reqTypeOpt=document.form.requestTypeOption;
        	  var mobileOption=document.form.mobileOption;
        	  var simOption=document.form.simOption;
        	  var makeModel=document.form.makeModel;
        	  var simNum=document.form.simNum;
        	  var requestFor=document.form.requestForCheck;
        	  var req_Branch=document.form.req_Branch;
        	  var mailDom=document.form.emaildomain;
        	  var empType=document.form.emptype;
        	  var emailCreated=document.form.emailCreated;
        	  var emailPass=document.form.emailPass;
        	  var em=document.form.email;
        	  var intuneProv=document.form.intuneProv;
        	  var intune=document.form.intune;
        	  var mobile=document.form.mobile;
        	  var imei1=document.form.imei1;
        	  var imei2=document.form.imei2;
        	  var domRem=document.form.remarksDom.value;
        	  var bioRem=document.form.bioRemarks;
        	  var shaRem=document.form.sharedRemarks;
        	  var internetRem=document.form.internetRem;
        	  var domID=document.form.domID;
        	  var vpnEmail=document.form.vpnEmail;
        	  var mlps=document.form.mlps;
        	  var accessFor=document.form.accessFor;
        	  var usbRem=document.form.usbRem;
        	  var Software=document.form.Software;
        	  var internalRem=document.form.internalRem;
        	  var gsrem=document.form.gsNetremarks;
        	  var compCode=document.form.compCode;
        	  var costCode=document.form.costCCode;
        	  var costName=document.form.costCName;
        	  var opRange=document.form.costOPRange;
        	  var uk=document.form.userKind;
        	  var opmenu=document.getElementsByName("OptionalMenu[]");
        	  var nexasRem=document.form.nexasRem;
       	      var reqbrcode=document.form.reqBrCode;
       	      var newinCode=document.form.newinCode;
       	      var remarksEmail=document.form.remarksEmail;
       	      var reqNew=document.form.reqNew;
       	      var newRem=document.form.newRem;
        	  var l=document.form.remarks;
        	  var desgS=document.form.desg;
       	   	  var empS=document.form.emp;
       	   	  var hardRemarks=document.form.hardRemarks;
       	   	  var assetRemarks=document.form.assetRemarks;
       	   	  var project=document.form.project;
       	   	  var warehouse=document.form.warehouse;
       	   	  var glowID=document.form.glowID;
       	   	  var glowPass=document.form.glowPass;
       	   	  var glowRemarks=document.form.glowRemarks;
       	   	  var glowAppRemarks=document.form.glowAppRemarks;
       	 	  var bkColor = "red";
       	 	  var bkColor2 = "white";
       	 
            if ((w.value==null)||(w.value=="")||(w.value=="Null")){
            alert("Please Select Branch!");
            w.focus();
            return false
            }
               if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null")){
           
            alert("Please Select Department!");
            dpt.focus()
            return false
            }
            if ((fn.value==null)||(fn.value=="")){
                alert("Please Enter Employee Name!");
                fn.focus()
                return false
                }
     if ((sw.value==null)||(sw.value=="")){
                	alert("Please Select Scope of Work!");
                    sw.focus()
                    return false
                    }
                    if ((desg.value==null)||(desg.value=="")||(desg.value=="Null")){
                    	alert("Please Select Designation!");
                        desg.focus()
                        return false
                        }
if((requestFor[0].checked == false) && (requestFor[1].checked == false) && (requestFor[2].checked == false) && (requestFor[3].checked == false) && (requestFor[4].checked == false) && (requestFor[5].checked == false) && (requestFor[6].checked == false) && (requestFor[7].checked == false) && (requestFor[8].checked == false) && (requestFor[9].checked == false) && (requestFor[10].checked == false) && (requestFor[11].checked == false) && (requestFor[12].checked == false) && (requestFor[12].checked == false)){
                               alert("Select Request For!");
                               requestFor[0].focus();
                               return false;
                           }
                           
                           if((requestFor[0].value=="Email ID") && (requestFor[0].checked == true)){
                           if ((mailDom.value==null)||(mailDom.value=="")){
                               alert("Please Select Email Domain!");
                               mailDom.focus();
                               return false;	
                           }
                           if ((empType.value==null)||(empType.value=="")){
                               alert("Please Select Employee Type!");
                               empType.focus();
                               return false;	
                           }
                           if ((emailCreated.value==null)||(emailCreated.value=="")){
                               alert("Please Enter Email ID Created!");
                               emailCreated.focus();
                               return false;	
                           }
                           if ((emailPass.value==null)||(emailPass.value=="")){
                               alert("Please Enter Email ID Created!");
                               emailPass.focus();
                               return false;	
                           }
                           if ((em.value==null)||(em.value=="")){
                               alert("Please Enter Requested E-Mail ID!");
                               em.focus();
                               return false;	
                           }
                           if ((intuneProv.value==null)||(intuneProv.value=="")){
                               alert("Please Enter Intune Access Provided!");
                               intuneProv.focus();
                               return false;	
                           }
                           if ((mobileOption[0].checked == false) && (mobileOption[1].checked == false)){
                               alert("Please Select Company Provided Mobile!");
                               mobileOption[0].focus();
                               return false;	
                           }
                           if (((makeModel.value==null)||(makeModel.value=="")) && ((mobileOption.value=="Yes"))){
                               alert("Please Enter Mobile Make & Model!");
                               makeModel.focus();
                               return false;	
                           }
                           if ((simOption[0].checked == false) && (simOption[1].checked == false)){
                               alert("Please Select Company Provided Sim Card!");
                               mobileOption[0].focus();
                               return false;	
                           }
                           if (((simNum.value==null)||(simNum.value=="")) && ((simOption.value=="Yes"))){
                               alert("Please Enter Company Privided Mobile Number!");
                               simNum.focus();
                               return false;	
                           }
                           if ((intune.value==null)||(intune.value=="")){
                               alert("Please Select Mobile Access (Intune)!");
                               intune.focus();
                               return false;	
                           }
                           
                           if (((mobile.value==null)||(mobile.value=="") && (intune.value=="Yes"))){
                               alert("Please Enter Mobile No.!");
                               mobile.focus();
                               return false;	
                           }
                           
                           if (((imei1.value==null)||(imei1.value=="")) && (intune.value=="Yes")){
                               alert("Please Enter IMEI No. 1!");
                               imei1.focus();
                               return false;	
                           }
                           
                           if (((imei2.value==null)||(imei2.value=="")) && (intune.value=="Yes")){
                               alert("Please Enter IMEI No. 2!");
                               imei2.focus();
                               return false;	
                           }
                           if (((remarksEmail.value==null)||(remarksEmail.value==""))){
                               alert("Please Enter Email Remarks!");
                               remarksEmail.focus();
                               return false;	
                           }
                           }
                           if((requestFor[1].value=="Domain Account") && (requestFor[1].checked == true)){
                       	   if((domRem==null) || (domRem=="")){
                       		  alert("Please Enter Domain Remarks!");
                       		  document.getElementById("domainRem").focus();
                       		  return false;
                       	   }
                           }
                           if((requestFor[2].value=="Biometric / Access Card") && (requestFor[2].checked == true)){
                               if ((bioRem.value==null)||(bioRem.value=="")){
                                   alert("Enter Biometric / Access Card Remarks!");
                                   bioRem.focus();
                                   return false
                                   }
                           }
                           if((requestFor[3].value=="Shared Folder") && (requestFor[3].checked == true)){
                               if ((shaRem.value==null)||(shaRem.value=="")){
                                   alert("Enter Shared Folder Remarks!");
                                   shaRem.focus();
                                   return false
                                   }
                           }
if((requestFor[4].value=="Internet Access / FTP Access") && (requestFor[4].checked == true)){
if((reqTypeOpt[0].checked == false ) && (reqTypeOpt[1].checked == false ) && (reqTypeOpt[2].checked == false ) && (reqTypeOpt[3].checked == false )){
                                   alert("Select Request Type Of Internet Access / FTP Access!");
                                   reqTypeOpt[0].focus();
                                   return false;
                               }
                               if ((internetRem.value==null)||(internetRem.value=="")){
                                   alert("Enter Internet Access / FTP Access Remarks!");
                                   internetRem.focus();
                                   return false
                                   }
                           }
                           if((requestFor[5].value=="NEWINS") && (requestFor[5].checked == true)){
                            	 if ((reqbrcode.value==null)||(reqbrcode.value=="")){
                                     alert("Please Select Requested Branch Code!");
                                     reqbrcode.focus();
                                     return false;
                                     }
                                 if ((newinCode.value==null)||(newinCode.value=="")){
                                     alert("Please Enter Operator Code!");
                                     newinCode.focus();
                                     return false;
                                     }
                                 if (checkAddress(newinCode.value)==false){
                               	 newinCode.value="";
                                 alert("Invalid Code!");
                                 newinCode.focus();
                                 return false;
                                 }
                                if ((reqNew[0].checked == false ) && (reqNew[1].checked == false )){
                                	 alert("Select Status Of Request! \n \n New / Change");
                                    req[0].focus();
                                    return false;
                                } 
                                 
                                if (((newRem.value==null)||(newRem.value=="")) && (reqNew[1].checked == true)){
                                    alert("Enter NEWINS Remarks!");
                                    newRem.focus();
                                    return false;
                                } 
                           }
                           if((requestFor[6].value=="NExAS") && (requestFor[6].checked == true)){
                   	     	 if (compCode.value=="")
                              {
                                  alert("Please Select Company Code!");
                                  compCode.focus();
                                  return false;
                              }
                             if (costName.value=="")
                              {
                                  alert("Please Select Cost Center Name!");
                                  costName.focus();
                                  return false;
                              }
                              if (costCode.value=="")
                              {
                                  alert("Please Enter Cost Center Code!");
                                  costCode.focus();
                                  return false;
                              }
                              if ((uk[0].checked == false ) && (uk[1].checked == false ) && (uk[2].checked == false ) && (uk[3].checked == false ) )
                              {
                              alert("Select Request Type option...");
                              uk[0].focus();
                              return false;
                              }
if ((opmenu[0].checked == false ) && (opmenu[1].checked == false ) && (opmenu[2].checked == false ) && (opmenu[3].checked == false )&& (opmenu[4].checked == false ) && (opmenu[5].checked == false ) && (opmenu[6].checked == false ) && (opmenu[7].checked == false ) && (opmenu[8].checked == false ) && (opmenu[9].checked == false ) && (opmenu[10].checked == false ) && (opmenu[11].checked == false ) )
                              {
                              alert("Select optional menu with respect on selected Request Type option...");
                              opmenu[0].focus();
                              return false;
                              } 
                              if (((nexasRem.value==null)||(nexasRem.value==""))){
                                  alert("Enter NExAS Remarks!");
                                  nexasRem.focus();
                                  return false
                              }  
                           }
                           if((requestFor[7].value=="GS-NET") && (requestFor[7].checked == true)){
                        	   var i,flag=0;
                               chks = document.getElementsByName('gsnetBrCode[]');
                              // alert("here :"+chks.length);
                               for (i = 0; i < chks.length; i++)
                                  {
                                  if (chks[i].checked)
                                     {
                                     flag=1; 
                                     }
                                  }
                               if(flag==0)
                             	  {
                             	  alert('Please select GSNET branch code..');
                                   return false;
                             	  }
                               
                               var j,flag1=0;
                               chks1 = document.getElementsByName('gsnetDiv[]');
                              
                               for (j = 0; j < chks1.length; j++)
                                  {
                             	  if (chks1[j].checked)
                                     {
                                     flag1=1; 
                                     }
                                }
                              if(flag1==0)
                           	    {
                           	    alert('Please select division name..');
                                 return false;
                           	    }
                             
                               var k,flag2=0;
                               chks2 = document.getElementsByName('gsnetPdiv[]');
                               //alert("herer..1.......");
                               for (k = 0; k < chks2.length; k++)
                                 {
                          	    if (chks2[k].checked)
                                  {
                                  flag2=1; 
                                  }
                                 }
                              if(flag2==0)
                        	       {
                        	       alert('Please select primary division name..');
                                return false;
                        	       }
                              
                              
                              var k3,flag3=0;
                              chks3 = document.getElementsByName('role[]');
                              //alert("herer..1.......");
                              for (k3 = 0; k3 < chks3.length; k3++)
                                {
                         	    if (chks3[k3].checked)
                                 {
                                 flag3=1; 
                                 }
                                }
                             if(flag3==0)
                       	       {
                       	       alert('Please select role..');
                                return false;
                       	       }
                             if (((gsrem.value==null)||(gsrem.value==""))){
                                 alert("Enter GS-NET Remarks!");
                                 gsrem.focus();
                                 return false
                             }                             
                           }
                           if((requestFor[8].value=="Internal Application") && (requestFor[8].checked == true)){
                               if ((Software.value==null)||(Software.value=="")){
                                   alert("Please Select Internal Application!");
                                   Software.focus()
                                   return false
                        	   }
                               if (((internalRem.value==null)||(internalRem.value==""))){
                                   alert("Enter Internal Application Remarks!");
                                   internalRem.focus();
                                   return false
                               }
                           }
                           if((requestFor[9].value=="USB Access") && (requestFor[9].checked == true)){
                               if ((accessFor.value==null)||(accessFor.value=="")){
                                   alert("Select Access For!");
                                   accessFor.focus();
                                   return false
                               }
                               if (((usbRem.value==null)||(usbRem.value==""))){
                                   alert("Enter USB Access Remarks / Reason!");
                                   usbRem.focus();
                                   return false
                               }
                           }
                           if((requestFor[10].value=="VPN Access") && (requestFor[10].checked == true)){
                               if ((vpnEmail.value==null)||(vpnEmail.value=="")){
                                   alert("Enter Email ID!");
                                   vpnEmail.focus();
                                   return false
                               }
                               if ((mlps.value==null)||(mlps.value=="")){
                                   alert("Select MPLS / Non MPLS!");
                                   mlps.focus();
                                   return false
                               }
                               if (((domID.value==null)||(domID.value=="")) && (mlps.value=="MPLS")){
                                   alert("Enter Domain ID!");
                                   domID.focus();
                                   return false
                               }
                           }
                           if((requestFor[11].value=="HardDisk / PenDrive") && (requestFor[11].checked == true)){
                               if ((hardRemarks.value==null)||(hardRemarks.value=="")){
                                   alert("Enter HardDisk / PenDrive Remarks!");
                                   hardRemarks.focus();
                                   return false
                                   }
                           }
                           if((requestFor[12].value=="Any Other Asset") && (requestFor[12].checked == true)){
                               if ((assetRemarks.value==null)||(assetRemarks.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   assetRemarks.focus();
                                   return false
                                   }
                           }
                           if((requestFor[13].value=="NEx-GLOW") && (requestFor[13].checked == true)){
                               if ((project.value==null)||(project.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   project.focus();
                                   return false
                               }
                               if ((warehouse.value==null)||(warehouse.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   warehouse.focus();
                                   return false
                               }
                               if ((glowID.value==null)||(glowID.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   glowID.focus();
                                   return false
                               }
                               if ((glowPass.value==null)||(glowPass.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   glowPass.focus();
                                   return false
                               }
                               if ((glowRemarks.value==null)||(glowRemarks.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   glowRemarks.focus();
                                   return false
                               }
                               if ((glowAppRemarks.value==null)||(glowAppRemarks.value=="")){
                                   alert("Enter Any Other Asset Remarks!");
                                   glowAppRemarks.focus();
                                   return false
                               }
                           }
                           
                            if ((l.value==null)||(l.value=="")){
                                alert("Enter Remarks!");
                                l.focus();
                                return false	
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
	<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
                                   	var expanded = false;
                                   	function showCheckboxes() 
                            		{
                            			//alert("I came here");
                            		  var checkboxes = document.getElementById("checkboxes");
                            		  if (!expanded) {
                            		    checkboxes.style.display = "block";
                            		    expanded = true;
                            		    var values = $('input:checkbox:checked.group1').map(function () {
                            				   return this.value;
                            				 }).get(); 
                            		   
                            		    } else {
                            		    checkboxes.style.display = "none";
                            		    expanded = false;
                            		  }
                            		
                            		  // alert(values);
                            	  }
                                   	
                                   	var expandedBC = false;
                                	function showCheckboxesBC() 
                            		{
                            			//alert("I came here");
                            		  var checkboxes = document.getElementById("checkboxesBC");
                            		  if (!expandedBC) {
                            		    checkboxes.style.display = "block";
                            		    expandedBC = true;
                            		    var values = $('input:checkbox:checked.group1BC').map(function () {
                            				   return this.value;
                            				 }).get(); 
                            		   
                            		    } else {
                            		    checkboxes.style.display = "none";
                            		    expandedBC = false;
                            		  }
                            		
                            		  // alert(values);
                            	  }
                                	
                               	 function syncBC(val) 
                         		{
                         			 var vijayValBC="";
                         				for(var i1=0; i1 < document.form.approverslistBC.length; i1++)
                         				{
                         				
                         					if(document.form.approverslistBC[i1].checked)
                         					{
                         					//	alert(document.form.approverslist[i1].value);
                         						vijayValBC=vijayValBC+ document.form.approverslistBC[i1].value+",";
                         					//	alert("i1:"+i1+" :"+vijayValBC);
                         					}
                         				}
                         			document.getElementById("idreqBranch").value=vijayValBC;
                         		}
                                	
                               	 function sync(val) 
                         		{
                         			 var vijayVal="";
                         				for(var i1=0; i1 < document.form.approverslist.length; i1++)
                         				{
                         				
                         					if(document.form.approverslist[i1].checked)
                         					{
                         					//	alert(document.form.approverslist[i1].value);
                         						vijayVal=vijayVal+ document.form.approverslist[i1].value+",";
                         					//	alert("i1:"+i1+" :"+vijayVal);
                         					}
                         				}
                         			document.getElementById("Software").value=vijayVal;
                         		} 
            
</script> 
                
<script type="text/javascript"> // script for seluseroffice fun
function isNumber1(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)){
        return false;
    }   
    return true;
    }
</script>

<script language = "Javascript">
function showMob()
{
 	  document.getElementById('compTD').colSpan="1";
	  document.getElementById('mob1').style.display="table-cell";
	  document.getElementById('mob1').style.visibility="visible";
	  document.getElementById('mob2').style.display="table-cell";
	  document.getElementById('mob2').style.visibility="visible";
}
function hideMob()
{
	 document.getElementById('compTD').colSpan="3";
	 document.getElementById('mob1').style.display="none";
	 document.getElementById('mob1').style.visibility="hidden";
	 document.getElementById('mob2').style.display="none";
	 document.getElementById('mob2').style.visibility="hidden";
}
function showSim()
{
 	  document.getElementById('compSim').colSpan="1";
	  document.getElementById('sim1').style.display="table-cell";
	  document.getElementById('sim1').style.visibility="visible";
	  document.getElementById('sim2').style.display="table-cell";
	  document.getElementById('sim2').style.visibility="visible";
}
function hideSim()
{
	 document.getElementById('compSim').colSpan="3";
	 document.getElementById('sim1').style.display="none";
	 document.getElementById('sim1').style.visibility="hidden";
	 document.getElementById('sim2').style.display="none";
	 document.getElementById('sim2').style.visibility="hidden";
}
</script>

<script language = "Javascript">
function showTR()
{	
	 document.getElementById('newin').rowSpan="9";
	 document.getElementById('idDelete').style.display="table-row";
	 document.getElementById('idDelete').style.visibility="visible";
}
function hideTR()
{
	 document.getElementById('newin').rowSpan="8";
	 document.getElementById('idDelete').style.display="none";
	 document.getElementById('idDelete').style.visibility="hidden";
}
</script>

<script language = "Javascript">
function showTRAjax()
{
    document.getElementById('newin').rowSpan="9";
	document.getElementById('idDelete').style.display="table-row";
	document.getElementById('idDelete').style.visibility="visible";
}
function hideTRAjax()
{
	document.getElementById('newin').rowSpan="8";
	document.getElementById('idDelete').style.display="none";
	document.getElementById('idDelete').style.visibility="hidden";
}

function uncheckedAjax()
{
 document.getElementById("OptionalMenu1").checked = false;
 document.getElementById("OptionalMenu2").checked = false;
 document.getElementById("OptionalMenu3").checked = false;
 document.getElementById("OptionalMenu4").checked = false;
 document.getElementById("OptionalMenu5").checked = false;
 document.getElementById("OptionalMenu6").checked = false;
 document.getElementById("OptionalMenu7").checked = false;
 document.getElementById("OptionalMenu8").checked = false;
 document.getElementById("OptionalMenu9").checked = false;
 document.getElementById("OptionalMenu10").checked = false;
 document.getElementById("OptionalMenu11").checked = false;
 document.getElementById("OptionalMenu12").checked = false;
}

document.getElementById("checkbox").checked = false;
function activeAjax(value)
{
	  uncheckedAjax()
	  if(value=="HOAcUser")
		   {
	       document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu12").style.backgroundColor = "#bff0a1";
	       document.getElementById("OptionalMenu1").disabled = true;
	       document.getElementById("OptionalMenu2").disabled = true;
	       document.getElementById("OptionalMenu3").disabled = true;
	       document.getElementById("OptionalMenu7").disabled = true;
	       document.getElementById("OptionalMenu9").disabled = true;
	       document.getElementById("OptionalMenu10").disabled = true;
		   }
	  if(value=="BRAcUser")
	      {
		  document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu3").disabled = false;
	       document.getElementById("OptionalMenu7").disabled = false;
	       document.getElementById("OptionalMenu1").disabled = true;
	       document.getElementById("OptionalMenu2").disabled = true;
	       document.getElementById("OptionalMenu9").disabled = true;
	       document.getElementById("OptionalMenu10").disabled = true;
	      }
	  if(value=="ITUser")
	      {
		  document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu1").disabled = true;
	       document.getElementById("OptionalMenu2").disabled = true;
	       document.getElementById("OptionalMenu3").disabled = true;
	       document.getElementById("OptionalMenu7").disabled = true;
	       document.getElementById("OptionalMenu9").disabled = true;
	       document.getElementById("OptionalMenu10").disabled = true;
	      }
	  if(value=="RepoDispOnly")
	      {
		  document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu3").disabled = false;
	       document.getElementById("OptionalMenu7").disabled = false;
	       document.getElementById("OptionalMenu1").disabled = false;
	       document.getElementById("OptionalMenu2").disabled = false;
	       document.getElementById("OptionalMenu9").disabled = false;
	       document.getElementById("OptionalMenu10").disabled = false;
	   }
}

function hidefieldsAjax()
{
	 document.getElementById("currNExASID").style.visibility = "hidden";
	 document.getElementById("idcurrentNExASID").value ="";
	 document.getElementById("OptionalMenu1").disabled = true;
	 document.getElementById("OptionalMenu2").disabled = true;
	 document.getElementById("OptionalMenu3").disabled = true;
	 document.getElementById("OptionalMenu4").disabled = true;
	 document.getElementById("OptionalMenu5").disabled = true;
	 document.getElementById("OptionalMenu6").disabled = true;
	 document.getElementById("OptionalMenu7").disabled = true;
	 document.getElementById("OptionalMenu8").disabled = true;
	 document.getElementById("OptionalMenu9").disabled = true;
	 document.getElementById("OptionalMenu10").disabled = true;
	 document.getElementById("OptionalMenu11").disabled = true;
	 document.getElementById("OptionalMenu12").disabled = true;	
}
</script>


<script type="text/javascript">  
 function callcostDetails(v)  
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
    	    var url="getCost.jsp";  
    		    url +="?cname=" +v;
    		    xmlHttp.onreadystatechange = getCostInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getCostInfo()
             {     
	         var str2=xmlHttp.responseText;
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
                             //alert("here");//idname,iduid,idpass,idnmail
                             document.getElementById("resultFromAjax3").innerHTML = str2;//fname,iddept,idbranch,iddesg
                             document.getElementById("idcostCCode").value =  document.getElementById("q1").value;
                             document.getElementById("idcostOPRange").value =  document.getElementById("q2").value;
                      		 
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax3").innerHTML = str2;
                             document.getElementById("idcostCCode").value = "";
                             document.getElementById("idcostOPRange").value =""; 
      		                
      		                 }
                 } 
  
  function unchecked()
  {
   document.getElementById("OptionalMenu4").checked = false;
   document.getElementById("OptionalMenu5").checked = false;
   document.getElementById("OptionalMenu6").checked = false;
   document.getElementById("OptionalMenu8").checked = false;
   document.getElementById("OptionalMenu11").checked = false;
   document.getElementById("OptionalMenu12").checked = false;
   
   document.getElementById("OptionalMenu1").checked = false;
   document.getElementById("OptionalMenu2").checked = false;
   document.getElementById("OptionalMenu3").checked = false;
   document.getElementById("OptionalMenu7").checked = false;
   document.getElementById("OptionalMenu9").checked = false;
   document.getElementById("OptionalMenu10").checked = false;
  }
  
  document.getElementById("checkbox").checked = false;
  function active(value)
  {
 	  unchecked()
 	  if(value=="HOAcUser")
 		   {
 	       document.getElementById("OptionalMenu4").disabled = false;
 	       document.getElementById("OptionalMenu5").disabled = false;
 	       document.getElementById("OptionalMenu6").disabled = false;
 	       document.getElementById("OptionalMenu8").disabled = false;
 	       document.getElementById("OptionalMenu11").disabled = false;
 	       document.getElementById("OptionalMenu12").disabled = false;
 	       document.getElementById("OptionalMenu12").style.backgroundColor = "#bff0a1";
 	       document.getElementById("OptionalMenu1").disabled = true;
 	       document.getElementById("OptionalMenu2").disabled = true;
 	       document.getElementById("OptionalMenu3").disabled = true;
 	       document.getElementById("OptionalMenu7").disabled = true;
 	       document.getElementById("OptionalMenu9").disabled = true;
 	       document.getElementById("OptionalMenu10").disabled = true;
 		   }
 	  if(value=="BRAcUser")
 	      {
 		  document.getElementById("OptionalMenu4").disabled = false;
 	       document.getElementById("OptionalMenu5").disabled = false;
 	       document.getElementById("OptionalMenu6").disabled = false;
 	       document.getElementById("OptionalMenu8").disabled = false;
 	       document.getElementById("OptionalMenu11").disabled = false;
 	       document.getElementById("OptionalMenu12").disabled = false;
 	       document.getElementById("OptionalMenu3").disabled = false;
 	       document.getElementById("OptionalMenu7").disabled = false;
 	       
 	       document.getElementById("OptionalMenu1").disabled = true;
 	       document.getElementById("OptionalMenu2").disabled = true;
 	       document.getElementById("OptionalMenu9").disabled = true;
 	       document.getElementById("OptionalMenu10").disabled = true;
 	      }
 	  if(value=="ITUser")
 	      {
 		  document.getElementById("OptionalMenu4").disabled = false;
 	       document.getElementById("OptionalMenu5").disabled = false;
 	       document.getElementById("OptionalMenu6").disabled = false;
 	       document.getElementById("OptionalMenu8").disabled = false;
 	       document.getElementById("OptionalMenu11").disabled = false;
 	       document.getElementById("OptionalMenu12").disabled = false;
 	       
 	       document.getElementById("OptionalMenu1").disabled = true;
 	       document.getElementById("OptionalMenu2").disabled = true;
 	       document.getElementById("OptionalMenu3").disabled = true;
 	       document.getElementById("OptionalMenu7").disabled = true;
 	       document.getElementById("OptionalMenu9").disabled = true;
 	       document.getElementById("OptionalMenu10").disabled = true;
 	      }
 	  if(value=="RepoDispOnly")
 	      {
 		  document.getElementById("OptionalMenu4").disabled = false;
 	       document.getElementById("OptionalMenu5").disabled = false;
 	       document.getElementById("OptionalMenu6").disabled = false;
 	       document.getElementById("OptionalMenu8").disabled = false;
 	       document.getElementById("OptionalMenu11").disabled = false;
 	       document.getElementById("OptionalMenu12").disabled = false;
 	       document.getElementById("OptionalMenu3").disabled = false;
 	       document.getElementById("OptionalMenu7").disabled = false;
 	       document.getElementById("OptionalMenu1").disabled = false;
 	       document.getElementById("OptionalMenu2").disabled = false;
 	       document.getElementById("OptionalMenu9").disabled = false;
 	       document.getElementById("OptionalMenu10").disabled = false;
 	   }
 	 
 	
  }
  
  function hidefields()
  {
	 document.getElementById("currNExASID").style.visibility = "hidden";
	 document.getElementById("idcurrentNExASID").value ="";
	 document.getElementById("OptionalMenu1").disabled = true;
	 document.getElementById("OptionalMenu2").disabled = true;
	 document.getElementById("OptionalMenu3").disabled = true;
	 document.getElementById("OptionalMenu4").disabled = true;
	 document.getElementById("OptionalMenu5").disabled = true;
	 document.getElementById("OptionalMenu6").disabled = true;
	 document.getElementById("OptionalMenu7").disabled = true;
	 document.getElementById("OptionalMenu8").disabled = true;
	 document.getElementById("OptionalMenu9").disabled = true;
	 document.getElementById("OptionalMenu10").disabled = true;
	 document.getElementById("OptionalMenu11").disabled = true;
	 document.getElementById("OptionalMenu12").disabled = true;
	 
	
  }
  
</script>

<script>  
function getFormDetails(obj)
{
var v = obj.value;
//alert("empid :"+v);
if(typeof XMLHttpRequest != "undefined")
{    
xmlHttp= new XMLHttpRequest();    
}
else if(window.ActiveXObject)
{    
xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
} 
if(xmlHttp==null)
{   
alert("Browser does not support XMLHTTP Request");   
return;     
}      
var url="getFormDetailsCont.jsp";  
url +="?EMP_NO=" +v;
//alert(url);
xmlHttp.onreadystatechange = setFormDetails;  
xmlHttp.open("GET", url, true);   
xmlHttp.send(null);    
}

function setFormDetails()
{
var str2=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
{
 	 document.getElementById("resultFromAjax22").innerHTML=str2;

 	 document.getElementById("idbranch").value=document.getElementById("r97").value;
 	 document.getElementById("iddepart").value=document.getElementById("r98").value;
 	 document.getElementById("iddesignation").value=document.getElementById("r99").value;
 	 document.getElementById("rofficer").value=document.getElementById("r100").value;
 	 document.getElementById("sow").value=document.getElementById("r1").value;
 	 document.getElementById("reqBy").value=document.getElementById("r83").value;
     document.getElementById("employeeOption12").value=document.getElementById("r3").value;
     document.getElementById("requestOption1").value=document.getElementById("r4").value;
     document.getElementById("reqB").value=document.getElementById("r5").value;

//requestFor
  	 document.getElementById("reqFor111").value=document.getElementById("r51").value;
	 
//email
     document.getElementById("idemaildomain").value=document.getElementById("r7").value;
	 document.getElementById("idemptype").value=document.getElementById("r9").value;
	 document.getElementById("idemailCreated").value=document.getElementById("r10").value;
	 document.getElementById("idemail").value=document.getElementById("r11").value;
	 document.getElementById("idmobile").value=document.getElementById("r14").value;
	 document.getElementById("idimei1").value=document.getElementById("r15").value;
	 document.getElementById("idimei2").value=document.getElementById("r16").value;
	 document.getElementById("remarksEmail").value=document.getElementById("r17").value;
	 document.getElementById("makeModel").value=document.getElementById("r50").value;
	 document.getElementById("simNum").value=document.getElementById("r85").value;
	 document.getElementById("idemailPass").value=document.getElementById("r86").value;
	 document.getElementById("ITremarksEmail").value=document.getElementById("r87").value;
//domain
	 document.getElementById("domainRem").value=document.getElementById("r18").value;
//biometric
	 document.getElementById("selBranch").value=document.getElementById("r90").value;
	 document.getElementById("bioRemarks").value=document.getElementById("r19").value;
//shared
	 document.getElementById("shareRemarks").value=document.getElementById("r20").value;
//internet
	 document.getElementById("idinternetRem").value=document.getElementById("r22").value;
//newins
	 document.getElementById("idreqBranch").value=document.getElementById("r23").value;
	 document.getElementById("ncode").value=document.getElementById("r24").value;
	 document.getElementById("idnewRem").value=document.getElementById("r26").value;
//nexas
	 document.getElementById("idcompCode").value=document.getElementById("r27").value;
	 document.getElementById("idcostCName").value=document.getElementById("r28").value;
	 document.getElementById("idcostCCode").value=document.getElementById("r29").value;
	 document.getElementById("idcostOPRange").value=document.getElementById("r30").value;
	 document.getElementById("idnexasRem").value=document.getElementById("r33").value;
//gsnet
	 document.getElementById("idgsNetremarks").value=document.getElementById("r38").value;
//internal
	 document.getElementById("Software").value=document.getElementById("r39").value;
	 document.getElementById("idinternalRem").value=document.getElementById("r40").value;
//usb
	 document.getElementById("idaccessFor").value=document.getElementById("r41").value;
	 document.getElementById("dscNo").value=document.getElementById("r42").value;
	 document.getElementById("idUSBRem").value=document.getElementById("r43").value;
//vpn
	 document.getElementById("idDOMid").value=document.getElementById("r44").value;
	 document.getElementById("idvpnEmail").value=document.getElementById("r45").value;
	 document.getElementById("idMlps").value=document.getElementById("r46").value;
//Harddisk / pendrive
	 document.getElementById("hardRemarks").value=document.getElementById("r47").value;
//any other asset
	 document.getElementById("assetRemarks").value=document.getElementById("r48").value;
//glow 
	 document.getElementById("project").value=document.getElementById("r91").value;
	 document.getElementById("warehouse").value=document.getElementById("r92").value;
	 document.getElementById("glowRemarks").value=document.getElementById("r93").value;

	 
//getting last approver filled details
	 	 document.getElementById("domainAcc").value=document.getElementById("r52").value;
	 	 document.getElementById("domainPass").value=document.getElementById("r53").value;
	 	 document.getElementById("domainAccRem").value=document.getElementById("r54").value;
	 	 document.getElementById("bioAppRem").value=document.getElementById("r55").value;
	 	 document.getElementById("shareAppRemarks").value=document.getElementById("r56").value;
	 	 document.getElementById("internetAppRem").value=document.getElementById("r57").value;
	 	 document.getElementById("opcCode").value=document.getElementById("r58").value;
	 	 document.getElementById("opcPass").value=document.getElementById("r59").value;
	 	 document.getElementById("opcLevel").value=document.getElementById("r60").value;
	 	 document.getElementById("opcRem").value=document.getElementById("r65").value;
	 	 document.getElementById("nexID").value=document.getElementById("r66").value;
	 	 document.getElementById("nexPass").value=document.getElementById("r67").value;
	 	 document.getElementById("nexRem").value=document.getElementById("r68").value;
	 	 document.getElementById("gsnetCode").value=document.getElementById("r69").value;
	 	 document.getElementById("gsnetPass").value=document.getElementById("r70").value;
	 	 document.getElementById("gsnetRem").value=document.getElementById("r75").value;
	 	 document.getElementById("intUSERID").value=document.getElementById("r76").value;
	 	 document.getElementById("intPass").value=document.getElementById("r77").value;
	 	 document.getElementById("intRem").value=document.getElementById("r78").value;
	 	 document.getElementById("usbAppRem").value=document.getElementById("r79").value;
	 	 document.getElementById("vpnForti").value=document.getElementById("r80").value;
	 	 document.getElementById("hardDiscRem").value=document.getElementById("r81").value;
	 	 document.getElementById("anyOtherRem").value=document.getElementById("r82").value;
	 	 document.getElementById("glowID").value=document.getElementById("r94").value;
	 	 document.getElementById("glowPass").value=document.getElementById("r95").value;
	 	 document.getElementById("glowAppRemarks").value=document.getElementById("r96").value;
	 
//sub function calling
selected1();
}
else
{
	 document.getElementById("resultFromAjax22").innerHTML=str2;

 	 document.getElementById("sow").value="";
     document.getElementById("employeeOption12").value="";
     document.getElementById("requestOption1").value="";
     document.getElementById("reqB").value="";

//email
     document.getElementById("idemaildomain").value="";
     document.getElementById("idgroup").value="";
	 document.getElementById("idemptype").value="";
	 document.getElementById("idemailCreated").value="";
	 document.getElementById("idemail").value="";
	 document.getElementById("idintuneProv").value="";
	 document.getElementById("intune").value="";
	 document.getElementById("idmobile").value="";
	 document.getElementById("idimei1").value="";
	 document.getElementById("idimei2").value="";
	 document.getElementById("remarksEmail").value="";
//domain
	 document.getElementById("domainRem").value="";
//biometric
	 document.getElementById("bioRemarks").value="";
//shared
	 document.getElementById("shareRemarks").value="";
//internet
	 document.getElementById("idinternetRem").value="";
//newins
	 document.getElementById("idreqBranch").value="";
	 document.getElementById("ncode").value="";
	 document.getElementById("idnewRem").value="";
//nexas
	 document.getElementById("idcompCode").value="";
	 document.getElementById("idcostCName").value="";
	 document.getElementById("idcostCCode").value="";
	 document.getElementById("idcostOPRange").value="";
	 document.getElementById("idnexasRem").value="";
//gsnet
	 document.getElementById("idgsNetremarks").value="";
//internal
	 document.getElementById("Software").value="";
	 document.getElementById("idinternalRem").value="";
//usb
	 document.getElementById("idaccessFor").value="";
	 document.getElementById("dscNo").value="";
	 document.getElementById("idUSBRem").value="";
//vpn
	 document.getElementById("idDOMid").value="";
	 document.getElementById("idvpnEmail").value="";
	 document.getElementById("idMlps").value="";
}
}
</script>

<script>
function selected1(){
	
//company provided mobile
	var mobileOpt = document.getElementById("r49").value;
	if(mobileOpt=="Yes"){		
		document.getElementById("mobileOptionyes").checked=true;
	}if(mobileOpt=="No"){
		document.getElementById("mobileOptionno").checked=true;
	}
//company provided sim
	var simOpt = document.getElementById("r84").value;
	if(simOpt=="Yes"){		
		document.getElementById("simOptionyes").checked=true;
	}if(simOpt=="No"){
		document.getElementById("simOptionno").checked=true;
	}
	
//intune
	var intune = document.getElementById("r13").value;
	if(intune=="Yes"){		
		document.getElementById("intuneyes").checked=true;
	}if(intune=="No"){
		document.getElementById("intuneno").checked=true;
	}
	
	var intuneprov = document.getElementById("r12").value;
	if(intuneprov=="Yes"){		
		document.getElementById("idintuneProvYes").checked=true;
	}if(intuneprov=="No"){
		document.getElementById("idintuneProvNo").checked=true;
	}

//access to newins branches
	var accessOpt = document.getElementById("r62").value;
	if(accessOpt=="Yes"){		
		document.getElementById("opcAccessYes").checked=true;
	}if(accessOpt=="No"){
		document.getElementById("opcAccessNo").checked=true;
	}
	
//request type either new request or old
	var reqType = document.getElementById("r4").value;
	if(reqType=="New"){
		document.getElementById("requestOptionchange").checked=true;
	}if(reqType=="Change"){
		document.getElementById("requestOptionchange").checked=true;		
	}

//request for
	var reqFor = document.getElementById("r6").value;
	var reqForChange = document.getElementById("r51").value;
	if(reqForChange==""){
 	var reqFor1 = reqFor.split(",");
	}else{
 	var reqFor1 = reqForChange.split(",");
	}

 	for(let z=0;z<reqFor1.length;z++){
 		reqFor1[z]=reqFor1[z].trim();
	if(reqFor1[z]=="Email ID"){
		document.getElementById("requestForCheck_email").checked=true;
		document.getElementById("requestForCheck_email").disabled=true;
	}if(reqFor1[z]=="Domain Account"){
		document.getElementById("requestForCheck_dom").checked=true;
		document.getElementById("requestForCheck_dom").disabled=true;
	}if(reqFor1[z]=="Biometric / Access Card"){
		document.getElementById("requestForCheck_bio").checked=true;
		document.getElementById("requestForCheck_bio").disabled=true;
	}if(reqFor1[z]=="Shared Folder"){
		document.getElementById("requestForCheck_sha").checked=true;
		document.getElementById("requestForCheck_sha").disabled=true;
	}if(reqFor1[z]=="Internet Access / FTP Access"){
		document.getElementById("requestForCheck_int").checked=true;
		document.getElementById("requestForCheck_int").disabled=true;
	}if(reqFor1[z]=="NEWINS"){
		document.getElementById("requestForCheck_newins").checked=true;
		document.getElementById("requestForCheck_newins").disabled=true;
	}if(reqFor1[z]=="NExAS"){
		document.getElementById("requestForCheck_nexas").checked=true;
		document.getElementById("requestForCheck_nexas").disabled=true;
	}if(reqFor1[z]=="GS-NET"){
		document.getElementById("requestForCheck_gs").checked=true;
		document.getElementById("requestForCheck_gs").disabled=true;
	}if(reqFor1[z]=="Internal Application"){
		document.getElementById("requestForCheck_internal").checked=true;
		document.getElementById("requestForCheck_internal").disabled=true;
	}if(reqFor1[z]=="USB Access"){
		document.getElementById("requestForCheck_usb").checked=true;
		document.getElementById("requestForCheck_usb").disabled=true;
	}if(reqFor1[z]=="VPN Access"){
		document.getElementById("requestForCheck_vpn").checked=true;
		document.getElementById("requestForCheck_vpn").disabled=true;
	}if(reqFor1[z]=="HardDisk / PenDrive"){
		document.getElementById("requestForCheck_hard").checked=true;
		document.getElementById("requestForCheck_hard").disabled=true;
	}if(reqFor1[z]=="Any Other Asset"){
		document.getElementById("requestForCheck_assets").checked=true;
		document.getElementById("requestForCheck_assets").disabled=true;
	}if(reqFor1[z]=="NEx-GLOW"){
		document.getElementById("requestForCheck_glow").checked=true;
		document.getElementById("requestForCheck_glow").disabled=true;
	}
 	}
 	
//biometric access
var selBranch1= document.getElementById("r90").value;
if(selBranch1!=""){
 	var selBranch = document.getElementById("selBranch");
 	var selBranch2= selBranch1.split(",");
 	var req_branch = document.getElementById("reqB").value;
 	for(let bbb=0;bbb<selBranch.length;bbb++){
 		for(let bb=0;bb<selBranch2.length;bb++){
 		if((selBranch2[bb].trim())==(selBranch[bbb].value)){
 			selBranch[bbb].selected=true;
 		}
 		}
 	}
}else{
 	var selBranch = document.getElementById("selBranch");
 	var req_branch = document.getElementById("reqB").value;
 	for(let bbb=0;bbb<selBranch.length;bbb++){
 		if(req_branch.includes(selBranch[bbb].value)){
 			selBranch[bbb].selected=true;
 		}
 	}
}
 	
//internet
 	var intType = document.getElementById("r21").value;
 	if(intType=="Privilege Access"){
 		document.getElementById("idrequestTypeOption1").checked=true;
 	}if(intType=="Normal Access"){
 		document.getElementById("idrequestTypeOption2").checked=true;		
 	}if(intType=="Limited Access"){
 		document.getElementById("idrequestTypeOption3").checked=true;
 	}if(intType=="No Internet Access"){
 		document.getElementById("idrequestTypeOption4").checked=true;		
 	}

//newins
 	var newType = document.getElementById("r25").value;
 	if(newType=="New"){
 		document.getElementById("idreqNew1").checked=true;
 		hideTRAjax();
 	}if(newType=="Change"){
 		document.getElementById("idreqNew2").checked=true;
 		showTRAjax();
 	}
 	
 	var newselBrs = document.getElementById("r23").value;
 	var defBC = document.getElementsByName("approverslistBC");
// 	newselBrs = newselBrs.substring(0,newselBrs.length-1);
	var newinsBranch = newselBrs.split(",");
	for(let n=0;n<defBC.length;n++){
		for(let nn=0;nn<newinsBranch.length;nn++){
			if((newinsBranch[nn]).trim()==((defBC[n].value)).trim()){
				document.getElementById("idapproverslistBC"+defBC[n].value).checked=true;
			}
		}
	}
 	
//nexas 	
	var nexType = document.getElementById("r31").value;
 	if(nexType=="HOAcUser"){
 		document.getElementById("userKind1").checked=true;
 		activeAjax(nexType);
 	}if(nexType=="BRAcUser"){
 		document.getElementById("userKind2").checked=true;
 		activeAjax(nexType);
 	}if(nexType=="ITUser"){
 		document.getElementById("userKind3").checked=true;
 		activeAjax(nexType);
 	}if(nexType=="RepoDispOnly"){
 		document.getElementById("userKind4").checked=true;
 		activeAjax(nexType);
 	}
 	 
 	var opt = document.getElementById("r32").value;
 	var defopt = document.getElementsByName("OptionalMenu[]");
	var opt1 = opt.split(",");
	let integ = 0;
	for(let y=0;y<defopt.length;y++){
		integ++;
		for(let yy=0;yy<opt1.length;yy++){
			if((opt1[yy]).trim()==(defopt[y].value).trim()){
				document.getElementById("OptionalMenu"+integ).checked=true;
			}
		}
	}
	
//newins
	 	var newBlock = document.getElementById("r63").value;
		var defnewBlock	 = document.getElementsByName("progBlocked[]");
		var newBlock1 = newBlock.split(",");
		for(let jjj=0;jjj<defnewBlock.length;jjj++){
			for(let jj=0;jj<newBlock1.length;jj++){
			if(((newBlock1[jj]).trim())==((defnewBlock[jjj].value).trim())){
				document.getElementById("progBlocked"+defnewBlock[jjj].value).checked=true;
			}
			}
		}		

		var newAllow = document.getElementById("r64").value;
		var defnewAllow	 = document.getElementsByName("progAllowed[]");
		var newAllow1 = newAllow.split(",");
		for(let jjj=0;jjj<defnewAllow.length;jjj++){
			for(let jj=0;jj<newAllow1.length;jj++){
			if(((newAllow1[jj]).trim())==((defnewAllow[jjj].value).trim())){
				document.getElementById("progAllowed"+defnewAllow[jjj].value).checked=true;
			}
			}
		}	
//gsnet
	var gsbranch = document.getElementById("r71").value;
	var defgsbr	 = document.getElementsByName("gsnetBrCode[]");
	var gsbranch1 = gsbranch.split(",");
	for(let jjj=0;jjj<defgsbr.length;jjj++){
		for(let jj=0;jj<gsbranch1.length;jj++){
		if(((gsbranch1[jj]).trim())==((defgsbr[jjj].value).trim())){
			document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).checked=true;
		}
		}
	}

	var gsdiv = document.getElementById("r72").value;
	var defgsdiv = document.getElementsByName("gsnetDiv[]");
	var gsdiv1 = gsdiv.split(",");
	for(let hh=0;hh<defgsdiv.length;hh++){
		for(let hhh=0;hhh<gsdiv1.length;hhh++){
		if(((gsdiv1[hhh]).trim())==((defgsdiv[hh].value).trim())){
			document.getElementById("idgsnetDiv"+defgsdiv[hh].value).checked=true;
		}
		}
	}

	var gspridiv = document.getElementById("r73").value;
	var defgspridiv = document.getElementsByName("gsnetPdiv[]");
	var gspridiv1 = gspridiv.split(",");
	for(let zz=0;zz<defgspridiv.length;zz++){
		for(let zzz=0;zzz<gspridiv1.length;zzz++){
		if(((gspridiv1[zzz]).trim())==((defgspridiv[zz].value).trim())){
			document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).checked=true;
		}
		}
	}
	
	var gsrole = document.getElementById("r74").value;
	var defgsrole = document.getElementsByName("role[]");
	var gsrole1 = gsrole.split(",");
	for(let ll=0;ll<defgsrole.length;ll++){
		for(let lll=0;lll<gsrole1.length;lll++){
		if(((gsrole1[lll]).trim())==((defgsrole[ll].value).trim())){
			document.getElementById("role"+ll).checked=true;
		}
		}
	}
	
//internal application
 	var intApp = document.getElementById("r39").value;
 	var defApp = document.getElementsByName("approverslist");
// 	intApp = intApp.substring(0,intApp.length-1);
	var internalApp = intApp.split(",");
	for(let m=0;m<defApp.length;m++){
		for(let mm=0;mm<internalApp.length;mm++){
			if((internalApp[mm])==(defApp[m].value)){
				document.getElementById("idapproverslist"+defApp[m].value).checked=true;
			}
		}
	}
	
reqForAjax();
intunedisplayAjax(document.getElementById("r13"));
showMobAjax(document.getElementById("r49").value);
hideMobAjax(document.getElementById("r49").value);
showSimAjax(document.getElementById("r84").value);
hideSimAjax(document.getElementById("r84").value);
}
</script>

<script>
function reqForAjax(){
	var req = document.getElementById("r6").value;
	var req2 = document.getElementById("r51").value;
	if(req1!="" || rreq!=null){		
		var req1 = req2.split(",");
	}else{
		var req1 = req.split(",");
	}
	for (let k=0;k<req1.length;k++){
		req1[k]=req1[k].trim();
		if(req1[k]=="Email ID"){
			var email 		= document.getElementById("requestForCheck_email");
			var emdt		= document.getElementById("email_details");
			if(email.checked==true){
				emdt.style.display 		= "inline";
				emdt.style.visibility 	= "visible";
			}else{
				emdt.style.display 		= "none";
				emdt.style.visibility	= "hidden";
			}
		}if(req1[k]=="Domain Account"){
			var domain		= document.getElementById("requestForCheck_dom");
			var dmdt		= document.getElementById("dom_details");
			if(domain.checked==true){
				dmdt.style.display = "inline";
			}else{
				dmdt.style.display = "none";			
			}
		}if(req1[k]=="Biometric / Access Card"){
			var biometric 	= document.getElementById("requestForCheck_bio");
			var biodt		= document.getElementById("bio_details");
			if(biometric.checked==true){
				biodt.style.display = "inline";
			}else{
				biodt.style.display = "none";			
			}
		}if(req1[k]=="Shared Folder"){
			var shared 		= document.getElementById("requestForCheck_sha");
			var shadt		= document.getElementById("sha_details");
			if(shared.checked==true){
				shadt.style.display = "inline";
			}else{
				shadt.style.display = "none";			
			}
		}if(req1[k]=="Internet Access / FTP Access"){
			var internet 	= document.getElementById("requestForCheck_int");
			var intdt		= document.getElementById("int_details");
			if(internet.checked==true){
				intdt.style.display = "inline";
			}else{
				intdt.style.display = "none";			
			}
		}if(req1[k]=="NEWINS"){
			var newins 		= document.getElementById("requestForCheck_newins");
			var newdt		= document.getElementById("new_details");
			if(newins.checked==true){
				newdt.style.display = "inline";
			}else{
				newdt.style.display = "none";			
			}
		}if(req1[k]=="NExAS"){
			var nexas 		= document.getElementById("requestForCheck_nexas");
			var nexdt		= document.getElementById("nex_details");
			if(nexas.checked==true){
				nexdt.style.display = "inline";
			}else{
				nexdt.style.display = "none";			
			}
		}if(req1[k]=="GS-NET"){
			var gsnet 		= document.getElementById("requestForCheck_gs");
			var gsdt		= document.getElementById("gs_details");
			if(gsnet.checked==true){
				gsdt.style.display = "inline";
			}else{
				gsdt.style.display = "none";			
			}
		}if(req1[k]=="Internal Application"){
			var internal 	= document.getElementById("requestForCheck_internal");
			var interdt		= document.getElementById("inter_details");
			if(internal.checked==true){
				interdt.style.display = "inline";
			}else{
				interdt.style.display = "none";			
			}
		}if(req1[k]=="USB Access"){
			var usb 		= document.getElementById("requestForCheck_usb");
			var usbdt		= document.getElementById("usb_details");
			if(usb.checked==true){
				usbdt.style.display = "inline";
			}else{
				usbdt.style.display = "none";			
			}
		}if(req1[k]=="VPN Access"){
			var vpn 		= document.getElementById("requestForCheck_vpn");
			var vpndt		= document.getElementById("vpn_details");
			if(vpn.checked==true){
				vpndt.style.display = "inline";
			}else{
				vpndt.style.display = "none";			
			}
		}if(req1[k]=="HardDisk / PenDrive"){
			var hd 		= document.getElementById("requestForCheck_hard");
			var hddt		= document.getElementById("hard_details");
			if(hd.checked==true){
				hddt.style.display = "inline";
			}else{
				hddt.style.display = "none";			
			}
		}if(req1[k]=="Any Other Asset"){
			var as 		= document.getElementById("requestForCheck_assets");
			var asdt		= document.getElementById("asset_details");
			if(as.checked==true){
				asdt.style.display = "inline";
			}else{
				asdt.style.display = "none";			
			}
		}if(req1[k]=="NEx-GLOW"){
			var gl 		= document.getElementById("requestForCheck_glow");
			var gldt		= document.getElementById("glow_details");
			if(gl.checked==true){
				gldt.style.display = "inline";
			}else{
				gldt.style.display = "none";			
			}
		}
	}
}

function intunedisplayAjax(obj){
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
		  document.getElementById('emailRow').rowSpan="9";
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
		  document.getElementById('emailRow').rowSpan="7";
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

function showMobAjax(obj)
{
	var bb = obj;
	if(bb=="Yes"){
	 document.getElementById('compTD').colSpan="1";
	 document.getElementById('mob1').style.display="table-cell";
	 document.getElementById('mob1').style.visibility="visible";
	 document.getElementById('mob2').style.display="table-cell";
	 document.getElementById('mob2').style.visibility="visible";
	}
}
function hideMobAjax(obj)
{
	var aa = obj;
	if(aa=="No"){
	 document.getElementById('compTD').colSpan="3";
	 document.getElementById('mob1').style.display="none";
	 document.getElementById('mob1').style.visibility="hidden";
	 document.getElementById('mob2').style.display="none";
	 document.getElementById('mob2').style.visibility="hidden";
	}
}

function showSimAjax(obj)
{
	var cc = obj;
	if(cc=="Yes"){
	 document.getElementById('compSim').colSpan="1";
	 document.getElementById('sim1').style.display="table-cell";
	 document.getElementById('sim1').style.visibility="visible";
	 document.getElementById('sim2').style.display="table-cell";
	 document.getElementById('sim2').style.visibility="visible";
	}
}
function hideSimAjax(obj)
{
	var dd = obj;
	if(dd=="No"){
	 document.getElementById('compSim').colSpan="3";
	 document.getElementById('sim1').style.display="none";
	 document.getElementById('sim1').style.visibility="hidden";
	 document.getElementById('sim2').style.display="none";
	 document.getElementById('sim2').style.visibility="hidden";
	}
}

</script>

 <script type="text/javascript">  

    function sync1(val)
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

 <script type="text/javascript"> //  body onloade()
function cleartext()
    {
    var checkboxes = document.getElementById("checkboxes");
    checkboxes.style.display = "none";
    }
</script>

 <script type="text/javascript"> //  body onloade()
function cleartextBC()
    {
    var checkboxesBC = document.getElementById("checkboxesBC");
    checkboxesBC.style.display = "none";
    }
</script>   

<script type="text/javascript">
function reqFor(type){
	var type 		= type.value;
	if(type=="Email ID"){
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
	if(type=="Domain Account"){
		var domain		= document.getElementById("requestForCheck_dom");
		var dmdt		= document.getElementById("dom_details");
		if(domain.checked==true){
			dmdt.style.display = "inline";
		}else{
			dmdt.style.display = "none";			
		}
	}
	if(type=="Biometric / Access Card"){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt		= document.getElementById("bio_details");
		if(biometric.checked==true){
			biodt.style.display = "inline";
		}else{
			biodt.style.display = "none";			
		}
	}
	if(type=="Shared Folder"){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt		= document.getElementById("sha_details");
		if(shared.checked==true){
			shadt.style.display = "inline";
		}else{
			shadt.style.display = "none";			
		}
	}
	if(type=="Internet Access / FTP Access"){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt		= document.getElementById("int_details");
		if(internet.checked==true){
			intdt.style.display = "inline";
		}else{
			intdt.style.display = "none";			
		}
	}
	if(type=="NEWINS"){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt		= document.getElementById("new_details");
		if(newins.checked==true){
			newdt.style.display = "inline";
		}else{
			newdt.style.display = "none";			
		}
	}
	if(type=="NExAS"){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt		= document.getElementById("nex_details");
		if(nexas.checked==true){
			nexdt.style.display = "inline";
		}else{
			nexdt.style.display = "none";			
		}
	}
	if(type=="GS-NET"){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt		= document.getElementById("gs_details");
		if(gsnet.checked==true){
			gsdt.style.display = "inline";
		}else{
			gsdt.style.display = "none";			
		}
	}
	if(type=="Internal Application"){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt		= document.getElementById("inter_details");
		if(internal.checked==true){
			interdt.style.display = "inline";
		}else{
			interdt.style.display = "none";			
		}
	}
	if(type=="USB Access"){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt		= document.getElementById("usb_details");
		if(usb.checked==true){
			usbdt.style.display = "inline";
		}else{
			usbdt.style.display = "none";			
		}
	}
	if(type=="VPN Access"){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt		= document.getElementById("vpn_details");
		if(vpn.checked==true){
			vpndt.style.display = "inline";
		}else{
			vpndt.style.display = "none";			
		}
	}
	if(type=="HardDisk / PenDrive"){
		var hd	 		= document.getElementById("requestForCheck_hard");
		var hddt		= document.getElementById("hard_details");
		if(hd.checked==true){
			hddt.style.display = "inline";
		}else{
			hddt.style.display = "none";			
		}
	}
	if(type=="Any Other Asset"){
		var as	 		= document.getElementById("requestForCheck_assets");
		var asdt		= document.getElementById("asset_details");
		if(as.checked==true){
			asdt.style.display = "inline";
		}else{
			asdt.style.display = "none";			
		}
	}
	if(type=="NEx-GLOW"){
		var gl	 		= document.getElementById("requestForCheck_glow");
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
	var yesNo11  = document.getElementById("intuneYes11");
	var yesNo1 = document.getElementById("intuneYes1");
	var yesNo111 = document.getElementById("intuneYes111");
	var yesNo12 = document.getElementById("intuneYes12");
	var yesNo13 = document.getElementById("intuneYes13");
	var yesNo2 = document.getElementById("intuneYes2");
	var yesNo21 = document.getElementById("intuneYes21");
	if(intune=="Yes"){
		  document.getElementById('mobInt').colSpan="1";
		  document.getElementById('emailRow').rowSpan="9";
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
		  document.getElementById('emailRow').rowSpan="7";
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
                
                
</head>

<body onload="cleartext();cleartextBC();getFormDetails(document.form.full_name);getFormDetails(document.form.full_name);hidefields();hidefieldsAjax();showSim();hideSim();showMob();hideMob();">
<form action="NEINFormUpdateContBack.jsp" method="post" name="form">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
//NEINApplicationFormBack.jsp
String empGet = request.getParameter("emplID");
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");

%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="26" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>
		APPLICATION FORM</label>
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
Connection cn1 = null,cnlms=null;
Statement st1= null,st2=null,st3=null,st4=null,st6=null,stED=null,stET=null,stINT=null,stBC=null,stGR=null,stMul=null,stBC1=null;
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs6=null,rsED=null,rsET=null,rsINT=null,rsBC=null,rsGR=null,rsMul=null,rsBC1=null;
try{
cn1 = con.getConnection2();
cnlms = conLMS.getConnectionlms();
st1 = cn1.createStatement();
rs1 = st1.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

st2 = cnlms.createStatement();
rs2 = st2.executeQuery("select department_name from department ORDER BY department_name Asc"); 

st4 = cn1.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

st6 = cn1.createStatement();
rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc"); 

stMul = cn1.createStatement();
rsMul = stMul.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc"); 

stED = cn1.createStatement();
rsED = stED.executeQuery("select emaildomain from emaildomainmaster ORDER BY emaildomain Asc"); 

stET = cn1.createStatement();
rsET = stET.executeQuery("select employeetype from employeeTypeMaster ORDER BY employeetype Asc");

stINT = cn1.createStatement();
rsINT = stINT.executeQuery("select app_name from software_owner_master ORDER BY app_name Asc"); 

stBC  = cn1.createStatement();
rsBC  = stBC.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_no Asc"); 

stBC1 = cnlms.createStatement();
rsBC1 = stBC1.executeQuery("select branch_type_code,branch_name from branchmaster ORDER BY branch_name Asc"); 

stGR  = cn1.createStatement();
rsGR  = stGR.executeQuery("select groupName from groupmaster ORDER BY groupName Asc"); 
%>	 
		
<table  width="895">
<tr>
<td style="text-align: right;"><font color=red>*</font>Employee Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="29" value="<%=empGet%>" maxlength="44" onchange="getFormDetails(this);" readonly></td>
<td style="text-align: right;width:23%;"><font color=red>*</font>Branch :</td>
<td style="text-align:left;">
<select name="branch" id="idbranch" style="width:100%;">
<option value="">Select</option>
<%while(rsBC1.next()){%>
<option value="<%=rsBC1.getString("branch_name")%>"><%=rsBC1.getString("branch_name")%></option>
<%}%>
</select>
</td>
</tr>
<tr>
<td style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
<td style="text-align:left;">
<select name="depart" id="iddepart" style="width:100%;">
<option value="">Select</option>
<%while(rs2.next()){%>
<option value="<%=rs2.getString("department_name")%>"><%=rs2.getString("department_name")%></option>
<%}%>
</select>
</td>
<td style="text-align: right;"><font color=red>*</font>Designation :</td>
<td style="text-align:left;">
<select name="designation" id="iddesignation" style="width:100%;">
<option value="">Select</option>
<%while(rs4.next()){%>
<option value="<%=rs4.getString("DESIGNATION")%>"><%=rs4.getString("DESIGNATION")%></option>
<%}%>
</select>
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" size="29" id="rofficer" maxlength="44" readonly/></td>
<td style="text-align: right;"><font color=red>*</font>Scope Of Work :</td>
<td style="text-align: left;">
<select name="scopeOfWork" id="sow" style="width:100%;">      
<option value="">Select</option>
<%while(rsGR.next()){%>     
<option value="<%=rsGR.getString(1)%>"><%=rsGR.getString(1)%></option> 
<%}%>   
</select> 
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Requested By :</td>
<td style="text-align:left;"><input type="text" name="requestBy" id="reqBy" size="29" maxlength="44" value="<%=Name%>" readonly/></td>
<td style="text-align: right;"><font color=red>*</font>Employee Contract Type</td>
<td style="font-weight:bold;font-style:italic;width:23%;"><input type="hidden" id="employeeOption12">
<input type="text" id="employeeOption1on" name="employeeOption1" size="29" value="Contract" readonly/>
</td>
</tr>
<tr>
<td align="right"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> <input type="hidden" id="requestOption1">
<input type="radio" name="requestOption" value="New" disabled id="requestOptionnew"/>New
<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
</td>
<td style="text-align: right;display: none;"><font color=red>*</font>Requested Branch :</td>
<td style="text-align:left;display: none;"><input type="hidden" id="req_branch">
<select name="req_Branch" id="reqB" style="font-size : 8pt;width:90;">      
<option value="">Select</option>
<%while(rs6.next()){%>     
<option value="<%=rs6.getString(2)%>"><%=rs6.getString(2)%></option> 
<%}%>
</select>
</td>
</tr>
</table>
<br />

<table width="895">
<tr>
<td id="req" rowspan="3" style="text-align:right; width: 15%;"><font color=red>*</font>Request For</td><input type="hidden" name="reqFor111" id="reqFor111">
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_email" onclick="reqFor(this)" value="Email ID">Email ID</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_dom" onclick="reqFor(this)" value="Domain Account" oninput="reqForAjax(this)">Domain Account</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_bio" onclick="reqFor(this)" value="Biometric / Access Card">Biometric / Access Card</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_sha" onclick="reqFor(this)" value="Shared Folder">Shared Folder</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_int" onclick="reqFor(this)" value="Internet Access / FTP Access">Internet Access / FTP Access</td>
<tr>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_newins" onclick="reqFor(this)" value="NEWINS">NEWINS</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_nexas" onclick="reqFor(this)" value="NExAS">NExAS</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_gs" onclick="reqFor(this)" value="GS-NET">GS-NET</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_internal" onclick="reqFor(this)" value="Internal Application">Internal Application</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_usb" onclick="reqFor(this)" value="USB Access">USB Access</td>
</tr>
<tr>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_vpn" onclick="reqFor(this)" value="VPN Access">VPN Access</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_hard" onclick="reqFor(this)" value="HardDisk / PenDrive">HardDisk / PenDrive</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_assets" onclick="reqFor(this)" value="Any Other Asset">Any Other Asset</td>
<td style="font-weight:bold;font-style:italic;"><input disabled type="checkbox" name="requestForCheck" id="requestForCheck_glow" onclick="reqFor(this)" value="NEx-GLOW">NEx-GLOW</td>
<td colspan="1"></td>
</tr>
</tr>
</table>

<br />

<div id="email_details" style="display: none;visibility: hidden;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" id="emailRow" rowspan="7" style="width:15%"><font size="3"><b>Email ID</b></font></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Email Domain :</td>
<td align="left" style="width: 20%;">
<select name="emaildomain" id="idemaildomain" style="width:50%;">      
<option value="">Select</option>
<%while(rsED.next()){%>     
<option value="<%=rsED.getString(1)%>"><%=rsED.getString(1)%></option> 
<%}%>   
</select>  
</td>
<td style="text-align: right;width:20%;"><font color=red>*</font>Employee Type :</td>
<td style="text-align:left;width:20%;">
<select name="emptype" id="idemptype" style="width:50%;">      
<option value="">Select</option>
<%while(rsET.next()){%>     
<option value="<%=rsET.getString(1)%>"><%=rsET.getString(1)%></option> 
<%}%>   
</select>  
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>E-Mail Id Created :</td>
<td style="text-align:left;"><input type="text" name="emailCreated" id="idemailCreated" maxlength="54"/></td>
<td style="text-align: right;"><font color=red>*</font>E-Mail Id Password :</td>
<td style="text-align:left;"><input type="text" name="emailPass" id="idemailPass" maxlength="54"/></td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Requested E-Mail Id :</td>
<td style="text-align:left;"><input type="text" name="email" id="idemail" maxlength="54"/></td>
<td style="text-align: right;"><font color=red>*</font>Intune Access Provided :</td>
<td style="text-align:left;">
<input id="idintuneProvYes" type="radio" name="intuneProv" value="Yes"/>Yes
<input id="idintuneProvNo" type="radio" name="intuneProv" value="No"/>No
<!-- <input type="text" name="intuneProv" id="idintuneProv" size="25" maxlength="54"/> -->
</td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided Mobile  :</td>
<td style="text-align:left;" id="compTD">
<input type="radio" name="mobileOption" value="Yes" onchange="showMob()" id="mobileOptionyes"/>Yes
<input type="radio" name="mobileOption" value="No" onchange="hideMob()" id="mobileOptionno"/>No
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="mob1"><font color=red>*</font>Mobile Make & Model  :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="mob2"><input type="text" name="makeModel" id="makeModel">
</td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided Sim Card :</td>
<td style="text-align:left;" id="compSim">
<input type="radio" name="simOption" value="Yes" onchange="showSim()" id="simOptionyes"/>Yes
<input type="radio" name="simOption" value="No" onchange="hideSim()" id="simOptionno"/>No
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="sim1"><font color=red>*</font>Company Provided Mobile Number  :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="sim2"><input type="text" name="simNum" id="simNum">
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Mobile Access (Intune) </td>
<td style="text-align:left;" id="mobInt">
<input type="radio" name="intune" value="Yes" onchange="return intunedisplay(this)" id="intuneyes"/>Yes
<input type="radio" name="intune" value="No" onchange="return intunedisplay(this)" id="intuneno"/>No
<!-- <select id="intune" name="intune" onchange="return intunedisplay(this)">
<option value="">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> -->
</td>
<td style="text-align:right;display: none;" id="intuneYes"><font color=red>*</font>Mobile No. :</td>
<td style="text-align:left;display: none;" id="intuneYes11"><input type="text" name="mobile" id="idmobile" size="20" maxlength="54"/></td>
</tr>
<!-- <tr id="intuneYes" style="display: none;">
</tr> -->
<tr id="intuneYes1" style="display: none;">
<td style="text-align:center;" colspan="4" class="tdColor"><font color="red">*</font>IMEI No. ('s) :</td>		
</tr>
<tr id="intuneYes111" style="display: none;">
<td style="text-align:right;display: none;" id="intuneYes12"><font color="red">*</font>IMEI No 1 :</td>
<td style="text-align:left;display: none;" id="intuneYes13"><input type="text" name="imei1" id="idimei1" size="20" maxlength="54"/></td>		
<td style="text-align:right;display: none;" id="intuneYes2"><font color="red">*</font>IMEI No 2 :</td>
<td style="text-align:left;display: none;" id="intuneYes21"><input type="text" name="imei2" id="idimei2" size="20" maxlength="54"/></td>
</tr>
<!-- <tr style="display: none;">
</tr> -->
<tr>
<td style="text-align:right;"><font color="red">*</font>Requester Remarks :</td>
<td style="text-align:left;"><textarea name="remarksEmail" rows="3" cols="26" id="remarksEmail" maxlength="199"></textarea></td>
<td style="text-align:right;"><font color="red">*</font>IT Remarks :</td>
<td style="text-align:left;"><textarea name="ITremarksEmail" rows="3" cols="26" id="ITremarksEmail" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="dom_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>Domain Account</b></font></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Domain Account :</td>
<td style="text-align:left; width: 20%;"><input type="text" name="domainAcc" id="domainAcc" maxlength="54"/></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Domain Password :</td>
<td style="text-align:left; width: 20%;"><input type="text" name="domainPass" id="domainPass" maxlength="54"/></td>
</tr>
<tr>
</tr>
<tr>
<td style="text-align:right;"><font color="red">*</font>Requester Remarks :</td>
<td style="text-align:left;"><textarea name="remarksDom" rows="3" cols="26" id="domainRem" maxlength="199"></textarea></td>
<td style="text-align:right;"><font color=red>*</font>IT Remarks :</td>
<td style="text-align:left;"><textarea name="domainAccRem" rows="3" cols="26" id="domainAccRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="bio_details" style="display: none;">
<table id="bio_details" width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>Biometric / Access Card</b></font></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Selected Branch ('s):</td>
<td style="text-align:left;" colspan="3">
<select name="selBranch" id="selBranch" multiple="multiple" style="width: 32%;">
<%while(rsMul.next()){%>
<option value="<%=rsMul.getString(2)%>"><%=rsMul.getString(2)%></option>
<%}%>
</select>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;"><font color="red">*</font>Requester Remarks :</td>
<td style="text-align:left;"><textarea name="bioRemarks" rows="3" cols="26" id="bioRemarks" maxlength="199"></textarea></td>
<td style="text-align:right; width: 20%;""><font color="red">*</font>IT Remarks :</td>
<td style="text-align:left;"><textarea name="bioAppRem" rows="3" cols="26" id="bioAppRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="sha_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Shared Folder Access</b></font></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td style="text-align:left;"><textarea name="sharedRemarks" rows="3" cols="26" id="shareRemarks" maxlength="199"></textarea></td>
<td style="text-align:right;width: 20%;"><font color="red">*</font> IT Remarks :</td>
<td style="text-align:left;"><textarea name="shareAppRemarks" rows="3" cols="26" id="shareAppRemarks" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="int_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internet Access / FTP Access</b></font></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Request Type :</td>
<td colspan="3" style="font-weight:bold;font-style:italic;text-align:left;">
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption1" value ="Privilege Access">Privilege Access
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption2" value ="Normal Access">Normal Access
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption3" value ="Limited Access">Limited Access
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption4" value ="No Internet Access">No Internet Access</td>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="internetRem" rows="3" cols="26" id="idinternetRem" maxlength="199"></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="internetAppRem" rows="3" cols="26" id="internetAppRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="new_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="9" id="newin" style="width:15%"><font size="3"><b>NEWINS</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Requested Branch Code :</td>
<td style="text-align: left;" colspan="3">
<div class="multiselect">
<div class="selectBox" onclick="showCheckboxesBC()" >
<select style="width:30%;" id="idselBranch">
<option value="">Select</option>
</select>
<input type="text" name="reqBrCode" size=50 id="idreqBranch" readonly/>
<div class="overSelect"></div>
</div>
<div id="checkboxesBC"  onclick="showCheckboxesBC()">
<%while(rsBC.next()){%> 
<label for="<%=rsBC.getString(1)%>" style="width:55%; text-align: left;">
<input type="checkbox" name="approverslistBC" onclick="syncBC(this),showCheckboxesBC()" id="idapproverslistBC<%=rsBC.getString(1)%>" class="group1BC" value="<%=rsBC.getString(1)%>" /><%=rsBC.getString(1)%> -- (<%=rsBC.getString(2)%>)</label>
<%}%>
</div>
</div>
</td> 
</tr>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Requested NEWIN's ID / Operator Code :</td>
<td style="text-align:left;"><input type="text" name="newinCode" id="ncode" maxlength="44" size="20"/></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;">
<input type="radio" name="reqNew" value="New" id="idreqNew1" onclick="hideTR();"/>New
<input type="radio" name="reqNew" value="Change" id="idreqNew2" onclick="showTR();" />Change
</tr>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Operator Code :</td>
<td style="text-align:left;"><input type="text" name="opcCode" id="opcCode" maxlength="44" size="20"/></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Password  :</td>
<td style="font-weight:bold;font-style:italic;"><input type="text" name="opcPass" id="opcPass" maxlength="44" size="20"/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Level :</td>
<td style="text-align:left;"><input type="text" name="opcLevel" id="opcLevel" maxlength="44" size="20"/></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Access Provided to Branche ('s) :</td>
<td style="text-align:left;" colspan="3">
<input type="radio" name="opcAccess" id="opcAccessYes" value="Yes">Yes
<input type="radio" name="opcAccess" id="opcAccessNo" value="No">No
<!-- <input type="text" name="opcAccess" id="opcAccess" maxlength="44" size="20"/> -->
</td>
</tr>
<%
Connection cndel1new = null,cndel2new = null,cndel3new = null,cndel4new = null;
Statement stdel1new = null,stdel2new = null,stdel3new = null,stdel4new = null; 
ResultSet rsdel1new = null,rsdel2new = null,rsdel3new = null,rsdel4new = null;

stdel1new=cn1.createStatement();

stdel3new=cn1.createStatement();
rsdel4new = stdel3new.executeQuery("select pro_name from newins_programs ORDER BY pro_name Asc");
stdel4new=cn1.createStatement();
rsdel3new = stdel4new.executeQuery("select pro_name from newins_programs ORDER BY pro_name Asc");
%>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Programs Blocked :</td>
<td style="text-align:left;" colspan="3">
<!-- <input type="text" name="progBlocked" id="progBlocked" maxlength="44" size="20"/> -->
<%
int count=0;
ArrayList<String> pro_nameBlockednew = new ArrayList<String>();
ArrayList<String> pro_nameAllowednew = new ArrayList<String>();
while(rsdel4new.next()){ 
pro_nameBlockednew.add(rsdel4new.getString("pro_name"));
} 
while(rsdel3new.next()){ 
pro_nameAllowednew.add(rsdel3new.getString("pro_name"));
}
int column=0,column2=0;
%>

<table>
<%
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
<td bgcolor="lightgrey">
<input type="checkbox" name="progBlocked[]" class="check" id="progBlocked<%=pro_nameBlockednew.get(row+column)%>" value="<%=pro_nameBlockednew.get(row+column)%>" /><%=pro_nameBlockednew.get(row+column) %></td>
<%
}
}
%>
</tr>
<%}%>
</table>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Programs Allowed :</td>
<td style="text-align:left;" colspan="3">
<table>
<%
for(int row2=0;row2<pro_nameAllowednew.size();row2+=8)
{
%> 
<tr colspan="8">

<% for(column2=0;column2<8;column2++){
 
 if(row2+column2<pro_nameAllowednew.size())
 {
 String temp2 = pro_nameAllowednew.get(row2+column2);
 %>
<td bgcolor="lightgrey">
<input type="checkbox" name="progAllowed[]" class="check" id="progAllowed<%=pro_nameAllowednew.get(row2+column2)%>" value="<%=pro_nameAllowednew.get(row2+column2)%>" /><%=pro_nameAllowednew.get(row2+column2) %></td>
<%
}
}
%>
</tr>
<%} %>
<input type="hidden" name="CheckValues" value="" id="text" />
<!-- <input type="text" name="progAllowed" id="progAllowed" maxlength="44" size="20"/> -->
</table>
</td>
</tr>
<tr style="visibility: hidden;display: none;" id="idDelete">
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Requester Remarks :</td>
<td style="text-align:left;" colspan="3"><textarea name="newRem" rows="3" cols="26" id="idnewRem" maxlength="99" title="Remarks 100 characters"></textarea></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>IT Remarks :</td>
<td style="text-align:left;" colspan="3"><textarea name="opcRem" rows="3" cols="26" id="opcRem" maxlength="99" title="Remarks 100 characters"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="nex_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="7" style="width:15%"><font size="3"><b>NExAS</b></font></td>
<td style="text-align:right; width: 20%;"><font color="red">*</font>Company Code :</td>
<td align="left">
<select style="width: 100%;" name="compCode" id="idcompCode">
<option value="">Select</option>
<option value="NIN">NIN</option>
</select>
</td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Cost Center Name:</td>
<td align="left">
<%
Connection con11 = null;
ResourceBundle dbProperties1 = ResourceBundle.getBundle("csdb");
String userName1 = dbProperties1.getString("csdb.username");
String password1 = dbProperties1.getString("csdb.password");
String url1 = dbProperties1.getString("csdb.url");
String driver1 = dbProperties1.getString("csdb.driverName");
String dbName1 = dbProperties1.getString("csdb.dbName");
//int sumcount=0;
Statement stcc=null;
ResultSet rscc=null; 
try
{
// id="idBranch"
Class.forName(driver1).newInstance();
con11 = DriverManager.getConnection(url1+dbName1,userName1,password1); 
String query = "select * from nexascostmaster ORDER BY costname Asc";
stcc = con11.createStatement();
rscc = stcc.executeQuery(query);
%>
<select name="costCName" id="idcostCName" onchange="callcostDetails(this.value)" style="width:100%;">
<option value="">Select</option>
<%while(rscc.next()){%>
<option value="<%=rscc.getString(2)%>"><%=rscc.getString(2)%></option>
<%}%>
</select>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
//	DbUtil.closeDBResources(rs,st,con);
con11.close();
}%>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Cost Center Code:</td>
<td style="text-align: left;"><input type="text" name="costCCode"	id="idcostCCode" size="20" maxlength="44" /></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Operation range:</td>
<td style="text-align: left;"><input type="text" name="costOPRange"	id="idcostOPRange" size="20" maxlength="44" /></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>NExAS User ID :</td>
<td style="text-align: left;"><input type="text" name="nexID" id="nexID" size="20" maxlength="44" /></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Password :</td>
<td style="text-align: left;"><input type="text" name="nexPass"	id="nexPass" size="20" maxlength="44" /></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Request Type <font color=red>(Please select first)</font></td>
<td align="left" colspan="3">
<table>
<tr>
<td><input type="radio" size="50" name="userKind" id="userKind1" value="HOAcUser" onclick="active(this.value)"></input>HO Acounting User</td>
<td><input type="radio" size="50" name="userKind" id="userKind2" value="BRAcUser" onclick="active(this.value)"></input>Branch Acounting User</td>
</tr>
<tr>
<td><input type="radio" size="50" name="userKind" id="userKind3" value="ITUser" onclick="active(this.value)"></input>IT User</td>
<td><input type="radio" size="50" name="userKind" id="userKind4" value="RepoDispOnly" onclick="active(this.value)"> </input>Report display only User</td>
</tr>
</table>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Optional menu</td>
<td align="left" colspan="3">
<table>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" ></input> Payment Proposal</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr"></input> Payment Approval</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch"></input> Open/Close Schedule</td>
</tr>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq"></input> Void Cheque</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" ></input> Issue Cheque</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo"></input> Tax Report</td>
</tr>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa"></input> Exchange Rate Maintainance</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc"></input> Offset Account</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" ></input> Addfree master Maintainance</td>
</tr>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch"></input> Payment operation of branch</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput"></input> Batch Input</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS"></input> SEPA.BACS data Download</td>
</tr>
</table>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="nexasRem" rows="3" cols="26" id="idnexasRem" maxlength="199"></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="nexRem" rows="3" cols="26" id="nexRem" maxlength="199"></textarea></td>
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

<div id="gs_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="7" style="width:15%"><font size="3"><b>GS-NET</b></font></td>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>User Code :</td>
<td style="text-align:left;"><input type="text" name="gsnetCode" id="gsnetCode" maxlength="44" size="20"/></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Password :</td>
<td style="text-align:left;"><input type="text" name="gsnetPass" id="gsnetPass" maxlength="44" size="20"/></td>
</tr>
<tr>    
<td align="right" style="width:20%" colspan="1"><font color=red>*</font>Requested GSNET Branch Code:	</td>
<td align="left" colspan="3">
<table>
<%
Connection con1 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
//int sumcount=0;
Statement st=null;
ResultSet rs=null; 
try
{
// id="idBranch"
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from gsnetbranchcodemaster ORDER BY branchcode Asc";
st = con1.createStatement();
rs = st.executeQuery(query);
int i=1;
count=0;
column=0;
ArrayList<String> gsnetBranchCodes = new ArrayList<String>();
//gsnetBranchCodes.clear();
%>							
<%while(rs.next()){
	gsnetBranchCodes.add(rs.getString(2));
/*if(i!=4)
{%>
<input type='checkbox' name='gsnetBrCode[]' id="idgsnetBrCode<%=rs.getString(2)%>" value="<%=rs.getString(2)%>"/><%=rs.getString(2)%>
<%i++;}
else
{%><br />
<%i=1;
}*/
}
for(int row=0;row<gsnetBranchCodes.size();row+=3)
{
%>
<tr>
<%
for(column=0;column<3;column++){
if(row+column<gsnetBranchCodes.size())
{ 
String temp = gsnetBranchCodes.get(row+column);
%>
<td bgcolor="lightgrey">
<input type="checkbox" name="gsnetBrCode[]" id="idgsnetBrCode<%=gsnetBranchCodes.get(row+column)%>" value="<%=gsnetBranchCodes.get(row+column)%>" /><span style="font-size: 11px;"><%=gsnetBranchCodes.get(row+column)%></span></td>
<%
}
}
%>
</tr>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
//	DbUtil.closeDBResources(rs,st,con);
con1.close();
}%>
</table>
</td>
</tr>

<tr>     
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Requested Division Name:	</td>
<td align="left" colspan="3">
<%       
//Statement st1=null;
//ResultSet rs1=null; 
try
{
// id="idBranch"
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from gsntdivisionmaster ORDER BY divName Asc";
st1 = con1.createStatement();
rs1 = st1.executeQuery(query);
%>
<%while(rs1.next()){%>
<input type='checkbox' id='idgsnetDiv<%=rs1.getString(2)%>' name='gsnetDiv[]' value="<%=rs1.getString(2)%>"/><%=rs1.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
//	DbUtil.closeDBResources(rs,st,con);
con1.close();
}%>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Requested Primary Division:	</td>
<td align="left" colspan="3">
<%
try
{
// id="idBranch"
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from gsnetprimarydivmaster ORDER BY divName Asc";
st2 = con1.createStatement();
rs2 = st2.executeQuery(query);
%>
<%while(rs2.next()){%>
<input type='checkbox' id='idgsnetPdiv<%=rs2.getString(2)%>' name='gsnetPdiv[]' value="<%=rs2.getString(2)%>"/><%=rs2.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
con1.close();
}%>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Requested User Role  :</td>
<td align="left" colspan="3"><input type='checkbox' id='role0' name='role[]' value="USER"/>USER <input type='checkbox' id='role1' name='role[]' value="MANAGER "/>MANAGER </td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>Requester Remarks  :</td>
<td align="left"><textarea name="gsNetremarks" rows="3" cols="26" id="idgsNetremarks" maxlength="199" title="Remarks 200 characters"></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>IT Remarks  :</td>
<td align="left"><textarea name="gsnetRem" rows="3" cols="26" id="gsnetRem" maxlength="199" title="Remarks 200 characters"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="inter_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>Internal Application</b></font></td>
<td align="right" colspan="1" style="width:20%"><font color="red">*</font>Internal Application :</td>
<td align="left" colspan="3">
<div class="multiselect">
<div class="selectBox" onclick="showCheckboxes()" >
<select style="width:30%;" id="idSelSoftware">
<option value="">Select</option>
</select>
<input type="text" name="Software" size=50 id="Software" readonly/>
<div class="overSelect"></div>
</div>
<div id="checkboxes"  onclick="showCheckboxes()">
<%while(rsINT.next()){%> 
<label for="<%=rsINT.getString("app_name")%>" style="width:55%; text-align: left;">
<input type="checkbox" name="approverslist" onclick="sync(this),showCheckboxes()" id="idapproverslist<%=rsINT.getString("app_name")%>" class="group1" value="<%=rsINT.getString("app_name")%>" /><%=rsINT.getString("app_name")%></label>
<%}%>
</div>
</div>
</td>
</tr>
<tr>
<td style="text-align:right; width: 20%;"><font color=red>*</font>User ID :</td>
<td style="text-align:left;"><input type="text" name="intUSERID" id="intUSERID" maxlength="44" size="20"/></td>
<td style="text-align:right; width: 20%;"><font color=red>*</font>Password :</td>
<td style="text-align:left;"><input type="text" name="intPass" id="intPass" maxlength="44" size="20"/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="internalRem" rows="3" cols="26" id="idinternalRem" maxlength="199"></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="intRem" rows="3" cols="26" id="intRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="usb_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>USB Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>Access For :</td>
<td style="text-align: left;">
<select name="accessFor" id="idaccessFor" style="width:60%;" onchange="callFun(this.value);">
<option value="">Select</option>
<option value="PenDrive">PenDrive</option>
<option value="DSC_CHA">DSC-CHA</option>
<option value="DSC_OTHER">DSC-OTHER</option>
</select>
</td>
<td style="text-align:right; width: 20%;" colspan="1"><font color=red>*</font>USB Details:</td>
<td style="text-align: left;"><input type="text" size="20" name="dscNo" value="" id="dscNo" maxlength="44" />	</td>		
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="usbRem" rows="3" cols="26" id="idUSBRem" maxlength="199"></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="usbAppRem" rows="3" cols="26" id="usbAppRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="vpn_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>VPN Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>Domain ID :</td>
<td style="text-align: left;"><input type="text" name="domID" id="idDOMid" size="20" maxlength="44" value=""/></td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Email ID :</td>
<td align="left"><input type="text" name="vpnEmail" id="idvpnEmail" size="20" maxlength="44" value=""/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>MPLS / NON MPLS :</td>
<td align="left">
<select name="mlps" id="idMlps" style="width:60%;">
<option value="">Select</option>
<option value="MPLS">MPLS</option>
<option value="NON MPLS">NON MPLS</option>
</select>
</td>
<td style="text-align:right; width: 20%;" colspan="1"><font color="red">*</font>Forti Token Details :</td>
<td align="left"><input type="text" name="vpnForti" id="vpnForti" size="20" maxlength="44" value=""/></td>
</tr>
</table>
<br />
</div>

<div id="hard_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>HardDisk / PenDrive</b></font></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="hardRemarks" rows="3" cols="26" id="hardRemarks" maxlength="199"></textarea></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="hardDiscRem" rows="3" cols="26" id="hardDiscRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="asset_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Any Other Asset</b></font></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="assetRemarks" rows="3" cols="26" id="assetRemarks" maxlength="199"></textarea></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="anyOtherRem" rows="3" cols="26" id="anyOtherRem" maxlength="199"></textarea></td>
</tr>
</table>
<br />
</div>

<div id="glow_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>NEx-GLOW</b></font></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>Project :</td>
<td align="left"><input type="text" name="project" id="project" size="20" ></td>
<td align="right" style="width: 20%;"><font color="red">*</font>Ware-House :</td>
<td align="left"><input type="text" name="warehouse" id="warehouse" size="20" ></td>
</tr>
<tr>
<td align="right" colspan="1"><font color="red">*</font>User ID :</td>
<td align="left"><input type="text" name="glowID" id="glowID" size="20" ></td>
<td align="right" colspan="1"><font color="red">*</font>Password :</td>
<td align="left"><input type="text" name="glowPass" id="glowPass" size="20" ></td>
</tr>
<tr>
<td align="right" colspan="1"><font color="red">*</font>Requester Remarks :</td>
<td align="left"><textarea name="glowRemarks" rows="3" cols="26" id="glowRemarks" maxlength="199" ></textarea></td>
<td align="right" colspan="1"><font color="red">*</font>IT Remarks :</td>
<td align="left"><textarea name="glowAppRemarks" rows="3" cols="26" id="glowAppRemarks" maxlength="199" ></textarea></td>
</tr>
</table>
<br />
</div>

<table id="it" width="895">
<tr><td id="ita"><font color=red>*</font>Remarks/Reason</td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199"></textarea></td></tr>
</table>
</br>
</center>                                                                   
</td>
</tr>
</table> 

<table style="margin-left: auto;margin-right: auto;" ><tr>
<td style="size:1"><div id="formsubmitbutton"><input style="size:1;font-size: 1.1em;" type="submit" value="UPDATE" name="save1" id="save1" onclick="return (validate() && ButtonClicked())"/></div>
<div id="buttonreplacement" style="display:none;"><img src="http://www.willmaster.com/images/preload.gif" alt="loading..." /></div></td>
<!-- <td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td> -->
<td><input type="button" id="btnShowSimple" style="size:1;font-size: 1.1em;" value="HELP" /></td>
<td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='NEINFormUpdateFilterCont.jsp?msg=1'"/></td>
</tr>
</table>

<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
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
</table><br/>
<label style="text-align:center;">HR/Admin (Local)</label>
<br/>
<label style="font-size: 30px;">&#x21d3;</label>
<br/>
<label>IT (Local)</label>
<br/>
<label style="font-size: 30px;">&#x21d3;</label>
<br/>
<label>GA(Branch)</label>
<br/>
<label style="font-size: 30px;">&#x21d3;</label>
<br/>
<label>BM/GM</label>
<br/>
<label style="font-size: 30px;">&#x21d3;</label>
<br/> 
<label>IT(HO)</label>
<br/>
<br/>
<br/>
</div>
</form>	
<div id="resultFromAjax3" style="display:none;"></div>
<div id="resultFromAjaxdeptAdmin" style="display:none;"></div>
<div id="resultFromAjax21" style="display:none;"></div>
<div id="resultFromAjax2" style="display:none;"></div>
<div id="resultFromAjax22" style="display:none;"></div>
</body>
</html>