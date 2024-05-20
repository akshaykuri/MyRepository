<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>


      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<title>Asset Inventory</title>
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
.modal-body {
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
				//alert(value);
				prot.find(".asType").attr("id","idAsType"+id);
				prot.find(".branchName").attr("id","idBranch"+id); 
				//prot.find(".subBranch").attr("id","idsubBranch"+id);
				prot.find(".waranty").attr("id","idWar1"+id);
				prot.find(".warExp").attr("id","idWarExp1"+id);
				prot.find(".rema").attr("id","idremarks1"+id);
				//prot.find(".links").bind("click", function(){
				 //var tmp=null;
				//newwindow=window.open("AddAssetConfigField.jsp?codice="+$(this).attr("title"),'name','height=300,width=300,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
				 /* if (window.focus) {newwindow.focus();}
		    		 return false;
		    		});  */
			   master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("tr").remove();
				//alert(id);
				id--;
			});
		});
	</script>

<!-- <script type="text/javascript">
var bId=0;

function subBranchfetch(str)
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
	  	  bId=str;
	  	  //alert("nameContent ="+bId);
	  	  var item = document.getElementById(str);
	  	  //alert("Str ="+str);
	  	  selOption = item.options[item.selectedIndex];
	      var t = selOption.value;
	      //alert(t);
	      var url="asmInventoryBack.jsp"; 
          url +="?m_b_no=" +t;   
          xmlHttp.onreadystatechange = onstateChange2;  
          xmlHttp.open("GET", url, true);   
          xmlHttp.send(null);    
         } 
function onstateChange2()
         {
	  	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	  	           {
	  		       //alert("here");
	  		        var  y=bId; 
	                //alert(y);
	                var res = y.charAt(8);
	                //alert(res);
	  		        var z = 'idsubBranch'+res.toString();
                    //alert(z);
                    document.getElementById(z).innerHTML=xmlHttp.responseText ;
                    }
          }
</script> -->
 <script type="text/javascript"> // scriptfor sysdate // body onloade()
function myFunction()
    {
	var date = new Date();
	//document.getElementById('datepicker-13').value =null;
	//document.getElementById('datepicker-131').value =null;
	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();
	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;
	var today = year + "-" + month + "-" + day;
	//idCalendar
	document.getElementById('demo').value = today;
	
	//document.getElementById("idempId").focus();
    document.getElementById("idabc4").value =null;
    document.getElementById("idabc5").value=null;
    document.getElementById("idabc6").value =null;
    document.getElementById("idabc7").value =null;
    document.getElementById("idabc8").value=null;
    document.getElementById("idabc9").value =null;
    document.getElementById("idPODate").value =null;
    document.getElementById("idInvDate").value=null;
  
   }
</script>


<script type="text/javascript"> // script for check PO entry
function checkpo()
 {
	if(document.getElementById("idabc4").value =="")
		  {
		    alert("First enter PO no..");
		  }
 }
</script>

<script type="text/javascript"> // script for validate field
function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	var pono=document.getElementById("idabc4").value;
	//alert(pono);
	var pod=document.getElementById("idPODate").value;
	//alert(pod);
	var invno=document.getElementById("idabc5").value;
	
	var vnm=document.getElementById("idabc6").value;
	var vmob=document.getElementById("idabc7").value;
	var vadd=document.getElementById("idabc8").value;
	//var pod=document.getElementById("idPODate").value;
	var invdate=document.getElementById("idInvDate").value;
	//alert(invdate);
	var invamt=document.getElementById("idabc9").value;
	
	if(pono==null || pono=="")
		{
		alert("Please entere po no..");
		idabc4.focus();
        return false;
		}
	   if(pod==null || pod=="")
	    {
	    alert("Please choose PO Date..");
	    idPODate.focus();
        return false;
	    } 
	else if(invno==null || invno=="")
	    {
	    alert("Please entere invoice no..");
	    idabc5.focus();
        return false;
	    }
    else if(vnm==null || vnm=="")
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
    else if(invdate==null || invdate=="")
        {
        alert("Please enter Invoice date..");
        idInvDate.focus();
        return false;
        }
   else if(invamt==null || invamt=="")
        {
        alert("Please enter invoice amount..");
        idabc9.focus();
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
		    var x = 'idAsType'+p.toString();
		    var y = 'idBranch'+p.toString();
		   // var z = 'idsubBranch'+p.toString();
		    var a = 'idWar1'+p.toString();
		    var b = 'idWarExp1'+p.toString();
		    var c = 'idremarks1'+p.toString();
		  
		    var astType = document.getElementById(x).value;
		    //alert(astType);
		    if(astType=="Select")
		    	 {
		    	 alert("Please slect the asset type...");
		    	 return false;
		    	 }
		    var branch = document.getElementById(y).value;
			//alert(branch);
		    if(branch=="Select")
	    	 {
	    	 alert("Please slect the Baranch Name...");
	    	 return false;
	    	 }
			//var subbranch = document.getElementById(z).value;
			//alert(subbranch);
			//if(subbranch==-1)
	    	 //{
	    	 //alert("Please slect the subBaranch Name...");
	    	 //return false;
	    	 //}
			var war = document.getElementById(a).value;
		    //alert(war);
		    if(war=="Select")
	    	 {
	    	 alert("Please slect the Waranty...");
	    	 return false;
	    	 }
		    var warexpd = document.getElementById(b).value;
			//alert(warexpd);
			if(warexpd=="")
	    	 {
	    	 alert("Please slect the Waranty Expiry date...");
	    	 return false;
	    	 }
			var rem = document.getElementById(c).value;
			//alert(rem);
			if(rem=="")
	    	 {
	    	 alert("Please enter item discriptiom....");
	    	 return false;
	    	 }
	       }
		}
   
 }
