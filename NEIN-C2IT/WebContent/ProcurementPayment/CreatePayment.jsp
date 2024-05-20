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
    	    var url="PoDetails.jsp";  
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
                             document.getElementById("resultFromAjax5").innerHTML = str2;
                             document.getElementById("podate").value =  document.getElementById("p001").value;
                             document.getElementById("vendorName").value =  document.getElementById("p002").value;
                            
                      		 }
             } 
</script>

<script language="Javascript">
function isNumberKey1(evt)
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
   
function isNumberKey2(evt)
{
		 var charCode = (evt.which) ? evt.which : event.keyCode
		if (charCode > 31 && (charCode < 48 || charCode > 57)){
			   alert("Enter numbers");
		      return false;
		   }
		 else{
			  
			   $("#quantity").keyup(function() {
				    var a = $("#per_itemAmt").val();
				    if(a == ''){
						 alert("Please Enter per item Amt");
						 return false;
					 }
				    var b = $(this).val();
				    var x=a*b;
				    var total = parseFloat(x).toFixed( 2 );
				    if(!isNaN(b)){
				    	$("#Amount").val(total);
				    }
				    
			  return true;
		}); 
		}
} 

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
			 /* if(cgstAmt == ''){
				 alert("Please Enter CGST Amount");
				 return false;
			 }
			 if(sgstAmt == ''){
				 alert("Please Enter SGST Amount");
				 return false;
			 } */
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
	    // var mlocation = document.forms["form1"]["mlocation"].value; 
		 var location = document.forms["form1"]["location"].value; 
		 var item_desc = document.forms["form1"]["item_desc"].value; 
		 var vendorName = document.forms["form1"]["vendorName"].value;  
		 var ponumber = document.forms["form1"]["ponumber"].value; 
		 var podate = document.forms["form1"]["podate"].value;  
		 var per_itemAmt = document.forms["form1"]["per_itemAmt"].value;  
		 var quantity = document.forms["form1"]["quantity"].value;  
		 var Amount = document.forms["form1"]["Amount"].value; 
		 /* var cgst = document.forms["form1"]["cgst"].value; 
		 var cgst_amt = document.forms["form1"]["cgst_amt"].value; 
		 var sgst = document.forms["form1"]["sgst"].value; 
		 var sgst_amt = document.forms["form1"]["sgst_amt"].value;  */
		 var total_amt = document.forms["form1"]["total_amt"].value; 
		 /* var deliveryDate = document.forms["form1"]["deliveryDate"].value; 
		  var billNo = document.forms["form1"]["billNo"].value; 
		 var billDate = document.forms["form1"]["billDate"].value;  */
		/*  var chequeNo = document.forms["form1"]["chequeNo"].value; 
		 var payMentDate = document.forms["form1"]["payMentDate"].value;  */
		 /* var invoicefile = document.forms["form1"]["invoicefile"].value;  */
		 var remarks = document.forms["form1"]["remarks"].value; 
		 
		 /* if(mlocation == "Select"){		
			    alert("Select main branch");
			    return false;
			}   */
		 if(location == "Select"){		
		    alert("Select shipping location");
		    return false;
		}  
		if(item_desc == ''){	
			 alert("Select Item Name");
            return false;     
		    } 		
		if(vendorName == ''){	
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
				
		/* if(cgst == ''){		
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
		}   */
				
		if(total_amt == ''){		
		    alert("Enter total amt");
		    return false;
		}  
		/*	 if(deliveryDate == ''){		
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
		} */
		/* if(chequeNo == ''){		
		    alert("Enter cheque No");
		    return false;
		}  
		if(payMentDate == ''){		
		    alert("Enter payMent Date");
		    return false;
		} */
		/* if(invoicefile == ''){		
		    alert("Upload file");
		    return false;
		}  
			 */	
		if(remarks == ''){		
		    alert("Enter remarks");
		    return false;
		}
		
		return true;
	}
	
