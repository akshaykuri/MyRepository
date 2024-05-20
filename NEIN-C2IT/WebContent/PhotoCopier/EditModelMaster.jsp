<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<%@page import = "java.text.DateFormat" %>
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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		
		 var brand = document.forms["form1"]["brand"].value;
		 var modelno = document.forms["form1"]["modelno"].value; 
		 var location = document.forms["form1"]["location"].value; ; 
		 var sno = document.forms["form1"]["sno"].value;  
		 var agreementno = document.forms["form1"]["agreementno"].value; 
		 var agreementdate = document.forms["form1"]["agreementdate"].value;
		 var agreementsdate = document.forms["form1"]["agreementsdate"].value;  
		 var vendortype = document.forms["form1"]["vendortype"].value;  
		 var agreementedate = document.forms["form1"]["agreementedate"].value; 
		 var rentamt = document.forms["form1"]["rentamt"].value; 
		// var txtamt = document.forms["form1"]["txtamt"].value; 
		 var machinetype = document.forms["form1"]["machinetype"].value; 
		 var fcblack = document.forms["form1"]["fcblack"].value; 
		 var fccolor = document.forms["form1"]["fccolor"].value; 
		 var fccolorprint = document.forms["form1"]["fccolorprint"].value; 
		 var chargefcblack = document.forms["form1"]["chargefcblack"].value; 
		 var chargefccolor = document.forms["form1"]["chargefccolor"].value; 
		 var chargefccolorprint = document.forms["form1"]["chargefccolorprint"].value; 
		 var fca3 = document.forms["form1"]["fca3"].value; 
		 var chargea3 = document.forms["form1"]["chargea3"].value
		 var installed = document.forms["form1"]["installed"].value;
	
		 if(brand == ''){	
			 alert("Enter brand name");
             return false;     
		    }  
		
		if(modelno == ''){		
            alert("Enter model number");
            return false;
		  }  		
		  
		if(location == ''){		
		    alert("Select location");
		    return false;
		}  
				
		if(sno == ''){		
		    alert("Enter Serial number");
		    return false;
		}  		
		
		if(agreementno == ''){		
		    alert("Enter Agreement no");
		    return false;
		}  
				
		if(agreementdate == ''){		
		    alert("Enter Agreement date ");
		    return false;
		}  		
		
		if(agreementsdate == ''){		
		    alert("Select Agreement start date");
		    return false;
		}  
		if(installed == ''){		
		    alert("Select installed date");
		    return false;
		}	
		if(vendortype == "Select"){		
			alert("Select Vendor Type");
		    return false;
		}  
		if(vendorname == "Select"){		
			alert("Select vendorname");
		    return false;
		}  
				
		if(agreementedate == ''){		
			alert("Select Agreement end date");
		    return false;
		}  
				
		if(rentamt == ''){		
		    alert("Enter rent amount");
		    return false;
		}
		/* if(txtamt == ''){		
		    alert("Enter Tax amount");
		    return false;
		}
		 */
		if(fcblack == ''){		
			alert("Enter Free Copies of BA4");
		    return false;
		}  
		if(fca3 == ''){		
			alert("Enter Free Copies of BA3");
		    return false;
		}  
		if(chargefcblack == ''){		
			alert("Enter charge cost of BA4");
		    return false;
		}  
			
		if(chargea3 == ''){		
			alert("Enter charge cost of BA3");
		    return false;
		} 
		if(machinetype == "Select"){			
			alert("Select machine type");
		    return false;
		} 
	
	  if(machinetype == "Colour"){		
		 
		if(fccolorprint == ''){		
		    alert("Enter Free Copies of CA4");
		    return false;
		}
		if(fccolor == ''){		
		    alert("Enter Free Copies of CA3 ");
		    return false;
		}
		if(chargefccolorprint == ''){		
		    alert("Enter charge cost of CA4");
		    return false;
		}
		if(chargefccolor == ''){		
		    alert("Enter charge cost of CA3");
		    return false;
		}
	 }
		
		return true;
	}
	
