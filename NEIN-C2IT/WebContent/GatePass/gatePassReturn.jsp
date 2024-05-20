<%@ page import="java.util.ResourceBundle"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body background =".jpg" >
<head><title>GatePassReturn</title>
<script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
</head>
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
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 80%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body 
    {
    padding: 2px 16px;
    background-color: #D5F5E3  ;
    }
.modal-content {
    position: relative;
    background-color: #D5F5E3  ;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 90%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header {
     padding: 2px 16px;
     background-color: #D5F5E3  ;
     color: black;
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
 <style>
.dynatable1 {
	border: solid 1px #000; 
    border-collapse: collapse;
	}
.dynatable1 td {
	border: solid 1px #000; 
	padding: 2px 10px;
	width: 100px;
	text-align: left;
	}
.dynatable1 .prototype {
	display:none;
	}
</style>
</head>
<script type="text/javascript">
$(document).ready(function () 
    {
	$("#iddate_time").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy ' }).val();  
	$("#idexpDateReturn").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val();  
	
    });

</script>



<%int p =0;%>
 <script>
 		var id =0;
		$(document).ready(function() {
			// Add button functionality
			//alert("ID :"+id);  descOfItem,iddescOfItem,assetNo,idassetNo,qty,idqty,remarks,idremarks
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID 1:"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(id);
				prot.find(".descOfItem").attr("id","iddescOfItem"+id);
				prot.find(".assetNo").attr("id","idassetNo"+id);
				prot.find(".qty").attr("id","idqty"+id);
				prot.find(".remarks").attr("id","idremarks"+id);
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {//alert(id);
				$(this).parents("tr").remove();
				id--;
				
			});
		});
	</script>
	
	<script type="text/javascript">  
function sendInfo(v)  
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
	        var url="getEmployee1.jsp";  
		    url +="?EMP_NO=" +v;
		    xmlHttp.onreadystatechange = getInfo;  
		    xmlHttp.open("GET", url, true);   
		    xmlHttp.send(null);    
        }  
function getInfo()
        { 
	          var str2=xmlHttp.responseText;;
	          if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                             { 
                             //alert("here");
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idITPName").value =  document.getElementById("p1").value;
                             document.getElementById("idITPDesg").value =  document.getElementById("p2").value;
                      		 //document.getElementById("idempBranch").value =  document.getElementById("p3").value;idITPName,idITPDesg
                             }
                         else
                        	 {
                        	 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idITPName").value = "";
                             document.getElementById("idITPDesg").value =""; 
                  		     }
             } 
</script>
	
	
	
	
	
<script>

