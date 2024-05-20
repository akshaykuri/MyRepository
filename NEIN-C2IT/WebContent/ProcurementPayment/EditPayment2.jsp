<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">

<script type="text/javascript">    

    $(document).ready(function () { 
    	$("#deliveryDate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
        $("#billDate").datepicker( { changeMonth: true, changeYear: true,dateFormat: 'yy-mm-dd' }).val(); 
        $("#payMentDate").datepicker( { changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd' }).val();  
        $("#podate").datepicker( { changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd' }).val();           
    });
    
</script> 
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 var location = document.forms["form1"]["location"].value; 
		 var item_desc = document.forms["form1"]["item_desc"].value; 
		 var vendorName = document.forms["form1"]["vendorName"].value;  
		 var ponumber = document.forms["form1"]["ponumber"].value; 
		 var podate = document.forms["form1"]["podate"].value;  
		 var per_itemAmt = document.forms["form1"]["per_itemAmt"].value;  
		 var quantity = document.forms["form1"]["quantity"].value;  
		 var Amount = document.forms["form1"]["Amount"].value; 
		 var cgst = document.forms["form1"]["cgst"].value; 
		 var cgst_amt = document.forms["form1"]["cgst_amt"].value; 
		 var sgst = document.forms["form1"]["sgst"].value; 
		 var sgst_amt = document.forms["form1"]["sgst_amt"].value; 
		 var igst = document.forms["form1"]["igst"].value; 
		 var igst_amt = document.forms["form1"]["igst_amt"].value; 
		 var tds = document.forms["form1"]["tds"].value; 
		 var tds_amt = document.forms["form1"]["tds_amt"].value; 
		 var total_amt = document.forms["form1"]["total_amt"].value; 
		 var deliveryDate = document.forms["form1"]["deliveryDate"].value; 
		 var billNo = document.forms["form1"]["billNo"].value; 
		 var billDate = document.forms["form1"]["billDate"].value; 
		// var chequeNo = document.forms["form1"]["chequeNo"].value; 
		 var filename = document.forms["form1"]["filename"].value; 
		 var invoicefile = document.forms["form1"]["invoicefile"].value; 
		 var remarks = document.forms["form1"]["remarks"].value; 
		 
		if(location == "Select"){		
		    alert("Select location");
		    return false;
		}  
		if(item_desc == "Select"){	
			 alert("Select Item Name");
            return false;     
		    } 		
		if(vendorName == "Select"){	
		    alert("Select vendor Name");
		    return false;
		}  		
		
		if(ponumber == ''){		
		    alert("Enter po number");
		    return false;
		}  
				
		if(podate == ''){		
		    alert("Enter po date");
		    return false;
		}  		
		
		if(per_itemAmt == ''){		
		    alert("Enter per item Amt");
		    return false;
		}  
				
		if(quantity == ''){		
		    alert("Enter quantity");
		    return false;
		}  
				
		if(Amount == ''){		
		    alert("Enter Amount");
		    return false;
		}  
				
		if(cgst == ''){		
		    alert("Enter cgst % value");
		    return false;
		}
		if(cgst_amt == ''){		
		    alert("Enter cgst amt");
		    return false;
		}  
		if(sgst == ''){		
		    alert("Enter sgst % value");
		    return false;
		}
		if(sgst_amt == ''){		
		    alert("Enter sgst amt");
		    return false;
		}  
		if(igst == ''){		
		    alert("Enter igst % value");
		    return false;
		}
		if(igst_amt == ''){		
		    alert("Enter igst amt");
		    return false;
		}  
		if(tds == ''){		
		    alert("Enter tds % value");
		    return false;
		}
		if(tds_amt == ''){		
		    alert("Enter tds amt");
		    return false;
		}  
		if(total_amt == ''){		
		    alert("Enter total amt");
		    return false;
		}  
		if(deliveryDate == ''){		
		    alert("Enter deliveryDate");
		    return false;
		}  
				
		if(billNo == ''){		
		    alert("Enter bill No");
		    return false;
		}  
				
		if(billDate == ''){		
		    alert("Enter bill Date");
		    return false;
		}
		/*  if(chequeNo == ''){		
		    alert("Enter cheque No");
		    return false;
		}  
		if(payMentDate == ''){		
		    alert("Enter payMent Date");
		    return false;
		}  */
		  if(invoicefile == '' && filename == ''){		
		    alert("Upload file");
		    return false;
		} 
				
		if(remarks == ''){		
		    alert("Enter remarks");
		    return false;
		}
		
		return true;
	}
	
</script>	
<script language="Javascript">
function isNumberKey3(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#cgst").keyup(function() {
				    var a = $("#Amount").val();
				    if(a == ''){
						 alert("Please Enter Amount");
						 return false;
					 }
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#cgst_amt").val(total);
				    }
				    
			  return true;
		}); 
		}
} 

