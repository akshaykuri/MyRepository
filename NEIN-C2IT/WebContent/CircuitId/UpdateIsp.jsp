<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="CON2.Connection2" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Circuit Id Master</title>
</head>
<body>
                       <%
                      
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String circuitid=request.getParameter("circuitid");
                       String linktype=request.getParameter("Linktype");
                       String ispoutage=request.getParameter("ispoutage");
                       String location=request.getParameter("b_id");
                       String Lanpool=request.getParameter("LAN");
                       String Wanpool=request.getParameter("WAN");
                       String Account_Relationship=request.getParameter("Account_Relationship");
                       String Bandwidth=request.getParameter("Bandwidth");
                       String Media=request.getParameter("Media");
                       String ARC=request.getParameter("ARC");
                       String OTC=request.getParameter("OTC");
                  
                       String ttno=request.getParameter("ttno");
                       
                       String reason=request.getParameter("reason");
                       String empid=request.getParameter("empid");
                       
                       String constarttime1=request.getParameter("connectionRestoredTime1");
                       String constarttime2=request.getParameter("connectionRestoredTime2");
                       String constarttime =constarttime1+":"+constarttime2;
                       String connectionRestoreddate1=request.getParameter("connectionRestoreddate");
                       Date utilDate = new SimpleDateFormat("dd-MM-yyyy").parse(connectionRestoreddate1);
	                   java.sql.Date connectionRestoreddate = new java.sql.Date(utilDate.getTime()); 
                      // String linkstarttype=request.getParameter("linkstarttype");
                       
                      // String connectionRestoredTime=constarttime+" "+linkstarttype;
                       String connectionRestoredTime=constarttime;
                       String OutageReport=request.getParameter("OutageReport");
                       String TotalDownTime=request.getParameter("TotalDownTime");
                       String remarks=request.getParameter("remarks");
                       
                        Connection con = null;
                        Connection2 dbConn = new Connection2();
        			    con = dbConn.getConnection2();
                        
                        int i=0;
                        Statement st=null;
                        String msg=null;
                        ResultSet rs=null;
                        PreparedStatement prds=null;
                        						
 						prds = con.prepareStatement("UPDATE `circuitid_details` SET `ttno`=?,`reason`=?,"+
 								"`linkrestoredtime`=?,`outagereport`=?,`totaldowntime`=?,`Remark`=?,`status`=?,`conRestoreddate`=? WHERE `ispoutageno`='"+ispoutage+"'");   
 						
 				       
				        prds.setString(1,ttno);
				        prds.setString(2,reason);		                          				        
				        prds.setString(3,connectionRestoredTime);
				        prds.setString(4,OutageReport);
				        prds.setString(5,TotalDownTime);
				        prds.setString(6,remarks);
				        prds.setString(7,"Completed");
				        prds.setDate(8,connectionRestoreddate);
				                       
 				        i= prds.executeUpdate();
 				      
 				        if(i == 1){
 				        msg = "ISPOutage__Updated__SUCCESSFULLY";
 				       response.sendRedirect("../OtherPage.jsp?msg=1");
 				        
 				        }
 				        else{
 				        	msg = "Error__occured";
 	 				        response.sendRedirect("../OtherPage.jsp?msg=1");
 				        }
 					
 						%>
</body>
</html>  