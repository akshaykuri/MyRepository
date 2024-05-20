<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script language="Javascript">
function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
         {
     	     alert("Enter numbers");
             return false;
          }
      else{
          return true;
        }
   } 
</script>
<script type="text/javascript">
    $(document).ready(function () { 
    	$("#billdate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
        $("#fromdate").datepicker( { changeMonth: true, changeYear: true,dateFormat: 'yy-mm-dd' }).val(); 
        $("#todate").datepicker( { changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd' }).val(); 
        $("#invoiceDate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
        $("#chequeDate").datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
    
    });	
</script>  
<script language="Javascript">
/* function total1(){      
				 var amount = document.forms["form1"]["amount"].value; 
				 var tds = document.forms["form1"]["tds"].value;
				 
				 if(amount == ''){
					 alert("Please Enter Amount");
					 return false;
				 }
				 if(tds == ''){
					 alert("Please Enter TDS Percentage");
					 return false;
				 }
				 var total=(amount/100)*tds;
				 document.getElementById("tdsamount").value =total.toFixed(2);
}

function total2(){     
	
			 var amount = document.forms["form1"]["amount"].value; 
			 var tax = document.forms["form1"]["tax"].value;
			 
			 if(amount == ''){
				 alert("Please Enter Amount");
				 return false;
			 }
			 if(tax == ''){
				 alert("Please Enter CGST Percentage");
				 return false;
			 }
			 var total=(amount/100)*tax;
			 document.getElementById("taxamount").value =total.toFixed(2);
}
function total21(){     
	
	 var amount = document.forms["form1"]["amount"].value; 
	 var tax1 = document.forms["form1"]["tax1"].value;
	 
	 if(amount == ''){
		 alert("Please Enter Amount");
		 return false;
	 }
	 if(tax1 == ''){
		 alert("Please Enter SGST Percentage");
		 return false;
	 }
	 var total=(amount/100)*tax1;
	 document.getElementById("taxamount1").value =total.toFixed(2);
} */
function isNumberKeyx(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		 if (charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#tds").keyup(function() {
				    var a = $("#amount").val();
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#tdsamount").val(total);
				    }
				    
			  return true;
		}); 
		}
} 
function isNumberKeyy(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		 if (charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#tax").keyup(function() {
				    var a = $("#amount").val();
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#taxamount").val(total);
				    }
				    
			  return true;
		}); 
		}
} 
function isNumberKeyz(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		 if (charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#tax1").keyup(function() {
				    var a = $("#amount").val();
				    var b = $(this).val();
				    var x=(a/100)*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#taxamount1").val(total);
				    }
				    
			  return true;
		}); 
		}
} 

function total3(){  
				 var amount = document.forms["form1"]["amount"].value; 
				 var tax = document.forms["form1"]["tax"].value;
				 var taxamount = document.forms["form1"]["taxamount"].value;
				 var tax1 = document.forms["form1"]["tax1"].value;
				 var taxamount1 = document.forms["form1"]["taxamount1"].value;
				
				 if(amount == ''){
					 alert("Please Enter Amount");
					 return false;
				 }
				 if(tax == ''){
					 alert("Please Enter CGST Percentage");
					 return false;
				 }
				 if(taxamount == ''){
					 alert("Please Enter CGST Amount");
					 return false;
				 }
				 if(tax1 == ''){
					 alert("Please Enter SGST Percentage");
					 return false;
				 }
				 if(taxamount1 == ''){
					 alert("Please Enter SGST Amount");
					 return false;
				 }
				
				 var total=+amount + +taxamount + +taxamount1;
				 document.getElementById("totalAmt").value =total.toFixed(2);
				 
}

function total4(){
				 var totalAmt = document.forms["form1"]["totalAmt"].value; 
				 var tds = document.forms["form1"]["tds"].value;
				 var tdsamount = document.forms["form1"]["tdsamount"].value; 
				 
				 if(totalAmt == ''){
					 alert("Please Enter totalAmt");
					 return false;
				 }
				
				 if(tds == ''){
					 alert("Please Enter TDS Percentage");
					 return false;
				 }
				 if(tdsamount == ''){
					 alert("Please Enter TDS Amount");
					 return false;
				 }
				 
				 var total=+totalAmt - +tdsamount;
				 document.getElementById("finalAmt").value =total.toFixed(2);
	 
}
</script>
<script>
function getdetails(str){  
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                                       alert("Browser does not support XMLHTTP Request");   
                                       return;     
                                       }      
              
                         var url="GetCircuitBranchDetails.jsp";  
                           url +="?circuitid=" +str;   
                           xmlHttp.onreadystatechange = onstateChange1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }   
         
