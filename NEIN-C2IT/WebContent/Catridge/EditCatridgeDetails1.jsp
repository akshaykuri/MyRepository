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

<%@ page import = "java.util.ResourceBundle" %>

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
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

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
                             document.getElementById("monthOfPayment").value =  document.getElementById("p001").value;
                            
                      		 }
             } 
</script>

<script language="javascript" type="text/javascript">
function Validation(){
	
				 var location = document.forms["form1"]["location"].value; 
				 var poNumber = document.forms["form1"]["poNumber"].value; 
				 var monthOfPayment = document.forms["form1"]["monthOfPayment"].value; 
				 var totalAmt = document.forms["form1"]["totalAmt"].value; 
				
				
				 if(location == 'Select'){		
				     alert("select location");
				     return false;
				    }  
				 if(poNumber == '' && totalAmt >= 5000){		
				        alert("Enter po Number");
				        return false; 
					}  
				 if(monthOfPayment == ''){		
						alert("Select purchase Date");
						return false;
					} 
				 
				 var norows = mytable.rows.length;
				 norows=norows - 1;
				 
				 var i=0;
				 for(i=1;i<=norows;i++){ 
					
					 var Cartridge="Cartridge"+i;
					 var printername="printername"+i;
					 var cost="cost"+i;
					 var quantity="quantity"+i;
					 var amount="amount"+i;
					 
					 var invoiceno="invoiceno"+i;
					 var invoiceAmt="invoiceAmt"+i;
					 var invoiceDate="invoiceDate"+i;
										  
						 var Cartridge1 = document.forms["form1"][Cartridge].value;  
						 var printername1 = document.forms["form1"][printername].value;  
						 var cost1 = document.forms["form1"][cost].value;  
						 var quantity1 = document.forms["form1"][quantity].value;  
						 var amount1 = document.forms["form1"][amount].value;
						 
						 var invoiceno = document.forms["form1"][invoiceno].value; 
						 var invoiceAmt = document.forms["form1"][invoiceAmt].value; 
						 var invoiceDate = document.forms["form1"][invoiceDate].value;
											               
						 if(Cartridge1 == 'Select'){		
						     alert("select Cartridge");
						     return false;
						    }  
						  
						 if(printername1 == ''){		
								alert("Enter "+Cartridge1+" printer name");
								return false;
							} 
						 if(cost1 == ''){		
						        alert("Enter "+Cartridge1+" cost");
						        return false;
						     }
						 if(quantity1 == ''){		
								alert("enter "+Cartridge1+" Quantity");
								return false;
							} 
						 if(amount1 == ''){		
						        alert("Enter "+Cartridge1+" Amount");
						        return false;
						     }
						 
						 if(invoiceno == ''){		
								alert("Enter  "+Cartridge1+" model invoice no");
								return false;
							} 
						 if(invoiceAmt == ''){		
								alert("Enter  "+Cartridge1+" model invoiceAmt");
								return false;
							} 
						 if(invoiceDate == ''){		
								alert("Enter  "+Cartridge1+" model invoiceDate");
								return false;
							} 
				 }
				 if(totalAmt == ''){		
				        alert("Enter Total Amount");
				        return false;
				     }
				 return true;			 
					
	}
