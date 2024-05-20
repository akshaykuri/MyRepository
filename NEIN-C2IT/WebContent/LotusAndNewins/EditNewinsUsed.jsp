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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<%-- <script  type="text/javascript">

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
</script> --%>
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
<script>
$(document).ready(function () { 
$("#month").datepicker({
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

	$("#month").focus(function () {
	    $(".ui-datepicker-calendar").hide();
	    $("#ui-datepicker-div").position({
	        my: "center top",
	        at: "center bottom",
	        of: $(this)
	    });
	});
});
</script>

<script language="javascript" type="text/javascript">
	function Validation()
	{ 				
		 var location = document.forms["form1"]["location"].value; ; 
		 var month = document.forms["form1"]["month"].value;
		 var no_ids = document.forms["form1"]["no_ids"].value; 
	
		 if(location == "Select"){		
			    alert("Select location");
			    return false;
			}  
		 
		if(month == ''){	
			 alert("Select month");
             return false;     
		    }  
		
		if(no_ids == ''){		
            alert("Enter the number of Lotus Email id's used for this month");
            return false;
		  }  		
		  
		  return true;
	}
	
</script>	
<script>
function getBranchNo(str){  
	
	    if (typeof XMLHttpRequest != "undefined"){    
             xmlHttp= new XMLHttpRequest();    
            } 
	    else if (window.ActiveXObject){    
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
</head>
<body background="../images/u.jpg">
<form method="post" name="form1" action="UpdateNewinsUsed.jsp">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
         <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
          <tr align="center">
               <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br /></font></strong></td>
         </tr>
         <tr align="center">
              <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">Lotus Email</font></strong></td>
         </tr>
         <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
                <input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'></td>
 </tr>
</table>
<br><br>

<table  align="center" border="1" width="30%"> 
					  <%
					    String id=request.getParameter("id");
					    String todate=request.getParameter("todate");
					    String fromdate=request.getParameter("fromdate");
					    String branchNo=request.getParameter("branchId");
					
						Connection conn=null;
						Connection2 dbConn = new Connection2();
						conn = dbConn.getConnection2(); 
						Statement st=null;
						ResultSet rs=null;
					 try 
					  {
					     
					    String query1 =  " SELECT DISTINCT mb.m_b_name,c.`branchNo`, "+
						                 "  c.`initiator`, c.`month`,c.`total` FROM newins_used c "+ 
										 " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
										 " WHERE c.id="+id;
					   
					    st = conn.createStatement();
					    rs = st.executeQuery(query1);  %>
          
	      <% while(rs.next()) {%>
	          <tr>
              <td><span style="color:red;">*</span>Location:</td>
               <td>      <%  Connection con3 = null; 
			           	     con3 = dbConn.getConnection2(); 
                             Statement st3=null;
                             ResultSet rs3=null; 
                             
                             try
                             {
	                            
                              String query = "select * from branch_master_main";
                              st3 = con3.createStatement();
                              rs3 = st3.executeQuery(query);
                              
                             %>
               <select name="branchNo" id="branchNo" >
		        <option value="<%=rs.getString("branchNo")%>"><%=rs.getString("m_b_name")%></option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString("m_b_no")%>"><%=rs3.getString("m_b_name")%></option>
   	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con3.close();
                            	}%>
         <%-- <input type="hidden" name="branchNo" id="branchNo" readonly value="<%=rs.getString("branchNo")%>"> --%>
         <input type="hidden" name="fromdate" id="fromdate" readonly value="<%=fromdate%>">
         <input type="hidden" name="todate" id="todate" readonly value="<%=todate%>">
         <input type="hidden" name="ids" id="ids" readonly value="<%=id%>">
         <input type="hidden" name="bNo" id="bNo" readonly value="<%=branchNo%>"> 	</td>
    </tr>  
    <tr>
       <td><span style="color:red;">*</span>Month:</td>
       <td><input type="text" name="month" id="month" size="20" readonly value="<%=rs.getString("month")%>"></td>
    </tr>
    <tr>
       <td><span style="color:red;">*</span>No.of Newins ID's Used':</td>
       <td><input type="text" name="no_ids" id="no_ids" size="20" value="<%=rs.getString("total")%>" onkeypress="return isNumberKey(event)"></td>
    </tr>
    <tr>
       <th colspan="2"> <input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp <input type="reset" value="Reset"></th>      
   </tr>  
	      <%}%> 
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
    
</table><br><br>
  
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
<div id="resultFromAjax2" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
        <div id="resultFromAjax5" style="display:none;"></div>
  <br>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
          <tr align="center">
                <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
          </tr>
</table>
</form>
</body>
</html>