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
<script>
function getTotalCount() {
	    var count = document.forms["form1"]["count"].value; 	 
	    var totalValue=0; 
		for(i=1;i<=count;i++){			 	 
				 var no_ids = document.forms["form1"]["no_ids"+i].value; 			
				 if(no_ids == ''){		
					 no_ids=0;  
				  }  						 
				 totalValue=+totalValue+ +no_ids;
		     } 
		document.getElementById("totalCount").value = totalValue;
}
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 				
		var month = document.forms["form1"]["month"].value;
		if(month == ''){	
			 alert("Select month");
            return false;     
		    }  
		
		 var count = document.forms["form1"]["count"].value; 
		 
	for(i=1;i<=count;i++){
		 	 
			 var no_ids = document.forms["form1"]["no_ids"+i].value; 
		
			 if(no_ids == ''){		
	             alert("Enter the number of SAP count for branch :: "+i);
	            return false;
			  }  		
	     }
		  return true;
	}
	
</script>	
</head>

<body background="../images/u.jpg">

<form method="post" name="form1" action="InsertSAPUsed.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
         <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 
          <tr align="center">
               <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br /></font></strong></td>
         </tr>
         <tr align="center">
              <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white"> Create SAP / NExAS</font></strong></td>
         </tr>
         <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
                <input type="hidden" name="empid" id="empid" value='<%=session.getAttribute("empid")%>'></td>
 </tr>
   </table>
<br><br>

<table  align="center" border="1" width="30%"> 
  <tr>
       <td><span style="color:red;">*</span>Month:</td>
       <td><input type="text" name="month" id="month" size="20" readonly></td>
    </tr> 
    <tr>
       <td><span style="color:red;">*</span>Location:</td>
       <td><span style="color:red;">*</span>No.of SAP / NExAS ID's Used':</td>
           
       <!--  <input type="hidden" name="branchNo" id="branchNo" readonly> 	</td> -->
         
    </tr>
    <%                       Connection con3 = null;
						     Connection2 dbConn = new Connection2();
							 con3 = dbConn.getConnection2(); 
                             Statement st3=null;
                             ResultSet rs3=null; 
                             int number=0; 
                           try
                              {
	                           
                               String query = "select * from branch_master_main";
                               st3 = con3.createStatement();
                               rs3 = st3.executeQuery(query);
                               
                              %>
                  
	              <%while(rs3.next()){ 
	              number=number+1;
	              %>
	              <tr>  
			            <td>  <input type="hidden" name="branchNo<%=number%>" id="branchNo<%=number%>" value="<%=rs3.getString("m_b_no")%>"><%=number%>.)<%=rs3.getString("m_b_name")%></td>
			            <td>  <input type="text" name="no_ids<%=number%>" id="no_ids<%=number%>" size="20" onkeypress="return isNumberKey(event)"></td>
    	          </tr>
    	            <%}%> 

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con3.close();
                            	}%> 
     <input type="hidden" name="count" id="count" value="<%=number%>" readonly>
     <tr>
       <td><span style="color:red; "> ** Total count **</span> </td>
       <td><input type="text" name="totalCount" id="totalCount" size="20" placeholder="click here" onclick="getTotalCount()" readonly></td>
     </tr>
    <tr>
       <th colspan="2"> <input type="submit" value="Submit" onclick="return (Validation());">&nbsp &nbsp &nbsp &nbsp <input type="reset" value="Reset"></th>
       
   </tr>
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
<!-- <div id="resultFromAjax2" style="display:none;"></div>
        <div id="resultFromAjax1" style="display:none;"></div>
        <div id="resultFromAjax5" style="display:none;"></div> -->

  <br>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
          <tr align="center">
                <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
         </tr>
  </table>
</form>
</body>
</html>