function isNumberKey4(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		 if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#sgst").keyup(function() {
				    var a = $("#Amount").val();
				    if(a == ''){
						 alert("Please Enter Amount");
						 return false;
					 }
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#sgst_amt").val(total);
				    }
				    
			  return true;
		}); 
		}
} 
function isNumberKeyx(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		 if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#igst").keyup(function() {
				    var a = $("#Amount").val();
				    if(a == ''){
						 alert("Please Enter Amount");
						 return false;
					 }
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#igst_amt").val(total);
				    }
				    
			  return true;
		}); 
		}
} 
function istdsdeduction(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		 if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#tds").keyup(function() {
				    var a = $("#Amount").val();
				    if(a == ''){
						 alert("Please Enter Amount");
						 return false;
					 }
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#tds_amt").val(total);
				    }
				    
			  return true;
		}); 
		}
} 
function total1(){  
	 var amount = document.forms["form1"]["Amount"].value; 
	 var cgstAmt = document.forms["form1"]["cgst_amt"].value;
	 var sgstAmt = document.forms["form1"]["sgst_amt"].value;
	 var igstAmt = document.forms["form1"]["igst_amt"].value;
	 var tdsAmt = document.forms["form1"]["tds_amt"].value;
	 
	 if(amount == ''){
		 alert("Please Enter Amount");
		 return false;
	 }
	 if(cgstAmt == ''){
		 cgstAmt=0;
	 }
	 if(sgstAmt == ''){
		 sgstAmt=0;
	 }
	 if(igstAmt == ''){
		 igstAmt=0;
	 }
	 if(tdsAmt == ''){
		 tdsAmt=0;
	 }
	 
	 var total=+amount + +cgstAmt + +sgstAmt + +igstAmt - +tdsAmt;
	 document.getElementById("total_amt").value =total.toFixed(2);

}
</script>
</head>

<body background="../images/u.jpg">

<form method="post" name="form1" action="UpdatePayment2.jsp" enctype="multipart/form-data">

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

                <input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'>
                </td>
 </tr>
   </table>
<br><br>