function onstateChange1()
{     

var str1=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        { 
        
        document.getElementById("resultFromAjax1").innerHTML = str1;
        document.getElementById("Linktype").value =  document.getElementById("p3").value;
        document.getElementById("Location").value =  document.getElementById("p4").value;
        document.getElementById("LAN").value =  document.getElementById("p5").value;
        document.getElementById("WAN").value =  document.getElementById("p6").value;
        document.getElementById("Bandwidth").value =  document.getElementById("p8").value;
        document.getElementById("Media").value =  document.getElementById("p9").value;
        document.getElementById("ARC").value =  document.getElementById("p10").value;
        document.getElementById("OTC").value =  document.getElementById("p11").value;
        document.getElementById("Account_Relationship").value =  document.getElementById("p7").value;
        document.getElementById("b_id").value =  document.getElementById("p12").value;
        document.getElementById("b_no").value =  document.getElementById("p13").value;
        document.getElementById("ponumber").value =  document.getElementById("p14").value;
        document.getElementById("podate").value =  document.getElementById("p15").value;
        document.getElementById("isp_name").value =  document.getElementById("p16").value;
        
        }
   else
        { 
        document.getElementById("resultFromAjax1").innerHTML = str1;
        document.getElementById("Linktype").value = "";
        document.getElementById("Location").value =""; 
        document.getElementById("LAN").value = "";
        document.getElementById("WAN").value = "";
        document.getElementById("Bandwidth").value = "";
        document.getElementById("Media").value =""; 
        document.getElementById("ARC").value = "";
        document.getElementById("OTC").value = "";
        document.getElementById("Account_Relationship").value = "";
        document.getElementById("b_id").value = "";
        document.getElementById("b_no").value = "";
        document.getElementById("ponumber").value = "";
        document.getElementById("podate").value = "";
        document.getElementById("isp_name").value = "";
        }
}
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		var Circuit = document.forms["form1"]["circuitid"].value; 
		var billref = document.forms["form1"]["billref"].value; 
		var billdate = document.forms["form1"]["billdate"].value; 
		var fromdate = document.forms["form1"]["fromdate"].value; 
		var todate = document.forms["form1"]["todate"].value; 
		var amount = document.forms["form1"]["amount"].value; 
		var tds = document.forms["form1"]["tds"].value; 
		var tdsamount = document.forms["form1"]["tdsamount"].value;
		var tax = document.forms["form1"]["tax"].value; 
		var taxamount = document.forms["form1"]["taxamount"].value;
		var totalAmt = document.forms["form1"]["totalAmt"].value; 
		var finalAmt = document.forms["form1"]["finalAmt"].value; 
		
		 
		if(Circuit == "Select"){		
		              alert("Enter CircuitId");
		              return false;
		    }  
		
		if(billref == ''){		
            alert("Enter bill reference number");
            return false;
        }  

		if(billdate == ''){		
            alert("select bill date");
            return false;
       }  

		if(fromdate == ''){		
            alert("Select Period From Date");
            return false;
       }  

		if(todate == ''){		
            alert("Select Period to Date");
            return false;
       }   

		if(amount == ''){		
            alert("Enter Amount");
            return false;
        }  
		  
		if(tds == ''){		
            alert("Enter TDS Percentage");
            return false;
        } 
		if(tdsamount == ''){		
            alert("Enter TDS Amount");
            return false;
        } 
		if(tax == ''){		
            alert("Enter TAXES Percentage");
            return false;
        } 
		if(taxamount == ''){		
            alert("Enter TAXES Amount");
            return false;
        }
		if(totalAmt == ''){		
            alert("Enter Total Invoice Amount");
            return false;
        }  
		if(finalAmt == ''){		
            alert("Enter Total Payable / Less TDS Amount");
            return false;
        }  
		

		return true;
	}
	
</script>	
</head>

<body background="../images/u.jpg">
<form method="post" name="form1" action="UpdateMplsData.jsp"  enctype="multipart/form-data">
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
                <input type="hidden" name="branch_no" id="branch_no" value='<%=session.getAttribute("b_no")%>'>
                
                </td>
 </tr>
   </table>