</script>	
 <script type="text/javascript">
$(document).ready(function () {
	
    $("#agreementdate").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val();  
	
	$("#agreementsdate").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val(); 
	
	$("#agreementedate").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val();  
	
	$("#installed").datepicker({ changeMonth: true, changeYear: true,  dateFormat: 'dd-mm-yy' }).val();
	
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
       
</script>
<script language="Javascript">
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
<script language="Javascript">
function check_dd() {
	var type = document.forms["form1"]["machinetype"].value; 
	
	if(type == 'Colour'){
		$("#colortype1").show();
		$("#colortype2").show();
		$("#chargecolortype1").show();
		$("#chargecolortype2").show();
	}
	else{
		document.getElementById("fccolorprint").value =0;		
		document.getElementById("fccolor").value =0;		
		document.getElementById("chargefccolorprint").value =0;		
		document.getElementById("chargefccolor").value =0;		
		$("#colortype1").hide();
		$("#colortype2").hide();
		$("#chargecolortype1").hide();
		$("#chargecolortype2").hide();
	}

}
</script>
<script language="Javascript">
function onLoadOfPage()
 {
var type = document.forms["form1"]["machinetype"].value; 
	
	if(type == 'Colour'){
			$("#colortype1").show();
			$("#colortype2").show();
			$("#chargecolortype1").show();
			$("#chargecolortype2").show();
	}
	else{
		document.getElementById("fccolorprint").value =0;		
		document.getElementById("fccolor").value =0;		
		document.getElementById("chargefccolorprint").value =0;		
		document.getElementById("chargefccolor").value =0;		
		
			$("#colortype1").hide();
			$("#colortype2").hide();
			$("#chargecolortype1").hide();
			$("#chargecolortype2").hide();
	}
	}
	
</script>
</head>

<form method="post" name="form1" action="UpdateModelMaster.jsp">
<br />
<br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="50%">
<%
String id=request.getParameter("id");
System.out.println("id::"+id);

Connection conn=null;
Statement st=null;
ResultSet rs=null;
 try 
  {
		Connection2 dbConn = new Connection2();
		conn = dbConn.getConnection2();
     
   String query1 = "SELECT c.`id`, c.`branch_id`, `brand`,`vendorname`, `modelno`, `serialno`, `agreementno`, DATE_FORMAT(`agreementdate`,'%d-%m-%Y') as agreementdate, "+
	" DATE_FORMAT(`agreementsdate`, '%d-%m-%Y') as agreementsdate, DATE_FORMAT(`agreementedate`, '%d-%m-%Y') as agreementedate, `vendortype`, `rentamt`, "+
	"`taxamt`,`machinetype`, `freecopyblack`, `freecopycolor`, `freecopycolorprint`, `chargeblackcopy`, `chargecolorcopy`, `chargecolorprint`,"+
	" a.id as branchid,a.b_name,c.freea3,c.chargea3,DATE_FORMAT(`installed_date`, '%d-%m-%Y') as installed_date FROM `photocopier_model_master` c "+
    " INNER JOIN branch_master a ON a.id=c.branch_id "+
    " where c.id="+id;
   
   st = conn.createStatement();
   rs = st.executeQuery(query1);  %>
    <tr>
              
	      <% while(rs.next()){ %>
	         
    <tr>
       <td>Location:</td>
               <td>      <%  Connection con3 = null; 
			                 Connection2 dbCon = new Connection2();
			       		     con3 = dbCon.getConnection2();
                             Statement st3=null;
                             ResultSet rs3=null; 
                             
                             String bNo=(String)session.getAttribute("b_no");
                             String query=null;
                             
                           try
                              {
                        	   
                       		   
                              // String query = "select * from branch_master ORDER BY b_name";
                              
                       		if(bNo.equals("90")){
                                query = "SELECT * FROM `branch_master`";
                              }
                            if(bNo.equals("40")){
                        	   
                        	     query = "SELECT * FROM `branch_master`  where b_no in(40,41,52,43,42)";
                             }
                            if(bNo.equals("20")){ 
                        	   
                        	   query = "SELECT * FROM `branch_master` where b_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                             }
                            if(bNo.equals("30")){ 
                        	   
                        	    query = "SELECT * FROM `branch_master` where b_no in(30,31,53,32,11)";
                        	    
                            }
                            if(bNo.equals("10")){ 
                        	   
                        	    query = "SELECT * FROM `branch_master` where b_no in(10)";
                            }
                            if(bNo.equals("54")){ 
                         	   
                        	    query = "SELECT * FROM `branch_master` where b_no in(54,44)";
                            }
                            if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("54") || bNo.equals("40") || bNo.equals("90"))){ 
                            	query = "SELECT * FROM `branch_master` where b_no ='"+bNo+"'";
                            }
                            
                               st3 = con3.createStatement();
                               rs3 = st3.executeQuery(query);
                              %>
                <select name="location" id="location" >
		        <option value="<%=rs.getString("branchid")%>"><%=rs.getString("b_name")%></option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString("id")%>"><%=rs3.getString("b_name")%></option>
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
   </tr>
   
   <tr>
       <td><span style="color:red;">*</span>Brand:</td>
       <td><input type="text" name="brand" id="brand" value="<%=rs.getString("brand")%>" size="35"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Model No:</td>
       <td><input type="text" name="modelno" id="modelno" value="<%=rs.getString("modelno")%>" size="35"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Serial No:</td>
       <td><input type="text" name="sno" id="sno" value="<%=rs.getString("serialno")%>" size="35"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Agreement No:</td>
       <td><input type="text" name="agreementno" id="agreementno" value="<%=rs.getString("agreementno")%>" size="35"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Agreement Date:</td>
      <td><input type="text" name="agreementdate" id="agreementdate" value="<%=rs.getString("agreementdate")%>" readonly size="35"></td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>Agreement Start Date:</td>
      <td><input type="text" name="agreementsdate" id="agreementsdate" value="<%=rs.getString("agreementsdate")%>" readonly size="35"></td>
   </tr>
    <tr>
       <td><span style="color:red;">*</span>Agreement End Date:</td>
      <td><input type="text" name="agreementedate" id="agreementedate" value="<%=rs.getString("agreementedate")%>" readonly size="35"></td>
   </tr>
    <tr>
       <td><span style="color:red;">*</span>Installed Date:</td>
       <td><input type="text" name="installed" id="installed" value="<%=rs.getString("installed_date")%>" readonly size="35"></td>
   </tr>
   <tr>  <td><span style="color:red;">*</span>Vendor Name :</td>
        <td >      <%        Connection con4 = null;
					         ResourceBundle dbProperties = ResourceBundle.getBundle("nepldb");
					    	 String userName = dbProperties.getString("nepldb.username");
					    	 String password = dbProperties.getString("nepldb.password");
					    	 String url = dbProperties.getString("nepldb.url");
					    	 String driver = dbProperties.getString("nepldb.driverName");
					    	 String dbName = dbProperties.getString("nepldb.dbName");
                             Statement st4=null;
                             ResultSet rs4=null; 
                           try
                              {
	                           Class.forName(driver).newInstance();
                               con4 = DriverManager.getConnection(url+dbName,userName,password);
                               String query2 = "SELECT * FROM `vendormaster` order by `vname`";
                               st4 = con4.createStatement();
                               rs4 = st4.executeQuery(query2);
                              %>
                <select name="vendorname" id="vendorname" >
		        <option value="<%=rs.getString("vendorname")%>"><%=rs.getString("vendorname")%></option>
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
       <td><span style="color:red;">*</span>Vendor Type:</td>
       <td><select name="vendortype" id="vendortype">
               <option value="<%=rs.getString("vendortype")%>"><%=rs.getString("vendortype")%></option>
                <option value="Rented">Rented</option>
                <option value="Owned">Owned</option>
           </select>
      </td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>Machine Type:</td>
      <td><select name="machinetype" id="machinetype" onchange="check_dd();">
              <option value="<%=rs.getString("machinetype")%>"><%=rs.getString("machinetype")%></option>
                <option value="Mono">Mono</option>
                <option value="Colour">Colour</option>
               
           </select>
      </td>
   </tr>
    <tr>
       <td><span style="color:red;">*</span>Free Copies of BA4:</td>
       <td><input type="text" name="fcblack" id="fcblack" size="35" value="<%=rs.getString("freecopyblack")%>" onkeypress="return isNumberKey1(event)" maxlength="10"></td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>charge of BA4:</td>
       <td><input type="text" name="chargefcblack" id="chargefcblack" size="35" value="<%=rs.getString("chargeblackcopy")%>" onkeypress="return isNumberKey(event)" maxlength="10"></td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>Free Copies BA3:</td>
       <td><input type="text" name="fca3" id="fca3" size="35" value="<%=rs.getString("freea3")%>"onkeypress="return isNumberKey1(event)" maxlength="10"></td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>charge of BA3:</td>
       <td><input type="text" name="chargea3" id="chargea3" size="35" value="<%=rs.getString("chargea3")%>"onkeypress="return isNumberKey(event)" maxlength="10"></td>
   </tr>
   <tr id="colortype1">
       <td><span style="color:red;">*</span>Free Copies of CA3:</td>
      <td><input type="text" name="fccolor" id="fccolor" size="35" value="<%=rs.getString("freecopycolor")%>" onkeypress="return isNumberKey1(event)" maxlength="10"></td>
   </tr>
   <tr id="chargecolortype1">
       <td><span style="color:red;">*</span>charge of CA3:</td>
      <td><input type="text" name="chargefccolor" id="chargefccolor" size="35" value="<%=rs.getString("chargecolorcopy")%>" onkeypress="return isNumberKey(event)" maxlength="10"></td>
   </tr>
   <tr id="colortype2">
       <td><span style="color:red;">*</span>Free Copies of CA4:</td> 
      <td><input type="text" name="fccolorprint" id="fccolorprint" size="35" value="<%=rs.getString("freecopycolorprint")%>" onkeypress="return isNumberKey1(event)" maxlength="10"></td>  
   </tr>
  <tr id="chargecolortype2">
       <td><span style="color:red;">*</span>charge of CA4:</td> 
      <td><input type="text" name="chargefccolorprint" id="chargefccolorprint" size="35" value="<%=rs.getString("chargecolorprint")%>" onkeypress="return isNumberKey(event)" maxlength="10"></td>  
   </tr>
 <tr>
       <td><span style="color:red;">*</span>Rent Amount:</td>
      <td><input type="text" name="rentamt" id="rentamt" size="35" value="<%=rs.getString("rentamt")%>" onkeypress="return isNumberKey(event)" maxlength="10"></td>
   </tr>
   <%--  <tr>
       <td><span style="color:red;">*</span>Tax Amount:</td>
      <td><input type="text" name="txtamt" id="txtamt" size="35" value="<%=rs.getString("taxamt")%>" onkeypress="return isNumberKey(event)" maxlength="10"></td>
   </tr> --%>
	     <tr><br><br>    
        <td><input type="hidden" name="cid" id="cid" value="<%=id%>" size="35">
        <input type="submit" name="Submit" value="Update" onclick="return (Validation());" style="background-color:white;font-weight:bold;color:black;"></td>
        <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='close' onclick='history.go(-1)'>
       </td></tr>
	     
	  
          <%}
          }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{ conn.close();
			} %>
      </table>
      </form>