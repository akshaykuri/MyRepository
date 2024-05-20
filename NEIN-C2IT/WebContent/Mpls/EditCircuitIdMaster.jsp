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
		 var location = document.forms["form1"]["location"].value; 
		 var isp_name = document.forms["form1"]["isp_name"].value; 
		 var isp_name = document.forms["form1"]["isp_name"].value; 
		 var Lanpool = document.forms["form1"]["Lanpool"].value;  
		 var Wanpool = document.forms["form1"]["Wanpool"].value; 
		 var Account_Relationship = document.forms["form1"]["Account_Relationship"].value;  
		 var Bandwidth = document.forms["form1"]["Bandwidth"].value;  
		 var Media = document.forms["form1"]["Media"].value;  
		 var ARC = document.forms["form1"]["ARC"].value; 
		 var OTC = document.forms["form1"]["OTC"].value; 
		 var pono = document.forms["form1"]["ponumber"].value; 
		 var podate = document.forms["form1"]["podate"].value; 
		 var nickName = document.forms["form1"]["nickName"].value; 
	
		if(circuitid == "Select"){	
			 alert("Select circuitid");
             return false;     
		    }  
		
		if(linktype == "Select"){		
            alert("Select linktype");
            return false;
		  }  		
		if(isp_name == "Select"){	
			 alert("Enter ISP Name");
           return false;     
		    } 
		if(location == "Select"){		
		    alert("Select location");
		    return false;
		}  
		if(isp_name == ''){	
			 alert("Enter ISP Name");
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
		
		if(nickName == '' || nickName == "null"){		
		    alert("Enter nick Name");
		    return false;
		} 
		
		
		return true;
	}
	
</script>	
<script type="text/javascript"> 
$(function () {
    $(".ImpactedMPLS").click(function () {  
    	var id=this.id;
    	var circuitid = document.forms["form1"][id].value;
    	var ImpactedMPLS1 = document.forms["form1"]["ImpactedMPLSIds"].value;
    	
        if (this.checked) {
        	document.getElementById("ImpactedMPLSIds").value =ImpactedMPLS1+","+circuitid;
        }
        else{
        	var aa=","+circuitid;
        	var bb=ImpactedMPLS1.replace(aa, '');
        	document.getElementById("ImpactedMPLSIds").value =bb;
        }
        
    });
});
</script> 

<body background="../images/u.jpg">
<form method="post" name="form1" action="UpdateCircuitMaster.jsp">
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="50%">
	<%
	String id=request.getParameter("id");
	System.out.println("c_ida::"+id);
	String ImpactedMPLS=null;
	
	Connection conn=null;
	Connection2 dbConn = new Connection2();
	 conn = dbConn.getConnection2(); 
	Statement st=null;
	ResultSet rs=null;
	 try 
	  {
	    
	     
	   String query1 = "SELECT c.`id`, c.`circuit_Id`, c.`linktype_id`, `branch_id`, `lanpool`, `wanpool`, `Acc_relation_no`, `bandwidth`, `media`,"+
					   "`arc`,`otc`,a.c_id,b1.b_name,`po_number`,`po_date`,`isp_name`,`nickName`,`ImpactedMPLS` FROM `circuitidmaster_details` c "+
					   "INNER JOIN circuitidmaster a ON a.circuit_Id=c.circuit_Id "+
					   "INNER JOIN branch_master b1 ON b1.id=c.branch_id "+
					   "where c.id="+id;
	   st = conn.createStatement();
	   rs = st.executeQuery(query1);  %>
	    <tr>
	              
		      <% while(rs.next()){ 
		    	  ImpactedMPLS=rs.getString("ImpactedMPLS");		      %>
		          <tr>
	       <td>Circuit Id:</td>
	       <td>      <%          Connection con1 = null; 
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
                             con2 = dbConn.getConnection2(); 
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
                             con3 = dbConn.getConnection2(); 
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
       <td><span style="color:red;">*</span>ISP Name:</td>
               <td>      <%  Connection con13 = null; 
                             con13 = dbConn.getConnection2(); 
                             Statement st13=null;
                             ResultSet rs13=null; 
                           try
                              {
	                            
                               String query11 = "select * from isp_master ORDER BY isp_name";
                               st13 = con13.createStatement();
                               rs13 = st13.executeQuery(query11);
                              %>
                <select name="isp_name" id="isp_name" >
		            <option value="<%=rs.getString("isp_name")%>"><%=rs.getString("isp_name")%></option>
	              <%while(rs13.next()){%>
			        <option value="<%=rs13.getString(2)%>"><%=rs13.getString(2)%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con13.close();
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
   <tr>
       <td><span style="color:red;">*</span>Short Name:</td>
       <td><input type="text" name="nickName" id="nickName" value="<%=rs.getString("nickName")%>" size="35" ></td>
   </tr>
		   <%	Connection con14 = null; 
		        con14 = dbConn.getConnection2(); 
		  		Statement st14=null;
		   		ResultSet rs14=null;
		   		 
		  		Statement st15=null;
		   		ResultSet rs15=null;
		   		
		   		int xyz=0; 
		   		
		   		
		   		
		   try
		   {
		     		    
		    if(ImpactedMPLS == null){
		    	ImpactedMPLS="0";
		    }
		    String ImpactedMPLS1=ImpactedMPLS;
		    String query12 = " select * from circuitidmaster_details where id in ("+ImpactedMPLS1+") AND `linktype_id` = 'MPLS' ORDER BY branch_id";
		    
		    st14 = con14.createStatement();
		    rs14 = st14.executeQuery(query12);  
		     
		    String ImpactedMPLS2=ImpactedMPLS;
		    String query13 = " select * from circuitidmaster_details where id not in ("+ImpactedMPLS2+") AND `linktype_id` = 'MPLS' ORDER BY branch_id";
		     		    
		    st15 = con14.createStatement();
		    rs15 = st15.executeQuery(query13); 
     %>  
    <tr> 
      <td colspan="2">
      <span style="color:red;">Impacted Domestic MPLS Sites:</span><br><br>
       <%
       
       while(rs14.next()){ 
    	   xyz=xyz+1;
    	   String idxyz="ImpactedMPLS"+xyz;
       %>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <input type="checkbox" id="<%=idxyz%>" name="ImpactedMPLS" value="<%=rs14.getString("id")%>" class="ImpactedMPLS" checked> 
            
           <%=rs14.getString("circuit_Id")%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (<%=rs14.getString("nickName")%>) <br>
          
           <%}%>
           <br>
           <span style="color:red;">Not Impacted Domestic MPLS Sites:</span><br><br>
           
           <%
       
       while(rs15.next()){ 
    	   xyz=xyz+1;
    	   String idxyz="affectedServices"+xyz;
       %>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <input type="checkbox" id="<%=idxyz%>" name="ImpactedMPLS" value="<%=rs15.getString("id")%>" class="ImpactedMPLS" > 
            
           <%=rs15.getString("circuit_Id")%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (<%=rs15.getString("nickName")%>) <br>
          
           <%}%>
           
           <input type="hidden" id="ImpactedMPLSIds" name="ImpactedMPLSIds" value="<%=ImpactedMPLS%>" readonly>
      </td>
           <% 
           } 
          catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con14.close();
                            	}%>
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