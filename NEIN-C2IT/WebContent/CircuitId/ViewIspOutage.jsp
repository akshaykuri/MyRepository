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
<script  type="text/javascript">

<% 
    String msg=request.getParameter("msg");

    String disp = msg;
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
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
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
</td>
 </tr>
   </table>
<br>
<div id="dvData">
<table class ="blue2" border="1" id="mytable" style="margin-left:110px;"> 

 <tr class="blueth1"> 
    <th>SI.No</th>
    <th>ISP Outage No</th>
    <th>Circuit Id</th>
    <th>Link Type</th>
    <th>ISP Name</th>
    <th>Initiator</th>   
    <th>Branch</th>
    <th>Location</th>
    <th>Trouble Ticket No</th> 
    <th>Link Down Time</th>
    <th>Call Logged Time</th>
    <th>Reason</th>
    <th>Link Restored Time</th>
    <th>Outage Report</th>
    <th>Total Down Time(H:M)</th>
    <th>Report</th>
    <%int number=0;%>		
 </tr>
             <%              response.setContentType("text/html;charset=UTF-8");
				             PrintWriter out1 = response.getWriter();
				             
				             String circuitid=request.getParameter("circuitid");
				             String fromdate1=request.getParameter("fromdate");
				             String todate1=request.getParameter("todate");
				             
				             SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				     	     Date startDate = null;
				     	     Date endDate =  null;
				     	      
				     	     startDate = dateFormat.parse(fromdate1);
			     		     endDate = dateFormat.parse(todate1);
				        
                             Connection con1 = null;
                             Connection2 dbConn = new Connection2();
                             con1 = dbConn.getConnection2(); 
                         	
                             Statement st1=null;
                             ResultSet rs1=null; 
                             PreparedStatement prds=null;
                             
                             
                           try
                              {
	                            
                               String query =null;
                               if(circuitid.equals("All")){
                            	   query =  " SELECT *,b.b_name,u.full_name,mb.m_b_name,c.filePath FROM `circuitid_details` c "+
			                                " INNER JOIN branch_master b ON b.id=c.branch_id "+
			                                " INNER JOIN branch_master_main mb ON mb.m_b_no=c.branchNo "+
			                                " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id "+
			                                " where status='Completed' and "+
			                                " (callLoggeddate >= ? and callLoggeddate <=?) order by c.branchNo";
                               }
                               else{
                               
                                      query =  " SELECT *,b.b_name,u.full_name,mb.m_b_name,c.filePath FROM `circuitid_details` c "+
				                               " INNER JOIN branch_master b ON b.id=c.branch_id "+
				                               " INNER JOIN branch_master_main mb ON mb.m_b_no=c.branchNo "+
				                               " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id "+
				                               " where circuit_Id='"+circuitid+"' and status='Completed' and "+
				                               " (callLoggeddate >= ? and callLoggeddate <=?) ";
                               }
                                    prds = con1.prepareStatement(query);
									prds.setDate(1, new java.sql.Date(startDate.getTime() ));
									prds.setDate(2,new java.sql.Date(endDate.getTime()));
									rs1 = prds.executeQuery();
                               
                              %>
                
	              <%while(rs1.next()){%>
					 <tr>
					    <td><%=++number%></td>
					    <td>
					    <a href="DownloadFile.jsp?f=<%=rs1.getString("filePath")%>" ><%=rs1.getString("ispoutageno")%></a>
					    </td>
					    
					    <td><%=rs1.getString("circuit_Id")%></td>
					    <td><%=rs1.getString("linktype_id")%></td>
					    <td><%=rs1.getString("isp_name")%></td>
					    <td><%=rs1.getString("full_name")%></td>
					    <td><%=rs1.getString("m_b_name")%></td>
					    <td><%=rs1.getString("b_name")%></td>
					    <td><%=rs1.getString("ttno")%></td>
					    <td><%=rs1.getString("connectionDowndate")%>&nbsp<%=rs1.getString("linkdowntime")%></td>
					    <td><%=rs1.getString("callLoggeddate")%>&nbsp<%=rs1.getString("calllogtime")%></td>
					    <td><%=rs1.getString("reason")%></td>
					    <td><%=rs1.getString("conRestoreddate")%>&nbsp<%=rs1.getString("linkrestoredtime")%></td>
					    <td><%=rs1.getString("outagereport")%></td>
					    <td><%=rs1.getString("totaldowntime")%></td>
					    <td class="bluetd2"><%=rs1.getString("Remark")%></td>
					    
					 </tr>
    	            <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
  </table></div><br><br>
<form action="../callForReport" method="get" style="margin-left:110px;">
<input type="hidden" name="view" value="ispoutage">
<input type="hidden" name="circuitid" value="<%=circuitid%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
</form><br><br>
	
 <form action="../callForReport" method="get" style="margin-left:110px;">
	<input type="hidden" name="view" value="ispoutage1">
	<input type="hidden" name="circuitid" value="<%=circuitid%>">
	<input type="hidden" name="fromdate" value="<%=fromdate1%>">
	<input type="hidden" name="todate" value="<%=todate1%>">
	<!-- <input type="text" name="fromadd" > -->
	&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Send By Email: To Address<input type="text" name="toadd" size ="30">&nbsp&nbsp
	<input type="hidden" name ="fromemail" value="<%=session.getAttribute("Nmail")%>" size ="50">
	<input type="submit" value="SEND" class="hollow">&nbsp &nbsp Note:Only one Email id enter in text box.
	</form><br>  
	
	<br>
  <!-- <div align="center"><br><br>
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
  <br>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
<!-- </form> -->
</body>
</html>