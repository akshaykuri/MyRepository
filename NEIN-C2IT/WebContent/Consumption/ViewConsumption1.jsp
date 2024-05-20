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
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />


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

<table class ="blue2" border="1" id="mytable" style="margin-left:110px;">
			<thead class="blueHead1">
			<tr class="blueth1">
				<th >SL No.</th>
				<th >Branch</th>
				<th >Location</th>
				<th >Type</th>
				<th >User Name</th>
				<th >Number</th>
				<th >Relationship Number</th>
				<th >ISP Network Type</th>
				<th >Consumption Type</th>
				<th >Monthly Rental Charges+Tax</th>
				<th >Bill From Date</th>
				<th >Bill To Date</th>
				<th >Month Of Payment</th>
				<th >Current Month Payment</th>
				<th >Status</th>
				<th >Invoice Number</th>
				<th >Invoice Amount </th>
				<th >Invoice Date</th>
				<th >cheque Number</th>
				<th >cheque Amount</th>
				<th >cheque Date</th>
				<th >Invoice Files</th>
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
				            
				              String branch=request.getParameter("branch");
				     		  int branchId=Integer.parseInt(branch);
				              String fromdate1=request.getParameter("fromdate");
				              String todate1=request.getParameter("todate");
				     	      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				     	      Date startDate = null;
				     	      Date endDate =  null;
				     	      
				     	        startDate = dateFormat.parse(fromdate1);
			     				endDate = dateFormat.parse(todate1);
				     	        String filename=null;
				     			
				             float total=0;float total1=0;
				             float gdtotal=0;float finaltotal=0;
				             
				             float t011=0;float t21=0;float t31=0;float t41=0;float t51=0;float t61=0;
				             float t71=0;float t81=0;float t91=0;float t101=0;float t111=0;float t121=0;
				             
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
   						        query = " SELECT c.`id` as id1, `initiatorId`,`type`, `empno`, `empname`, `branchid`, `branchNo`, `number`, `relationnumber`, "+
   						                "`isptype`, `typename`, `monthlycharges`, `billfromdate`, `billtodate`, `monthofpayment`, `number_status`, "+
   						                "`invoiceno`, `invoiceamt`, `invoicedate`, `chequenumber`, `chequeamt`, `chequedate`, `current_month_amt`,"+
   						                "`filepath`,s.b_name,mb.m_b_name "+
   										" FROM consumption_report_details c "+  
   										" INNER JOIN branch_master s ON c.branchid = s.id "+
   										" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no "+
   										" WHERE monthofpayment >=  ?"+
   										" AND monthofpayment <=  ?"+
   										" AND c.branchNo = ? AND `typename` != 'DATA CARD'";
   										
   										prds = con.prepareStatement(query);
   										prds.setDate(1, new java.sql.Date(startDate.getTime() ));
   										prds.setDate(2,new java.sql.Date(endDate.getTime()));
   										prds.setInt(3, branchId);
   										rs1 = prds.executeQuery();
   								     
                              
                              %>
                
	              <%while(rs1.next()){
	            	    String filepath1=rs1.getString("filepath"); 
			            filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
			           /*  System.out.println("filepath ::"+filepath1);
			            System.out.println("filename ::"+filename); */
	              %>
					 <tr class="bluetd1">
						<td ><%=++number%></td>
						<td ><%=rs1.getString("m_b_name")%></td>
						<td ><%=rs1.getString("b_name")%></td>
						<td ><%=rs1.getString("type")%></td>
						<td ><%=rs1.getString("empname")%></td>
						<td ><%=rs1.getString("number")%></td>
						<td ><%=rs1.getString("relationnumber")%></td>
						<td ><%=rs1.getString("isptype")%></td>
						<td ><%=rs1.getString("typename")%></td>
						<td ><%=rs1.getString("monthlycharges")%></td>
						<td ><%=rs1.getString("billfromdate")%></td>
						<td ><%=rs1.getString("billtodate")%></td>
						<td ><%=rs1.getString("monthofpayment")%></td>
						<td ><%=rs1.getString("current_month_amt")%></td>
						<td ><%=rs1.getString("number_status")%></td>
						<td ><%=rs1.getString("invoiceno")%></td>
						<td ><%=rs1.getString("invoiceamt")%></td>
						<td ><%=rs1.getString("invoicedate")%></td>
						<td ><%=rs1.getString("chequenumber")%></td>
						<td ><%=rs1.getString("chequeamt")%></td>
						<td ><%=rs1.getString("chequedate")%></td>
						<td ><a href="DownloadFile.jsp?f=<%=rs1.getString("filepath")%>" ><%=filename%></a></td>
						<td bgcolor="white" width="150">
						     <font size="3" color="blue">
						     <a href="EditConsumptionReportDetails1.jsp?id=<%=rs1.getString("id1")%>&fromdate=<%=fromdate1%>&todate=<%=todate1%>&bno=<%=rs1.getString("branchNo")%>">Edit/Update</a>
						     </font>
						</td>   							  
						</tr>
						 <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con.close();
                            	}%>
             
  </table>
  
<!-- <button  onclick="tablesToExcel(['mytable'],['Catridge'],'CatridgeReport.xls', 'Excel')">Export to Excel</button>	 -->
<form action="../callForReport" method="get" style="margin-left:110px;">
<input type="hidden" name="view" value="consumption1">
<input type="hidden" name="branch" value="<%=branchId%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
	</form>
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