</script>  
<!-- <script>
function popitup1(url)
        {
		//newwindow=window.open(url,'name','fullscreen=yes,height=,width=,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus();}
		return false;
	    }
</script> -->

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
    	    var url="featchvendordetls.jsp";  
    		    url +="?pordernon=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str2=xmlHttp.responseText;
                             // alert("here");
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idPODate").value =  document.getElementById("p1").value;
                             document.getElementById("idabc6").value =  document.getElementById("p2").value;
                      		 document.getElementById("idabc7").value =  document.getElementById("p3").value;
                      		 document.getElementById("idabc8").value =  document.getElementById("p4").value;
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




<body onload="myFunction()">
<form  method="post" onsubmit="return validatefield()" action="asmInvNonITDB.jsp"  name="form1" id="form">
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
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                
                <font size ="2">DEPARTMENT :<%=session.getAttribute("department")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>NON IT ASSET INVENTORY FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<!-- <table width="75%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
 -->     <table width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
     	<tr>
		<!-- <td colspan="2"><font size="2" face="Swiss" id="hiderow">Inventory&nbsp;No.</font>
		<input type="text" name="abc3" placeholder="Auto create" maxlength="99" id="idabc3" value="" size=20 />
		 -->
		 <td colspan="2"><font size="2" face="Swiss" id="hiderow" align="right">Date&nbsp;</font>
		<input type="text" name="abc3" placeholder="System current date" maxlength="99" id="demo" value=" " size=20 />
		
		</td>
		</tr>
     	<tr>
	   <td height="21" align="left" width="103">
     	    <table> 
     	    <tr>
		    	<td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>PO&nbsp;No.</font>
			    <td><input type="text" name="abc4" maxlength="20" id="idabc4" value="" size=15 onkeyup="sendInfo(this.value)"/> </td>
			   
			   
			   
			   
			   <!-- <td><input type="text" name="abc4" maxlength="99" id="idabc4" value="" size=10/></td> -->
			   
			   
			   
			   
			   
		   </tr>	
		   <tr>
		    	<td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>PO Date :</font>
		    	
		    	<!-- <td><input type="text"  style="width: 6em"  name="txtCalendar" value="" id="datepicker-13" ></td> -->
		    	
		    	<td><input type="text"  style="width: 6em"  name="txtCalendar"  value="" id="idPODate" onclick="showCalendarControl(this)" ></td>
			   
		   </tr>	
	  </table>
	</td>
	<td height="21" align="left" width="103">
	
	<table>
	 <td>
	     <table width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	        <tr>
		    <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>Invoice &nbsp;No. :</font> 
			<td><input type="text" name="abc5" maxlength="99" id="idabc5" value="" size=20 onclick="checkpo()"/></td>
		     </tr>
		  </table>
	    </td>
	    <td>
	     <table>
	        <tr>
		    <td><font size="2" face="Swiss" id="hiderow">Vendor &nbsp;Name :</font> 
			<td><input type="text" name="abc6" maxlength="99" id="idabc6" value="" size=20 /></td>
			<td><font size="2" face="Swiss" id="hiderow">Vendor Mob &nbsp;No. :</font> 
			<td><input type="text" name="abc7" maxlength="99" id="idabc7" value="" size=20 /></td>
		    <td><font size="2" face="Swiss" id="hiderow">Vendor &nbsp;Address :</font> 
			<td><input type="text" name="abc8" maxlength="99" id="idabc8" value="" size=20 /></td>
		    
		     </tr>
		     <tr>
		    <td><font size="2" face="Swiss" id="hiderow">Invoice &nbsp;Date :</font> 
		    
		    <!-- <td><input type="text"  style="width: 6em"  name="txtCalendar2" value="" id="datepicker-131" ></td> -->
			
			<td><input type="text"  style="width: 6em"  name="txtCalendar2" value="" id="idInvDate" onclick="showCalendarControl(this)" ></td>
			
					
	    	<td><font size="2" face="Swiss" id="hiderow">Invoice &nbsp;Amount :</font> 
			<td><input type="text" name="abc9" maxlength="99" id="idabc9" value="" size=20 /></td>
		        
		     </tr>
		  </table>
		  </td>
	</table>
	</td>
	</tr>
	</td>
 </table>
