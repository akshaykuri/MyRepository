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
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- 
 <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> 

<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.min.js"></script>
 -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
 
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
function totalamount(){
	     var id = document.forms["form1"]["norows"].value;
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
<script language="javascript" type="text/javascript">
function Validation(){
				 var location = document.forms["form1"]["location"].value; 
				 var poNumber = document.forms["form1"]["poNumber"].value; 
				 var monthOfPayment = document.forms["form1"]["monthOfPayment"].value;    
				 var totalAmt = document.forms["form1"]["totalAmt"].value; 
				 var vendorName = document.forms["form1"]["vendorName"].value; 
				 
				 
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
				 if(vendorName == "Select"){		
				        alert("Enter vendor Name");
				        return false;
				     }
			
				 var norows = document.forms["form1"]["norows"].value; 
				
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
					 var file="file"+i;
										  
						 var Cartridge1 = document.forms["form1"][Cartridge].value;  
						 var printername1 = document.forms["form1"][printername].value;  
						 var cost1 = document.forms["form1"][cost].value;  
						 var quantity1 = document.forms["form1"][quantity].value;  
						 var amount1 = document.forms["form1"][amount].value; 
						 var invoiceno = document.forms["form1"][invoiceno].value; 
						 var invoiceAmt = document.forms["form1"][invoiceAmt].value; 
						 var invoiceDate = document.forms["form1"][invoiceDate].value; 
						 var files = document.forms["form1"][file].value; 
							
						 
						 
						 if(Cartridge1 == 'Select'){		
						     alert("select Cartridge");
						     return false;
						    }  
						  
						 if(printername1 == ''){		
								alert("Enter "+Cartridge1+" model printer name");
								return false;
							} 
						 if(cost1 == ''){		
						        alert("Enter "+Cartridge1+" model cost");
						        return false;
						     }
						 if(quantity1 == ''){		
								alert("enter "+Cartridge1+" model Quantity");
								return false;
							} 
						 if(amount1 == ''){		
						        alert("Enter "+Cartridge1+" model  Amount");
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
						 if(files == ''){		
								alert("Enter  "+Cartridge1+" model files");
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
    	  $('.date1').datepicker( { changeMonth: true, changeYear: true,  dateFormat: 'yy-mm-dd' }).val(); 
    	});
    	
    });	
</script>
 <script type="text/javascript">
