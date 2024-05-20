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
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

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
       <th colspan="2"> <input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp 
       <input type="reset" value="Reset">
       <a href="DisplayCircuitIdMaster.jsp" onclick="return popitup('DisplayCircuitIdMaster.jsp')">VIEW ALL</a> 
       </th>
   </tr>
   </table><br><br>
   <!-- <div align="center">
       <input style="size: 1;" type="button" title="Back To Selection Date Page" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div>
  <br> -->
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