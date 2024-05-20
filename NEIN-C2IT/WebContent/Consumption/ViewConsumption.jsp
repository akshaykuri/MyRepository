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
				<th >Jan</th>
				<th >Feb</th>
				<th >Mar</th>
				<th >Apr</th>
				<th >May</th>
				<th >June</th>
				<th >July</th>
				<th >Aug</th>
				<th >Sep</th>
				<th >Oct</th>
				<th >Nov</th>
				<th >Dec</th>
				<th >Total</th>
			   
				
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
				              String type=request.getParameter("type");
				     	      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				     	     
				     	      Date startDate = null;
				     	      Date endDate =  null;
				     	      
				     	        startDate = dateFormat.parse(fromdate1);
			     				endDate = dateFormat.parse(todate1);
				     	     
				     			
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
   							
   					 if(type.equals("Select") && branchId == 0 ){
   						    
   						query = " SELECT DISTINCT c.`empname`,`number`,`relationnumber`,`type`,`isptype`,`typename`,`monthlycharges`,"+
				                "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
						        " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
								" FROM consumption_report_details c "+  
								" INNER JOIN branch_master s ON c.branchid = s.id"+
								" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
								" WHERE monthofpayment >=  ?"+
								" AND monthofpayment <=  ?"+ 
								" Group by c.number order by c.branchNo ";
   						 
   					 }
   					 else if(!type.equals("Select") && branchId == 0 ){
   						query = " SELECT DISTINCT c.`empname`,`number`,`relationnumber`,`type`,`isptype`,`typename`,`monthlycharges`,"+
				                "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
						        " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
								" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
								" FROM consumption_report_details c "+  
								" INNER JOIN branch_master s ON c.branchid = s.id"+
								" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
								" WHERE monthofpayment >=  ?"+
								" AND monthofpayment <=  ?"+
								" AND c.typename = ? "+
								" Group by c.number order by c.branchNo ";
   					 }
   					 else if(!type.equals("Select") && branchId != 0){
   						
   						        query = " SELECT DISTINCT c.`empname`,`number`,`relationnumber`,`type`,`isptype`,`typename`,`monthlycharges`,"+
   						                "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
   								        " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
   										" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
   										" FROM consumption_report_details c "+  
   										" INNER JOIN branch_master s ON c.branchid = s.id"+
   										" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
   										" WHERE monthofpayment >=  ?"+
   										" AND monthofpayment <=  ?"+
   										" AND c.branchNo = ? AND c.typename = ? "+
   										" Group by c.number";
   					 }
   					 else{
   						    query = " SELECT DISTINCT c.`empname`,`number`,`relationnumber`,`type`,`isptype`,`typename`,`monthlycharges`,"+
					                "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
							        " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
									" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
									" FROM consumption_report_details c "+  
									" INNER JOIN branch_master s ON c.branchid = s.id"+
									" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
									" WHERE monthofpayment >=  ?"+
									" AND monthofpayment <=  ?"+
									" AND c.branchNo = ? "+
									" Group by c.number";
   						 
   					 }
   										prds = con.prepareStatement(query);
   										
   							  if(type.equals("Select") && branchId == 0 ){	
	   									prds.setDate(1, new java.sql.Date(startDate.getTime() ));
										prds.setDate(2,new java.sql.Date(endDate.getTime())); 
   							  }
   							  else if(!type.equals("Select") && branchId == 0 ){
	   									prds.setDate(1, new java.sql.Date(startDate.getTime() ));
										prds.setDate(2,new java.sql.Date(endDate.getTime())); 
										prds.setString(3, type);
   							  }
   							  else if(!type.equals("Select") && branchId != 0){
   					   						
   										prds.setDate(1, new java.sql.Date(startDate.getTime() ));
   										prds.setDate(2,new java.sql.Date(endDate.getTime()));
   										prds.setInt(3, branchId);
   										prds.setString(4, type);
   										
   				               }
   				              else{
				   					    prds.setDate(1, new java.sql.Date(startDate.getTime() ));
										prds.setDate(2,new java.sql.Date(endDate.getTime()));
										prds.setInt(3, branchId);
   				               }
   										rs1 = prds.executeQuery();
   								     
                               /*  st1 = con.createStatement();
                                rs1 = st1.executeQuery(query); */
                              %>
                
	              <%while(rs1.next()){
	            	  
	            	    String amt_Jan = rs1.getString("amt_Jan");    float  t1 = Float.parseFloat(amt_Jan);	  t011=t011+t1; 
	            	    String amt_Feb = rs1.getString("amt_Feb");    float  t2 = Float.parseFloat(amt_Feb);      t21=t21+t2;  
	            	    String amt_Mar = rs1.getString("amt_Mar");    float  t3 = Float.parseFloat(amt_Mar);	  t31=t31+t3;     
	            	    String amt_Apr = rs1.getString("amt_Apr");    float  t4 = Float.parseFloat(amt_Apr);      t41=t41+t4;  
	            	    String amt_May = rs1.getString("amt_May");    float  t5 = Float.parseFloat(amt_May);	  t51=t51+t5;          
	            	    String amt_June = rs1.getString("amt_June");  float  t6 = Float.parseFloat(amt_June);     t61=t61+t6; 
	            	    String amt_July = rs1.getString("amt_July");  float  t7 = Float.parseFloat(amt_July);     t71=t71+t7;  
	            	    String amt_Aug = rs1.getString("amt_Aug");    float  t8 = Float.parseFloat(amt_Aug);	  t81=t81+t8;         
	            	    String amt_Sep = rs1.getString("amt_Sep");    float  t9 = Float.parseFloat(amt_Sep);      t91=t91+t9;  
	            	    String amt_Oct = rs1.getString("amt_Oct");    float  t10 = Float.parseFloat(amt_Oct);     t101=t101+t10;   
	            	    String amt_Nov = rs1.getString("amt_Nov");    float  t11 = Float.parseFloat(amt_Nov);     t111=t111+t11;  
	            	    String amt_Dec = rs1.getString("amt_Dec");    float  t12 = Float.parseFloat(amt_Dec);     t121=t121+t12;         
	            	    
	               		        
	               	     total=t1+t2+t3+t4+t5+t6+t7+t8+t9+t10+t11+t12;
	               	     gdtotal=gdtotal+total;
	               	     
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
						<td ><%=rs1.getString("amt_Jan")%></td>
						<td ><%=rs1.getString("amt_Feb")%></td>
						<td ><%=rs1.getString("amt_Mar")%></td>
						<td ><%=rs1.getString("amt_Apr")%></td>
						<td ><%=rs1.getString("amt_May")%></td>
						<td ><%=rs1.getString("amt_June")%></td>
						<td ><%=rs1.getString("amt_July")%></td>
						<td ><%=rs1.getString("amt_Aug")%></td>
						<td ><%=rs1.getString("amt_Sep")%></td>
						<td ><%=rs1.getString("amt_Oct")%></td>
						<td ><%=rs1.getString("amt_Nov")%></td>
						<td ><%=rs1.getString("amt_Dec")%></td>
						<td class="bluetd2"><%=nf.format(total)%></td>							  
						</tr>
						 <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con.close();
                            	}%>
                    
                <tr >
					<td colspan="10" class="blueth2">Grand Total</td>
					<td class="bluetd2"><%=nf.format(t011)%></td>
					<td class="bluetd2"><%=nf.format(t21)%></td>
					<td class="bluetd2"><%=nf.format(t31)%></td>
					<td class="bluetd2"><%=nf.format(t41)%></td>
					<td class="bluetd2"><%=nf.format(t51)%></td>
					<td class="bluetd2"><%=nf.format(t61)%></td>
					<td class="bluetd2"><%=nf.format(t71)%></td>
					<td class="bluetd2"><%=nf.format(t81)%></td>
					<td class="bluetd2"><%=nf.format(t91)%></td>
					<td class="bluetd2"><%=nf.format(t101)%></td>
					<td class="bluetd2"><%=nf.format(t111)%></td>
					<td class="bluetd2"><%=nf.format(t121)%></td>
			   <%
			      total1=t011+t21+t31+t41+t51+t61+t71+t81+t91+t101+t111+t121;
	              finaltotal=finaltotal+total1;
	             %>
			<td class="bluetd3"><%=nf.format(finaltotal)%></td>
			</tr>
  </table>
  
<!-- <button  onclick="tablesToExcel(['mytable'],['Catridge'],'CatridgeReport.xls', 'Excel')">Export to Excel</button>	 -->
<form action="../callForReport" method="get" style="margin-left:110px;">
<input type="hidden" name="view" value="consumption">
<input type="hidden" name="branch" value="<%=branchId%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
<input type="hidden" name="type" value="<%=type%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	<form action="../callForReport" method="get" style="margin-left:110px;">
			<input type="hidden" name="view" value="consumption2">
			<input type="hidden" name="branch" value="<%=branchId%>">
		    <input type="hidden" name="fromdate" value="<%=fromdate1%>">
		    <input type="hidden" name="todate" value="<%=todate1%>">
		    <input type="hidden" name="type" value="<%=type%>">
			<!-- <input type="text" name="fromadd" > -->
			&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Send By Email: To Address<input type="text" name="toadd" size ="30">&nbsp&nbsp
			<input type="hidden" name ="fromemail" value="<%=session.getAttribute("Nmail")%>" size ="50">
			<input type="submit" value="SEND" class="hollow">
	</form><br><br>
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