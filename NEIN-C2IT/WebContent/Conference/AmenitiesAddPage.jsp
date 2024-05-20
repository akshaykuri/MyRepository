<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amenities</title>
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" />

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
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
				
				prot.find(".quanc").attr("id","quan"+id); 
				prot.find(".remarksc").attr("id","remarks"+id);
				
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

</head>

<body onload="cleartext()">
<form  name="form"  method="post"  onsubmit="return validate()" action="ConRoomBookingBack.jsp" >
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">AMENITIES</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
              <%--   <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
                
                </td>
 </tr>
</table>
		
		
<div id="multiple1" style="display:block;">
     
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
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
				
		       </td>
		      
		       <td><input type="text" class="quanc" name="quant" id="quan" ></td>
               <td><input type="text" class="remarksc" name="remarks" id="remarks">
               </td>
              <!--  <td><input type="text" class="modelc" name="model" id="model" ></td>
               <td><input type="text" class="configc" name="configs" id="config"  /></td> -->
     </tr>
</table>
		
     
     </div>
     
     <table width="100%" border="0" align="center" bgcolor="#d2f7f3">
                              <tr>
	                          	<td style="size:1">
	                          	     <center>
			                		<input type=submit name="button" value="OK" id="button">
			                		<!-- <input type="button" name="backBtn"  value="BACK" /> -->
		                            <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" />
		                             </center>
		                       </td>
		                      </tr>
	                         </table>
	                         
	 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 
	   