<br><br>
<table  align="center" border="1" width="70%" style="margin-left:110px;"> 
<%
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
			       String queryx = " SELECT *,s.b_name,mb.m_b_name FROM `mpls_details` c"+  
						           " INNER JOIN branch_master s ON c.branch_id = s.id "+
							       " INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no "+
							       " WHERE mpls_id='"+id+"' ";
				   
				   stx = conx.createStatement();
				   rsx = stx.executeQuery(queryx);  
				   
			while(rsx.next()){ 
	    	     String path=rsx.getString("invoice_file");
	             String filename=path.substring(path.lastIndexOf("/")+1);
	       %>
   <tr><td><span style="color:red;">*</span>Circuit Id:</td><td>
         <%                  Connection con1 = null;
					         Connection2 dbConn = new Connection2();
					         con1 = dbConn.getConnection2(); 
                             Statement st1=null;
                             ResultSet rs1=null; 
                           try
                              {
	                            
                               String bNo=(String)session.getAttribute("b_no");
                               String query =null;
                               //String query = "SELECT * FROM `circuitidmaster_details`";
                               if(bNo.equals("90")){
                                   query = "SELECT * FROM `circuitidmaster_details`";
                                 }
                              if(bNo.equals("40")){
                           	   
	                           	   query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(30,31,53,32,11)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(10)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no in(54,44)";
                              }
                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){
                            	  query = "SELECT * FROM `circuitidmaster_details` c INNER JOIN branch_master b1 ON b1.id=c.`branch_id` where b1.b_no ='"+bNo+"'";
                              }
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query);
                              %>
                <select name="circuitid" id="circuitid"  onchange="getdetails(this.value)">
		       <option value="<%=rsx.getString("circuit_Id")%>"><%=rsx.getString("circuit_Id")%></option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
    	            <%}%> 
	           </select>

                <%
                } catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
        </td>
		<td> <span style="color:red;">*</span>Link Type:</td>
		<td><input type="text" name="Linktype" id="Linktype" value="<%=rsx.getString("linktype_id")%>"  readonly size ="30"></td>
		<td> <span style="color:red;">*</span>ISP Name:</td>
		<td><input type="text" name="isp_name" id="isp_name" value="<%=rsx.getString("isp_name")%>"  readonly size ="30"></td>
		
   </tr>

   <tr>	<td> <span style="color:red;">*</span>Location:</td>
        <td>
            
            <input type="text" name="Location" id="Location" value="<%=rsx.getString("b_name")%>"  readonly size ="30">
		    <input type="hidden" name="initiator" id="initiator" value="<%=rsx.getString("emp_id")%>" >
		    <input type="hidden" name="b_id" id="b_id" value="<%=rsx.getString("branch_id")%>"  readonly size ="30">
		    <input type="hidden" name="b_no" id="b_no"  value="<%=rsx.getString("branch_no")%>" readonly size ="30">
		    <input type="hidden" name="mplsid" id="mplsid"  value="<%=rsx.getString("mpls_id")%>" readonly size ="30">
		    <input type="hidden" name="from" id="from" value="<%=fromdate1%>"  readonly size ="30">
		    <input type="hidden" name="to" id="to"  value="<%=todate1%>" readonly size ="30">
		    <input type="hidden" name="bid" id="bid"  value="<%=branchId1%>" readonly size ="30"></td>
        <td><span style="color:red;">*</span>LAN Pool:</td>   
        <td><input type="text" name="LAN" id="LAN" value="<%=rsx.getString("lanpool")%>"  readonly size ="30"></td>	
		<td><span style="color:red;">*</span>WAN Pool:</td>   
		<td><input type="text" name="WAN" id="WAN" value="<%=rsx.getString("wanpool")%>"  readonly size ="30"></td>
		
   </tr>
   <tr>	<td><span style="color:red;">*</span>Account/Relationship No: </td> 
		<td><input type="text" name="Account_Relationship" value="<%=rsx.getString("acc_relation_no")%>" id="Account_Relationship"  readonly size ="30"></td>	
		<td><span style="color:red;">*</span>BandWidth:</td> 
		<td><input type="text" name="Bandwidth" id="Bandwidth" value="<%=rsx.getString("bandwidth")%>"  readonly size ="30"></td>
		<td><span style="color:red;">*</span>Media: </td>     
		<td><input type="text" name="Media" id="Media" value="<%=rsx.getString("media")%>"  readonly size ="30"></td>
		
   </tr>

   <tr>	<td><span style="color:red;">*</span>ARC:  </td>      
		<td><input type="text" name="ARC" id="ARC" value="<%=rsx.getString("arc")%>"  readonly size ="30"></td>
		<td><span style="color:red;">*</span>OTC: </td>       
        <td><input type="text" name="OTC" id="OTC" value="<%=rsx.getString("otc")%>"  readonly size ="30"></td>	
		<td><span style="color:red;">*</span>PO No:</td>      
		<td><input type="text" name="ponumber" id="ponumber" value="<%=rsx.getString("po_number")%>" readonly  size ="30"></td>
		
   </tr>
    <tr><td><span style="color:red;">*</span>PO date: </td>  
		<td> <input type="text" name="podate" id="podate" value="<%=rsx.getString("po_date")%>" size ="30" readonly> </td>	   
        <td><span style="color:red;">*</span>Bill Ref No: </td>       
        <td><input type="text" name="billref" id="billref" value="<%=rsx.getString("bill_refno")%>"  size ="30"></td>	
		<td><span style="color:red;">*</span>Bill date:</td>      
		<td><input type="text" name="billdate" id="billdate" value="<%=rsx.getString("bill_date")%>" readonly  size ="30"></td>
		
   </tr>
    <tr><td><span style="color:red;">*</span>From Date: </td>  
		<td> <input type="text" name="fromdate" id="fromdate" value="<%=rsx.getString("bill_fdate")%>" size ="30" readonly> </td>	
        <td><span style="color:red;">*</span>To Date: </td>       
        <td><input type="text" name="todate" id="todate"  value="<%=rsx.getString("bill_tdate")%>" readonly size ="30"></td>	
		<td><span style="color:red;">*</span>Amount:</td>      
		<td><input type="text" name="amount" id="amount"  value="<%=rsx.getString("amount")%>" size ="30" onkeypress="return isNumberKey(event)" maxlength="10"></td>
		
   </tr>
   <tr>	<td><span style="color:red;">*</span>TDS %: </td>  
		<td> <input type="text" name="tds" id="tds" value="<%=rsx.getString("tds_percentage")%>" size ="5" onkeypress="return isNumberKeyx(event)" > 
		<input type="text" name="tdsamount" id="tdsamount"  size ="20" value="<%=rsx.getString("tds_amt")%>" readonly ></td>
        <td><span style="color:red;">*</span>CGST %: </td>       
        <td><input type="text" name="tax" id="tax" value="<%=rsx.getString("tax_percentage")%>" size ="5" onkeypress="return isNumberKeyy(event)"> 
        <input type="text" name="taxamount" id="taxamount" size ="20" value="<%=rsx.getString("cgst_amount")%>" readonly ></td>	
        <td><span style="color:red;">*</span>SGST %: </td>       
        <td><input type="text" name="tax1" id="tax1" value="<%=rsx.getString("tax_percentage1")%>" size ="5" onkeypress="return isNumberKeyz(event)"> 
        <input type="text" name="taxamount1" id="taxamount1" size ="20" value="<%=rsx.getString("sgst_amount")%>"  readonly ></td>	
		
	</tr>
	<tr><td><span style="color:red;">*</span>Total Invoice Amount:</td>      
		<td><input type="text" name="totalAmt" id="totalAmt"  placeholder="click here" size ="30" readonly onclick="return total3()"></td>
		<td><span style="color:red;">*</span>Total Payable / Less TDS: </td>  
		<td> <input type="text" name="finalAmt" id="finalAmt" placeholder="click here"  size ="30" readonly onclick="return total4()"> </td>
   
  <%--  <tr>	
        <td><!-- <span style="color:red;">*</span> -->Invoice No: </td>       
        <td><input type="text" name="invoiceno" id="invoiceno" value="<%=rsx.getString(25)%>" size="30"></td>
		<td><!-- <span style="color:red;">*</span> -->Invoice Amount:</td>      
		<td><input type="text" name="invoiceAmt" id="invoiceAmt" value="<%=rsx.getString(26)%>" class="number-only" size="30" onkeypress="return isNumberKey(event)" maxlength="10" ></td>
		<td><!-- <span style="color:red;">*</span> -->Invoice Date: </td>  
		<td><input type="text" name="invoiceDate" id="invoiceDate" value="<%=rsx.getString(27)%>" class="date"  readonly size="30"></td>
   </tr> --%>
  
        <td><!-- <span style="color:red;">*</span> -->Cheque No: </td>       
        <td><input type="text" name="chequeno" id="chequeno" value="<%=rsx.getString("cheque_no")%>" size="30"></td>
		
	</tr>
	<tr><td><!-- <span style="color:red;">*</span> -->Cheque Amount:</td>      
		<td><input type="text" name="chequeamt" id="chequeamt" value="<%=rsx.getString("cheque_amt")%>" size="30" onkeypress="return isNumberKey(event)" maxlength="10"></td>
		<td><!-- <span style="color:red;">*</span> -->Cheque Date: </td>  
		<td><input type="text" name="chequeDate" id="chequeDate" value="<%=rsx.getString("cheque_date")%>" class="date1" readonly size="30"></td>	  
        <td colspan="4">Invoice File:   <input type="file" name="invoicefile" id="file1"/><br>
        <a href="DownloadFile.jsp?f=<%=path%>"><%=filename%></a>
        <input type="hidden" name="file" id="file" value="<%=path%>">
     </td>
   </tr>
                <%
                } 
				 }
				  catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     conx.close();
                            	}%>
   <tr>
      <td colspan="6" align="center"><input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp <input type="reset" value="Reset"></td>
   </tr>
 </table>
  
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
  <div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax1" style="display:none;">
        
       </div>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>

  </table>
</form>
</body>
</html>