<br>

<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr>
          <center><td colspan="9"><font size="5" face="Swiss" id="hiderow">Enter Item Details</font></td></center> 
        </tr>
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp;Type</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Branch&nbsp;</font></td>
		    <!--  <td><font size="2" face="Swiss" id="hiderow">Sub &nbsp;Branch</font></td> -->
		     <!-- <td><font size="2" face="Swiss" id="hiderow">Configuration</font></td> -->
		     <td><font size="2" face="Swiss" id="hiderow">Wranty</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Waranty Exp&nbsp;Date</font></td>
	<!-- 	     <td><font size="2" face="Swiss" id="hiderow">Asset &nbsp;No.</font></td> -->
		     <td><font size="2" face="Swiss" id="hiderow">Discription</font></td>
	     </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td>
		                <% 
		                System.out.println("------------- Asm Inventory NONIT   -----------------");
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
					    <select name="astType" class="asType" id="idAsType">
        					<!-- <select name="branchName1" class="branchName"  onchange="subBranchfetch(this.value)"> -->
							<option selected="selected">Select</option>
							<%while(rs2.next()){%>
								<%-- <option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option> --%>
										<%-- <% String tot_val1 = rs1.getString(2)+"---"+rs1.getString(3) ;%> --%>
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
						String query = "select * from branch_master_main ORDER BY m_b_name";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
						
						<!-- <select name="branchName1" class="incSelect"  onchange="getItem(this.id);"> -->
        					<select name="branchName1" class="branchName" >
							<option selected="selected">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
										<%-- <% String tot_val = rs.getString(2)+"---"+rs.getString(3) ;%> --%>
										<%-- <option  value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option> --%>
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
                   
		     <!--  <td>
		           <div id='Subcity'> 
		           <select name='Subcity'  class="subBranch" id="idsubBranch" style="font-size: 11px;width: 142px;overflow: auto;height: 20px ">
                   <select name="Subcity" class="subBranch" style="font-size: 11px;width: 142px;overflow: auto;height: 20px id="idsubBranch" >  
                   <option value='-1'>Select</option>     
                    </select>     
                   </div>
               </td> -->
               <!-- <td><a href="AddAssetConfigField.jsp?msg=1" onclick="return popitup1('AddAssetConfigField.jsp?msg=1')" >Add Config</a></td> -->
		       <td><select name="war" class="waranty" id="idWar">
		           <option value="Select">Select</option>
		           <option value="0">0</option>
                   <option value="1">1</option>
                   <option value="2">2</option>
                    <option value="3">3</option>
                   <option value="4">4</option>
                   <option value="5">5</option>
                   <option value="6">6</option>
                    <option value="7">7</option>
                   <option value="8">8</option>
                  <option value="9">9</option>
                   <option value="10">10</option>
                  
                   </select>
               </td>
               <td><input type="text"  style="width: 6em"  name="txtCalendar3" class="warExp" value="" id="idWarExpDate" onclick="showCalendarControl(this)" ></td>
                
                
                 <!-- <td><input type="text"  style="width: 6em"  class="war" name="warantyExp" value="" id="warExpDate" ></td>
		         <td><input type="text"  style="width: 6em"  name="txtCalendar" value="" id="datepicker-132" ></td>
		         
			  <td> <img src="images/cal.gif" id="idForDay" style="float: right; margin: 0.5em 0.5em 0.5em 0.25em;" name="imgForDate" width="20" height="20"  onclick="showCalendarControl(document.getElementById('idCalendar'))"></td>
	    
		       <td><select name="cars" class="Validity">
                   </select>
               </td>
               <td><input type="text" name="abc3" placeholder="Asset no auto creation" maxlength="99" id="idabc3" class="assetId" value="" size=20 /></td>
		      -->  
		       
		       
		       <td><input type="text" name="remarks" maxlength="99" id="idremarks" class="rema" value="" size=28 /></td>
     </tr>
</table>
		

</center>
                           
	                          	 <br>
	                          	 <center>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                            
		                            <input type="button" onclick="history.go(0)" value="CANCEL" />
		                             </center>
		                             <br>
		                       <!-- </td>
		                      
	                         </table> -->
                          </table>
    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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