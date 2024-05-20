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
<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=500,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
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
                            
                      		 }
             } 
</script>
<script type="text/javascript">
    $(document).ready(function () {
    	
    	             $("#podate").datepicker(  { changeMonth: true, changeYear: true, yearRange: '1980:+0', dateFormat: 'yy-mm-dd' }).val(); 
                }); 
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		
		 var circuitid = document.forms["form1"]["circuitid"].value;
		 var linktype = document.forms["form1"]["linktype"].value; 
		 var location = document.forms["form1"]["location"].value; ; 
		 var Lanpool = document.forms["form1"]["Lanpool"].value;  
		 var Wanpool = document.forms["form1"]["Wanpool"].value; 
		 var Account_Relationship = document.forms["form1"]["Account_Relationship"].value;  
		 var Bandwidth = document.forms["form1"]["Bandwidth"].value;  
		 var Media = document.forms["form1"]["Media"].value;  
		 var ARC = document.forms["form1"]["ARC"].value; 
		 var OTC = document.forms["form1"]["OTC"].value; 
		 var pono = document.forms["form1"]["ponumber"].value; 
		 var podate = document.forms["form1"]["podate"].value; 
	
		if(circuitid == "Select"){	
			 alert("Select circuitid");
             return false;     
		    }  
		
		if(linktype == "Select"){		
            alert("Select linktype");
            return false;
		  }  		
		  
		if(location == "Select"){		
		    alert("Select location");
		    return false;
		}  
				
		if(Lanpool == ''){		
		    alert("Enter Lanpool");
		    return false;
		}  		
		
		if(Wanpool == ''){		
		    alert("Enter Wanpool");
		    return false;
		}  
				
		if(Account_Relationship == ''){		
		    alert("Enter Account/Relationship No");
		    return false;
		}  		
		
		if(Bandwidth == ''){		
		    alert("Enter Bandwidth");
		    return false;
		}  
				
		if(Media == "Select"){		
		    alert("Select Media");
		    return false;
		}  
				
		if(ARC == ''){		
		    alert("Enter ARC");
		    return false;
		}  
				
		if(OTC == ''){		
		    alert("Enter OTC");
		    return false;
		}
		if(pono == ''){		
		    alert("Enter PO number");
		    return false;
		}  
				
		if(podate == ''){		
		    alert("Enter PO date");
		    return false;
		}  
		
		
		return true;
	}
	
