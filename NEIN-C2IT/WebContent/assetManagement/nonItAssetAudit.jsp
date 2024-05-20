<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>

<script>
  $( function() {
    $( "#idauditDate" ).datepicker({ dateFormat: 'dd-mm-yy' });
    $( "#idPODate" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
</script>
 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>Asset Inventory</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#idInvDate" ).datepicker({ dateFormat: 'dd-mm-yy' });
    $( "#idPODate" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
</script>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
    {
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
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
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body 
    {
    padding: 2px 16px;
    background-color: #D3D3D3;
    }
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header {
     padding: 2px 16px;
     background-color: #D3D3D3;
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
</head>

<script type="text/javascript">

function syncCode(str,id)
{
	//idbarcode
	var   res = id.slice(9);
	//	alert(res+ " :: " + res +":: "+id);
	var setId="#idbarcodediv" + res;
	if(str == "No")
	{
		alert("Please Metion Remorks ");
		$(setId).show();
	}
	if(str  == "Yes")
		{
		  //	alert("no::");
			$(setId).hide();
		}
	
}

function syncCode1(str,id)
{
	//idbarcode
	var   res = id.slice (16);
	//	alert(res+ " :: " + res +":: "+id);
	var setId="#idbarcodereprintdiv" + res;
	if(str == "Yes")
	{
		alert("yes Metion remarks to  for bar codde reprint");
		$(setId).show();
	}
	if(str  == "No")
		{
			//alert("no::");
			$(setId).hide();
		}
	
}



function assetnofetch(str,val2){  
	
	alert(str+"  "+val2);
	var res = val2.slice(7);
	var idvalue;
//	alert("Actual value"+res);
	
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="auditassetavailable.jsp"; 
                    //alert (str);
                            url +="?AssetType=" +str +"&val="+res ;   
                            //alert(url);
                           xmlHttp.onreadystatechange = function getinfo222(){     
                          	 //alert("valuessssssss "+ res);
                         	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                         	//	alert(xmlHttp.responseText);
                         	//	idvalue="auditidano"+res;
                         	//	alert(" idvalue::"+idvalue);
                         	     document.getElementById("auditidano"+res).innerHTML=xmlHttp.responseText;    
                                
                               }
                         	
                        };  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                     
                     
                     
function assetnamefetch(str,val2){  
	
	alert(" asset name "+str+"  "+val2);
	var res = val2.slice(10);
	var idvalue;
//	alert("Actual value"+res);
	
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="auditassetavailablename.jsp"; 
                    //alert (str);
                            url +="?AssetType=" +str +"&val="+res ;   
                            //alert(url);
                           xmlHttp.onreadystatechange = function getinfo222(){     
                          	 //alert("valuessssssss "+ res);
                         	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
                         		idvalue="auditidaname"+res;
                         		document.getElementById(idvalue).innerHTML=xmlHttp.responseText;  
                         	    document.getElementById("auditidaname"+res).value=document.getElementById("configuration").value;    
                                
                               }
                         	
                        };  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                     
</script>




<%int p =0;%>

 <script>
 
		var id =0;
		$(document).ready(function() {
			// Add button functionality
			var idval1;
			var idval2;
			
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID :"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".name").attr("value",name);
				prot.find(".id").attr("value",id);
				prot.find(".auditastno1").attr("id","auditassetno"+id);
				//prot.find(".auditastno").attr("name","auditassetno"+id);
				prot.find(".auditAsType").attr("id","idaType"+id);
				prot.find(".auditastno").attr("id","auditidano"+id);
				prot.find(".asname").attr("id","auditidaname"+id);
				prot.find(".asaudo").attr("id","iddoaudit"+id);
				prot.find(".auditdone").attr("id","idauditdone"+id);
				prot.find(".rema").attr("id","idremarks"+id);
				prot.find(".bar").attr("id","idbarcode"+id);
				prot.find(".barcodereprint").attr("id","idbarcodereprint"+id);
				prot.find(".barcodediv").attr("id","idbarcodediv"+id);
				prot.find(".barcodereprintdiv").attr("id","idbarcodereprintdiv"+id);
				prot.find(".barcoderem").attr("id","idbarcoderemarks"+id);
				prot.find(".barcoderem1").attr("id","idbarcodereprintremarks"+id);
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

<script type="text/javascript"> // scriptfor sysdate // body onloade()
function myFunction()
    {
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	var date = new Date();
	//document.getElementById('datepicker-13').value =null;
	//document.getElementById('datepicker-131').value =null;
	var day = date.getDate();
	var month = date.getMonth();
	var year = date.getFullYear();
	for(var i=0;i<12;i++)
		{
		if (i==month)
			 {
			var mo=months[i];
		    break;
			 }
		}
	
	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;
	var today =day+"-"+mo+"-"+year;
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	document.getElementById('demo').value = today;
    document.getElementById("idabc5").focus();
	//document.getElementById("idempId").focus();
    document.getElementById("idabc5").value =null;
    document.getElementById("idabc9").value=null;
    document.getElementById("idInvDate").value =null;
    //document.getElementById("idabc6").value ="";
    document.getElementById("idabc7").value=null;
    document.getElementById("idabc8").value =null;
    
   }
</script>




<script type="text/javascript">  
/* function featchvendor(v)  
      { 
     // alert(v);
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
    	    var url="featchvendordetls.jsp";  
    	    url +="?vname=" +v;
    		xmlHttp.onreadystatechange = getInfo;  
    		xmlHttp.open("GET", url, true);   
    		xmlHttp.send(null);  
      }  
 function getInfo()
            {     
	        var str2=xmlHttp.responseText;
	        var matches=0;
            if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")//iddesg,iddept,idbranch,idcono
                    { 
                    // alert("here");//idname,iduid,idpass,idnmail
                    document.getElementById("resultFromAjax2").innerHTML = str2;
                    document.getElementById("idabc7").value =  document.getElementById("p1").value;
                    document.getElementById("idabc8").value =  document.getElementById("p2").value;
                    }
                else
         	        {
         	        document.getElementById("resultFromAjax2").innerHTML = str2;
         	       document.getElementById("idabc7").value =  "";
                   document.getElementById("idabc8").value = "";
                   
      		        }
             } 
 */
 /* function sendInfo1(v,first)  
 {  
   //alert(v);
  // alert(first);
   var n = first.length;
   var res = first.substring(8, n);
   // alert(res);
   var v1="testflag"+res;
   //alert(" vvviiiiiiiiiiiiiiiiV1 :"+document.getElementById(v1).value+" : "+v1);
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
 	document.getElementById(v1).value="0"; 
 	var url="assetNoDetails.jsp";  
 	    url +="?assetNoCheck=" +v;
 	    
 	    xmlHttp.onreadystatechange = function getInfo1()
 	   {     
 	       if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 	                      { 
 	         	             var str2=xmlHttp.responseText;
 	                    	 document.getElementById("resultFromAjax2").innerHTML = str2;
 	                    	 var flag=document.getElementById("p6").vlaue;
 	                     	 alert("Please select the different Asset NO and  Asset NO is already assigned  for Inventory "+document.getElementById("p1").value);
 	                     	 document.getElementById("idflag").value=document.getElementById("p6").value;
 	                     	// alert(v1);
 	                  		 document.getElementById(v1).value=document.getElementById("p6").value;
 	                      }
 	       } 
 	    xmlHttp.open("GET", url, true);   
 	    xmlHttp.send(null);    
   }  
  */
 </script>


<script type="text/javascript"> // script for validate field



function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	
	var invno=document.getElementById("idabc5").value;
	var invamt=document.getElementById("idabc9").value;
	var invdate=document.getElementById("idInvDate").value;
	var vnm=document.getElementById("idabc6").value;
	var vmob=document.getElementById("idabc7").value;
	var vadd=document.getElementById("idabc8").value;
	//alert(invdate);
	if(invno==null || invno=="")
	    {
	    alert("Please enter invoice no..");
	    idabc5.focus();
        return false;
	    }
	else if(invamt==null || invamt=="")
        {
         alert("Please enter invoice amount..");
         idabc9.focus();
         return false;
         } 
	else if(invdate==null || invdate=="")
        {
        alert("Please enter Invoice date..");
        idInvDate.focus();
        return false;
        }
    else if(vnm==null || vnm=="Select")
        {
        alert("Please enter vendor name..");
        idabc6.focus();
        return false;
        }
    else if(vmob==null || vmob=="")
        {
        alert("Please enter vendor mob no..");
        idabc7.focus();
        return false;
        }
    else if(vadd==null || vadd=="")
	    {
	    alert("Please enter vendor address..");
	    idabc8.focus();
        return false;
	    }
  if(id==0)
	   {
	   alert("Please enter item details..");
	   return false;
	   } 
	else
		{
	//alert(id);
	for(p = 1; p <=id; p++)
	       {
		   var aname = 'idasname'+p.toString();
		   var ano = 'auditidaname'+p.toString();
		   var assetflag='testflag'+p;
		   var x = 'idAsType'+p.toString();
		   var y = 'idBranch'+p.toString();
		   // var z = 'idsubBranch'+p.toString();
		    var a = 'idWar1'+p.toString();
		    var b = 'idWarExp1'+p.toString();
		    var c = 'idauditdone'+p.toString();
		    var aname1 = document.getElementById(aname).value;
		    var duplicate=document.getElementById(assetflag).value;
			if(duplicate=='1'){
				alert("Already Inventory done of given Asset No...");
	    		 return false;
			}
		    //alert(astType);
		    if(aname1=="")
		    	 {
		    	 alert("Please enter asset name...");
		    	 return false;
		    	 }
		    var ano1 = document.getElementById(ano).value;
		    if(ano1=="")
	    	 {
	    	 alert("Please enter a/c asset no...");
	    	 return false;
	    	 }
		    else{
				//alert("Upper");
				for(var v=p+1;v<=id;v++)
				{
					//alert("lower");
					 var nextAsset='auditidaname'+v;
					 var nextValue=document.getElementById(nextAsset).value;
					 if(nextValue == ano1 )
						 {
							 alert("Duplicate Asset No Entery...");
			    			 return false;
			    	 	 }
				}	
			}
		    var astType = document.getElementById(x).value;
		    if(astType=="Select")
		    	 {
		    	 alert("Please slect the Asset Type...");
		    	 return false;
		    	 }
		    var branch = document.getElementById(y).value;
			//alert(branch);
		    if(branch=="Select")
	    	 {
	    	 alert("Please slect the Baranch Name...");
	    	 return false;
	    	 }
			
			var war = document.getElementById(a).value;
		    //alert(war);
		    if(war=="Select")
	    	 {
	    	 alert("Please slect the Warranty...");
	    	 return false;
	    	 }
		    var warexpd = document.getElementById(b).value;
			//alert(warexpd);
			if(warexpd=="")
	    	 {
	    	 alert("Please slect the Warranty Expiry Date...");
	    	 return false;
	    	 }
			var rem = document.getElementById(c).value;
			//alert(rem);
			
	       }
		}
 }
</script>  


<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
           msg=null;
		}
</script>

<script>
function popitup1(url)
        {
		//newwindow=window.open(url,'name','fullscreen=yes,height=,width=,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
			newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
			if (window.focus) {newwindow.focus();}
			return false;
	    }
</script>


<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) {
   evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
      return true;
    }
</script>


<body onload="myFunction()">
<form  method="post" onsubmit="return validatefield()" action="itAssetAuditDB.jsp"  enctype="multipart/form-data" name="form1" id="form">
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :  <%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2"> DEPARTMENT :  <%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2> NON IT ASSET AUDIT FORM </h2></center>
    </div>
    <div class="modal-body">
	<center>
	
	
		<table width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
		<tr>
		     <td colspan="8">
		           <font size="2" face="Swiss" id="hiderow" align="right">Date&nbsp;</font>
		           <input type="text" name="abc3" placeholder="System current date" maxlength="20" id="demo" value=" " size=11 readonly />
	 	     </td>
		</tr>
		</table>
		
	<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        
        <tr align="center">
          <td colspan="9"><font size="5" face="Swiss" id="hiderow">Select Asset To Audit</font></td> 
        </tr>
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Asset Type</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">A/C. Asset No.</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Asset Name</font></td>
			  <td><font size="2" face="Swiss" id="hiderow">Audit Date</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Audit Done</font></td>
			<td><font size="2" face="Swiss" id="hiderow">Remarks</font></td>
			<td><font size="2" face="Swiss" id="hiderow">Bar Code </font></td>
			<td><font size="2" face="Swiss" id="hiderow">Bar Code Reprint</font></td>
			
	     </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21"><button class="remove" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td><% 
		                Connection con2 = null;
                        String url2 = "jdbc:mysql://localhost:3306/";
                        String db2 = "csdb";
                        String driver2 = "com.mysql.jdbc.Driver";
                        String userName2 ="root";
                        String password2="";
                        // int sumcount=0;
                        Statement st2=null;
                        ResultSet rs2=null; 
                  	  	try
                        {
                    	// id="idBranch"
						Class.forName(driver2).newInstance();
						con2 = DriverManager.getConnection(url2+db2,userName2,password2);
						String query2 = "select * from asset_type where it_nonit='NON IT' ";
						st2 = con2.createStatement();
 						rs2 = st2.executeQuery(query2);
						%>
						<select name="auditAstType" class="auditAsType" id="idaType" onchange="assetnofetch(this.value,id)" style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">
						<option selected="selected">Select</option>
						<%while(rs2.next()){%>
							<option  value="<%=rs2.getString(3)%>"><%=rs2.getString(3)%></option>
    					<%}%>
						</select>
						<%} catch (SQLException ex1) {
    										ex1.printStackTrace();
										}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con2.close();
					   }%>	
		          </td>
		          <td> <div id='auditassetno' class="auditastno1" >   
                           <select name="auditassetno" id="auditidano" class="auditastno" onchange="assetnamefetch(this.value,id)">  
                               <option selected="selected" value = "-1">Select</option> 
                           </select>   
                           </div>  
                  </td>
                  <td><input type="hidden" id="testflag" name="testflag" class="testflag" value="0" size=1/>
		          <input type="text" name="auditAssetName" maxlength="99" id="auditidaname" class="asname" size=15 /></td>
		          <td> <input type="text" name="doaudit" maxlength="99" id="iddoaudit" value="" class="asaudo"size=15 onclick="showCalendarControl(this)"/>  </td>
		          <td><input type="text" name="idauditdone" maxlength="99" id="idauditdone" class="auditdone" value="" size=25 /></td>       
              	  <td><input type="text" name="idremarks" maxlength="99" id="idremarks" class="rema" value="" size=25 /></td>
              	  <td><select name="idbarcode" id="idbarcode" class="bar" onchange="syncCode(this.value,this.id)">  
                               <option selected="selected" value = "-1">Select</option>
                               <option  value="Yes">Yes</option> 
                          		<option  value="No">No</option> 
                          
                           </select> 
                           
                           <div id="idbarcodediv" class="barcodediv">
                          	 <input type="text" name="idbarcoderemarks" maxlength="50" placeholder="Please Mention remarks" id="idbarcoderemarks" class="barcoderem" value="" size=25 />
                           </div>
              	  
              	  <!-- 
              	  <input type="radio" name="idbarcode" onchange="syncCode(this.value,id)" maxlength="99" id="idbarcode" class="bar" value="Yes" size=25 >YES
              	 	 <input type="radio" name="idbarcode" onchange="syncCode(this.value,id)" maxlength="99" id="idbarcode" class="bar" value="No" size=25 >No
              	 	 <input type="text" id="barcodevalue" class="bar2" value=""/> --> 
              	  </td>
              	  <td><select name="idbarcodereprint" id="idbarcodereprint" class="barcodereprint" onchange="syncCode1(this.value,id)">  
                               <option selected="selected" value = "-1">Select</option>
                               <option  value="Yes">Yes</option> 
                          		<option  value="No">No</option> 
                           </select> 
                           <div id="idbarcodereprintdiv" class="barcodereprintdiv">
                          	 <input type="text" name="idbarcodereprintremarks" maxlength="50" placeholder="Please Mention remarks"  id="idbarcodereprintremarks" class="barcoderem1" value="" size=25 />
                           </div>
              	  </td>
     </tr>
</table>
<!-- Scanned files update here  -->

	<table width="75%" border="1" style="height: 150;" cellspacing="0"
						cellpadding="0" bgcolor="lightgrey">
						<tr><td colspan="9"><center><font size="5" face="Swiss" id="hiderow">Upload Supporting Documents </font></center></td></tr>
						<tr><td><font color="red" size="4">*</font>Audit Document :</td><td><input type="file" name="mrScanCopy" id="mrScanCopy"/></td></tr>
						<tr><td>Other Scanned Copy :</td><td><input type="file" name="otherScanCopy" id="otherScanCopy" /></td></tr>
	</table>

</center>
                           
	                          	 <br>
	                          	 <center>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(0)" value="CANCEL" />
		                             </center>
		                             <br>
             
    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 
</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>



</body>
</html>