function date(){
	
	
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
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("-","  ");
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
<script type="text/javascript">
function add()
         {
	        var i = mytable.rows.length;
	        i=i-1;
	             document.getElementById("norows").value = i;
                 document.getElementById("mytable").insertRow(-1).innerHTML = 
                	    '<td>'+
                	    '<% Connection con2 = null;
                	    Connection2 dbConn2 = new Connection2();
 						con2 = dbConn2.getConnection2();
                        Statement st2=null;
                        ResultSet rs2=null;
                        try
                        { String query1 = "select * from catridge_master";
                        st2 = con2.createStatement();
                        rs2= st2.executeQuery(query1); %>'+
                        '<select name="Cartridge" id="Cartridge'+i+'" onchange="getCost(this.value,'+i+')">'+
		                '<option >Select</option>'+
	                    '<%while(rs2.next()){%>'+
			            '<option value="<%=rs2.getString(3)%>"><%=rs2.getString(3)%></option>'+
    	                '<%}%>'+
	                    '</select>'+
                        '<%} catch (SQLException ex) {
                        	ex.printStackTrace();
                                   }
                           finally{
	                       
		                         con2.close();
                            }%>'+
	                    '</td>'+
                	    '<td><input type="text" name="printername" id="printername'+i+'"  readonly="readonly"></td>'+
        				'<td><input type="text" name="cost" id="cost'+i+'" readonly="readonly" size="6"></td>'+
        				'<td><input type="text" name="quantity" id="quantity'+i+'" class="number-only" onkeypress="return isNumberKey1(event,'+i+')" size="10"></td>'+
        				'<td><input type="text" name="amount" id="amount'+i+'" readonly="readonly"	size="20"></td>'+
        				'<td><input type="text" name="invoiceno" id="invoiceno'+i+'" size="20"></td>'+
        				'<td><input type="text" name="invoiceAmt" id="invoiceAmt'+i+'" class="number-only" size="13" onkeypress="return isNumberKey(event)" maxlength="10" ></td>'+
        			    '<td><input type="text" name="invoiceDate" id="invoiceDate'+i+'" class="date'+i+'" readonly size="10"></td>'+
        				'<td><input type="text" name="chequeno" id="chequeno'+i+'" size="20"></td>'+
        				'<td><input type="text" name="chequeamt" id="chequeamt'+i+'" size="13" onkeypress="return isNumberKey(event)"></td>'+
        			    '<td><input type="text" name="chequeDate" id="chequeDate'+i+'"  class="date1'+i+'" readonly size="10"></td>	'+
        			    '<td><input type="file" name="invoicefile" id="file'+i+'"/> ';
	                    $(".date"+i).datepicker( { dateFormat: 'yy-mm-dd' });   
	                    $(".date1"+i).datepicker( { dateFormat: 'yy-mm-dd' });
    }

function del(){ 
		        var rowCount = mytable.rows.length;
		        var i = rowCount - 1;
		        var aa=rowCount-3;
		        if(aa == 0){
		        	aa=1;
		        }
		        document.getElementById("norows").value =aa ;
	            if(i<=2){   alert("Atleast one row mandatory");  }
                else{ mytable.deleteRow(i); }        
              }
</script>  
</head>

<body background="../images/u.jpg">
<br><br>
<form method="post" name="form1" action="InsertCatridge.jsp" enctype="multipart/form-data">
<input type="hidden" name="xyz" id="xyz" >
<input type="hidden" name="norows" id="norows" value="1">
<input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'>
 
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/logo.png" height="35" width="220"> </td>
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

<table width="1118" align="center" border="1" style="margin-left:110px;"> 
<tr>
	
			<td ><b style="color:red">*</b>Location</td>
			<td colspan="2"> 
		
			<%                      
                             Connection con = null;
 							 Connection2 dbConn = new Connection2();
 							 con = dbConn.getConnection2();
 							
                             Statement st3=null;
                             ResultSet rs3=null; 
                             String bNo=(String)session.getAttribute("b_no");
                             String query=null;
                             
                           try
                              {
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
                           	   
                            	  query = "select * from branch_master b1 where b1.b_no in(30,31,53,32,11) ORDER BY b_name";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query = "select * from branch_master b1 where b1.b_no in(10) ORDER BY b_name";
                              }
                              if(bNo.equals("54")){ 
                              	   
                            	  query = "select * from branch_master b1 where b1.b_no in(54,44) ORDER BY b_name";
                              }
                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query = "select * from branch_master b1 where b1.b_no ='"+bNo+"' ORDER BY b_name";
                              }
                              // String query = "select * from branch_master ORDER BY b_name";
                               st3 = con.createStatement();
                               rs3 = st3.executeQuery(query);
                              %>
                <select name="location" id="location" onchange="getBranchNo(this.value)" >
		        <option >Select</option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
			        
    	            <%
    	          
	              }%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con.close();
                            	}%>
                            <input type="hidden" name="branchNo" id="branchNo" > 	
				
				</td>
			    <td><b style="color:red"></b>PO Number</td>
				<td><input type="text" name="poNumber" id="poNumber" size="20" placeholder="enter po number" onkeyup="sendInfo(this.value)">	</td>
				<td><b style="color:red">*</b>Purchase Date</td>
				<td><input type="text" name="monthOfPayment" id="monthOfPayment" size="10"  readonly></td>
				<td><b style="color:red">*</b>Vendor Name</td>
				<td colspan="4">
				 <%          ResourceBundle dbProperties = ResourceBundle.getBundle("nepldb");
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
                               String query1 = "SELECT * FROM `vendormaster` order by `vname`";
                               st4 = con4.createStatement();
                               rs4 = st4.executeQuery(query1);
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
                            	}%>
				</td>	
				
		</tr>
		<tr>
		    <td colspan="12">
