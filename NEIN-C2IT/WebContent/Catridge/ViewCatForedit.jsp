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
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<style type="text/css">
	.blue2{  border:2px solid #1ABC9C; border-collapse:separate; width:90%; overflow-y: auto; margin:auto; }
	.blueHead1{ background:#1ABC9C; color:white; }
	.blueth1{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; }
	.blueth2{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; text-align: center;}
	.bluetd1{ text-align: center;border: 1px solid black; }
	.bluetd2{ border: 1px solid black;padding: 1px solid black;; background-color: #FAEBD7;color: #0000FF;text-align: center;}
	.bluetd3{ border: 1px solid black;padding: 1px solid black;; color: Red;text-align: center;}
</style>
 
</head>

<body background="../images/u.jpg">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/logo.png" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
   </tr>
   </table>
<br>
<table class ="blue2" border="1" id="mytable" style="margin-left:110px;">
			<thead class="blueHead1">
			<tr class="blueth1">
				<th >SL No.</th>
				<th>Initiator Name</th>
			             <th>Location</th>
			             <th>Vendor Name</th>
			             <th>MONTH OF PAYMENT</th>		
			             <th>TOTAL AMOUNT</th>
			             <th >Edit/Update</th>
		    </tr>
			</thead>
			  <tbody >
			  <%int number=0;%>
			  
             <%              
							  NumberFormat nf = NumberFormat.getInstance();
							  nf.setMaximumFractionDigits(2);
				              nf.setMinimumFractionDigits(2);
				             
                              response.setContentType("text/html;charset=UTF-8"); 
				              PrintWriter out1 = response.getWriter();
				            
				              int cid=0,branch_no=0;
				              String branch=request.getParameter("branch");
				     		  int branchId=Integer.parseInt(branch);
				     		  //System.out.println("aaaaa ::"+branchId);
				              String fromdate1=request.getParameter("fromdate");
				              String todate1=request.getParameter("todate");
				     	      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				     	      Date startDate = null;
				     	      Date endDate =  null;
				     	      
				     	        startDate = dateFormat.parse(fromdate1);
			     				endDate = dateFormat.parse(todate1);
				     	     
				             String filename=null;
                             Connection con = null;
 	                         Statement st1=null;
 	                        // String msg=null;
 	                         ResultSet rs1=null;
 	                         PreparedStatement prds=null;
                           try
                              {
                        	   Connection2 dbConn = new Connection2();
   							   con = dbConn.getConnection2();
   							 
   							      String query = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
	                                             " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
			                                     " INNER JOIN `branch_master` b ON b.id=c.`branch_id`  "+
			                                     " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
			                                     " WHERE createddate >=  ?  AND createddate <=  ?  AND c.branch_no = ? order by catridge_id ";
	   							
						   					        prds = con.prepareStatement(query);
						   							prds.setDate(1, new java.sql.Date(startDate.getTime() ));
						   							prds.setDate(2,new java.sql.Date(endDate.getTime()));
						   							prds.setInt(3, branchId);
						   							rs1 = prds.executeQuery();
                              %>
                
	               <% while(rs1.next()){
	            	  String  id=rs1.getString("id");
	            	  // branch_no=rs1.getInt("branch_no");
	                %>
					 <tr class="bluetd1">
						 <td ><%=++number%></td>
						 <td><%= rs1.getString("user_name")%></td>
						 <td><%= rs1.getString("b_name")%></td>
						 <td><%= rs1.getString("vendor_name")%></td>
			             <td><%= rs1.getString("month_of_payment")%></td>
			             <td><%= rs1.getString("totalAmt")%></td>
			             <td><a href="EditCatridgeDetails1.jsp?id=<%=id%>&fromdate=<%=fromdate1%>&todate=<%=todate1%>&bno=<%=branch_no%>">Edit/Update</a>
			             <%-- <a href="Catridge/EditCatridgeDetails.jsp?id=<%=id%>">Edit/Update --%></td>
						
						 <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con.close();
            }%>                 
</table><br><br>
 <%-- <form action="../callForReport" method="get">
<input type="hidden" name="view" value="catridge1">
<input type="hidden" name="branch" value="<%=branchId%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
	</form> --%>
	<br><br>
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