function Validation()
    {
	var  p;
	//alert("Please entere po no..");
	// idRETURNABLE_NON,idtakeby,iddesg,iddate_time,idtrnsfrom,idtrnsto,idITPName,idScPName,idexpDateReturn,idvname,idpurpos,iditnonit
	var returnnon=document.getElementById("idRETURNABLE_NON").value;
	var itnonit=document.getElementById("iditnonit").value;
	var takenby=document.getElementById("idtakeby").value;
	var desg=document.getElementById("iddesg").value;
	var datetime=document.getElementById("iddate_time").value;
	var transfrom=document.getElementById("idtrnsfrom").value;
	var transto=document.getElementById("idtrnsto").value;
	var itpecode=document.getElementById("idITPECode").value;
	var itpname=document.getElementById("idITPName").value;
	var itpname=document.getElementById("idITPDesg").value;
	var secname=document.getElementById("idScPName").value;
	var expdatereturn=document.getElementById("idexpDateReturn").value;
	var vname=document.getElementById("idvname").value;
	var purpose=document.getElementById("idpurpos").value;
	var purpose1=document.getElementById("idpurposNON").value;
	var hr=document.getElementById("idhour").value;
	var mm=document.getElementById("idminutes").value;
	var addr=document.getElementById("idbranch").value;
	var loc=document.getElementById("idbrContact").value;
	
	var remarksAp=document.getElementById("idremarksAp").value;
	//alert("branchGA :"+branchGA);
	//alert("remarksAp :"+remarksAp);
	//branchGA,idbranchGA,remarksAp,idremarksAp
	//idbranch,idbrContact
	//idhour,idminutes
	//alert(invdate);
	if(itnonit==null || itnonit=="")
    {
     alert("Please chose IT/NONIT ..");
     iditnonit.focus();
     return false;
     } 
	else if(datetime==null || datetime=="")
    {
     alert("Please chose the date ..");
     iddate_time.focus();
     return false;
     } 
	 else if(hr==null || hr=="")
	    {
	     alert("Please select hours..");
	     idhour.focus();
	     return false;
	     } 
	 else if(mm==null || mm=="")
	    {
	     alert("Please select minuts..");
	     idminutes.focus();
	     return false;
	     } 
	 else if(vname==null || vname=="")
    {
     alert("Please enter vendor name..");
     idvname.focus();
     return false;
     } 
	 else if(takenby==null || takenby=="")
	    {
	    alert("Please Enter Taken By Name..");
	    idtakeby.focus();
        return false;
	    }
	else if(desg==null || desg=="")
        {
         alert("Please enter desg..");
         iddesg.focus();
         return false;
         } 
	
	else if(transfrom==null || transfrom=="")
    {
     alert("Please enter transfer from..");
     idtrnsfrom.focus();
     return false;
     } 
	else if(transto==null || transto=="")
    {
     alert("Please enter transfer to..");
     idtrnsto.focus();
     return false;
     } 
	else if(itpecode==null || itpecode=="")
    {
     alert("Please enter Emp Code..");
     idITPECode.focus();
     return false;
     } 
	else if(itpname==null || itpname=="")
    {
     alert("Emp id dose not exist in HRMS Apps..");
     idITPName.focus();
     return false;
     } 
	else if(secname==null || secname=="")
    {
     alert("Please enter security name..");
     idScPName.focus();
     return false;
     }
	else if(returnnon=="RETURNABLE" && expdatereturn=="")
    {
     alert("Please enter exected return date..");
     idexpDateReturn.focus();
     return false;
     } 
	
	else if(returnnon=="RETURNABLE" && purpose=="")
    {
     alert("Please enter purpose....");
     idpurpos.focus();
     return false;
     }
	else if(returnnon=="NON_RETURNABLE" && purpose1=="")
    {
     alert("Please enter reason for Non-Returnable...");
     idpurposNON.focus();
     return false;
     } 
	else if( addr=="")
    {
     alert("Please select branch ....");
     idbranch.focus();
     return false;
     }
	else if(loc=="")
    {
     alert("Please enter contact no of branch...");
    idbrContact.focus();
     return false;
     } 
	else if(id==0)
	     {
	     alert("Please enter Asset details..");
	     return false;
	     } 
	else 
		 {
	     //alert(id);descOfItem,iddescOfItem,assetNo,idassetNo,qty,idqty,remarks,idremarks
	     for(p = 1; p <=id; p++)
	       {
		   var descOfItem = 'iddescOfItem'+p.toString();
		   var assetNo = 'idassetNo'+p.toString();
		   var qty= 'idqty'+p.toString();
		   var remarks= 'idremarks'+p.toString();
		   var descOfItem1 = document.getElementById(descOfItem).value;
		   //alert("level no :"+qty);
		   var assetNo1=document.getElementById(assetNo).value;
		   //alert("empid1 :"+empid1);
		   var qty1=document.getElementById(qty).value;
		   //alert("allopt1 :"+qty1);
		   var remarks1=document.getElementById(remarks).value;
		   //alert("allopt1 :"+allopt1.checked);
		   //alert("allop1:"+allop1);
		   
		   if(descOfItem1=="")
		    	 {
		    	 alert("Please enter asset desc...");
		    	 return false;
		    	 }
	       else if(assetNo1=="")
  	             {
  	             alert("Please enter asset no...");
  	             return false;
  	             }
	       else if (qty1 == "")
	             {
		         alert("Please enter quantity...");
		         return false;
		         }
	       else if(remarks1== "")
                {
	            alert("Please enter Item remarks...");
	            return false;
	            }
	        }
	    
		 } //alert("here");
	   var cityno=document.getElementById("cityno").value;
	   //alert(cityno);
       if(cityno!="90")
	       {
    	   var branchGA=document.getElementById("idbranchGA").value;
    	   if(branchGA=="")
	           {
	           alert("Branch GA not inserted in master please contact to IT...");
	           idbranchGA.focus();
	           return false;
	           } 
	       }
       else
		   {  
    		var branchGA11=document.getElementById("idbranchGA11").value;
    	    if(branchGA11=="")
                {
                alert("HO IT/Admin not inserted in master please contact to IT...");
                idbranchGA11.focus();
                return false;
                } 
		   }
	 if(remarksAp=="")
	    {
	    alert("Please enter Remarks..");
	    idremarksAp.focus();
	    return false;
	    }  
     else
		return true;
 }