<table  align="center" border="1" width="20%" id="mytable" class="input-fields">
	<tr><td colspan="12">
		          <button type="button" onclick="add()" ><b style="color:blue">Add</b></button> &nbsp &nbsp &nbsp &nbsp    
                  <button type="button" onclick="del()"><b style="color:blue">Delete</b></button> 
                  
		    </td>
	   </tr>
	    <tr>
				<td><b style="color:red">*</b>Cartridge Model</td>
				<td><b style="color:red">*</b>Printer Name</td>
				<td><b style="color:red">*</b>Cost</td>
			    <td><b style="color:red">*</b>Quantity</td>
				<td><b style="color:red">*</b>Amount</td>
				<td><b style="color:red">*</b>Invoice No</td>
			    <td><b style="color:red">*</b>Invoice Amountt</td>
			    <td><b style="color:red">*</b>Invoice Date</td>
			    <td><!-- <b style="color:red">*</b> -->Cheque No</td>
			    <td><!-- <b style="color:red">*</b> -->Cheque Amount</td>
			    <td><!-- <b style="color:red">*</b> -->Cheque Date</td>
			    <td><b style="color:red">*</b> Invoice File</td>
	  </tr>
	  <tr>			
				<td><%                                        
                             Connection con1 = null;
 							 Connection2 dbConn1 = new Connection2();
 							 con1 = dbConn.getConnection2();
 							
                             Statement st1=null;
                             ResultSet rs1=null; 
                           try
                              {
	                           
                               String query1 = "select * from catridge_master";
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query1);
                              %>
                <select name="Cartridge" id="Cartridge1" onchange="getCost(this.value,1)">
		        <option >Select</option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
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
				<td><input type="text" name="printername" id="printername1"  readonly="readonly"></td>
				<td><input type="text" name="cost" id="cost1" readonly="readonly" size="6"></td>
				<td><input type="text" name="quantity" id="quantity1" class="number-only" onkeypress="return isNumberKey1(event,1)" size="10"></td>
				<td><input type="text" name="amount" id="amount1" readonly="readonly"	size="20"></td>
				<td><input type="text" name="invoiceno" id="invoiceno1" size="20"></td>
				<td><input type="text" name="invoiceAmt" id="invoiceAmt1" class="number-only" size="13" onkeypress="return isNumberKey(event)" maxlength="10" ></td>
			    <td><input type="text" name="invoiceDate" id="invoiceDate1" class="date"  readonly size="10"></td>
				<td><input type="text" name="chequeno" id="chequeno1" size="20"></td>
				<td><input type="text" name="chequeamt" id="chequeamt1" size="13" onkeypress="return isNumberKey(event)"></td>
			    <td><input type="text" name="chequeDate" id="chequeDate1" class="date1" readonly size="10"></td>	
			    <td><input type="file" name="invoicefile" id="file1"/ > </td>
			</tr>
		</table>
		</td></tr>	
	<tr>
	<td colspan="12"> Total Amount &nbsp &nbsp &nbsp &nbsp 
	   <input type="text" name="totalAmt" id="totalAmt" readonly size="30" readonly onclick="return totalamount();" placeholder="click here"></td>
	</tr>
<tr>
	<td colspan="12" align="center" >
	<input type="submit" value="Submit" name="save1" id="save" onclick="return Validation();">&nbsp &nbsp 
	<input type="reset" value="Reset"></td>
</tr>
   
    </table>
  <!--  <div align="center"><br><br>
      <input style="size: 1;" type="button" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div> -->

  
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
