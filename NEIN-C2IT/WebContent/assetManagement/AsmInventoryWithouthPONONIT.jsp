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

 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>Asset Inventory</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#idInvDate" ).datepicker({ dateFormat: 'dd-M-yy' });
    $( "#idPODate" ).datepicker({ dateFormat: 'dd-M-yy' });
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
<%int p =0;%>
<script>
function sync(textbox)
{
 document.getElementById('idabc4').value = textbox.value;
}
function CalExp(selectBox,second)
{
	var podate1=document.getElementById('idInvDate').value;
	var calcval = null;
	var start_date = document.getElementById('idInvDate').value;;
	//alert(second);
	var res1;
	var res = second.substring(0,8);
	//alert(res);
	if(second.length==15)
		   {
		    var last2 = second.slice(-2);
	        //alert("L1"+last2);
	        res1=res+last2;
		   }
	else
		   {
		   var last21 = second.slice(-3);
		  // alert("L2"+last21);
		   res1=res+last21;
		   }
	      //alert(last2);
	      //alert(res1);
	var term = selectBox.value;  // Is text value
	//alert(term);
	var set_start = start_date.split('-');  
	var day = set_start[0];
	var month = (set_start[1]);  // January is 0 so August (8th month) is 7
	 if (month == "Jan")
     {
         month="0";
     }
     if (month == "Feb")
     {
         month="1";
     }
     if (month == "Mar")
     {
         month="2";
     }
     if (month == "Apr")
     {
         month="3";
     }
     if (month == "May")
     {
         month="4";
     }
     if (month == "Jun")
     {
         month="5";
     }
     if (month == "Jul")
     {
         month="6";
     }
     if (month == "Aug")
     {
         month="7";
     }
     if (month == "Sep")
     {
         month="8";
     }
     if (month == "Oct")
     {
         month="9";
     }
     if (month == "Nov")
     {
         month="10";
     }
     if (month == "Dec")
     {
         month="11";
     }
     var year = set_start[2];
  	var datetime = new Date(year, month, day);
	var newmonth = (parseInt(month) + parseInt(term));  // Must convert term to integer
	var newdate = datetime.setMonth(newmonth);
	newdate = new Date(newdate);
	//alert(newdate);
	day = newdate.getDate();
	month = newdate.getMonth() + 1;
	year = newdate.getFullYear();
	var daysInMonths = [
	                    "01", "02", "03","04", "05", "06", "07","08", "09", "10","11", "12","13", "14","15", "16","17", "18","19", "20","21", "22","23", "24","25", "26","27", "28","29", "30","31"
	                  	];
	var monthNames = [
	                  "01", "02", "03","04", "05", "06", "07","08", "09", "10","11", "12"
	                  ];
	day = newdate.getDate();
	month = newdate.getMonth();
	year = newdate.getFullYear();
	var newdate1=daysInMonths[day]+ '-' + monthNames[month] + '-' + year;    	
	document.getElementById(res1).value = newdate1;
}
</script>



 <script>
 
		var id =0;
		$(document).ready(function() {
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID :"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(id);
				prot.find(".asname").attr("id","idasname"+id);
				prot.find(".acasno").attr("id","idacasno"+id);
				prot.find(".testflag").attr("id","testflag"+id);
				prot.find(".asType").attr("id","idAsType"+id);
				prot.find(".branchName").attr("id","idBranch"+id); 
				prot.find(".waranty").attr("id","idWar1"+id);
				prot.find(".warExp").attr("id","idWarExp1"+id);
				prot.find(".rema").attr("id","idremarks1"+id);
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
function featchvendor(v)  
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
 
 function sendInfo1(v,first)  
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
		   var ano = 'idacasno'+p.toString();
		   var assetflag='testflag'+p;
		   var x = 'idAsType'+p.toString();
		   var y = 'idBranch'+p.toString();
		   // var z = 'idsubBranch'+p.toString();
		    var a = 'idWar1'+p.toString();
		    var b = 'idWarExp1'+p.toString();
		    var c = 'idremarks1'+p.toString();
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
					 var nextAsset='idacasno'+v;
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
<form  method="post" onsubmit="return validatefield()" action="asmInvDBwithouthPONONIT.jsp"  enctype="multipart/form-data" name="form1" id="form">
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
      <center> <h2> ASSET WITH OUT PO INVENTORY FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
   <table width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
     	<tr>
		     <td colspan="2">
		           <font size="2" face="Swiss" id="hiderow">Date&nbsp;</font>
		           <input type="text" name="abc3"  maxlength="20" id="demo" value=" " size=11 readonly />
	 	     </td>
		</tr>
		<tr>
			<td height="21" align="left" width="103">
								<table>

									<tr>
										<td><font size="2" face="Swiss" id="hiderow"><font
												color="red" size="4">*</font>PO&nbsp;No.</font>
										<td><input type="text" name="abc4" maxlength="20"
											id="idabc4" value="" size=15 /></td>
									</tr>
									<tr>
										<td><font size="2" face="Swiss" id="hiderow"><font
												color="red" size="4">*</font>PO Date :</font>
										</td>
										<td><input type="text" name ="txtCalendar1"  placeholder="Please Enter Po Date" 
											value="" id="idPODate">
										</td>
									</tr>
								</table></td>		
	        <td height="21" align="left" >
 	          <table>
	                <tr>
	                  <td ><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>Invoice &nbsp;No. :</font> 
			           <td><input type="text" name="abc5" maxlength="99" id="idabc5" value="" size=20 onclick="checkpo()"/></td>
			           <td width="10%"><font size="2" face="Swiss" id="hiderow">Invoice &nbsp;Amount :</font> 
			            <td><input type="text" name="abc9" maxlength="99" id="idabc9" value="" size=10 /></td>
			           <td width="10%"><font size="2" face="Swiss" id="hiderow">Invoice &nbsp;Date :</font> 
			            <td>
			            <input type="text" name ="idInvDate" class="txtCalendar2" id="idInvDate" placeholder="Please Select the Date" value="">
			            <!-- <input type="text"  style="width: 6em"  name="txtCalendar2" value="" id="idInvDate" onclick="showCalendarControl(this)" > -->
			            </td>
		   	            
		          </tr>
		          <tr>
		               <td width="20%"><font size="2" face="Swiss" id="hiderow">Vendor &nbsp;Name :</font> </td>
		               
		               <%
		               System.out.println("------------- NONIT AsmInventory With OUT PO  -----------------");
		               Connection con21 = null;
                       String url21 = "jdbc:mysql://localhost:3306/";
                       String db21 = "nepldb";
                       String driver21 = "com.mysql.jdbc.Driver";
                       String userName21 ="root";
                       String password21="";
                       Statement st21=null;
                       ResultSet rs21=null; 
                       
 					  try
                        {
                        Class.forName(driver21).newInstance();
 						con21 = DriverManager.getConnection(url21+db21,userName21,password21);
 						String query21 = "SELECT vname FROM vendormaster  order by vname ASC";
 		                st21 = con21.createStatement();
  					    rs21 = st21.executeQuery(query21);
 						%>
 						<td>
					    <select name="abc6" id="idabc6" style="width: 150px;" onchange="featchvendor(this.value);">
        					<option value="">Select</option>
							<%while(rs21.next()){%>
									<option  value="<%=rs21.getString(1)%>"><%=rs21.getString(1)%></option>
    						<%}%>
							</select></td>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							con21.close();
					   }%>	
	       	
		                <!-- <td><input type="text" name="abc6" maxlength="99" id="idabc6" value="" size=20 /></td> -->
			           <td width="20%"><font size="2" face="Swiss" id="hiderow">Vendor Mob &nbsp;No. :</font> 
			           <td><input type="text" name="abc7" maxlength="99" id="idabc7" value="" onkeypress="return isNumber(event)" size=20 /></td>
		               <td width="20%"><font size="2" face="Swiss" id="hiderow">Vendor &nbsp;Address :</font> 
			          <td><input type="text" name="abc8" maxlength="99" id="idabc8" value="" size=20 /></td> 
		         </tr>
		  </table>
		  </td>
	</tr>
 </table>
<br>

<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr align="center">
          <td colspan="9"><font size="5" face="Swiss" id="hiderow">Enter Item Details</font></td> 
        </tr>
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Asset Name</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">A/C. Asset&nbsp;No.</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp;Type</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Branch&nbsp;</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Warranty</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Warranty Exp&nbsp;Date</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Remarks</font></td>
	     </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td><input type="text" name="assetName" maxlength="99" id="idasname" class="asname" value="" size=25 /></td>
		           <td><input type="hidden" id="testflag" name="testflag" class="testflag" value="0" size=1/>
		           <input type="text" name="assetNo" maxlength="99" id="idacasno" class="acasno" onkeyup="sendInfo1(this.value,this.id)" value="" size=15 /></td>
		           <td>
		                <% 
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
					    <select name="astType" class="asType" id="idAsType" >
        					<!-- <select name="branchName1" class="branchName"  onchange="subBranchfetch(this.value)"> -->
							<option selected="selected">Select</option>
							<%while(rs2.next()){%>
								<option  value="<%=rs2.getString(3)%>"><%=rs2.getString(3)%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con2.close();
					   }%>	
				
		          </td>
		          <td><%Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                            // int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select * from branch_master_main where m_b_no in(90,10,20,30,40) ORDER BY m_b_name";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branchName" class="branchName" >
							<option selected="selected">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
									
    						<%}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con.close();
					   }%>
                   </td>
                   <td><select name="war" class="waranty" id="idWar" onclick="CalExp(this,'idWarExp'+id)">
			     	    
				           <option value="Select">Select</option>
				           <option value="0">0 </option>
				           <option value="3">3 Months</option>
				           <option value="6">6 Months</option>
		                   <option value="12">1 Year</option>
		                   <option value="24">2 Year</option>
		                   <option value="36">3 Year</option>
		                   <option value="48">4 Year</option>
		                   <option value="60">5 Year</option>
		                   <option value="72">6 Year</option>
		                   <option value="84">7 Year</option>
		                   <option value="96">8 Year</option>
		                   <option value="108">9 Year</option>
		                   <option value="120">10 Year</option>
		                   </select>
		               </td>
		         
               <td><input type="text"  style="width: 6em"  name="warExp" class="warExp" value="" id="idWarExp" readonly ></td>
               <td><input type="text" name="idremarks" maxlength="99" id="idremarks" class="rema" value="" size=25 /></td>
     </tr>