</script>  
<script>//getHOAdmin
function fetchHOadmin(v) 
     {
	 //alert(v);
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
	        var url="getHOAdmin.jsp";  
		    url +="?itnonit=" +v;
		    xmlHttp.onreadystatechange = getHOAdmin;  
		    xmlHttp.open("GET", url, true);   
		    xmlHttp.send(null);    
     }  
function getHOAdmin()
     { 
	          var str21=xmlHttp.responseText;;
	          if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                          { 
                          //alert("here");//idgaempid1,idganame1,idgadesg1,idgamail1,idbranchGA1
                          document.getElementById("resultFromAjax3").innerHTML = str21;
                          document.getElementById("idgaempid1").value =  document.getElementById("q1").value;
                          document.getElementById("idganame1").value =  document.getElementById("q2").value;
                          document.getElementById("idgadesg1").value =  document.getElementById("q3").value;
                          document.getElementById("idgamail1").value =  document.getElementById("q4").value;
                          document.getElementById("idbranchGA11").value =  document.getElementById("q5").value;
                          document.getElementById("idbranchGA1").value =  document.getElementById("q5").value;
                   	     }
                      else
                     	 {
                     	 document.getElementById("resultFromAjax3").innerHTML = str21;
                          document.getElementById("idgaempid1").value = "";
                          document.getElementById("idganame1").value =""; 
                          document.getElementById("idgadesg1").value = "";
                          document.getElementById("idgamail1").value =""; 
                          document.getElementById("idbranchGA11").value =""; 
                          document.getElementById("idbranchGA1").value =""; 
               		     }
          } 



function isNumber(evt) 
{
evt = (evt) ? evt : window.event;
var charCode = (evt.which) ? evt.which : evt.keyCode;
if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    return false;
      }
