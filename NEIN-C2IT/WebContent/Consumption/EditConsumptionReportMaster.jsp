<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<!-- <script>
$(document).ready(function() {
	
$('#type').change(function () {
	var value = document.forms["form1"]["type"].value;
    if(value == "Office") {
    	document.forms["form1"]["empno"].value = "";		
    	document.forms["form1"]["empname"].value = "";	
    	$('#Other1').hide();
        $('#Other2').hide();
        $('#Other3').hide();
        $('#Other4').hide();
        	
    } else {
    	$('#Other1').show();
        $('#Other2').show();
        $('#Other3').show();
        $('#Other4').show();
    }
    });
});
</script>
<script language="javascript" type="text/javascript">
$( document ).ready(function() {
	var value = document.forms["form1"]["type"].value;
    if(value == "Office") {
    	document.forms["form1"]["empno"].value = "";		
    	document.forms["form1"]["empname"].value = "";	
        $('#Other1').hide();
        $('#Other2').hide();
        $('#Other3').hide();
        $('#Other4').hide();
        	
    } else {
    	$('#Other1').show();
        $('#Other2').show();
        $('#Other3').show();
        $('#Other4').show();
    }
});
</script> -->
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
	    /*  if(type != 'Office')	{ */
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

<body>
<form method="post" name="form1" action="UpdateConsumptionReportMaster.jsp">

 <br><br>

