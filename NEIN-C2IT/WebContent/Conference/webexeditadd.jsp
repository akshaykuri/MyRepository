<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@ page import = "java.util.ResourceBundle" %>

<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  ;
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<head>

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Conference room Booking</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> 
  <link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" /> 

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>


      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>


<script>
   $(document).ready(function () {
	   var $tbl = $('#table1');
	     $('#Button1').click(function(){
	        var num = $('input[id="Text1"]').val();
	            //alert(num);
	            $tbl.find('.row').remove();
	            for(var i=1;i<=num;i++){
	            	
	            $('table[id="table1"]').append(' <tr class="row"><td><input type="text" name="rr1"></td><td><input type="text" name="rr"></td><td><select name="type"><option value="Host/Leader">Host/Leader</option><option value="Participant">Participant</option></select></td></tr>');

	        }
	        });
	    });
</script>

</head>


<body onload="cleartext()">
<form  name="form"  method="post"  onsubmit="return validateForm()" action="webexeditaddback.jsp" >
<br><br>

 
<br>

<center>
 
	 <br />
 <div id="div" style="display:block;">
     <table border="1" bgcolor="#d2f7f3" >
     <tr>
     <td>
     Number of Web-Ex participants :<input type="text" id="Text1" name="Text1">
     
     <input id="Button1" type="button" value="Add" onclick="showRow()"/>
     <br>
     </td>
     <tr>
     <td>
     <table id="table1">
     <tr>
     <th>Name</th>
     <th>Email Id</th>
     <th>Type</th>
     </tr>
    
     <tr class="row">
    <td><input type="text" name="rr1"></td>
    <td><input type="text" name="rr"></td>
    <td><select name="type"><option value="Host/Leader">Host/Leader</option><option value="Participant">Participant</option></select></td>
  </tr>
     </table>
     </td>
     </tr>
     </table>
     </div>
    
<br>
</center>
<% 
Connection con5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

                        Statement st=null;
                        ResultSet rs=null; 
                    try
                       {
                    	// id="idBranch"
Class.forName(driver).newInstance();
con5= DriverManager.getConnection(url+dbName,userName,password);
						
						 String booking_no=request.getParameter("id");
	                		System.out.println("bookingggggggggg edit add page----------- :"+booking_no);
	                		
						
						String query2 = "select * from webex_meeting where Booking_no='"+booking_no+"'";
						st = con5.createStatement();
 						rs = st.executeQuery(query2);
						%>
						
					  
							<%while(rs.next()){%>
								
										<input type="hidden"  name=id id="id" value="<%=rs.getString("Booking_no")%>" />
    						<%}%>
							
							
								<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
		

 <table width="100%" border="0" align="center" >
                              <tr>
	                          	<td style="size:1">
	                          	     <center>
			                		<input type=submit name="button" value="ADD" id="button" >
			                		<!-- <input type="button" name="backBtn"  value="BACK" /> -->
		                             <input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'>
		                             </center>
		                       </td>
		                      </tr>
	                         </table>

</div>
</div>
</br> 

</body>
</html>