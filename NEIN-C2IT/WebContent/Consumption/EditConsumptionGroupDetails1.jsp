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
<script language="javascript" type="text/javascript">
function gettotalamt(){ 
	var amt = document.getElementsByClassName("amt");  
	var tamt=0;
	for(var i=0; i<amt.length; i++) {
	    var xx = amt[i].value;
	    tamt=+tamt + +xx;
	}
	var n = tamt.toFixed(2);
	document.getElementById("totalamt").value = n; 
}
</script>

<script language="javascript" type="text/javascript">
	function Validation()
	{ 					
			  var billfromdate = document.forms["form1"]["billfromdate"].value; 
			  var billtodate = document.forms["form1"]["billtodate"].value; 
			  var monthofpayment = document.forms["form1"]["monthofpayment"].value; 
			 
			  var invoicenumber = document.forms["form1"]["invoicenumber"].value; 
			  var invoicedate = document.forms["form1"]["invoicedate"].value; 
				
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
			 
			if(invoicedate == ''){		
	         alert("Select invoice date");
	         return false;
	        }  
		 
		 
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

<body >
<br><br>
<form method="post" name="form1" action="UpdateConsumptionGroupDetails1.jsp" enctype="multipart/form-data">
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

<table  align="center" border="1" width="70%" style="margin-left:110px;"
> 
<%
                String group_name=request.getParameter("group_name");
                String monthofpayment=request.getParameter("monthofpayment");
                String fromdate1=request.getParameter("fromdate");
				String todate1=request.getParameter("todate");
				String branch=request.getParameter("branch");
				
				Connection con1 = null;
				Connection2 dbConn1 = new Connection2();
				con1 = dbConn1.getConnection2();
				
				String status=null,filename=null;
				int sumcount=0;
				Statement st1=null;
				ResultSet rs1=null; 
				
				String invoiceno=null,invoicedate=null,chequeno=null,chequedate=null,billfromdate=null,billtodate=null,filepath=null;
				
		           %>
    
    <tr>
         <td><span style="color:red;">*</span>Group Name/Number:</td>
		 <td ><input type="text" name="group_name" id="group_name"  value="<%=group_name%>" readonly size="40"> </td></td>	
	     <%int number=0;%>
	         <input type="hidden" name="fromdate" id="fromdate" value="<%=fromdate1%>"> 
             <input type="hidden" name="todate" id="todate" value="<%=todate1%>"> 
             <input type="hidden" name="branch" id="branch" value="<%=branch%>"> 
             <input type="hidden" name="monthofpayment1" id="monthofpayment1" value="<%=monthofpayment%>"> 
        <%-- <td>Relationship Numbers:</td>
		<td colspan="3">
		
		<%                   Connection con2 = null;
                             String url2 = "jdbc:mysql://localhost:3306/";
                             String db2 = "csdb";
                             String driver2 = "com.mysql.jdbc.Driver";
                             String userName2 ="root";
                             String password2="";
                             Statement st2=null;
                             ResultSet rs2=null; 
                             String aa=null;
                             String bNo=(String)session.getAttribute("b_no");
                             String query = null;
                             String type="DATA CARD";
                           try
                              {
	                           Class.forName(driver2).newInstance();
                               con2 = DriverManager.getConnection(url2+db2,userName2,password2);
                              
                                    query = "SELECT relationnumber,number  FROM `consumptionreportmaster` WHERE `group_name`='"+group_name+"' ";
                                 
                               st2 = con2.createStatement();
                               rs2 = st2.executeQuery(query);
                              %>
                <select name="relationnumber" id="relationnumber" onchange="getNumber(this.value)">
		        <option >Select</option>
	              <%while(rs2.next()){%>
			        <option value="<%=rs2.getString("relationnumber")%>">(<%=++number%>) <%=rs2.getString("relationnumber")%>(Number: <%=rs2.getString("number")%>)</option>
    	            <%}%> 
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con2.close();
                            	}%>
		<br><font color="red">&nbsp &nbsp No need to select any Relationship Numbers this is only for referene of selected group</font>
		
		</td>	 --%>
	</tr>		
	<tr>
   <td colspan="6">
   <div id="numbera">
    <table border="1" width="100%">
    <%
    try
	{
	
			String query1 = " SELECT `initiatorId`,`relationnumber`,`number`,`isptype`,`typename`, `billfromdate`, `billtodate`,`monthofpayment`, "+
			                " `invoiceno`, `invoicedate`, `chequenumber`,`chequedate`, `filepath` ,group_name,current_month_amt"+
			                " from consumption_report_details where monthofpayment='"+monthofpayment+"' AND group_name='"+group_name+"' ";
		st1 = con1.createStatement();
		rs1 = st1.executeQuery(query1);
	
	    while(rs1.next()){
	            String filepath1=rs1.getString("filepath"); 
	            filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
	            invoiceno=rs1.getString("invoiceno");
                invoicedate=rs1.getString("invoicedate");
                chequeno=rs1.getString("chequenumber");
                chequedate=rs1.getString("chequedate");
                billfromdate=rs1.getString("billfromdate");
                billtodate=rs1.getString("billtodate");
                filepath=rs1.getString("filepath"); 
	    
    
    %>
   <tr>
        <td>
           <span style="color:red;">*</span>Relationship Number:
           <input type="hidden" name="initiatorId" id="initiatorId" value="<%=rs1.getString("initiatorId")%>" readonly>
        </td>
		<td><input type="text" name="relationnumber" id="relationnumber" value="<%=rs1.getString("relationnumber")%>" readonly> </td>			
        <td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="number" id="number" value="<%=rs1.getString("number")%>" readonly></td>
		<td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="typename" id="typename" value="<%=rs1.getString("typename")%>" readonly></td>
		<td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="isptypename" id="isptypename" value="<%=rs1.getString("isptype")%>" readonly></td>
		<td><span style="color:red;">*</span>Amount:</td>
		<td><input type="text" name="amount" id="amount" class="amt" value="<%=rs1.getString("current_month_amt")%>" onkeypress="return isNumberKey1(event)"> </td>
    </tr>
    <%}%>
		<%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	
		finally{
					}%>
    </table> 
    </div>
    </td>
   </tr>
   <tr>
     <td colspan="5" align="right" Style="color:Blue;">Total Amount</td>
     <td><input type="text" name="totalamt" id="totalamt" onclick="return gettotalamt();" readonly placeholder="cick here">Click here</td>
   </tr>
	 <tr>
        <td><span style="color:red;">*</span>Billing Date From:</td>
		<td><input type="text" name="billfromdate" id="billfromdate" value="<%=billfromdate%>" ></td>
		<td><span style="color:red;">*</span>Billing Date To:</td>
		<td><input type="text" name="billtodate" id="billtodate" value="<%=billtodate%>"  > </td>
		<td><span style="color:red;">*</span>Month Of Payment:</td>
		<td><input type="text" name="monthofpayment" id="monthofpayment" value="<%=monthofpayment%>"  ></td>		
	  </tr>
       <tr>
			
        
        <td><span style="color:red;">*</span> Invoice Number:</td>
		<td><input type="text" name="invoicenumber" id="invoicenumber" value="<%=invoiceno%>"  ></td>
		<!-- <td> <span style="color:red;">*</span>Invoice Amount:</td>
		<td><input type="text" name="invoiceamt" id="invoiceamt" onkeypress="return isNumberKey1(event)" size="40" > </td> -->
		<td><span style="color:red;">*</span> Invoice Date:</td>
		<td><input type="text" name="invoicedate" id="invoicedate" value="<%=invoicedate%>" ></td>
		<td><!-- <span style="color:red;">*</span> -->Cheque Number:</td>
		<td><input type="text" name="chequenumber" id="chequenumber" value="<%=chequeno%>"  ></td>
	</tr>
    <tr>
        
        
		<!-- <td><span style="color:red;">*</span>Cheque Amount:</td>
		<td><input type="text" name="chequeamt" id="chequeamt" onkeypress="return isNumberKey1(event)" size="40" > </td>	 -->		
        <td><!-- <span style="color:red;">*</span> -->Cheque Date:</td>
		<td><input type="text" name="chequedate" id="chequedate" value="<%=chequedate%>"  ></td>	
       <!--  <td ><span style="color:red;">*</span>Current Month Charges:</td>
		<td><input type="text" name="currentmonthamount" id="currentmonthamount" onkeypress="return isNumberKey1(event)" size="40" ></td> -->
       <td colspan="4">Invoice File:&nbsp &nbsp &nbsp &nbsp
         <input type="file" name="invoicefile" id="invoicefile">
         <input type="hidden" name="filepath" id="file" value="<%=filepath%>">
         <a href="DownloadFile.jsp?f=<%=filepath%>" ><%=filename%></a>
       </td>  
        
   </tr>

   
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