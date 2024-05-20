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
	      var group_name = document.forms["form1"]["group_name"].value; 
		  var billfromdate = document.forms["form1"]["billfromdate"].value; 
		  var billtodate = document.forms["form1"]["billtodate"].value; 
		  var monthofpayment = document.forms["form1"]["monthofpayment"].value; 
		 
		  var invoicenumber = document.forms["form1"]["invoicenumber"].value; 
		  var invoicedate = document.forms["form1"]["invoicedate"].value; 
		  var invoicefile = document.forms["form1"]["invoicefile"].value; 


		  if(group_name == "Select"){		
		         alert("Please select Group Name");
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
		 
		/* if(group_name == ''){		
         alert("Enter invoice Amount");
         return false;
         }   */
		
		if(invoicedate == ''){		
         alert("Select invoice date");
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
    	   
    	    var url="GetNumberDetails2.jsp";  
    		    url +="?group_name=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
                             document.getElementById("numbera").innerHTML=xmlHttp.responseText;
                             
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
<form method="post" name="form1" action="InsertConsumptionGroupDetails.jsp" enctype="multipart/form-data">
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

<table  align="center" border="1" width="90%" style="margin-left:110px;"> 
   
   <tr><%int number=0;%><%int number1=0;%>
        <td><span style="color:red;">*</span>Group Name/Number:</td>
		<td>
		
		<%                   Connection con1 = null;
							 Connection2 dbConn = new Connection2();
							 con1 = dbConn.getConnection2(); 
                             Statement st1=null;
                             ResultSet rs1=null; 
                             String aa=null;
                             String bNo=(String)session.getAttribute("b_no");
                             String query = null;
                             String type11=null;
                           try
                              {
	                            
                               if(bNo.equals("90")){
                                    query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null'  AND branchNo in(90) ";
                                  }
                               if(bNo.equals("40")){
                            	   
                            	   query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null'  AND branchNo in(40,41,52,43,42) ";
                                }
                               if(bNo.equals("20")){ 
                            	   
                            	   query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null'  AND branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                               }
                               if(bNo.equals("30")){ 
                            	   
                            	   query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null' AND branchNo in(30,31,53,32,11)";
                               }
                               if(bNo.equals("10")){ 
                            	   
                            	   query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null' AND branchNo in(10)";
                               }
                             if(bNo.equals("54")){ 
                            	   
                            	   query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null' AND branchNo in(54,44)";
                               }
                               if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("54") || bNo.equals("90"))){ 
                            	   query = "SELECT distinct group_name  FROM `consumptionreportmaster` where group_name !='null' AND branchNo ='"+bNo+"'";
                               }
                               
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query);
                              %>
                <select name="group_name" id="group_name" onchange="getNumber(this.value)">
		        <option >Select</option>
	              <%while(rs1.next()){
	            	  //type11=rs1.getString("typename");
	              %>
			        <option value="<%=rs1.getString("group_name")%>">(<%=++number%>) <%=rs1.getString("group_name")%></option>
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
		<%-- <td align="center"><font color="red">OR</font></td>
		<td><span style="color:red;">*</span>Relationship Number:</td>
		<td>
		
		<%                   Connection conz = null;
                             String urlz = "jdbc:mysql://localhost:3306/";
                             String dbz = "csdb";
                             String driverz = "com.mysql.jdbc.Driver";
                             String userNamez ="root";
                             String passwordz="";
                             Statement stz=null;
                             ResultSet rsz=null; 
                             String aaz=null;
                             String bNoz=(String)session.getAttribute("b_no");
                             String queryz = null;
                             String type11z=null;
                           try
                              {
	                           Class.forName(driverz).newInstance();
                               conz = DriverManager.getConnection(urlz+dbz,userNamez,passwordz);
                               if(bNoz.equals("90")){
                                    queryz = "SELECT distinct group_name,typename  FROM `consumptionreportmaster` where group_name like '%null%' AND branchNo in(90) ";
                                  }
                               if(bNoz.equals("40")){
                            	   
                            	   queryz = "SELECT distinct group_name,typename  FROM `consumptionreportmaster` where group_name like '%null%' AND branchNo in(40,41,52,43,42) ";
                                }
                               if(bNoz.equals("20")){ 
                            	   
                            	   queryz = "SELECT distinct group_name,typename  FROM `consumptionreportmaster` where group_name like '%null%' AND branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                               }
                               if(bNoz.equals("30")){ 
                            	   
                            	   queryz = "SELECT distinct group_name,typename  FROM `consumptionreportmaster` where group_name like '%null%' AND branchNo in(30,31,53,32)";
                               }
                               if(bNoz.equals("10")){ 
                            	   
                            	   queryz = "SELECT distinct group_name,typename  FROM `consumptionreportmaster` where group_name like '%null%' AND branchNo in(10,54)";
                               }
                               stz = conz.createStatement();
                               rsz = stz.executeQuery(queryz);
                              %>
                <select name="group_name" id="group_name" onchange="getNumber(this.value)">
		        <option >Select</option>
	              <%while(rsz.next()){
	            	  type11z=rsz.getString("typename");
	              %>
			        <option value="<%=rsz.getString("group_name")%>">(<%=++number1%>) <%=rsz.getString("group_name")%></option>
    	            <%}%> 
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     conz.close();
                            	}%>
		
		
		</td>	 --%>
		 <!-- <td>Relationship Numbers:</td>
	    <td colspan="3">
	         <select name=relationnumber id=relationnumber >
	            <option value=''>Select</option> 
	         </select><br><font color="red">&nbsp &nbsp No need to select any Relationship Numbers this is only for referene of selected group</font>
	    
	    </td> -->
   </tr>
   
   <tr>
   <td colspan="6">
   <div id="numbera">
  <!--  <table border="1" width="100%">
   <tr>
        <td><span style="color:red;">*</span>Relationship Number:</td>
		<td><input type="text" name="relationnumber" id="relationnumber"  readonly> </td>			
        <td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="number" id="number" readonly></td>
		<td><span style="color:red;">*</span>Amount:</td>
		<td><input type="text" name="amount" id="amount" onkeypress="return isNumberKey1(event)"> </td>
    </tr>
    </table> -->
    </div>
    </td>
   </tr>
   <tr>
     <td colspan="5" align="right" Style="color:Blue;">Total Amount</td>
     <td><input type="text" name="totalamt" id="totalamt" onclick="return gettotalamt();" readonly placeholder="cick here">Click here</td>
   </tr>
   <tr>	
		<!-- <td><span style="color:red;">*</span>Consumption Type:</td>
		<td><input type="text" name="typename" id="typename"  readonly > </td>	 -->		
        <td><span style="color:red;">*</span>Billing Date From:</td>
		<td><input type="text" name="billfromdate" id="billfromdate"   readonly></td>
		<td><span style="color:red;">*</span>Billing Date To:</td>
		<td><input type="text" name="billtodate" id="billtodate"   readonly> </td>
		<td><span style="color:red;">*</span>Month Of Payment:</td>
		<td><input type="text" name="monthofpayment" id="monthofpayment"   readonly></td>		
	  </tr>
       <tr>
			
        
        <td><span style="color:red;">*</span> Invoice Number:</td>
		<td><input type="text" name="invoicenumber" id="invoicenumber"   ></td>
		<!-- <td> <span style="color:red;">*</span>Invoice Amount:</td>
		<td><input type="text" name="invoiceamt" id="invoiceamt" onkeypress="return isNumberKey1(event)" size="40" > </td> -->
		<td><span style="color:red;">*</span> Invoice Date:</td>
		<td><input type="text" name="invoicedate" id="invoicedate"   readonly></td>
		<td><!-- <span style="color:red;">*</span> -->Cheque Number:</td>
		<td><input type="text" name="chequenumber" id="chequenumber"   ></td>
	</tr>
    <tr>
        
        
		<!-- <td><span style="color:red;">*</span>Cheque Amount:</td>
		<td><input type="text" name="chequeamt" id="chequeamt" onkeypress="return isNumberKey1(event)" size="40" > </td>	 -->		
        <td><!-- <span style="color:red;">*</span> -->Cheque Date:</td>
		<td><input type="text" name="chequedate" id="chequedate"   readonly></td>	
       <!--  <td ><span style="color:red;">*</span>Current Month Charges:</td>
		<td><input type="text" name="currentmonthamount" id="currentmonthamount" onkeypress="return isNumberKey1(event)" size="40" ></td> -->
        <td colspan="4"><span style="color:red;">*</span>Invoice File:&nbsp &nbsp &nbsp &nbsp
        <input type="file" name="invoicefile" id="invoicefile"></td>
        
   </tr>
   <tr>
      <td colspan="6" align="center" >
         <input type="submit" value="Submit" name="save1" id="save"  onclick="return Validation();">&nbsp &nbsp 
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