return true;
}
function show_hide_row(val)
       {
	   //alert(val);//idapprovaRow
	   if(val=="RETURNABLE")
		   {
		   document.getElementById("idexpDateReturn").value = "";
		   document.getElementById("idepd").style.display = '';
		   document.getElementById("idepd1").style.display = '';
     	   document.getElementById("idnon").style.display = 'none';
		   document.getElementById("idpur").style.display = '';
		   var purpose=document.getElementById("idpurpos").value="";
		   var purpose1=document.getElementById("idpurposNON").value="";
		   
		   /* document.getElementById("idapprovaRow").style.display = '';
		   document.getElementById("idapprovaRow").style.display = ''; */
		   
		   }
	   else
		   {
		   document.getElementById("idexpDateReturn").value = "";
		   document.getElementById("idnon").style.display = '';
		   document.getElementById("idpur").style.display = 'none';
		   document.getElementById("idepd").style.display = 'none';
		   document.getElementById("idepd1").style.display = 'none';
		   var purpose=document.getElementById("idpurpos").value="";
		   var purpose1=document.getElementById("idpurposNON").value="";
		   
		   /* document.getElementById("idapprovaRow").style.display = 'none';
		   document.getElementById("idapprovaRow").style.display = 'none'; */
		   }
       }
  function clearfield()
       {
       //alert(val);idbranch,idbrContact
       document.getElementById("idRETURNABLE_NON").selectedIndex=0;
       document.getElementById("iditnonit").selectedIndex=0;
       document.getElementById("idtakeby").value="";
       document.getElementById("iddesg").value="";
	   document.getElementById("iddate_time").value="";
	   document.getElementById("idtrnsfrom").value="";
	   document.getElementById("idtrnsto").value="";
	   document.getElementById("idITPECode").value="";
	   document.getElementById("idITPName").value="";
	   document.getElementById("idITPDesg").value="";
	   document.getElementById("idScPName").value="";
	   document.getElementById("idexpDateReturn").value="";
	   document.getElementById("idvname").value="";
	   document.getElementById("idpurpos").value="";
	   document.getElementById("idpurposNON").value="";
       
       document.getElementById("idexpDateReturn").value = "";
	   document.getElementById("idepd").style.display = '';
	   document.getElementById("idepd1").style.display = '';
	   document.getElementById("idnon").style.display = 'none';
	   document.getElementById("idpur").style.display = '';
	   document.getElementById("idbranch").selectedIndex=0;
	   document.getElementById("idbrContact").value = '';
       }

</script>
<body onload="clearfield();"> 
<div id="wrapper">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
       
    </tr>
   <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">GATE PASS  FORM</font></strong></td>
</tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>


<br />
<br />
<form name="form" method="post" action="gatePassReturnBack.jsp">
<div class="modal-content">
<div class="modal-header">
      <center> <h2>GATE PASS FORM</h2></center>
    </div>
    <div class="modal-body">
<CENTER>


<%
String city = (String) session.getAttribute("city");
String b_no = (String) session.getAttribute("b_no");
System.out.println("City Name :"+city);
System.out.println("Branch Number :"+b_no);
String addr=null,loc=null;
Connection conn=null,conn1=null;
Statement st=null,st1=null,st11=null; 
ResultSet rs=null,rs1=null,rs11=null;