</script>	
<body background="../images/u.jpg">
<form method="post" name="form1" action="UpdateCircuitMaster.jsp">
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="50%">
	<%
	String id=request.getParameter("id");
	System.out.println("c_ida::"+id);
	
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	 try 
	  {
	   Class.forName("com.mysql.jdbc.Driver");
	   conn = DriverManager.getConnection("jdbc:mysql://10.206.10.90:3306/csdb", "root", "");
	     
	   String query1 = "SELECT c.`id`, c.`circuit_Id`, c.`linktype_id`, `branch_id`, `lanpool`, `wanpool`, `Acc_relation_no`, `bandwidth`, `media`,"+
					   "`arc`,`otc`,a.c_id,b1.b_name,`po_number`,`po_date` FROM `circuitidmaster_details` c "+
					   "INNER JOIN circuitidmaster a ON a.circuit_Id=c.circuit_Id "+
					   "INNER JOIN branch_master b1 ON b1.id=c.branch_id "+
					   "where c.id="+id;
	   st = conn.createStatement();
	   rs = st.executeQuery(query1);  %>
	    <tr>
	              
		      <% while(rs.next()){ %>
		          <tr>
	       <td>Circuit Id:</td>
	       <td>      <%          Connection con1 = null;
						         Connection2 dbConn = new Connection2();
						         con1 = dbConn.getConnection2(); 
	       
	                             Statement st1=null;
	                             ResultSet rs1=null; 
	                           try
	                              {
		                           
	                               String query = "SELECT * FROM `circuitidmaster`";
	                               st1 = con1.createStatement();
	                               rs1 = st1.executeQuery(query);
	                              %>
	                <select name="circuitid" id="circuitid" >
			        
			        <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
		              <%while(rs1.next()){%>
				        <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
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
   </tr>   
   <tr>
       <td>Link Type:</td>
       <td>      <%          Connection con2 = null;
					         Connection2 dbConn1 = new Connection2();
					         con2 = dbConn1.getConnection2(); 
                             Statement st2=null;
                             ResultSet rs2=null; 
                           try
                              {
	                            
                               String query = "select * from linktype_master";
                               st2 = con2.createStatement();
                               rs2 = st2.executeQuery(query);
                              %>
                <select name="linktype" id="linktype" >
		        <option value="<%=rs.getString(3)%>"><%=rs.getString(3)%></option>
	              <%while(rs2.next()){%>
			        <option value="<%=rs2.getString(2)%>"><%=rs2.getString(2)%></option>
    	            <%}%>
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
       <td>Location:</td>
               <td>      <%  Connection con3 = null;

			                 Connection2 dbConn3 = new Connection2();
			                 con3 = dbConn3.getConnection2(); 
					         
                             Statement st3=null;
                             ResultSet rs3=null; 
                           try
                              {
	                            
                               String query = "select * from branch_master ORDER BY b_name";
                               st3 = con3.createStatement();
                               rs3 = st3.executeQuery(query);
                              %>
                <select name="location" id="location" >
		        <option value="<%=rs.getString(4)%>"><%=rs.getString(13)%></option>
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
   </tr>
   
    <tr>
       <td>LAN Pool:</td>
       <td><input type="text" name="Lanpool" id="Lanpool" size="35" value="<%=rs.getString(5)%>">
       <input type="hidden" name="id" id="id" size="35" value="<%=rs.getString(1)%>">
       </td>
   </tr>
   
    <tr>
       <td>WAN Pool:</td>
       <td><input type="text" name="Wanpool" id="Wanpool" size="35" value="<%=rs.getString(6)%>"></td>
   </tr>
   
    <tr>
       <td>Account/Relationship No:</td>
       <td><input type="text" name="Account_Relationship" id="Account_Relationship" size="35" value="<%=rs.getString(7)%>"></td>
   </tr>
   
    <tr>
       <td>Band Width:</td>
       <td><input type="text" name="Bandwidth" id="Bandwidth" size="35" value="<%=rs.getString(8)%>"></td>
   </tr>
   
    <tr>
       <td>Media:</td>
       <td><select name="Media" id="Media">
               <option value="<%=rs.getString(9)%>"><%=rs.getString(9)%></option>
               <option value="wired">wired</option>
                <option value="wireless">wireless</option>
               
           </select>
      </td>
   </tr>
   
    <tr>
       <td>ARC:</td>
       <td><input type="text" name="ARC" id="ARC" size="35" value="<%=rs.getString(10)%>"></td>
   </tr>
   
    <tr>
       <td>OTC:</td>
       <td><input type="text" name="OTC" id="OTC" size="35" value="<%=rs.getString(11)%>"></td>
   </tr> 
   <tr>
       <td><span style="color:red;">*</span>Po Number:</td>
       <td><input type="text" name="ponumber" id="ponumber" value="<%=rs.getString(14)%>" size="35" onkeyup="sendInfo(this.value)"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Po Date:</td>
       <td><input type="text" name="podate" id="podate" value="<%=rs.getString(15)%>" size="35"></td>
   </tr>
    <%}%> <div id="resultFromAjax2" style="display:none;"></div>
          <div id="resultFromAjax1" style="display:none;"></div>
          <div id="resultFromAjax5" style="display:none;"></div> 
	     <tr> <br><br>    
        <td><input type="submit" value="Submit" onclick="return (Validation());"></td>
        <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='close' onclick='history.go(-1)'>
       </td></tr>
	     
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
      </form>
  </body>
  </html>