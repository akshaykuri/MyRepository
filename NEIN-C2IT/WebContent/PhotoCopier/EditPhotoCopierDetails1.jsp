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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<style type="text/css">
.innertablebg{ background:#E6E6FA;}
</style>
<script language="javascript" type="text/javascript">
function Validation()
	{ 		
		 var chequeNo = document.forms["form1"]["chequeNo"].value;
		 var chequeDate = document.forms["form1"]["chequeDate"].value; 
		 var rinvoicefile = document.forms["form1"]["rinvoicefile"].value; 
		 
		
		 if(chequeNo == ''){	
			 alert("Enter cheque No");
             return false;     
		    }
		 if(chequeDate == 'null'){	
			 alert("Select cheque Date");
             return false;     
		    }  
		 /* if(rinvoicefile == ''){	
			 alert("upload rent invoice file");
             return false;     
		    }   */
		 
	}
</script>
<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=400,width=1300%,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>	
 <script type="text/javascript">
 $(document).ready(function () { 
	
	 $("#chequeDate").datepicker(  { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
	//$("#invoicedate1").datepicker(  { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
	//$("#invoicedate2").datepicker(  { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
	//$("#invoicedate3").datepicker(  { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
	
 });
 
</script>
<script language="Javascript">
 function isNumberKey(evt)
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

 
function isNumberKey1(evt)
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
</head>

<body background="../images/u.jpg">

<form method="post" name="form1" action="UpdatePhotoCopyDetails1.jsp" enctype="multipart/form-data">

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
<br>
<table  align="center" border="1" width="80%" style="margin-left:110px;"> 
<tr>
       <td><span style="color:red;">*</span>Location/Branch:</td>
                    <% 
                             response.setContentType("text/html;charset=UTF-8");
   		                     PrintWriter out1 = response.getWriter();
   		       
   		                     String phid1=request.getParameter("phid");
   		                     int phid=Integer.parseInt(phid1);
   		                    // System.out.println("phid :::;"+phid);
   		                     
   		                     String from=request.getParameter("fromdate");
   		                     String to=request.getParameter("todate");
   		                     
   		                     String month_of_payment=null,cheque_no=null,cheque_date=null;
   		                     String total_amt=null,filename=null,filename3=null;
   		                    
                             Connection con1 = null;
				             Connection2 dbConn = new Connection2();
				             con1 = dbConn.getConnection2();
                             Statement st3=null;
                             ResultSet rs3=null; 
                           try
                              {
	                          
                               String query = "SELECT `ph_id`, `brand`, `modelno`, `serialno`, `agreementno`, `vendorname`,empid,chequeAmt, "+
                               " `vendortype`, `machinetype`, `branch_id`, `branch_no`, `cheque_no`, DATE_FORMAT(`cheque_date`, '%Y-%m-%d') as cheque_date,"+
                               " DATE_FORMAT(`month_of_payment`, '%Y-%m-%d') as month_of_payment,DATE_FORMAT(`createddate`, '%Y-%m-%d') as createddate,"+
                               " `rentamt`, `total_amt`, DATE_FORMAT(`closingdate`, '%Y-%m-%d') as closingdate,DATE_FORMAT(`installeddate`, '%Y-%m-%d') as installeddate,"+
                               " DATE_FORMAT(`openingdate`, '%Y-%m-%d') as openingdate,b.b_name,mb.m_b_no,p.agreementdate,p.agreementsdate,"+
                               " p.agreementedate, `rcgst_per`, `rcgst_amt`, `rsgst_per`, `rsgst_amt`, `rinvoice_no`, `rinvoice_date`, `rinvoice_Amt`, "+
                               " `rinvoice_file` "+
                               " FROM `photocopier_details` p"+
                               " INNER JOIN branch_master b ON p.branch_id = b.id "+
                               " INNER JOIN branch_master_main mb ON b.b_no = mb.m_b_no"+
                               " WHERE `ph_id`='"+phid+"' ";
                               
                               st3 = con1.createStatement();
                               rs3 = st3.executeQuery(query);
                               
                              %>
                
	              <%while(rs3.next()){
	            	  String filepath3=rs3.getString("rinvoice_file");
                  	  filename3=filepath3.substring(filepath3.lastIndexOf("/")+1);
                  	  
	            	  month_of_payment=rs3.getString("month_of_payment");
	            	  cheque_no=rs3.getString("cheque_no");
	            	  cheque_date=rs3.getString("cheque_date");
	            	  total_amt=rs3.getString("total_amt");
	            	  
	              %>
		   <td>
		       <input type="text" name="location" id="location" readonly size="35" value="<%=rs3.getString("b_name")%>">
		       <input type="hidden" name="bid" id="bid" readonly size="35" value="<%=rs3.getString("branch_id")%>">
		       <input type="hidden" name="bno" id="bno" readonly size="35" value="<%=rs3.getString("m_b_no")%>">
		       <input type="hidden" name="phid" id="phid" readonly size="35" value="<%=phid%>">
		       <input type="hidden" name="from" id="from" readonly size="35" value="<%=from%>">
		        <input type="hidden" name="to" id="to" readonly size="35" value="<%=to%>">
		       <input type="hidden" name="createddate"   value="<%=rs3.getString("createddate")%>" >
		       <input type="hidden" name="empid"   value="<%=rs3.getString("empid")%>" >	
		  </td>
		  
		  <td><span style="color:red;">*</span>Machine Type:</td>
          <td><input type="text" name="machinetype" id="machinetype" readonly size="35" value="<%=rs3.getString("machinetype")%>">  </td>
          <td><span style="color:red;">*</span>Vendor Type:</td>
          <td><input type="text" name="vendortype" id="vendortype" readonly size="35" value="<%=rs3.getString("vendortype")%>">  </td>
          
   </tr>
    <tr>
        <td><span style="color:red;">*</span>Brand:</td>
        <td><input type="text" name="brand" id="brand" readonly size="35" value="<%=rs3.getString("brand")%>"></td>
        <td><span style="color:red;">*</span>Model No:</td>
        <td><input type="text" name="modelno" id="modelno" readonly size="35" value="<%=rs3.getString("modelno")%>"></td>
        <td><span style="color:red;">*</span>Serial No:</td>
        <td><input type="text" name="sno" id="sno" readonly size="35" value="<%=rs3.getString("serialno")%>"></td>
        
   </tr>
   <tr>
       <td><span style="color:red;">*</span>Agreement Date:</td>
       <td><input type="text" name="agreementdate" id="agreementdate" readonly size="35" value="<%=rs3.getString("agreementdate")%>"></td>
       <td><span style="color:red;">*</span>Agreement Start Date:</td>
       <td><input type="text" name="agreementsdate" id="agreementsdate" readonly size="35" value="<%=rs3.getString("agreementsdate")%>"> </td>
       <td><span style="color:red;">*</span>Agreement End Date:</td>
       <td><input type="text" name="agreementedate" id="agreementedate" readonly size="35" value="<%=rs3.getString("agreementedate")%>"></td>
    </tr>
   <tr>
       <td><span style="color:red;">*</span>Agreement No:</td>
       <td><input type="text" name="agreementno" id="agreementno" readonly size="35" value="<%=rs3.getString("agreementno")%>"></td>
       <%-- <td><span style="color:red;">*</span>Rent Amount:</td>
       <td><input type="text" name="rentamt" id="rentamt" size="35" readonly value="<%=rs3.getString("rentamt")%>"></td>
       <td><span style="color:red;">*</span>Tax Amount:</td>
       <td><input type="text" name="txtamt" id="txtamt" size="35" readonly value="<%=rs3.getString("taxamt")%>"></td>
      
    </tr>
    <tr >    --%>   
    <td>Vendor Name ::</td>
    <td><input type="text" name="vendorname" id="vendorname" size="35" value="<%=rs3.getString("vendorname")%>" readonly></td>     
       <%-- <td ><span style="color:red;">*</span>Vendor Name :</td>
       <td >      <%          Connection con4 = null;
                             String url4 = "jdbc:mysql://localhost:3306/";
                             String db4 = "nepldb";
                             String driver4 = "com.mysql.jdbc.Driver";
                             String userName4 ="root";
                             String password4="";
                             Statement st4=null;
                             ResultSet rs4=null; 
                           try
                              {
	                           Class.forName(driver4).newInstance();
                               con4 = DriverManager.getConnection(url4+db4,userName4,password4);
                               String query1 = "SELECT * FROM `vendormaster` order by `vname`";
                               st4 = con4.createStatement();
                               rs4 = st4.executeQuery(query1);
                              %>
                <select name="vendorname" id="vendorname" >
		        <option value="<%=rs3.getString("vendorname")%>"><%=rs3.getString("vendorname")%></option>
	              <%while(rs4.next()){%>
			        <option value="<%=rs4.getString("vname")%>"><%=rs4.getString("vname")%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con4.close();
                            	}%>
        </td> --%>
       <td><span style="color:red;">*</span>Rent Amount:</td>
       <td><input type="text" name="rentamt" id="rentamt" size="35" readonly value="<%=rs3.getString("rentamt")%>"></td>
    </tr>
    <tr>  
        <td>Closing Meter Date:</td><td><input type="text" name="closingdate" id="closingdate1" size="35" value="<%=rs3.getString("closingdate")%>" readonly></td>
        <td>Opening Meter Date:</td><td><input type="text" name="openingdate" id="openingdate1" size="35" value="<%=rs3.getString("openingdate")%>" readonly></td>
    <td colspan="2">
       Rent CGST : % <input type="text" name="rcgst_per" id="cgst_per0" size="3" value="<%=rs3.getString("rcgst_per")%>" readonly>
       &nbsp<input type="text" name="rcgst_Amt" id="cgst_Amt0" placeholder="click here"  value="<%=rs3.getString("rcgst_amt")%>"  size="10" readonly>
       &nbsp &nbsp
       Rent SGST : % <input type="text" name="rsgst_per" id="sgst_per0" size="3" value="<%=rs3.getString("rsgst_per")%>" readonly > 
       &nbsp<input type="text" name="rsgst_Amt" id="sgst_Amt0" placeholder="click here"  value="<%=rs3.getString("rsgst_amt")%>"  size="10" readonly>
    </td>
    </tr> 
    <tr> 
          <td colspan="6">
                Rent Invoice No: &nbsp <input type="text" name="rinvoiceno" id="rinvoiceno"  size="15" value="<%=rs3.getString("rinvoice_no")%>" readonly>&nbsp &nbsp &nbsp &nbsp
                Rent Invoice Date: &nbsp <input type="text" name="rinvoicedate" id="rinvoicedate" size="15" value="<%=rs3.getString("rinvoice_date")%>" readonly >    &nbsp &nbsp &nbsp &nbsp
	            Rent Invoice Amt: &nbsp <input type="text" name="rinvoiceAmt" id="rinvoiceAmt"  size="20" value="<%=rs3.getString("rinvoice_Amt")%>" readonly >&nbsp &nbsp &nbsp &nbsp 
	            Rent Invoice File:&nbsp <input type="file" name="rinvoicefile" id="rinvoicefile" readonly>
	            <input type="hidden" name="filepath" id="file" value="<%=rs3.getString("rinvoice_file")%>">
                <a href="DownloadFile.jsp?f=<%=rs3.getString("rinvoice_file")%>" ><%=filename3%></a>
         </td>    
    </tr>
    <tr>
    <td colspan="11">
    <!--  <br><input type="button" value="+" onclick="addRow('dataTable2')"> 
     <input type="button" value="-" onclick="deleteRow('dataTable2')"> -->
    <table border="1" width="70%" class="innertablebg" id="dataTable2">
    <tr>           
       <td ><span style="color:red;">*</span>Photo Type:</td>
       <td><span style="color:red;">*</span>Closing Balance:</td>
       <td><span style="color:red;">*</span>Opening Balance:</td>
       <td><span style="color:red;">*</span>Total Copies:</td>
       <td><span style="color:red;">*</span>Free Copies:</td>
       <td><span style="color:red;">*</span>Extra Copies:</td>
       <td><span style="color:red;">*</span>perCopy:</td>
       <td><span style="color:red;">*</span>Charged:</td>
       <td ><span style="color:red;">*</span>CGST:%</td>
       <td ><span style="color:red;">*</span>CGST Amt</td>
       <td ><span style="color:red;">*</span>SGST:%</td>
       <td ><span style="color:red;">*</span>SGST Amt</td>
       <td><!-- <span style="color:red;">*</span> -->Invoice No:</td>
       <td><!-- <span style="color:red;">*</span> -->Invoice Date:</td>
       <td><!-- <span style="color:red;">*</span> -->Invoice Amt:</td>
       <td><!-- <span style="color:red;">*</span> -->Invoice File:</td>
       </tr>
					       <% Connection con5 = null;
					          Connection2 dbConn5 = new Connection2();
					          con5 = dbConn5.getConnection2();
					          Statement st5=null;
					          ResultSet rs5=null; 
                           try
                              {
	                           
                               String query5 = "SELECT `phs_id`, `ph_id`, `serial_no`, `photo_type`, `closing_balance`, `opening_balance`, "+
                               " `total_copies`, `free_copies`, `extra_copies`, `per_copy_cost`, `charged_amt`, `invoice_no`, "+
                               " DATE_FORMAT(`invoice_date`, '%Y-%m-%d') as invoice_date,filepath,"+
                               " `invoice_amt`,`cgst_per`, `cgst_amt`, `sgst_per`, `sgst_amt` "+
                               " FROM `photocopy_summary` where ph_id='"+phid+"' ";
                               
                               st5 = con5.createStatement();
                               rs5 = st5.executeQuery(query5);
                              
	              while(rs5.next()){
	            	  String filepath1=rs5.getString("filepath");
                  	  filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
   if(rs5.getString("photo_type").equals("BA4")){  %>             
      	                     	
     <tr>
       <td><input type="text" name="phototype" id="phototype1"  value="<%=rs5.getString("photo_type")%>" readonly size="15"></td>    
	   <td><input type="text" name="closingbalance" id="closingbalance1"  value="<%=rs5.getString("closing_balance")%>" size="10" readonly></td>
	   <td><input type="text" name="openingbalance" id="openingbalance1"  value="<%=rs5.getString("opening_balance")%>" size="10" readonly></td>
	   <td><input type="text" name="numberofcopies" id="numberofcopies1"   size="8"  value="<%=rs5.getString("total_copies")%>" readonly></td>
	   <td><input type="text" name="freecopies" id="freecopies1"  size="6" value="<%=rs5.getString("free_copies")%>" readonly></td>
	   <td><input type="text" name="extracopies" id="extracopies1"  size="6" value="<%=rs5.getString("extra_copies")%>" readonly></td>
	   <td><input type="text" name="percopy" id="percopy1"  size="7" value="<%=rs5.getString("per_copy_cost")%>" readonly></td>
	   <td><input type="text" name="charged" id="charged1" size="7" value="<%=rs5.getString("charged_amt")%>" readonly></td>
	   
	   <td><input type="text" name="cgst_per" id="cgst_per1" size="7" value="<%=rs5.getString("cgst_per")%>" readonly></td>
	   <td><input type="text" name="cgst_Amt" id="cgst_Amt1" value="<%=rs5.getString("cgst_amt")%>" readonly size="15" ></td>
	   <td><input type="text" name="sgst_per" id="sgst_per1" size="7" value="<%=rs5.getString("sgst_per")%>" readonly></td>
	   <td><input type="text" name="sgst_Amt" id="sgst_Amt1" value="<%=rs5.getString("sgst_amt")%>"  size="15" readonly></td>
	   
	   <td><input type="text" name="invoiceno" id="invoiceno1"  value="<%=rs5.getString("invoice_no")%>" size="15" readonly></td>
	   <td><input type="text" name="invoicedate" id="invoicedate1" value="<%=rs5.getString("invoice_date")%>" size="10" readonly></td>
	   <td><input type="text" name="invoiceAmt" id="invoiceAmt1"  value="<%=rs5.getString("invoice_amt")%>" size="8" readonly ></td>	   
       <td>
           <!-- <input type="file" name="invoicefile" id="invoicefile3" readonly> -->
           <input type="hidden" name="filepath" id="file" value="<%=rs5.getString("filepath")%>">
           <a href="DownloadFile.jsp?f=<%=rs5.getString("filepath")%>" ><%=filename%></a>
       </td>  
     </tr>
  <% } 
   if(rs5.getString("photo_type").equals("BA3")){  %>             
  	
   <tr>
       <td><input type="text" name="phototype" id="phototype4"  value="<%=rs5.getString("photo_type")%>" readonly size="15"></td>    
	   <td><input type="text" name="closingbalance" id="closingbalance4"  value="<%=rs5.getString("closing_balance")%>" size="10" readonly></td>
	   <td><input type="text" name="openingbalance" id="openingbalance4"  value="<%=rs5.getString("opening_balance")%>" size="10" readonly></td>
	   <td><input type="text" name="numberofcopies" id="numberofcopies4"   size="8"  value="<%=rs5.getString("total_copies")%>" readonly></td>
	   <td><input type="text" name="freecopies" id="freecopies4"  size="6" value="<%=rs5.getString("free_copies")%>" readonly></td>
	   <td><input type="text" name="extracopies" id="extracopies4"  size="6" value="<%=rs5.getString("extra_copies")%>" readonly></td>
	   <td><input type="text" name="percopy" id="percopy4"  size="7" value="<%=rs5.getString("per_copy_cost")%>" readonly></td>
	   <td><input type="text" name="charged" id="charged4" size="7" value="<%=rs5.getString("charged_amt")%>" readonly></td>
	   
	   <td><input type="text" name="cgst_per" id="cgst_per4" size="7" value="<%=rs5.getString("cgst_per")%>" readonly></td>
	   <td><input type="text" name="cgst_Amt" id="cgst_Amt4" value="<%=rs5.getString("cgst_amt")%>" readonly size="15" ></td>
	   <td><input type="text" name="sgst_per" id="sgst_per4" size="7" value="<%=rs5.getString("sgst_per")%>" readonly></td>
	   <td><input type="text" name="sgst_Amt" id="sgst_Amt4" value="<%=rs5.getString("sgst_amt")%>"  size="15" readonly></td>
	   
	   <td><input type="text" name="invoiceno" id="invoiceno4"  value="<%=rs5.getString("invoice_no")%>" size="15" readonly></td>
	   <td><input type="text" name="invoicedate" id="invoicedate4" value="<%=rs5.getString("invoice_date")%>" size="10" readonly></td>
	   <td><input type="text" name="invoiceAmt" id="invoiceAmt4"  value="<%=rs5.getString("invoice_amt")%>" size="8" readonly ></td>	   
       <td>
           <!-- <input type="file" name="invoicefile" id="invoicefile3" readonly> -->
           <input type="hidden" name="filepath" id="file" value="<%=rs5.getString("filepath")%>">
           <a href="DownloadFile.jsp?f=<%=rs5.getString("filepath")%>" ><%=filename%></a>
       </td>  
     </tr>
<% } if(rs5.getString("photo_type").equals("CA3")){  %>    
      <tr>
       <td><input type="text" name="phototype" id="phototype2"  value="<%=rs5.getString("photo_type")%>"readonly size="15"></td>    
	   <td><input type="text" name="closingbalance" id="closingbalance2"  size="10" value="<%=rs5.getString("closing_balance")%>" readonly></td>
	   <td><input type="text" name="openingbalance" id="openingbalance2"  size="10" value="<%=rs5.getString("opening_balance")%>" readonly></td>
	   <td><input type="text" name="numberofcopies" id="numberofcopies2"  size="8"   value="<%=rs5.getString("total_copies")%>" readonly></td>
	   <td><input type="text" name="freecopies" id="freecopies2"  size="6" value="<%=rs5.getString("free_copies")%>" readonly></td>
	   <td><input type="text" name="extracopies" id="extracopies2"  size="6"  value="<%=rs5.getString("extra_copies")%>" readonly></td>
	   <td><input type="text" name="percopy" id="percopy2"  size="7" value="<%=rs5.getString("per_copy_cost")%>" readonly></td>
	   <td><input type="text" name="charged" id="charged2" size="7" value="<%=rs5.getString("charged_amt")%>" readonly></td>
	   
	   <td><input type="text" name="cgst_per" id="cgst_per2" size="7" value="<%=rs5.getString("cgst_per")%>" readonly></td>
	   <td><input type="text" name="cgst_Amt" id="cgst_Amt2" value="<%=rs5.getString("cgst_amt")%>" readonly size="15" ></td>
	   <td><input type="text" name="sgst_per" id="sgst_per2" size="7" value="<%=rs5.getString("sgst_per")%>" readonly></td>
	   <td><input type="text" name="sgst_Amt" id="sgst_Amt2" value="<%=rs5.getString("sgst_amt")%>"  size="15" readonly></td>
	   
	   <td><input type="text" name="invoiceno" id="invoiceno2"  value="<%=rs5.getString("invoice_no")%>" size="15" readonly></td>
	   <td><input type="text" name="invoicedate" id="invoicedate2" size="10" value="<%=rs5.getString("invoice_date")%>" readonly></td>
	   <td><input type="text" name="invoiceAmt" id="invoiceAmt2"  size="8" value="<%=rs5.getString("invoice_amt")%>" readonly ></td>	   
      <td>
          <!-- <input type="file" name="invoicefile" id="invoicefile3" readonly> -->
          <input type="hidden" name="filepath" id="file" value="<%=rs5.getString("filepath")%>">
          <a href="DownloadFile.jsp?f=<%=rs5.getString("filepath")%>" ><%=filename%></a>
      </td>  
      </tr> 
    <% } if(rs5.getString("photo_type").equals("CA4")){  %>   
     <tr>
       <td><input type="text" name="phototype" id="phototype3"  value="<%=rs5.getString("photo_type")%>" readonly size="15"></td>    
	   <td><input type="text" name="closingbalance" id="closingbalance3"   value="<%=rs5.getString("closing_balance")%>" size="10" readonly></td>
	   <td><input type="text" name="openingbalance" id="openingbalance3"  value="<%=rs5.getString("opening_balance")%>" size="10" readonly></td>
	   <td><input type="text" name="numberofcopies" id="numberofcopies3"  size="8"   value="<%=rs5.getString("total_copies")%>" readonly></td>
	   <td><input type="text" name="freecopies" id="freecopies3"  size="6" value="<%=rs5.getString("free_copies")%>" readonly></td>
	   <td><input type="text" name="extracopies" id="extracopies3"  size="6" value="<%=rs5.getString("extra_copies")%>" readonly></td>
	   <td><input type="text" name="percopy" id="percopy3"  size="7" value="<%=rs5.getString("per_copy_cost")%>" readonly></td>
	   <td><input type="text" name="charged" id="charged3" size="7" value="<%=rs5.getString("charged_amt")%>" readonly></td>
	   
	   <td><input type="text" name="cgst_per" id="cgst_per3" size="7" value="<%=rs5.getString("cgst_per")%>" readonly></td>
	   <td><input type="text" name="cgst_Amt" id="cgst_Amt3" value="<%=rs5.getString("cgst_amt")%>" readonly size="15" ></td>
	   <td><input type="text" name="sgst_per" id="sgst_per3" size="7" value="<%=rs5.getString("sgst_per")%>" readonly></td>
	   <td><input type="text" name="sgst_Amt" id="sgst_Amt3" value="<%=rs5.getString("sgst_amt")%>"  size="15" readonly></td>
	   
	   <td><input type="text" name="invoiceno" id="invoiceno3"  value="<%=rs5.getString("invoice_no")%>" size="15" readonly></td>
	   <td><input type="text" name="invoicedate" id="invoicedate" size="10" value="<%=rs5.getString("invoice_date")%>" readonly></td>
	   <td><input type="text" name="invoiceAmt" id="invoiceAmt3"  size="8" value="<%=rs5.getString("invoice_amt")%>" readonly ></td>	   
       <td>
         <!-- <input type="file" name="invoicefile" id="invoicefile3" readonly> -->
         <input type="hidden" name="filepath" id="file" value="<%=rs5.getString("filepath")%>" >
         <a href="DownloadFile.jsp?f=<%=rs5.getString("filepath")%>" ><%=filename%></a>
       </td>  
    </tr> 
    
        <%  }
              } 
	           } catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con5.close();
                            	}%>
    </table>  
    </td></tr>
        <tr><td><span style="color:red;">*</span>Month Of Payment:</td>
	    <td><input type="text" name="monthOfPayment" id="monthOfPayment1" value="<%=rs3.getString("month_of_payment")%>" size="35" readonly></td>
	    <td><span style="color:red;">*</span>Installed Date:</td>
	     <td><input type="text" name="installdate" id="installdate1" value="<%=rs3.getString("installeddate")%>" size="35" readonly></td>
		<td><span style="color:red;">*</span>Total Amount:</td>
		<td><input type="text" name="totalamt" id="totalamt"  size="35"   value="<%=rs3.getString("total_amt")%>"readonly ></td>
			
    </tr>
    <tr>
	    <td><!-- <span style="color:red;">*</span> -->Cheque No:</td>
		<td ><input type="text" name="chequeNo" id="chequeNo" value="<%=rs3.getString("cheque_no")%>" class="number-only" size="35"></td>
		<td><b style="color:red"></b>Cheque Amount :  </td>
		<td><input type="text" name="chequeamt" id="chequeamt"  value="<%=rs3.getString("chequeAmt")%>" size="30" onkeypress="return isNumberKey(event)" placeholder="enter cheque amount">   </td>
		<td><!-- <span style="color:red;">*</span> -->Cheque Date:</td>
		<td><input type="text" name="chequeDate" id="chequeDate" value="<%=rs3.getString("cheque_date")%>" size="35" readonly></td>
		
	</tr>
   <%}
	     } catch (SQLException ex) {
                              ex.printStackTrace();
                               }	
          finally{
	               //	DbUtil.closeDBResources(rs,st,con);
		          con1.close();
              }%>
       <tr> 
       <th colspan="6"> <input type="submit" value="Submit" onclick="return (Validation());"> 
       </th>
   </tr>
   </table><br><br> 
  <!--  <div align="center">
       <input style="size: 1;" type="button" title="Back To Selection Date Page" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div> -->
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