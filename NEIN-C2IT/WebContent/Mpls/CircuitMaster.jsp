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
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
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
		  
		if(location == "Select"){		
		    alert("Select location");
		    return false;
		}  
		if(isp_name == "Select"){	
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
		if(nickName == ''){		
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
    	var ImpactedMPLSa = document.forms["form1"]["ImpactedMPLSIds"].value;
    	    	
        if (this.checked) { 
        	document.getElementById("ImpactedMPLSIds").value =ImpactedMPLSa+","+circuitid;
        	
        }
        else{
        	var aa=","+circuitid;
        	var bb=ImpactedMPLSa.replace(aa, '');
        	document.getElementById("ImpactedMPLSIds").value = bb;
        }
        
    });
});
</script> 
</head>

<body background="../images/u.jpg">

<form method="post" name="form1" action="InsertCircuitIdBranch.jsp">

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
   </table>
<br><br>

<table  align="center" border="1" width="30%" style="margin-left:110px;"> 
   <tr>
       <td><span style="color:red;">*</span>CircuitId:</td>
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
		        <option >Select</option>
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
       <td><span style="color:red;">*</span>Link Type:</td>
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
		        <option >Select</option>
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
       <td><span style="color:red;">*</span>Location:</td>
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
		        <option >Select</option>
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
		        <option >Select</option>
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
       <td><span style="color:red;">*</span>LAN Pool:</td>
       <td><input type="text" name="Lanpool" id="Lanpool" size="35"></td>
   </tr>
    <tr>
       <td><span style="color:red;">*</span>WAN Pool:</td>
       <td><input type="text" name="Wanpool" id="Wanpool" size="35"></td>
   </tr>   
   <tr>
       <td><span style="color:red;">*</span>Account/Relationship No:</td>
       <td><input type="text" name="Account_Relationship" id="Account_Relationship" size="35"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Band Width:</td>
       <td><input type="text" name="Bandwidth" id="Bandwidth" size="35"></td>
   </tr>
   
    <tr>
       <td><span style="color:red;">*</span>Media:</td>
       <td><select name="Media" id="Media">
               <option>Select</option>
               <option value="wired">wired</option>
                <option value="wireless">wireless</option>
               
           </select>
      </td>
    </tr>
   
    <tr>
       <td><span style="color:red;">*</span>ARC:</td>
       <td><input type="text" name="ARC" id="ARC" size="35"></td>
    </tr>
    <tr>
       <td><span style="color:red;">*</span>OTC:</td>
       <td><input type="text" name="OTC" id="OTC" size="35"></td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>Po Number:</td>
       <td><input type="text" name="ponumber" id="ponumber" size="35" onkeyup="sendInfo(this.value)"></td>
   </tr>
    <tr>
       <td><span style="color:red;">*</span>Po Date:</td>
       <td><input type="text" name="podate" id="podate" size="35"></td>
   </tr>
   <tr>
       <td><span style="color:red;">*</span>Short Name:</td>
       <td><input type="text" name="nickName" id="nickName" size="35" ></td>
   </tr>
		   <%	Connection con14 = null; 
		        con14 = dbConn.getConnection2(); 
		   
		  		Statement st14=null;
		   		ResultSet rs14=null;
		   try
		   {
		     
		    String query12 = " select * from circuitidmaster_details where `linktype_id` = 'MPLS' ORDER BY branch_id";
		    
		    st14 = con14.createStatement();
		    rs14 = st14.executeQuery(query12); 
     %>  
    <tr> 
      <td colspan="2"><span style="color:red;">Impacted Domestic MPLS Sites:</span><br>
       <%int xyz=0;
       while(rs14.next()){ 
    	   xyz=xyz+1;
    	   String idxyz="ImpactedMPLS"+xyz;
       %>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="checkbox" id="<%=idxyz%>" name="ImpactedMPLS" value="<%=rs14.getString("id")%>" class="ImpactedMPLS" > 
           <%=rs14.getString("circuit_Id")%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (<%=rs14.getString("nickName")%>) <br>
          
           <%}%>
           <input type="hidden" id="ImpactedMPLSIds" name="ImpactedMPLSIds" value="0" readonly>
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
   
<tr>
       <th colspan="2"> <input type="submit" value="Submit" onclick="return (Validation());">&nbsp; &nbsp;   
       <input type="reset" value="Reset"> &nbsp; &nbsp; 
       <a href="DisplayCircuitIdMaster.jsp" onclick="return popitup('DisplayCircuitIdMaster.jsp')">VIEW ALL</a> &nbsp; &nbsp;  
       <a href="ExporToExcel.jsp" onclick="return popitup('ExporToExcel.jsp')">ExportTo Excel ALL</a>
      </th>
   </tr>
   </table><br><br>  
  <div id="resultFromAjax2" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
        <div id="resultFromAjax5" style="display:none;"></div>
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
  <br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>

  </table>
</form>
</body>
</html>