<table  align="center" border="1" width="80%"> 
<%
                String id=request.getParameter("id");
				Connection con1 = null;
				Connection2 dbConn1 = new Connection2();
				con1 = dbConn1.getConnection2();
				
				String status=null;
				int sumcount=0;
				Statement st1=null;
				ResultSet rs1=null; 
				try
				{
				
					String query1 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
		                            "`number`, `relationnumber`,monthlycharges, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
		                            "INNER JOIN branch_master b ON b.id=m.branchId "+
		                            "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo  where m.id='"+id+"'";
				st1 = con1.createStatement();
				rs1 = st1.executeQuery(query1);
		%>
		<%      while(rs1.next()){
		
		               status=rs1.getString("status"); 
		           %>
     <tr>
        <td><span style="color:red;">*</span>Type:</td>
		<td ><select name="type" id="type">
		        <option value="<%=rs1.getString("type")%>"><%=rs1.getString("type")%></option>
	            <option value="Office">Office</option>
	            <option value="User">User</option>
	            <option value="Residential">Residential</option>
	           </select>
	    </td>	
	</tr>		           
   <tr >
        <td ><span style="color:red;">*</span>Emp No:</td> <!-- id="Other1" style="display:none", id="Other2" style="display:none" -->
		<td ><input type="text" name="empno" id="empno" value="<%=rs1.getString("empno")%>" onkeyup="sendInfo(this.value)"  size="40" maxlength="4"> 
         <input type="hidden" name="id" id="id"  value="<%=rs1.getString("id1")%>" > </td>
		 <!-- id="Other3" style="display:none",id="Other4" style="display:none" --> 
		<td ><span style="color:red;">*</span>Emp Name:</td>
		<td ><input type="text" name="empname" id="empname"  value="<%=rs1.getString("empname")%>" size="40" ></td>	
	</tr>
    <tr>	
		<td><span style="color:red;">*</span>Location:</td>
		<td>
		<%                      
                             Connection con2 = null;
 							 Connection2 dbConn2 = new Connection2();
 							 con2 = dbConn2.getConnection2();
 							
                             Statement st2=null;
                             ResultSet rs2=null; 
                             String query2 =null;
                             String bNo=(String)session.getAttribute("b_no");
                           try
                              {
	                           
                               if(bNo.equals("90")){
                            	   query2 = "SELECT * FROM `branch_master`";
                                 }
                               if(bNo.equals("40")){
                           	   
                            	   query2 = "SELECT * FROM `branch_master`  where b_no in(40,41,52,43,42)";
                                }
                               if(bNo.equals("20")){ 
                           	   
                            	   query2 = "SELECT * FROM `branch_master` where b_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                                }
                               if(bNo.equals("30")){ 
                           	   
                            	   query2 = "SELECT * FROM `branch_master` where b_no in(30,31,53,32,11)";
                           	    
                               }
                               if(bNo.equals("10")){ 
                           	   
                            	   query2 = "SELECT * FROM `branch_master` where b_no in(10)";
                               }
                               if(bNo.equals("54")){ 
                               	   
                            	   query2 = "SELECT * FROM `branch_master` where b_no in(54,44)";
                               }
                               if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){
                            	   query2 = "SELECT * FROM `branch_master` where b_no ='"+bNo+"'";
                               }
                               
                               st2 = con2.createStatement();
                               rs2 = st2.executeQuery(query2);
                              %>
                <select name="location" id="location" onchange="getBranchNo(this.value)">
		        <option value="<%=rs1.getString("branchId")%>"><%=rs1.getString("b_name")%></option>
	              <%while(rs2.next()){%>
			        <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
			        
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
                <input type="hidden" name="branchNo" id="branchNo" value="<%=rs1.getString("branchNo")%>"> 
		</td>		
    
        <td><span style="color:red;">*</span>Number:</td>
		<td><input type="text" name="number" id="number"  value="<%=rs1.getString("number")%>" maxlength="15" size="40"></td>
	</tr>
    <tr>	
		<td><span style="color:red;">*</span>Relationship Number:</td>
		<td><input type="text" name="relationnumber" id="relationnumber" value="<%=rs1.getString("relationnumber")%>" onkeypress="return isNumberKey(event)" maxlength="15" size="40"></td>
		
		<td><span style="color:red;">*</span>ISP Network:</td>
		<td>
        <%                      
                             Connection con3 = null;
 							 Connection2 dbConn3 = new Connection2();
 							 con3 = dbConn3.getConnection2();
 							
                             Statement st3=null;
                             ResultSet rs3=null; 
                           try
                              {
	                           
                               String query3 = "select * from mobile_network";
                               st3 = con3.createStatement();
                               rs3 = st3.executeQuery(query3);
                              %>
                <select name="isptype" id="isptype">
		        <option value="<%=rs1.getString("isptype")%>"><%=rs1.getString("isptype")%></option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString("mobile_network_name")%>"><%=rs3.getString("mobile_network_name")%></option>
			        
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
   </tr>
   <tr>	
		<td><span style="color:red;">*</span>Consumption Type:</td>
		<td>
        <%                      
                             Connection con4 = null;
 							 Connection2 dbConn4 = new Connection2();
 							 con4 = dbConn4.getConnection2();
 							
                             Statement st4=null;
                             ResultSet rs4=null; 
                           try
                              {
	                           
                               String query = "select * from type_master";
                               st4 = con4.createStatement();
                               rs4 = st4.executeQuery(query);
                              %>
                <select name="typename" id="typename">
		        <option value="<%=rs1.getString("typename")%>"><%=rs1.getString("typename")%></option>
	              <%while(rs4.next()){%>
			        <option value="<%=rs4.getString("type_name")%>"><%=rs4.getString("type_name")%></option>
			        
    	            <%
    	          
	              }%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con4.close();
                            	}%>
         </td>
  
		<td><span style="color:red;">*</span>Monthly Rental Charges:</td>
		<td><input type="text" name="monthlycharges" id="monthlycharges" onkeypress="return isNumberKey1(event)" value="<%=rs1.getString("monthlycharges")%>" size="40"></td>		
   </tr>
   <tr>
     <td colspan="4">
         <span style="color:red;">*</span>Status:
         <%if(status.equals("Active")){%>
	         <input type="radio" name="status" id="Active" value="Active" size="40" checked>Active &nbsp &nbsp &nbsp
	         <input type="radio" name="status" id="In-Active" value="In-Active" size="40" >In-Active
	     <%}
         else{
         %>
             <input type="radio" name="status" id="Active" value="Active" size="40" >Active &nbsp &nbsp &nbsp
	         <input type="radio" name="status" id="In-Active" value="In-Active" size="40" checked>In-Active
	     <%} %>
     </td>
     
   </tr>
   <%}%>
		<%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	
		finally{
					}%>
   <tr>
       <td colspan="2" align="center" >
       <input type="submit" value="Submit" name="save1" id="save"  onclick="return (Validation());">&nbsp &nbsp 
       <td colspan="2"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='close' onclick='history.go(-1)'>
       </td>
        
   </tr>
 </table>
        <div id="resultFromAjax5" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
   <br><br>
  
</form>
</body>
</html>