%>
<input type="hidden" name="city" value="<%=city%>" />
<input type="hidden" name="cityno" id="cityno" value="<%=b_no%>" />
<table class="dynatable1" width="85%" border="2" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
          <tr>
                  <td ><font size="2" face="Swiss" id="hiderow">Returnable/NonReturnable<font color=red>*</font></font> 
                           <select name="RETURNABLE_NON"  id="idRETURNABLE_NON" onchange="return show_hide_row(this.value);" style="width: 125px">
        					   <option value="RETURNABLE">RETURNABLE</option>
                               <option value="NON_RETURNABLE">NON-RETURNABLE</option>
                          </select>	
                          
				  </td>
				  <%if(!b_no.equals("90")) {%>
				  <td>
				      <font size="2" face="Swiss" id="hiderow">IT/NONIT<font color=red>*</font></font>
				       <select name="itnonit"  id="iditnonit"  style="width: 60px">
        					   <option value="">Select</option>
        					   <option value="IT">IT</option>
                               <option value="NONIT">NONIT</option>
                          </select>	
				  </td>
				  <%}else{ %>
				  <td>
				      <font size="2" face="Swiss" id="hiderow">IT/NONIT<font color=red>*</font></font>
				       <select name="itnonit"  id="iditnonit"  style="width: 60px" onchange="fetchHOadmin(this.value)">
        					   <option value="">Select</option>
        					   <option value="IT">IT</option>
                               <option value="NONIT">NONIT</option>
                          </select>	
				  </td>
				  
				  <%} %>
				  <td ><font size="2" face="Swiss" id="hiderow">Date:<font color=red>*</font></font>
				  <input type="text" name="date_time" maxlength="99" id="iddate_time" class="date_time" value="" size=10 /></td>
				  <td ><font size="2" face="Swiss" id="hiderow">Time:<font color=red>*</font></font>
				          <select name="hour"  id="idhour"  style="width: 50px" >
        					   <option value="">HR</option>
        				
        					  <%int i=1;String i1="";
        					   while(i<=12)
        					      {
        					      if(i<10)
        					          {
        					    	  i1="0"+i;
        					          %>
        						      <option value="<%=i1%>"><%=i1%></option>
        						     <%i++;
        					          }
        					      else
        					         {%>
        					    	  <option value="<%=i%>"><%=i%></option> 
        					         <%i++;}
        					      }
        					  %>
        					   
                          </select>
                          <select name="minutes"  id="idminutes"  style="width: 50px">
        					   <option value="">MM</option>
        					   <option value="00">00</option>
        					  <%int j=1;String j1="";;
        					   while(j<60)
        					   {
         					      if(j<10)
         					          {
         					    	  j1="0"+j;
         					          %>
         						      <option value="<%=j1%>"><%=j1%></option>
         						     <%j++;
         					          }
         					      else
         					         {%>
         					    	  <option value="<%=j%>"><%=j%></option> 
         					         <%j++;}
         					      }
        					  %>
                           </select>
                           <select name="ampm"  id="idampm"  style="width: 50px">
        					   <option value="AM">AM</option>
        					   <option value="PM">PM</option>
        	               </select>		
                </td>
          </tr>
          </table>
          <br>
          <table class="dynatable1" width="85%" border="2" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
           <tr>
                <td><font size="2" face="Swiss" id="hiderow">Vendor Name :<font color=red>*</font></font></td> 
				<td colspan=5><input type="text" name="vname" maxlength="99" id="idvname" class="lno" value="" size=80 /></td>
		  </tr>  
          <tr>
                  <td><font size="2" face="Swiss" id="hiderow">Taken By Name<font color=red>*</font></font></td> 
                  <td colspan=2><input type="text" name="takeby" maxlength="99" id="idtakeby" class="lno" value="" size=25 /></td>
                  <td><font size="2" face="Swiss" id="hiderow">Designation<font color=red>*</font></font></td> 
				  <td colspan=2><input type="text" name="desg" maxlength="99" id="iddesg" class="lno" value="" size=25 /></td>
		          
                    
          </tr>
          <tr>
                <td><font size="2" face="Swiss" id="hiderow">Transport From<font color=red>*</font></font></td> 
				<td colspan=2><input type="text" name="trnsfrom" maxlength="99" id="idtrnsfrom" class="lno" value="" size=25 /></td>
				<td><font size="2" face="Swiss" id="hiderow">Transport To<font color=red>*</font></font></td> 
				<td colspan=2><input type="text" name="transto" maxlength="99" id="idtrnsto" class="lno" value="" size=25 /></td>
          </tr>
          </table>
          <br>
          <table class="dynatable1" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
           <tr>
                <td><font size="2" face="Swiss" id="hiderow">Emp Code :<font color=red>*</font></font></td> 
				<td ><input type="text" name="ITPECode" maxlength="99" id="idITPECode" class="ITPECode" value="" size=25 onkeypress="return isNumber(event)" onkeyup="return sendInfo(this.value);"/></td>
     			<td><font size="2" face="Swiss" id="hiderow">Name :<font color=red>*</font></font></td> 
				<td ><input type="text" name="ITPName" maxlength="99" id="idITPName" class="ITPName" value="" size=25 readonly/></td>
				<td><font size="2" face="Swiss" id="hiderow">Designation :<font color=red>*</font></font></td> 
				<td ><input type="text" name="ITPDesg" maxlength="99" id="idITPDesg" class="ITPName" value="" size=25 readonly/></td>
		  </tr>
           
           <tr>
                <td><font size="2" face="Swiss" id="hiderow">Security Name<font color=red>*</font></font></td> 
				<td colspan=2><input type="text" name="ScPName" maxlength="99" id="idScPName" class="ScPName" value="" size=25 /></td>
				<td colspan=1 id="idepd"><font size="2" face="Swiss" id="hiderow">Expected Date Of Return<font color=red>*</font></font></td> 
				<td colspan=2 id="idepd1"><input type="text" name="expDateReturn" maxlength="99" id="idexpDateReturn" class="expDateReturn" value="" size=25 /></td>
           </tr>
           <tr id="idpur">
                <td ><font size="2" face="Swiss" id="hiderow">Purpose :<font color=red>*</font></font></td> 
				<td colspan=5><input type="text" name="purpos" maxlength="99" id="idpurpos" class="lno" value="" size=100 /></td>
           </tr>
            <tr id="idnon">
                <td ><font size="2" face="Swiss" id="hiderow">Reason for NON-RETURNABLE :<font color=red>*</font></font></p></td> 
				<td colspan=5><input type="text" name="purposNON" maxlength="99" id="idpurposNON" class="purposNON" value="" size=100 /></td>
           </tr>
            <tr>
                <td ><font size="2" face="Swiss" id="hiderow">GatePass Branch :<font color=red>*</font></font></p></td> 
		  	    <td colspan=2>
                       <select name="branch"  id="idbranch"  style="width: 100px">
                       <option value="">Select</option>
                            <%
                            ResourceBundle dbProperties = ResourceBundle.getBundle("nepldb");
                        	String userName = dbProperties.getString("nepldb.username");
                        	String password = dbProperties.getString("nepldb.password");
                        	String url = dbProperties.getString("nepldb.url");
                        	String driver = dbProperties.getString("nepldb.driverName");
                        	String dbName = dbProperties.getString("nepldb.dbName");
                            
                            
                            
                            
                            
                            try{
                            	Class.forName(driver).newInstance();
                                conn = DriverManager.getConnection(url+dbName,userName,password); 
                               String query = "select * from billto order by bto_location asc";
                            	st = conn.createStatement();
                            	rs = st.executeQuery(query);
                            while(rs.next())
                                  {addr=rs.getString(3);loc=rs.getString(4);
                                  %>
        					      <option value="<%=loc%>"><%=loc%></option>
        					      <%}
        					       }catch(Exception ex)
	                                    {
		    	                        ex.printStackTrace();
		 	                       }%>
        	           </select>				
			    <td><font size="2" face="Swiss" id="hiderow">Branch ContactNo :<font color=red>*</font></font></p></td> 
				<td colspan=2>+91-<input type="text" name="brContact" maxlength="99" id="idbrContact"  value="" size=20 /></td>
           </tr>
           </table>
           <br>
         
     <table class="dynatable"  width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3    >
	        <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button' onclick="checkit_nonit()">+</button></td>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>Sl.No</font></td>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>Desc. Of Items<font color=red>*</font></font></td>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>AssetNo<font color=red>*</font></font></td>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>Quantity</font></td>
		    <td><font size="3" face="Swiss" id="hiderow" color=blue>Remarks<font color=red>*</font></font></td> 
		   </tr>
		   <tr class="prototype">
		           <td  align="center" height="21"><button class="remove" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td ><textarea value="" name="descOfItem" id="iddescOfItem" class="descOfItem" rows="4" cols="40"></textarea></td>
		           <td><input type="text" value=""  name="assetNo" maxlength="99" id="idassetNo" class="assetNo"  size=20 /></td>
		           <td><input type="text" value=""  name="qty" maxlength="99" id="idqty" class="qty" value="" size=5 /></td>
		           <td><input type="text" value=""  name="remarks" maxlength="99" id="idremarks" class="remarks"  size=40 /></td>
	       </tr>
	       
   </table>
  
      <br>
      <table class="dynatable1" id="idapprovaRow" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
               <%
               //System.out.println("b_no :"+b_no);
               if(!b_no.equals("90")) {%>
                <tr>
                <td colspan=2>Send to Branch GA :
		  	                <%String name="",desg="",mail="",sendmail="",gaempid="";
		  	                try{
		  	                	ResourceBundle dbProperties1 = ResourceBundle.getBundle("csdb");
		  	          	        String userName1 = dbProperties1.getString("csdb.username");
		  	      	            String password1 = dbProperties1.getString("csdb.password");
		  	      	            String url1 = dbProperties1.getString("csdb.url");
		  	      	            String driver1 = dbProperties1.getString("csdb.driverName");
		  	      	            String dbName1 = dbProperties1.getString("csdb.dbName");
		  	      	            Class.forName(driver1).newInstance();
                                conn1 = DriverManager.getConnection(url1+dbName1,userName1,password1); 
		  	                	
		  	                	
		  	                	
		  	                	String query1 = "select * from formapproval where formtype='GATEPASS' and levelno='1' and branch='"+b_no+"'";
                            	st1 = conn1.createStatement();
                            	rs1 = st1.executeQuery(query1);
                            if(rs1.next())
                                  {
                            	  gaempid=rs1.getString(5);
                            	  name=rs1.getString(6);
                            	  desg=rs1.getString(8);
                            	  mail=rs1.getString(10);
                            	  sendmail=name+"("+desg+")-"+mail;
                                  }
        					       }catch(Exception ex)
	                                    {
		    	                        ex.printStackTrace();
		 	                       }
		 	                      // if(sendmail.equals(""))sendmail="No BranchGA Added in Master, please contact to IT.";
		 	                       %>
		 	           <input type="hidden" name="gaempid" id="idgaempid" value="<%=gaempid%>">
		 	           <input type="hidden" name="ganame" id="idganame" value="<%=name%>">
		 	           <input type="hidden" name="gadesg" id="idgadesg" value="<%=desg%>">
		 	           <input type="hidden" name="gamail" id="idgamail" value="<%=mail%>">            
        	          <input type="hidden" name="branchGA" id="idbranchGA" value="<%=sendmail%>"><font size="3" face="Swiss" id="hiderow" color=blue> <%=sendmail%></font><br>
        	    </td>        
        	   </tr>
        	   <%}else{ %>
        	   <tr>
                <td colspan=2>Send to Branch HO IT/ADMIN :
		  	           <input type="hidden" name="gaempid1" id="idgaempid1" value="">
		 	           <input type="hidden" name="ganame1" id="idganame1" value="">
		 	           <input type="hidden" name="gadesg1" id="idgadesg1" value="">
		 	           <input type="hidden" name="gamail1" id="idgamail1" value="">            
        	           <input type="hidden" name="branchGA1" id="idbranchGA11" value=""><font size="3" face="Swiss" id="hiderow" color=blue> <input type="text" size="80" name="branchGA1" id="idbranchGA1" value="" readonly></font><br>
        	    </td>        
        	   </tr>
        	   <%} %>
        	   <tr>
        	        <td>Remarks :</td>
        	        <td ><textarea name="remarksAp" id="idremarksAp"  rows="4" cols="40"></textarea></td>
        	   </tr>
           </table>
           <br>
  
  
  
</CENTER>	

	                          	 <br>
	                          	 <center>
	                          	  <!-- <a href="viewGatePass.jsp" onclick="return popitup('viewGatePass.jsp')">View Materials</a> -->
			                       <input style="font-size:1" type="submit" value="SAVE & SEND" name="save3" id="save1" onclick="return (Validation());"/>
	                               
		                          <input type="button" onclick="clearfield();" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br>
	</form>

	
	<br>
<br>
<br>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../adminHR.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>
<div id="resultFromAjax2" style="display:none;">
        
       </div>
<div id="resultFromAjax3" style="display:none;">
        
       </div>


</body>
</html>