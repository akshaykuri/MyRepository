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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script language="javascript" type="text/javascript">
$( document ).ready(function() {
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
});
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 /* var empno = document.forms["form1"]["empno"].value; 
		 var empname = document.forms["form1"]["empname"].value;  */
		 var location = document.forms["form1"]["location1"].value; 
		 var number = document.forms["form1"]["number"].value; 
		 var relationnumber = document.forms["form1"]["relationnumber"].value; 
		 var isptype = document.forms["form1"]["isptype"].value; 
		 var typename = document.forms["form1"]["typename"].value; 
		 var monthlycharges = document.forms["form1"]["monthlycharges"].value;
		 
		 var billfromdate = document.forms["form1"]["billfromdate"].value; 
		 var billtodate = document.forms["form1"]["billtodate"].value; 
		 var monthofpayment = document.forms["form1"]["monthofpayment"].value;      
		  var invoicenumber = document.forms["form1"]["invoicenumber"].value; 
		 var invoiceamt = document.forms["form1"]["invoiceamt"].value; 
		 var invoicedate = document.forms["form1"]["invoicedate"].value; 
		 /* var chequenumber = document.forms["form1"]["chequenumber"].value; 
		 var chequeamt = document.forms["form1"]["chequeamt"].value;
		 var chequedate = document.forms["form1"]["chequedate"].value;  */
		 var currentmonthamount = document.forms["form1"]["currentmonthamount"].value; 
		 
		/* if(empno == ''){		
		       alert("Enter emp no");
		       return false;
		    }  
		if(empname == ''){		
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
		return true;
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
<body >
<br><br>
<form method="post" name="form1" action="UpdateConsumptionReportDetails1.jsp" enctype="multipart/form-data">
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
 </table>
 <br><br>

<table  align="center" border="1" width="80%" style="margin-left:110px;"> 
<%
                String id=request.getParameter("id");
                String fromdate1=request.getParameter("fromdate");
				String todate1=request.getParameter("todate");
				Connection con1 = null;
				Connection2 dbConn1 = new Connection2();
				con1 = dbConn1.getConnection2();
				
				String status=null,filename=null;
				int sumcount=0;
				Statement st1=null;
				ResultSet rs1=null; 
				try
				{
				
					String query1 = " SELECT m.`id` as id1, `initiatorId`,`type`, `empno`, `empname`, `branchid`, `branchNo`, `number`, "+
					                " `relationnumber`, `isptype`, `typename`, `monthlycharges`, `billfromdate`, `billtodate`,"+
					                " `monthofpayment`, `number_status`, `invoiceno`, `invoiceamt`, `invoicedate`, `chequenumber`,"+
					                " `chequeamt`, `chequedate`, `current_month_amt`, `filepath`, `status`,b.b_name,mb.m_b_name "+
					                " from consumption_report_details m "+
		                            " INNER JOIN branch_master b ON b.id=m.branchId "+
		                            " INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo  where m.id='"+id+"'";
				st1 = con1.createStatement();
				rs1 = st1.executeQuery(query1);
		%>
		<%      while(rs1.next()){
			            String filepath1=rs1.getString("filepath"); 
			            filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
			           // System.out.println("filename  ::"+filename);
		                status=rs1.getString("status"); 
		           %>
    
    <tr>
        <td><span style="color:red;">*</span>Type:</td>
		<td ><input type="text" name="type" id="type"  value="<%=rs1.getString("type")%>" readonly size="40"> </td></td>	
	</tr>		
    <tr>
         <td id="Other1" style="display:none"><span style="color:red;">*</span>Emp No:</td>
		 <td id="Other2" style="display:none"><input type="text" name="empno" id="empno"  value="<%=rs1.getString("empno")%>" readonly size="40" > 
             <input type="hidden" name="id" id="id"  value="<%=rs1.getString("id1")%>" >
             <input type="hidden" name="initiatorId" id="initiatorId"  value="<%=rs1.getString("initiatorId")%>" > </td>
		
		 <td id="Other3" style="display:none"><span style="color:red;">*</span>Emp Name:</td>
		 <td id="Other4" style="display:none"><input type="text" name="empname" id="empname"  value="<%=rs1.getString("empname")%>" size="40" readonly></td>	
		
		 <td><span style="color:red;">*</span>Location:</td>
		 <td><input type="text" name="location1" id="location1"  value="<%=rs1.getString("b_name")%>" size="40" readonly>		
             <input type="hidden" name="location" id="location" value="<%=rs1.getString("branchId")%>"> 
             <input type="hidden" name="branchNo" id="branchNo" value="<%=rs1.getString("branchNo")%>"> 
             <input type="hidden" name="fromdate" id="fromdate" value="<%=fromdate1%>"> 
             <input type="hidden" name="todate" id="todate" value="<%=todate1%>"> 
		 </td>		
    </tr>
    <tr>
        <td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="number" id="number"  value="<%=rs1.getString("number")%>" readonly  size="40"></td>
	
		<td><span style="color:red;">*</span>Relationship Number:</td>
		<td><input type="text" name="relationnumber" id="relationnumber" value="<%=rs1.getString("relationnumber")%>" readonly size="40"></td>
		
		<td><span style="color:red;">*</span>ISP Network:</td>
		<td><input type="text" name="isptype" id="isptype" value="<%=rs1.getString("isptype")%>" readonly size="40"></td>
		
   </tr>
   <tr>	
		<td><span style="color:red;">*</span>Consumption Type:</td>
		<td> <input type="text" name="typename" id="typename" value="<%=rs1.getString("typename")%>" readonly size="40">  </td>
  
		<td><span style="color:red;">*</span>Monthly Rental Charges:</td>
		<td><input type="text" name="monthlycharges" id="monthlycharges"  value="<%=rs1.getString("monthlycharges")%>" readonly size="40"></td>		
		
        <td > <span style="color:red;">*</span>Status:</td>
        <td>  <input type="text" name="status" id="status" value="<%=rs1.getString("number_status")%>" size="40" readonly></td>
     
   </tr>
   <tr>
        <td><span style="color:red;">*</span>Billing Date From:</td>
		<td><input type="text" name="billfromdate" id="billfromdate"  value="<%=rs1.getString("billfromdate")%>" size="40" readonly></td>
		<td><span style="color:red;">*</span>Billing Date To:</td>
		<td><input type="text" name="billtodate" id="billtodate"  value="<%=rs1.getString("billtodate")%>" size="40" readonly> </td>			
		<td><span style="color:red;">*</span>Month Of Payment:</td>
		<td><input type="text" name="monthofpayment" id="monthofpayment" value="<%=rs1.getString("monthofpayment")%>"  size="40" readonly></td>		
			
   </tr>
    <tr>
        <td><!-- <span style="color:red;">*</span> -->Invoice Number:</td>
		<td><input type="text" name="invoicenumber" id="invoicenumber"  value="<%=rs1.getString("invoiceno")%>" size="40" ></td>
		<td><!-- <span style="color:red;">*</span> -->Invoice Amount:</td>
		<td><input type="text" name="invoiceamt" id="invoiceamt" value="<%=rs1.getString("invoiceamt")%>" onkeypress="return isNumberKey1(event)" size="40" > </td>			
		<td><!-- <span style="color:red;">*</span> -->Invoice Date:</td>
		<td><input type="text" name="invoicedate" id="invoicedate" value="<%=rs1.getString("invoicedate")%>" size="40" readonly></td>		
			
   </tr>
   <tr>
        <td><!-- <span style="color:red;">*</span> -->Cheque Number:</td>
		<td><input type="text" name="chequenumber" id="chequenumber" value="<%=rs1.getString("chequenumber")%>"  size="40" ></td>
		<td><!-- <span style="color:red;">*</span> -->Cheque Amount:</td>
		<td><input type="text" name="chequeamt" id="chequeamt" value="<%=rs1.getString("chequeamt")%>" onkeypress="return isNumberKey1(event)" size="40" > </td>			
		<td><!-- <span style="color:red;">*</span> -->Cheque Date:</td>
		<td><input type="text" name="chequedate" id="chequedate" value="<%=rs1.getString("chequedate")%>" size="40" readonly></td>		
			
   </tr>
   <tr>
        <td ><span style="color:red;">*</span>Current Month Charges:</td>
		<td><input type="text" name="currentmonthamount" id="currentmonthamount" value="<%=rs1.getString("current_month_amt")%>" onkeypress="return isNumberKey1(event)" size="40" ></td>
       
        <td colspan="4">Invoice File:&nbsp &nbsp &nbsp &nbsp
         <input type="file" name="invoicefile" id="invoicefile">
         <input type="hidden" name="filepath" id="file" value="<%=rs1.getString("filepath")%>">
         <a href="DownloadFile.jsp?f=<%=rs1.getString("filepath")%>" ><%=filename%></a>
       </td>  
   </tr>
   <%}%>
		<%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	
		finally{
					}%>
   <tr>
       <td colspan="6" align="center" >
       <input type="submit" value="Submit" name="save1" id="save"  onclick="return (Validation());"></td>
        
   </tr>
 </table>
        <div id="resultFromAjax5" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
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