<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import="CON2.Connection2"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Model Master Details</title>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<style>
.tabletd{ height:20; bgcolor:white; width:150; align:center; background-color:#1ABC9C;color:black;}
.tabletd1{ background-color:white; width:30; text-color:blue; align:center;}
</style>
<script>
<%

String msg1=request.getParameter("msg");	

%>
msg = "<%=msg1%>";

 if(msg!="1")
	{
       alert(msg);
	}

</script>
</head>
<body background="../images/u.jpg">
<br><br>
<form method="post" name="form1" >

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
   </table><br><br>
     
	<table border="1"  align="center"  width="70%">
		<tr class="tabletd">
		<td><b>Branch</b></td>	
		<td><b>Location</b></td>	
		<td><b>Brand</b></td>	    
		<td><b>ModelNo</b></td>	
		<td><b>Vendor Type</b></td>	
		<td><b>SerialNo</b></td>
		<td><b>Insert</b></td>
		
		</tr>
		<%
				 response.setContentType("text/html;charset=UTF-8");
		         PrintWriter out1 = response.getWriter();  
		       
		         String branch_No=request.getParameter("location");
		         int branchNo=Integer.parseInt(branch_No);
		
				 Connection con = null;
				 Connection2 dbConn = new Connection2();
				 con = dbConn.getConnection2();
				
				 int sumcount=0;
				 Statement st=null;
				 ResultSet rs=null; 
				 try
				 {
				 String query = "SELECT * ,b.id as bid,b.b_name,mb.m_b_name FROM `photocopier_model_master` p"+
				                " INNER JOIN branch_master b ON p.branch_id = b.id "+
				                " INNER JOIN branch_master_main mb ON b.b_no = mb.m_b_no "+
				                "where `branch_id` in(SELECT id FROM `branch_master` WHERE `b_no`='"+branchNo+"')";
				
				 st = con.createStatement();
				 rs = st.executeQuery(query);
		      while(rs.next()){%>
			<tr>
			<td bgcolor="white" width="150"><%=rs.getString("m_b_name")%></td>
			<td bgcolor="white" width="150"><%=rs.getString("b_name")%></td>
			<td bgcolor="white" width="150"><%=rs.getString("brand")%></td>
			<td bgcolor="white" width="150"><%=rs.getString("modelno")%></td>
			<td bgcolor="white" width="150"><%=rs.getString("vendortype")%></td>
			<td bgcolor="white" width="150"><%=rs.getString("serialno")%></td>
			
			<td bgcolor="white" width="150">
			<font size="2" color="blue">
			<a href="CreatePhotoCopier.jsp?model=<%=rs.getString("modelno")%>&sno=<%=rs.getString("serialno")%>&branch_id=<%=rs.getString("bid")%>">INSERT</a>
			</font>
			</td>	
					
			</tr>
			<%}%>
			<%} catch (SQLException ex) {
			    ex.printStackTrace();
			}	
			finally{
						}%>
			
			</table>
			<br><br>
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
</form>
</body>
</html>