</table>
<!-- Scanned files update here  -->

	<table width="75%" border="1" style="height: 150;" cellspacing="0"
						cellpadding="0" bgcolor="lightgrey">
						<tr>
							<td colspan="9"><center><font size="5" face="Swiss" id="hiderow">Upload Scanned Files </font></center></td>
						</tr>
						<tr>
							<td><font color="red" size="4">*</font>MR Scanned Copy :</td><td><input type="file" name="mrScanCopy" id="mrScanCopy" /></td>
						</tr>
						<tr>
							<td><font color="red" size="4">*</font>PO Scanned Copy :</td><td><input type="file" name="poScanCopy" id="poScanCopy" /></td>
						</tr>
						<tr>
							<td><font color="red" size="4">*</font>Invoice Scanned Copy :</td><td><input type="file" name="invScanCopy" id="invScanCopy" /></td>
						</tr>
						<tr>
							<td>Other Scanned Copy :</td><td><input type="file" name="otherScanCopy" id="otherScanCopy" /></td>
						</tr>
					</table>

		
<!-- scanned file end here   -->
</center>
                           
	                          	 <br>
	                          	 <center>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(0)" value="CANCEL" />
		                             </center>
		                             <br>
		                       <!-- </td>
		                      
	                         </table> -->
             
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