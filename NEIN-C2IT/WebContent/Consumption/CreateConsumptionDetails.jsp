<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="CON2.DbUtil"%>

<%@ page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.text.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@ page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> -->
<script language="javascript" type="text/javascript">
$( document ).ready(function() {
    	$('#Other1').show();
        $('#Other2').show();
        $('#Other3').show();
        $('#Other4').show();
});
</script> 
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 //var empno = document.forms["form1"]["empno"].value; 
		// var empname = document.forms["form1"]["empname"].value; 
		 var location = document.forms["form1"]["location1"].value; 
		 var number = document.forms["form1"]["number"].value; 
		 var relationnumber = document.forms["form1"]["relationnumber"].value; 
		 var isptype = document.forms["form1"]["isptype"].value; 
		 var typename = document.forms["form1"]["typename"].value; 
		 var monthlycharges = document.forms["form1"]["monthlycharges"].value;
		 
		 var billfromdate = document.forms["form1"]["billfromdate"].value; 
		 var billtodate = document.forms["form1"]["billtodate"].value; 
		 var monthofpayment = document.forms["form1"]["monthofpayment"].value; 
		// var status = document.forms["form1"]["status"].value; 
		 
		  var invoicenumber = document.forms["form1"]["invoicenumber"].value; 
		  var invoiceamt = document.forms["form1"]["invoiceamt"].value; 
		  var invoicedate = document.forms["form1"]["invoicedate"].value; 
		 /* var chequenumber = document.forms["form1"]["chequenumber"].value; 
		 var chequeamt = document.forms["form1"]["chequeamt"].value;
		 var chequedate = document.forms["form1"]["chequedate"].value;  */
		 var currentmonthamount = document.forms["form1"]["currentmonthamount"].value; 
		 var invoicefile = document.forms["form1"]["invoicefile"].value; 
		
		 if(status == "In-Active"){		
		       alert("Number In-Active State Please check Number details");
		       return false;
		    }  
		/* if(empno == ''){		
		       alert("Enter emp no");
		       return false;
		    }  */ 
		/* if(empname == ''){		
            alert("Enter empname");
            return false;
         }   */
		if(location == ''){		
            alert("Select location");
            return false;
         }  
		if(number == ''){		
            alert("Enter number");
            return false;
         }  
		if(relationnumber == ''){		
            alert("Enter relationship number");
            return false;
        }  
		if(isptype == ''){		
            alert("Select isp network type");
            return false;
        }  
		
		if(typename == ''){		
            alert("Select Consumption type");
            return false;
       } 
		if(monthlycharges == ''){		
            alert("Enter monthly charges");
            return false;
       } 
		
		
	   if(billfromdate == ''){		
		       alert("Select bill from date");
		       return false;
		    }  
	   if(billtodate == ''){		
         alert("Select bill to date");
         return false;
        }  
		if(monthofpayment == ''){		
         alert("Select month of payment");
         return false;
        }  
		 if(invoicenumber == ''){		
         alert("Enter invoice number");
         return false;
        }  
		if(invoiceamt == ''){		
         alert("Enter invoice Amount");
         return false;
       }  
		if(invoicedate == ''){		
         alert("Select invoice date");
         return false;
        }  
		
		/*	if(chequenumber == ''){		
         alert("Enter cheque number");
         return false;
        } 
		if(chequeamt == ''){		
         alert("Enter cheque Amount");
         return false;
        } 
		if(chequedate == ''){		
	         alert("Select cheque date");
	         return false;
	        }  */
	  if(currentmonthamount == ''){
		  alert("Enter current month amount");
          return false;
       } 
	  if(invoicefile == ''){
		  alert("Enter Invoice file");
          return false;
       } 
		return true;
	}
	
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
    	   
    	    var url="GetNumberDetails.jsp";  
    		    url +="?number="+v;
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
            	             var str2=xmlHttp.responseText;
                             document.getElementById("resultFromAjax5").innerHTML = str2;
                             document.getElementById("isptype").value =  document.getElementById("px1").value;
                             document.getElementById("typename").value =  document.getElementById("p2").value;
                             document.getElementById("empno").value =  document.getElementById("p3").value;
                             document.getElementById("empname").value =  document.getElementById("p4").value;
                             document.getElementById("location").value =  document.getElementById("p5").value;
                             document.getElementById("branchNo").value =  document.getElementById("p6").value;
                             document.getElementById("monthlycharges").value =  document.getElementById("p8").value;
                             document.getElementById("status").value =  document.getElementById("p9").value;
                             document.getElementById("location1").value =  document.getElementById("p10").value;
                             document.getElementById("type").value =  document.getElementById("p12").value;
                            
                             var value = document.forms["form1"]["type"].value;
                             if(value == "Office") {
                             	document.forms["form1"]["empno"].value = "";		
                             	document.forms["form1"]["empname"].value = "";	
                                 $('#Other1').hide();
                                 $('#Other2').hide();
                                 $('#Other3').hide();
                                 $('#Other4').hide();
                                 	
                             } else {
                             	 $('#Other1').show();
                                 $('#Other2').show();
                                 $('#Other3').show();
                                 $('#Other4').show();
                             }
                      		 }
             } 
