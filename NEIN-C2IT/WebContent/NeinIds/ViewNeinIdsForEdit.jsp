<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/plain; charset=UTF-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<style type="text/css">
		.blue2{  border:2px solid #1ABC9C; border-collapse:separate; width:70%; overflow-y: auto; margin:auto; }
		.blueHead1{ background:#1ABC9C; color:white; }
		.blueth1{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; }
		.blueth2{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; text-align: center;}
		.bluetd1{ text-align: center;border: 1px solid black; }
		.bluetd2{ border: 1px solid black;padding: 1px solid black; background-color: #FAEBD7;color: red;text-align: center;}
		.bluetd3{ border: 1px solid black;padding: 1px solid black;; color: blue;text-align: center;}
</style>
<script  type="text/javascript">

<% 
    String msg1=request.getParameter("msg");

    String disp = msg1;
    %>
    msg1 = "<%=disp%>";

     if(msg1!="1")
		{
           alert(msg1);
		}
</script>
</head>

<body background="../images/u.jpg">
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
<br>

<table class ="blue2" border="1" id="mytable">
			<thead class="blueHead1">
			<tr class="blueth1">
				<th >SL No.</th>
				<th >Branch</th>
				<th >Initiator</th>
				<th >Type Of Id</th>
				<th >Month</th>
				<th >No.of Id's used</th>
				<th >View/Edit</th>
			</tr>
			</thead>
			  <tbody >
			  <%int number=0;%>
			  
             <%              
				              response.setContentType("text/html;charset=UTF-8"); 
				              PrintWriter out1 = response.getWriter();
				            
				              String fileName=null;
				              
				     		  String idtype=request.getParameter("idtype");
				              String month=request.getParameter("month");  
				              
                              Connection con = null;
 	                          Statement st1=null;
 	                          String msg=null;
 	                          ResultSet rs1=null;
 	                          PreparedStatement prds=null;
                           try
                              {
                        	   Connection2 dbConn = new Connection2();
   							   con = dbConn.getConnection2();
   							 
   							   String query = null;
   						    
   							   query =  " SELECT DISTINCT mb.m_b_name,u.full_name,c.`id`, c.`branchNo`, c.`initiator`, c.`month`,c.`total`, "+
   							            " c.TypeOfNeinId FROM nein_ids c "+  
   										" INNER JOIN leavemanagement.user u ON c.initiator = u.emp_id"+
   										" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
   										" WHERE month =  ?"+ 
   										" AND c.TypeOfNeinId = ?"+
   										" Order by c.branchNo ";			
   										
   										prds = con.prepareStatement(query);
   										prds.setString(1, month); 
   										prds.setString(2, idtype);
   										rs1 = prds.executeQuery();   								     
                              %>                
	              <%while(rs1.next()){	            	  
	              %>
					<tr class="bluetd1">
						<td ><%=++number%></td>
						<td ><%=rs1.getString("m_b_name")%></td>
						<td ><%=rs1.getString("full_name")%></td>
						<td ><%=rs1.getString("TypeOfNeinId")%></td>
						<td ><%=rs1.getString("month")%></td>
						<td ><%=rs1.getString("total")%></td>
						<td ><a href="EditNeinIds.jsp?id=<%=rs1.getString("id")%>&month=<%=month%>&idtype=<%=idtype%>">Edit/Update</a></td>	
				   </tr>
						 <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con.close();
                            	}%>
                               
</table><br>	

 <!--  <div align="center"><br><br>
      <input style="size: 1;" type="button" title="Back To Selection Date Page" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div><br> -->
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
<!-- </form> -->
</body>
</html>