<%              String filename=null;
                String id1=request.getParameter("id");
                int id=Integer.parseInt(id1);
                String branchId1=request.getParameter("branchId");
                String todate1=request.getParameter("todate");
                String fromdate1=request.getParameter("fromdate");
				
				Connection conx = null;
				Connection2 dbConnx = new Connection2();
				conx = dbConnx.getConnection2();
				Statement stx=null;
				ResultSet rsx=null; 
				
				  try 
				  {           
			      
			    String queryx =" SELECT DISTINCT s.b_name,mb.m_b_name,u.full_name,`po_number`, `po_date`, `vendorName`, `item_name`, `per_item_amt`, "+
					           " `quantity`, `cgst_per`, `cgst_amt`, `sgst_per`, `sgst_amt`, `amount`, `total_amt`, `cheque_no`,`tds_per`,`tds_amt`, "+
					           " `payment_date`, `delivery_date`, `bill_no`, `bill_date`, `remarks`, `file_path`,s.`id`, `igst_per`, `igst_amt`,`initiator` "+
					           " FROM procurement_payment c "+  
							   " INNER JOIN branch_master s ON c.branchId = s.id"+
							   " INNER JOIN leavemanagement.user u ON c.initiator = u.emp_id"+
							   " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
							   "  WHERE c.id='"+id+"' ";
			       
				   stx = conx.createStatement();
				   rsx = stx.executeQuery(queryx);  
				   
			while(rsx.next()){ 
	    	     String path=rsx.getString("file_path");
	                filename=path.substring(path.lastIndexOf("/")+1);
	       %>

<table  align="center" border="1" width="90%" style="margin-left:110px;"> 
   
    <tr>
        <td ><span style="color:red;">*</span>Location:</td>                   
        <td ><input type="text" name="amount" id="amount" size="25" value="<%=rsx.getString("b_name")%>" readonly>
        <input type="hidden" name="location" id="location" size="25" value="<%=rsx.getString("id")%>" readonly></td>
        <td><span style="color:red;">*</span>Po Number:</td>
        <td><input type="text" name="ponumber" id="ponumber" readonly value="<%=rsx.getString("po_number")%>" size="25" ></td>
        <td><span style="color:red;">*</span>Po Date:</td>
        <td><input type="text" name="podate" id="podate" size="25" value="<%=rsx.getString("po_date")%>" readonly>
                <input type="hidden" name="id" id="id" size="25" value="<%=id%>" readonly>
                <input type="hidden" name="initiator" id="initiator"  value="<%=rsx.getString("initiator")%>">
        </td>	
        <td ><b style="color:red">*</b>Vendor Name</td>
        <td><input type="text" name="vendorName" id="vendorName" size="40" value="<%=rsx.getString("vendorName")%>" readonly></td>
        
     </tr>
     <tr>
             <td ><b style="color:red">*</b>Description of Item</td>
			 <td><input type="text" name="item_desc" id="item_desc" size="40" value="<%=rsx.getString("item_name")%>" readonly></td>			
             <td><span style="color:red;">*</span>Per Item Amount:</td>
		     <td><input type="text" name="per_itemAmt" id="per_itemAmt" value="<%=rsx.getString("per_item_amt")%>" size="25" readonly></td>     
	         <td><span style="color:red;">*</span>Quantity:</td>
		     <td><input type="text" name="quantity" id="quantity" value="<%=rsx.getString("quantity")%>" size="25" readonly></td>
	         <td><span style="color:red;">*</span>Amount:</td>
		     <td><input type="text" name="Amount" id="Amount" size="25" value="<%=rsx.getString("amount")%>" readonly></td>    
			
    </tr>
    <tr>
		    <td><span style="color:red;">*</span>CGST %</td>
	        <td><input type="text" name="cgst" id="cgst" size="4" value="<%=rsx.getString("cgst_per")%>" onkeypress="return isNumberKey3(event)">&nbsp &nbsp
	           <input type="text" name="cgst_amt" id="cgst_amt" size="15" value="<%=rsx.getString("cgst_amt")%>" readonly></td>
	        <td><span style="color:red;">*</span>SGST %</td>
            <td><input type="text" name="sgst" id="sgst" size="4" value="<%=rsx.getString("sgst_per")%>" onkeypress="return isNumberKey4(event)">&nbsp &nbsp
            <input type="text" name="sgst_amt" id="sgst_amt" value="<%=rsx.getString("sgst_amt")%>" size="10" readonly></td>
            <td><span style="color:red;">*</span>IGST %</td>
            <td><input type="text" name="igst" id="igst" size="4" value="<%=rsx.getString("igst_per")%>" onkeypress="return isNumberKeyx(event)">&nbsp &nbsp
            <input type="text" name="igst_amt" id="igst_amt" value="<%=rsx.getString("igst_amt")%>" size="12" readonly></td>
	        <td><span style="color:red;">*</span>TDS Deduction %</td>
            <td><input type="text" name="tds" id="tds" size="4" value="<%=rsx.getString("tds_per")%>" onkeypress="return istdsdeduction(event)">&nbsp &nbsp
            <input type="text" name="tds_amt" id="tds_amt" value="<%=rsx.getString("tds_amt")%>" size="12" readonly></td>
	        
     </tr>
     <tr>  
            <td><span style="color:red;">*</span>Total Amount:</td>
	        <td><input type="text" name="total_amt" id="total_amt" size="25"  onclick="return total1()"></td>
		    <td><span style="color:red;">*</span>Delivery Date:</td>
	        <td><input type="text" name="deliveryDate" id="deliveryDate" value="<%=rsx.getString("delivery_date")%>" size="25" ></td>
	        <td><span style="color:red;">*</span>Bill No:</td>
	        <td><input type="text" name="billNo" id="billNo" value="<%=rsx.getString("bill_no")%>" size="25" ></td>
	        <td><span style="color:red;">*</span>Bill Date:</td>
	        <td><input type="text" name="billDate" id="billDate" value="<%=rsx.getString("bill_date")%>" size="25" ></td>
	        
            
    </tr>
    <tr>  
            <td>Cheque Number:</td>
	        <td><input type="text" name="chequeNo" id="chequeNo" value="<%=rsx.getString("cheque_no")%>" size="25" readonly></td>
	        <td>Payment Date:</td>
	        <td><input type="text" name="payMentDate" id="payMentDate" value="<%=rsx.getString("payment_date")%>" size="25" readonly></td>
	        <td colspan="2"><span style="color:red;">*</span>
	         Upload Invoice File:<input type="file" name="invoicefile" id="file1"/><br>
	         <a href="DownloadFile.jsp?f=<%=rsx.getString("file_path")%>"><%=filename%></a>
	         <input type="hidden" name="filepath" id="filepath" value="<%=rsx.getString("file_path")%>" ">
	         <input type="hidden" name="filename" id="filename" value="<%=filename%>" >
	         </td>
	       <td><span style="color:red;">*</span>Remarks:</td>
	       <td colspan="6"><textarea rows="4" cols="40" name="remarks" id="remarks" readonly><%=rsx.getString("remarks")%></textarea></td>
   </tr>
   <tr>  <% }
            } catch (SQLException ex) {
                                         ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     conx.close();
                            	}%>
         <th colspan="8"> 
           <input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp <input type="reset" value="Reset">        
       </th>
   </tr>
   </table><br><br>
   <!-- <div align="center">
       <input style="size: 1;" type="button" title="Back To Selection Date Page" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div>
  <br> -->
  <div id="resultFromAjax2" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
        <div id="resultFromAjax5" style="display:none;"></div>
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
  <br>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>