</script>	
</head>

<body background="../images/u.jpg">

<form method="post" name="form1" action="InsertPayment.jsp" enctype="multipart/form-data">

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

<table  align="center" border="1" width="90%" style="margin-left:110px;"> 



   <%--    <tr>
       <td colspan="2"><span style="color:red;">*</span>Branch :
                     <%      Connection con31 = null;
					         Connection2 dbConn1 = new Connection2();
						     con31 = dbConn1.getConnection2();
                             Statement st31=null;
                             ResultSet rs31=null; 
                             String bNo1=(String)session.getAttribute("b_no");
                             String query1=null; 
                           try
                              {
	                           if(bNo1.equals("90"))
	                               {
                                   query1 = "select * from branch_master_main where  m_b_no in(90,10,20,30,40,31,51,54) order by m_b_no";
                                   }
                               else
                                   {
                            	   query1 = "select * from branch_master_main b1 where b1.m_b_no ='"+bNo1+"'";
                                   }
	                           
                            
                             
                               st31 = con31.createStatement();
                               rs31 = st31.executeQuery(query1);
                              %>
                <select name="mlocation" id="mlocation" >
		        <option >Select</option>
	              <%while(rs31.next()){%>
			        <option value="<%=rs31.getString(3)%>"><%=rs31.getString(2)%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con31.close();
                            	}%>
        </td>
        </tr>
    --%>
    <tr>
       <td colspan="2"><span style="color:red;">*</span>Shipping Location:
                     <%      Connection con3 = null;
					         Connection2 dbConn = new Connection2();
						     con3 = dbConn.getConnection2();
                             Statement st3=null;
                             ResultSet rs3=null; 
                             String bNo=(String)session.getAttribute("b_no");
                             String query=null; 
                           try
                              {
	                            
                               //String query = "select * from branch_master ORDER BY b_name";
                               if(bNo.equals("90")){
                                   query = "select * from branch_master ORDER BY b_name";
                                 }
                              if(bNo.equals("40")){
                           	   
	                           	   query = "select * from branch_master b1 where b1.b_no in(40,41,52,43,42) ORDER BY b_name";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query = "select * from branch_master b1 where b1.b_no in(20,51,21,89,88,22,23,24,25,26,27,28) ORDER BY b_name";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query = "select * from branch_master b1 where b1.b_no in(30,53,32,11) ORDER BY b_name";
                              }
                              if(bNo.equals("54")){ 
                           	   
                           	   /* query = "SELECT * FROM `branch_master` where m_b_no in(54,44)"; */
                           	   query = "select * from branch_master b1 where b1.b_no in(54,44) ORDER BY b_name";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query = "select * from branch_master b1 where b1.b_no in(10) ORDER BY b_name";
                              }
                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query = "select * from branch_master b1 where b1.b_no ='"+bNo+"'";
                              }
                               st3 = con3.createStatement();
                               rs3 = st3.executeQuery(query);
                              %>
                <select name="location" id="location" >
		        <option >Select</option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con3.close();
                            	}%>
        </td>
        <td><span style="color:red;">*</span>Po Number:</td>
        <td><input type="text" name="ponumber" id="ponumber" size="25" ></td> <!--onkeyup="sendInfo(this.value)"-->
        <td><span style="color:red;">*</span>Po Date:</td>
        <td><input type="text" name="podate" id="podate" size="20"></td>
        <td><b style="color:red">*</b>Vendor Name</td>
        <td><input type="text" name="vendorName" id="vendorName" size="45"></td>	
      </tr>
     <tr>         
         <td ><b style="color:red">*</b>Description of Item</td>
         <td ><input type="text" name="item_desc" id="item_desc" size="40"></td>	
         <td><span style="color:red;">*</span>Per Item Amount:</td>
		 <td><input type="text" name="per_itemAmt" id="per_itemAmt" size="25" onkeypress="return isNumberKey1(event)"></td>  
         <td><span style="color:red;">*</span>Quantity:</td>
		 <td><input type="text" name="quantity" id="quantity" size="25" onkeypress="return isNumberKey2(event)"></td>
		 <td><span style="color:red;">*</span>Amount:</td>
		 <td><input type="text" name="Amount" id="Amount" size="25" readonly></td>    
     </tr>
     
				<%--  <%     Connection con14 = null;
                             String url14 = "jdbc:mysql://localhost:3306/";
                             String db14 = "nepldb";
                             String driver14 = "com.mysql.jdbc.Driver";
                             String userName14 ="root";
                             String password14="";
                             Statement st14=null;
                             ResultSet rs14=null; 
                           try
                              {
	                           Class.forName(driver14).newInstance();
                               con14 = DriverManager.getConnection(url14+db14,userName14,password14);
                               String query = "SELECT * FROM `item_masterbom`";
                               st14 = con14.createStatement();
                               rs14 = st14.executeQuery(query);
                              %>
                <select name="item_desc" id="item_desc" >
		        <option >Select</option>
	              <%while(rs14.next()){%>
			        <option value="<%=rs14.getString("item_name")%>"><%=rs14.getString("item_name")%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con14.close();
                            	}%>
				</td>			 --%>
	       
	       
             
				 <%-- <%          Connection con4 = null;
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
                               String query = "SELECT * FROM `vendormaster` order by `vname`";
                               st4 = con4.createStatement();
                               rs4 = st4.executeQuery(query);
                              %>
                <select name="vendorName" id="vendorName" >
		        <option >Select</option>
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
                            	}%> --%>
				
			
     <tr > 
     
     <tr>       
		    <td>CGST %</td>
	        <td><input type="text" name="cgst" id="cgst" size="4" onkeypress="return isNumberKey3(event)">&nbsp &nbsp
	            <input type="text" name="cgst_amt" id="cgst_amt" size="15" readonly></td>
            <td>SGST %</td>
            <td><input type="text" name="sgst" id="sgst" size="4" onkeypress="return isNumberKey4(event)">&nbsp &nbsp
                <input type="text" name="sgst_amt" id="sgst_amt" size="12" readonly></td>
            <td>IGST %</td>
            <td><input type="text" name="igst" id="igst" size="4" onkeypress="return isNumberKeyx(event)">&nbsp &nbsp
                <input type="text" name="igst_amt" id="igst_amt" size="12" readonly></td>
	        <td>TDS Deduction %</td>
            <td><input type="text" name="tds" id="tds" size="4" onkeypress="return istdsdeduction(event)">&nbsp &nbsp
                <input type="text" name="tds_amt" id="tds_amt" size="12" readonly></td> 
	        
    </tr> 
    <tr>
           <td><span style="color:red;">*</span>Total Amount:</td>
	       <td><input type="text" name="total_amt" id="total_amt" size="25" readonly onclick="return total1()" placeholder="click here"></td>
	       <td>Delivery Date:</td>
		   <td><input type="text" name="deliveryDate" id="deliveryDate" size="25"></td>
	       <td>Bill No:</td>
	       <td><input type="text" name="billNo" id="billNo" size="25"></td>
	       <td>Bill Date:</td>
	       <td><input type="text" name="billDate" id="billDate" size="25"></td>
	             
   </tr>
   <tr>
           <td>Cheque Number:</td>
	       <td><input type="text" name="chequeNo" id="chequeNo" size="25"></td>	       
	       <td>Payment Date:</td>
	       <td><input type="text" name="payMentDate" id="payMentDate" size="25"></td>
	       <td colspan="2">Upload Invoice File:<input type="file" name="invoicefile" id="file1"/></td>
	       <td><span style="color:red;">*</span>Remarks:</td>
	       <td colspan="2"><textarea rows="4" cols="35" name="remarks" id="remarks"></textarea></td>
   </tr>
   <tr>
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