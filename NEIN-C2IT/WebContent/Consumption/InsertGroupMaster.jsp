<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import="CON2.Connection2"%>
<%@page import = "java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Group Master</title>
</head>
<body>
                       <%
                       
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       
                       String groupName=request.getParameter("groupName");
                       String final_Rnumbers=request.getParameter("number");
                      
                       String relaNumbers[]=final_Rnumbers.split(",");
               		   int length = relaNumbers.length;
               		   String rela_Numbers=null;
               		   String alreadyrela_Numbers=null;
            
                       int i=0;
                        Connection con = null;
						Connection2 dbConn = new Connection2();
						con = dbConn.getConnection2();
						
						Connection con1 = null;
						Connection2 dbConn1 = new Connection2();
						con1 = dbConn1.getConnection2();
						
                        Statement st=null,st1=null;
                        String msg=null;
                        String msg1=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        
                        String query = "SELECT `group_name` FROM `consumptionreportmaster` WHERE `group_name`='"+groupName+"' ";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 					if(!rs.next()){	
 						for(int z=0;z<length;z++){ 
            			        rela_Numbers=relaNumbers[z];
            			        st1=con1.createStatement();
 							    i=st1.executeUpdate("UPDATE `consumptionreportmaster` SET `group_name`='"+groupName+"' where `relationnumber`='"+rela_Numbers+"'");
 						    }
 						       msg = " Data__IS__Inserted__successfully ";
					           response.sendRedirect("ConsumptionGroupMaster.jsp?msg=" +msg);
 					     }
 					else{
 						       msg = " Group__Name__alerady__exit ";
						       response.sendRedirect("ConsumptionGroupMaster.jsp?msg=" +msg);
 					   }
 						%>
</body>
</html>  