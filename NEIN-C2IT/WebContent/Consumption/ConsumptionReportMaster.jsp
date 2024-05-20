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
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<!-- <script>
$(document).ready(function() {
$('#type').change(function () {
	var value = document.forms["form1"]["type"].value;
    if(value == "Office") {
    	document.forms["form1"]["empno"].value = "";		
    	document.forms["form1"]["empname"].value = "";	
        $('#Other').hide();
        	
    } else {
        $('#Other').show();
    }
    });
});
</script> -->
 <!-- <script language="javascript" type="text/javascript">
$( document ).ready(function() {
	var value = document.forms["form1"]["type"].value;
    if(value == "Office") {
    	document.forms["form1"]["empno"].value = "";		
    	document.forms["form1"]["empname"].value = "";	
        $('#Other').hide();
        	
    } else {
        $('#Other').show();
    }
});
</script> 
 -->
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 var type = document.forms["form1"]["type"].value;
	  // if(type != 'Office'){	
		 var empno = document.forms["form1"]["empno"].value; 
		 var empname = document.forms["form1"]["empname"].value; 
	  //  }
		 var location = document.forms["form1"]["location"].value; 
		 var number = document.forms["form1"]["number"].value; 
		 var relationnumber = document.forms["form1"]["relationnumber"].value; 
		 var isptype = document.forms["form1"]["isptype"].value; 
		 var typename = document.forms["form1"]["typename"].value; 
		 var monthlycharges = document.forms["form1"]["monthlycharges"].value;
		 
		if(type == 'Select'){		
		              alert("Enter Type of Number (User/Office/Residential)");
		              return false;
		    }
	     /* if(type != 'Office')	{ */
				if(empno == ''){		
		            alert("Enter emp no");
		            return false;
		         }  
				if(empname == ''){		
		            alert("Enter empname");
		            return false;
		         } 
	     /* } */
		if(location == 'Select'){		
            alert("Select location");
            return false;
         }  
		if(number == ''){		
            alert("Enter number");
            return false;
         }  
		if(relationnumber == ''){		
            alert("Enter relationship number");
            return false;
        }  
		if(isptype == 'Select'){		
            alert("Select isp network type");
            return false;
        }  
		
		if(typename == 'Select'){		
            alert("Select Consumption type");
            return false;
       } 
		if(monthlycharges == ''){		
            alert("Enter monthly charges");
            return false;
       }  
		return true;
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
    	   
    	    var url="GetUserName.jsp";  
    		    url +="?empid=" +v;
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
                             document.getElementById("empname").value =  document.getElementById("p001").value;
                            
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
<form method="post" name="form1" action="InsertConsumptionReportMaster.jsp">

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

<table  align="center" border="1" width="60%" style="margin-left:110px;"> 
   <tr>
        <td><span style="color:red;">*</span>Type:</td>
		<td ><select name="type" id="type">
		        <option >Select</option>
	            <option value="Office">Office</option>
	            <option value="User">User</option>
	            <option value="Residential">Residential</option>
	           </select>
	    </td>	
	</tr>
	<tr > <!-- id="Other" style="display:none" -->
        <td><span style="color:red;">*</span>Emp No:</td>
		<td><input type="text" name="empno" id="empno" onkeyup="sendInfo(this.value)" size="40" maxlength="4"> </td>
		<td><span style="color:red;">*</span>Emp Name:</td>
		<td><input type="text" name="empname" id="empname" readonly  size="40"></td>	
	</tr>
    <tr>	
		<td><span style="color:red;">*</span>Location:</td>
		<td>
		<%                      
                             Connection con1 = null;
 							 Connection2 dbConn1 = new Connection2();
 							 con1 = dbConn1.getConnection2();
 							 
                             Statement st3=null;
                             ResultSet rs3=null; 
                             String bNo=(String)session.getAttribute("b_no");
                             String query=null;
                             
                           try
                              {
	                           
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
                               if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	   query = "SELECT * FROM `branch_master` where b_no ='"+bNo+"'";
                               }
                               
                               st3 = con1.createStatement();
                               rs3 = st3.executeQuery(query);
                              %>
                <select name="location" id="location" onchange="getBranchNo(this.value)">
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
		                     con1.close();
                            	}%>
                            <input type="hidden" name="branchNo" id="branchNo" > 
		</td>		
    
        <td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="number" id="number" maxlength="15" size="40"></td>
	</tr>
    <tr>	
		<td><span style="color:red;">*</span>Relationship Number:</td>
		<td><input type="text" name="relationnumber" id="relationnumber" onkeypress="return isNumberKey(event)" maxlength="15" size="40"></td>
		
		<td><span style="color:red;">*</span>ISP Network:</td>
		<td>
        <%                      
                             Connection con2 = null;
 							 Connection2 dbConn2 = new Connection2();
 							 con2 = dbConn1.getConnection2();
 							
                             Statement st2=null;
                             ResultSet rs2=null; 
                           try
                              {
	                           
                               String query1 = "select * from mobile_network";
                               st2 = con2.createStatement();
                               rs2 = st2.executeQuery(query1);
                              %>
                <select name="isptype" id="isptype">
		        <option >Select</option>
	              <%while(rs2.next()){%>
			        <option value="<%=rs2.getString("mobile_network_name")%>"><%=rs2.getString("mobile_network_name")%></option>
			        
    	            <%
    	          
	              }%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con2.close();
                            	}%>
         </td>
   </tr>
   <tr>	
		<td><span style="color:red;">*</span>Consumption Type:</td>
		<td>
        <%                      
                             Connection con3 = null;
 							 Connection2 dbConn3 = new Connection2();
 							 con3 = dbConn3.getConnection2();
 							
                             Statement st1=null;
                             ResultSet rs1=null; 
                           try
                              {
	                           
                               String querye = "select * from type_master";
                               st1 = con3.createStatement();
                               rs1 = st1.executeQuery(querye);
                              %>
                <select name="typename" id="typename">
		        <option >Select</option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString("type_name")%>"><%=rs1.getString("type_name")%></option>
			        
    	            <%
    	          
	              }%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con3.close();
                            	}%>
         </td>
  
		<td><span style="color:red;">*</span>Monthly Rental Charges+Tax:</td>
		<td><input type="text" name="monthlycharges" id="monthlycharges" onkeypress="return isNumberKey1(event)" size="40"></td>		
   </tr>
   <tr>
     <td colspan="4">
         <span style="color:red;">*</span>Status:
	     <input type="radio" name="status" id="status" value="Active" size="40" checked>Active &nbsp &nbsp &nbsp
	     <input type="radio" name="status" id="status" value="In-Active" size="40" >In-Active
     </td>
     
   </tr>
   <tr>
      <td colspan="4" align="center" >
         <input type="submit" value="Submit" name="save1" id="save"  onclick="return (Validation());">&nbsp &nbsp &nbsp 
         <input type="reset" value="Reset">&nbsp &nbsp 
         <a href="DisplayConsumptionReportMaster.jsp" onclick="return popitup('DisplayConsumptionReportMaster.jsp')">VIEW ALL</a> 
      </td>
   </tr>
 </table>
        <div id="resultFromAjax5" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
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