</script>
<script type="text/javascript">  
 function getNumber(v)  
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
    	   
    	    var url="GetNumberDetails1.jsp";  
    		    url +="?relationnumber=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
                             document.getElementById("number").innerHTML=xmlHttp.responseText;
                           } 
             }
</script>
<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=400,width=950,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>
 <script type="text/javascript">
$(document).ready(function () {
	
	$("#billfromdate").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();  
	$("#billtodate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();
	$("#invoicedate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();  
	$("#chequedate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();  

	$("#monthofpayment").datepicker({
		   /*  dateFormat: 'MM yy', */
		    dateFormat : 'yy-mm-dd',
		    changeMonth: true,
		    changeYear: true,
		    showButtonPanel: true,

		    onClose: function(dateText, inst) {
		        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		        $(this).val($.datepicker.formatDate('yy-mm-dd', new Date(year, month, 1)));
		    }
		});

		$("#monthofpayment").focus(function () {
		    $(".ui-datepicker-calendar").hide();
		    $("#ui-datepicker-div").position({
		        my: "center top",
		        at: "center bottom",
		        of: $(this)
		    });
		});
});

</script>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script language="Javascript">
       function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode > 31 && (charCode < 48 || charCode > 57)){
        	 alert("Enter numbers");
             return false;
          }
       else{
          return true;
       }
       }
       
    </script>
    <script language="Javascript">
       function isNumberKey1(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
        	 alert("Enter numbers");
             return false;
          }
       else{
          return true;
       }
       }
       
    </script>
    
    
</head>

<body background="../images/u.jpg">
<br><br>
<form method="post" name="form1" action="InsertConsumptionReportDetails.jsp" enctype="multipart/form-data">
<input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
</td>
 </tr>
   </table><br><br>

