<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  ;
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<head>

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Conference room Booking</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> 
  <link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" /> 

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>


      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>


<!-- <link rel="stylesheet"href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">  -->
<script>
$(function() 
		  {   $( "#date1,#date2" ).datepicker({
		       changeMonth:true,
		       changeYear:true,
		       yearRange:"-50:+50",
		       dateFormat:"yy-mm-dd" });
		   });
</script>
 
 <style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
</style>

<style>
			.dynatable1 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable1 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable1 .prototype1 {
				display:none;
			}
</style>

<script>
		var id =0;
		$(document).ready(function() {
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID :"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(value);
				prot.find(".amenc").attr("id","ament"+id);
				
				prot.find(".quanc").attr("id","quant"+id); 
				prot.find(".remarksc").attr("id","aremarks"+id);
				
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("#tr1").remove();
				//alert(id);
				id--;
			});
		});
	</script>
 
 
 

<style>
.black_overlay {
  display: none;
  position: absolute;
  top: 0%;
  left: 0%;
  width: 100%;
  height: 100%;
  background-color: black;
  z-index: 1001;
  -moz-opacity: 0.8;
  opacity: .80;
  filter: alpha(opacity=80);
}
.white_content {
  display: none;
  position: absolute;
  top: 25%;
  left: 25%;
  width: 50%;
  height: 50%;
  padding: 16px;
  border: 16px solid orange;
  background-color: white;
  z-index: 1002;
  overflow: auto;
}
</style>
		

 
 
</head>


<body onload="cleartext()">
<form  name="form"  method="post"  onsubmit="return validateForm()" action="amenitieseditaddback.jsp" >
<br><br>

 
<br>

<center>
 
	 <br />
 


     <table class="dynatable" width="75%" border="1"  cellspacing="0" cellpadding="0" bgcolor="#d2f7f3">
  	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Items</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Quantity</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Remarks</font></td>
		     
	     </tr>
		 <tr class="prototype" id="tr1">
		           <td width="4" align="center" height="21"><button class="remove" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td>
		                <% 
		                Connection con5 = null;
                       /*  String url5 = "jdbc:mysql://localhost:3306/";
                        String db5 = "csdb";
                        String driver5 = "com.mysql.jdbc.Driver";
                        String userName5 ="root";
                        String password5=""; */
                        ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
                        String userName = dbProperties.getString("csdb.username");
                        String password = dbProperties.getString("csdb.password");
                        String url = dbProperties.getString("csdb.url");
                        String driver = dbProperties.getString("csdb.driverName");
                        String dbName = dbProperties.getString("csdb.dbName");
                        // int sumcount=0;
                        Statement st5=null;
                        ResultSet rs5=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con5= DriverManager.getConnection(url+dbName,userName,password);
						
							
						
						String query2 = "select Amenities_name from amenities_master";
						st5 = con5.createStatement();
 						rs5 = st5.executeQuery(query2);
						%>
						
					    <select name="ament" class="amenc" id="ament">
        					<option selected="selected">Select</option>
							<%while(rs5.next()){%>
								
										<option  value="<%=rs5.getString(1)%>"><%=rs5.getString(1)%></option>
    						<%}%>
							</select>
							
								<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
				
		       </td>
		      
		       <td>
		    
		       <input type="text" class="quanc" name="quant" id="quant" ></td>
               <td><input type="text" class="remarksc" name="aremarks" id="aremarks">
               </td>
              <!--  <td><input type="text" class="modelc" name="model" id="model" ></td>
               <td><input type="text" class="configc" name="configs" id="config"  /></td> -->
     </tr>
</table>

		<% 
		                
                        Statement st=null;
                        ResultSet rs=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con5= DriverManager.getConnection(url+dbName,userName,password);
						
						 String booking_no=request.getParameter("id");
	                		System.out.println("bookingggggggggg edit add page----------- :"+booking_no);
	                		
						
						String query2 = "select * from amenities_add where Booking_no='"+booking_no+"'";
						st = con5.createStatement();
 						rs = st.executeQuery(query2);
						%>
						
					  
							<%while(rs.next()){%>
								
										<input type="hidden"  name=id id="id" value="<%=rs.getString("Booking_no")%>" />
    						<%}%>
							
							
								<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
		
     
    
<br>
</center>
 <table width="100%" border="0" align="center" >
                              <tr>
	                          	<td style="size:1">
	                          	     <center>
			                		<input type=submit name="button" value="ADD" id="button" >
			                		<!-- <input type="button" name="backBtn"  value="BACK" /> -->
		                             <input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'>
		                             </center>
		                       </td>
		                      </tr>
	                         </table>

</div>
</div>
</br> 

</body>
</html>