</script>
<script type="text/javascript">
    $(document).ready(function () { 
    	
    	$("#monthOfPayment").datepicker(  { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();
    	
    });
   
    $(document).ready(function () { 
    	var i = 0;
    	$(document).ready(function(){
    	  $('.date').datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();
    	  $('.date1').datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val();
    	});
    	
    });	
</script>
<!-- <script language="javascript" type="text/javascript">
function totalamount(){
	      var norows = mytable.rows.length;
	      norows=norows - 1;
	     var total = 0;
		 for(var i=1;i<=norows;i++){
			   var amount = document.forms["form1"]["amount"+i].value;
			   total=+total + +amount;
			   document.getElementById("totalAmt").value =total;
		     }	 
}
</script>  -->	
<script language="javascript" type="text/javascript">
function totalamount(){
	
	     //var id = document.forms["form1"]["norows"].value;
	      var id = mytable.rows.length;
	      id=id - 1;
	     var total = 0;
		 for(i=1;i<=id;i++){
			   var amount = document.forms["form1"]["invoiceAmt"+i].value;
			   var Cartridge1 = document.forms["form1"]["Cartridge"+i].value;
			   if(amount == ''){		
			        alert("Enter "+Cartridge1+" model Invoice Amount");
			        return false;
			     }
			   total=+total + +amount;
		 }	
		 document.getElementById("totalAmt").value =total;
}
</script> 	
<script>
function getBranchNo(str){  
	
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                                       alert("Browser does not support XMLHTTP Request");   
                                       return;     
                                       }      
             
                           var url="GetBranchNo.jsp";  
                           url +="?branchid=" +str;   
                           xmlHttp.onreadystatechange = onstateChange;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }   
         
function onstateChange()
{     

var str1=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        { 
        document.getElementById("resultFromAjax1").innerHTML = str1;
        document.getElementById("branchNo").value =  document.getElementById("p1").value;
        
        }
   else
        { 
        document.getElementById("resultFromAjax1").innerHTML = str1;
        document.getElementById("branchNo").value = "";
        
        }
}
</script>
<script>
function getCost(str,i){  
	document.getElementById("xyz").value = i;
	if (typeof XMLHttpRequest != "undefined"){  xmlHttp= new XMLHttpRequest(); }
	else if (window.ActiveXObject){ xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");    }  
	    if (xmlHttp==null){   
                             alert("Browser does not support XMLHTTP Request");   
                              return;     
                           } 
	    
             var url="GetCatridgeCost.jsp";  
             url +="?catridge="+str+"&id="+i;   
             xmlHttp.onreadystatechange = onstateChange1;
             xmlHttp.open("GET", url, true);   
             xmlHttp.send(null);    
         }   
         
function onstateChange1()
{   
 var id=document.getElementById("xyz").value;
		var str1=xmlHttp.responseText;
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		        { 
		        document.getElementById("resultFromAjax2").innerHTML = str1;
		        document.getElementById("cost"+id).value =  document.getElementById("p2").value;
		        document.getElementById("printername"+id).value =  document.getElementById("p3").value;
		        
		        }
		   else
		        {
		        document.getElementById("resultFromAjax3").innerHTML = str1;
		        document.getElementById("cost"+id).value = "";
		        document.getElementById("printername"+id).value = "";
		        
		        }
}
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
       
    </script>
<script language="Javascript">
function isNumberKey1(evt,i)
       {
	          var charCode = (evt.which) ? evt.which : event.keyCode
	          if (charCode > 31 && (charCode < 48 || charCode > 57)){
	        	   alert("Enter numbers");
	               return false;
	            }
	          else{ 
	        	   $('#quantity'+i).keyup(function() {
	        		    var a = $('#cost'+i).val();
	        		    var b = $(this).val();
	        		    var x=a * b;
	        		    var total = parseFloat(x).toFixed( 2 );
	        		    if(!isNaN(b)){
	        		    	$('#amount'+i).val(total);
	        		    }
	        	  return true;
	       }); 
       }
  }    
</script>

</head>

<body background="../images/u.jpg">
<br><br>
<form method="post" name="form1" action="UpdateCat1.jsp" enctype="multipart/form-data">
<input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'>
<input type="hidden" name="xyz" id="xyz">
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

<table  align="center" border="1" width="75%" style="margin-left:110px;"> 
         <%
                String id1=request.getParameter("id");
                int id=Integer.parseInt(id1);
                String fromdate1=request.getParameter("fromdate");
                String todate1=request.getParameter("todate");
               
				Connection con1 = null;
				Connection2 dbConn1 = new Connection2();
				con1 = dbConn1.getConnection2();
				Statement st1=null;
				ResultSet rs1=null; 
				
				Connection conx = null;
				Connection2 dbConnx = new Connection2();
				conx = dbConnx.getConnection2();
				Statement stx=null;
				ResultSet rsx=null; 
				float total=0;
				
				String filename=null;
				  try 
				  {           
			       String query1 = " SELECT Distinct b.b_name,c.po_number,c.month_of_payment,c.vendor_name,c.branch_no,c.branch_id,c.totalAmt,c.empid FROM `catridge_details` c"+
			                       " INNER JOIN `branch_master` b ON b.id=c.`branch_id`  WHERE c.`id`="+id ;
				   
				   st1 = con1.createStatement();
				   rs1 = st1.executeQuery(query1);  %>
              
	      <% while(rs1.next()){ 
	              total=rs1.getFloat("totalAmt");
	      %>
	<tr> 
			<td><b style="color:red">*</b>Location :  </td>
			<td colspan="2"> 
		
			<%                      
                             Connection con2 = null;
 							 Connection2 dbConn2 = new Connection2();
 							 con2 = dbConn2.getConnection2();
 							
                             Statement st2=null;
                             ResultSet rs2=null; 
                             String bNo=(String)session.getAttribute("b_no");
                             String query2=null;
                           try
                              {
	                           
                               //String query2 = "select * from branch_master ORDER BY b_name";
                        	   if(bNo.equals("90")){
                                   query2 = "select * from branch_master ORDER BY b_name";
                                 }
                              if(bNo.equals("40")){
                           	   
	                           	   query2 = "select * from branch_master b1 where b1.b_no in(40,41,52,43,42) ORDER BY b_name";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query2 = "select * from branch_master b1 where b1.b_no in(20,51,21,89,88,22,23,24,25,26,27,28) ORDER BY b_name";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query2 = "select * from branch_master b1 where b1.b_no in(30,31,53,32,11) ORDER BY b_name";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query2 = "select * from branch_master b1 where b1.b_no in(10) ORDER BY b_name";
                              }
                              if(bNo.equals("54")){ 
                              	   
                            	  query2 = "select * from branch_master b1 where b1.b_no in(54,44) ORDER BY b_name";
                              }
                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){
                            	  query2 = "select * from branch_master b1 where b1.b_no ='"+bNo+"' ORDER BY b_name";
                              }
                              /* if(bNo.equals("51")){ 
                              	   
                            	  query2 = "select * from branch_master b1 where b1.b_no in(51) ORDER BY b_name";
                              } */
                               st2 = con2.createStatement();
                               rs2 = st2.executeQuery(query2);
                              %>
                <select name="location" id="location" onchange="getBranchNo(this.value)">
		        <option value="<%=rs1.getInt("branch_id")%>"><%=rs1.getString("b_name")%></option>
	              <%while(rs2.next()){%>
			        <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
			        
    	            <%
    	          
	              }%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
		                     con2.close();
                            	}%>
                            <input type="hidden" name="branchNo" id="branchNo" value="<%=rs1.getInt("branch_no")%>"> 
                            <input type="hidden" name="branchNo1" id="branchNo1" value="<%=rs1.getInt("branch_no")%>">
                            <input type="hidden" name="initiator" id="initiator" value="<%=rs1.getInt("empid")%>">
                            <input type="hidden" name="fromdate" id="fromdate" value="<%=fromdate1%>"> 
                            <input type="hidden" name="todate" id="todate" value="<%=todate1%>"> 		
				</td>
				<td><b style="color:red"></b>PO Number</td>
				<td><input type="text" name="poNumber" id="poNumber" size="15" value="<%=rs1.getString("po_number")%>"  onkeyup="sendInfo(this.value)"></td>
				<td><b style="color:red">*</b>Purchase Date</td>
				<td><input type="text" name="monthOfPayment" id="monthOfPayment" size="10"  value="<%=rs1.getString("month_of_payment")%>" ></td>
				<td><b style="color:red">*</b>Vendor Name</td>
				<td colspan="4">
				 <%          
						     ResourceBundle dbProperties = ResourceBundle.getBundle("nepldb");
							 String userName = dbProperties.getString("nepldb.username");
							 String password = dbProperties.getString("nepldb.password");
							 String url = dbProperties.getString("nepldb.url");
							 String driver = dbProperties.getString("nepldb.driverName");
							 String dbName = dbProperties.getString("nepldb.dbName");
					
				             Connection con4 = null;
                             Statement st4=null;
                             ResultSet rs4=null;
                             
                           try
                              {
	                           Class.forName(driver).newInstance();
                               con4 = DriverManager.getConnection(url+dbName,userName,password);
                               
                               String query = "SELECT * FROM `vendormaster` order by `vname`";
                               st4 = con4.createStatement();
                               rs4 = st4.executeQuery(query);
                               
                              %>
                <select name="vendorName" id="vendorName" >
		        <option value="<%=rs1.getString("vendor_name")%>"><%=rs1.getString("vendor_name")%></option>
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
				</td>	
				
		   </tr>
		        <% }%>
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
		                     con1.close();
                            	}%>
		   <tr>
		   <tr><td colspan="12">
		   <table border="1" id="mytable">
		   <tr>
				<td><b style="color:red">*</b>Cartridge Model</td>
				<td><b style="color:red">*</b>Printer Name</td>
				<td><b style="color:red">*</b>Cost</td>
			    <td><b style="color:red">*</b>Quantity</td>
				<td><b style="color:red">*</b>Amount</td>
				<td><b style="color:red">*</b>Invoice No</td>
			    <td><b style="color:red">*</b>Invoice Amt</td>
			    <td><b style="color:red">*</b>Invoice Date</td>
			    <td><!-- <b style="color:red">*</b> -->Cheque No</td>
			    <td><!-- <b style="color:red">*</b> -->Cheque Amount</td>
			    <td><!-- <b style="color:red">*</b> -->Cheque Date</td>
			    <td><b style="color:red">*</b>Invoice File</td>
	  </tr>
	  <% 
	              try 
				  {           
			       String queryx = " SELECT * FROM `catridge_details`  WHERE `id`="+id ;
				   
				   stx = conx.createStatement();
				   rsx = stx.executeQuery(queryx);
				   int x=1;
	               while(rsx.next()){ 
	            	     String path=rsx.getString("invoice_file");
			             filename=path.substring(path.lastIndexOf("/")+1);
	               %>
	        <tr>
				   <td><%                                        
                             Connection con3 = null;
 							 Connection2 dbConn3 = new Connection2();
 							 con3 = dbConn3.getConnection2();
 							
                             Statement st3=null;
                             ResultSet rs3=null; 
                           try
                              {
	                           
                               String query3 = "select * from catridge_master";
                               st3 = con3.createStatement();
                               rs3 = st3.executeQuery(query3);
                              %>
                <select name="Cartridge" id="Cartridge<%=x%>" onchange="getCost(this.value,<%=x%>)">
		        <option value="<%=rsx.getString("catridge_model")%>"><%=rsx.getString("catridge_model")%></option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString(3)%>"><%=rs3.getString(3)%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
		                     con3.close();
                            	}%>
				</td>
				<td><input type="text" name="printername" id="printername<%=x%>"  readonly="readonly" value="<%=rsx.getString("printer_name")%>" ></td>
				<td><input type="text" name="cost" id="cost<%=x%>"  readonly="readonly" value="<%=rsx.getString("cost")%>" size="10"></td>
				<td><input	type="text" name="quantity" id="quantity<%=x%>" class="number-only" value="<%=rsx.getString("quantity")%>" size="6" onkeypress="return isNumberKey1(event,<%=x%>)"></td>
				<td><input	type="text" name="amount" id="amount<%=x%>"  readonly="readonly" value="<%=rsx.getString("amount")%>" size="15"></td>	
				<td><input type="text" name="invoiceno" id="invoiceno<%=x%>"  value="<%=rsx.getString("invoiceno")%>" size="20"></td>
			    <td><input type="text" name="invoiceAmt" id="invoiceAmt<%=x%>"  class="number-only" value="<%=rsx.getString("invoice_amt")%>" size="13" onkeypress="return isNumberKey(event)" maxlength="10" ></td>				
			    <td><input type="text" name="invoiceDate" id="invoiceDate<%=x%>"  value="<%=rsx.getString("invoice_date")%>"  readonly class="date1"></td>
		        <td><input type="text" name="chequeno" id="chequeno<%=x%>" value="<%=rsx.getString("chequeno")%>" size="20"></td>
		        <td><input type="text" name="chequeamt" id="chequeamt<%=x%>"   value="<%=rsx.getString("chequeAmt")%>" size="13" onkeypress="return isNumberKey(event)"></td>		
				<td><input type="text" name="chequeDate" id="chequeDate<%=x%>"  value="<%=rsx.getString("cheque_date")%>" readonly size="10" class="date"></td>			
			    <td><input type="file" name="invoicefile" id="file"/><br>
			        <input type="hidden"  name="path" id="path" value="<%=path%>">
			        <a href="DownloadFile.jsp?f=<%=path%>"><%=filename%></a>
			        <input type="hidden" name="cid" id="cid" value="<%=rsx.getInt("catridge_id")%>"> 
			        </td>
			   </tr>
			  <%  x++;} 
		           }
				  catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       
		                     conx.close();
                            	}%>
</table></td></tr>
<tr>
	<td colspan="12"> Total Amount &nbsp &nbsp &nbsp &nbsp 
	   <input type="text" name="totalAmt" id="totalAmt"  readonly size="30" readonly onclick="return totalamount();"></td>
	</tr>
<tr>
	<td colspan="12" align="center" >
	     <input type="submit" value="Submit" name="save1" id="save" onclick="return Validation();">&nbsp &nbsp 
         <input type="reset" value="Reset"></td>
</tr>
	
    </table>
  
  <div id="resultFromAjax2" style="display:none;"></div>
  <div id="resultFromAjax1" style="display:none;"></div>
   <div id="resultFromAjax5" style="display:none;"></div>
        <br><br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="javascript:history.back(1)"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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