<table  align="center" border="1" width="80%" style="margin-left:110px;"> 
   
   <tr><%int number=0;%>
        <td><span style="color:red;">*</span>Relationship Number:</td>
		<td><!-- <input type="text" name="number" id="number"  onkeyup="sendInfo(this.value)" size="40" maxlength="10"> -->
		
		<%                   Connection con1 = null;
							 Connection2 dbConn = new Connection2();
							 con1 = dbConn.getConnection2(); 
							 
                             Statement st1=null;
                             ResultSet rs1=null; 
                             String aa=null;
                             String bNo=(String)session.getAttribute("b_no");
                             String query = null;
                           try
                              {
	                            
                               if(bNo.equals("90")){
                                    query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo in(90)";
                                  }
                               if(bNo.equals("40")){
                            	   
                            	   query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo in(40,41,52,43,42) ";
                                }
                               if(bNo.equals("20")){ 
                            	   
                            	   query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                               }
                               if(bNo.equals("30")){ 
                            	   
                            	   query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo in(30,31,53,32,11)";
                               }
                               if(bNo.equals("10")){ 
                            	   
                            	   query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo in(10)";
                               }
                               if(bNo.equals("54")){ 
                            	   
                            	   query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo in(54,44)";
                               }
                               if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("54") || bNo.equals("40") || bNo.equals("90"))){ 
                            	   query = "SELECT distinct relationnumber FROM `consumptionreportmaster` where branchNo ='"+bNo+"'";
                               }
                               
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query);
                              %>
                <select name="relationnumber" id="relationnumber" onchange="getNumber(this.value)">
		        <option >Select</option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString("relationnumber")%>">(<%=++number%>) <%=rs1.getString("relationnumber")%></option>
    	            <%}%> 
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
		
		
		</td>	
		<td><span style="color:red;">*</span>Number:</td>
		<td><!-- <input type="text" name="number" id="number" readonly size="40"> -->
		     <select name="number" id="number" onchange="sendInfo(this.value)">
		           <option value=''>Select</option>
            </select>
	       </td>		
		<td><span style="color:red;">*</span>ISP Network:</td>
		<td><input type="text" name="isptype" id="isptype" readonly size="40"> </td>			
   </tr>
   <tr>
        <td ><span style="color:red;">*</span>Type:</td>
		<td ><input type="text" name="type" id="type" readonly size="40" > </td>
        <td id="Other1" style="display:none"><span style="color:red;">*</span>Emp No:</td>
		<td id="Other2" style="display:none"><input type="text" name="empno" id="empno" readonly size="40" > </td>
		<td id="Other3" style="display:none"><span style="color:red;">*</span>Emp Name:</td>
		<td id="Other4" style="display:none"><input type="text" name="empname" id="empname" readonly  size="40"></td>	
			
	</tr>
   <tr>	
        <td><span style="color:red;">*</span>Location:</td>
	   	<td><input type="text" name="location1" id="location1" readonly  size="40">
		    <input type="hidden" name="location" id="location" >
		    <input type="hidden" name="branchNo" id="branchNo" > 
		</td>	
		<td><span style="color:red;">*</span>Consumption Type:</td>
		<td><input type="text" name="typename" id="typename" readonly size="40"> </td>			
		<td><span style="color:red;">*</span>Monthly Rental Charges+Tax:</td>
		<td><input type="text" name="monthlycharges" id="monthlycharges" readonly size="40"></td>		
        
	     <!-- <input type="radio" name="status" id="status" value="Active" size="40" checked>Active &nbsp &nbsp &nbsp
	     <input type="radio" name="status" id="status" value="In-Active" size="40" >In-Active -->
       
   </tr>
   <tr>
        <td ><span style="color:red;">*</span>Status:</td>
        <td><input type="text" name="status" id="status" readonly size="40"></td>
        <td><span style="color:red;">*</span>Billing Date From:</td>
		<td><input type="text" name="billfromdate" id="billfromdate"  size="40" readonly></td>
		<td><span style="color:red;">*</span>Billing Date To:</td>
		<td><input type="text" name="billtodate" id="billtodate"  size="40" readonly> </td>		
			
   </tr>
    <tr>
        <td><span style="color:red;">*</span>Month Of Payment:</td>
		<td><input type="text" name="monthofpayment" id="monthofpayment"  size="40" readonly></td>	
        <td><span style="color:red;">*</span> Invoice Number:</td>
		<td><input type="text" name="invoicenumber" id="invoicenumber"  size="40" ></td>
		<td> <span style="color:red;">*</span>Invoice Amount:</td>
		<td><input type="text" name="invoiceamt" id="invoiceamt" onkeypress="return isNumberKey1(event)" size="40" > </td>
			
   </tr>
   <tr>
        <td><span style="color:red;">*</span> Invoice Date:</td>
		<td><input type="text" name="invoicedate" id="invoicedate"  size="40" readonly></td>
        <td><!-- <span style="color:red;">*</span> -->Cheque Number:</td>
		<td><input type="text" name="chequenumber" id="chequenumber"  size="40" ></td>
		<td><!-- <span style="color:red;">*</span> -->Cheque Amount:</td>
		<td><input type="text" name="chequeamt" id="chequeamt" onkeypress="return isNumberKey1(event)" size="40" > </td>			
			
   </tr>
   <tr>
        <td><!-- <span style="color:red;">*</span> -->Cheque Date:</td>
		<td><input type="text" name="chequedate" id="chequedate"  size="40" readonly></td>	
        <td ><span style="color:red;">*</span>Current Month Charges:</td>
		<td><input type="text" name="currentmonthamount" id="currentmonthamount" onkeypress="return isNumberKey1(event)" size="40" ></td>
        <td colspan="4"><span style="color:red;">*</span>Invoice File:&nbsp &nbsp &nbsp &nbsp<input type="file" name="invoicefile" id="invoicefile"></td>
        
   </tr>
   <tr>
      <td colspan="6" align="center" >
         <input type="submit" value="Submit" name="save1" id="save"  onclick="return (Validation());">&nbsp &nbsp 
         <input type="reset" value="Reset">&nbsp &nbsp 
      </td>
   </tr>
 </table>
        <div id='resultFromAjax5' style='display:none;'></div>
   <br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table> 
   <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>