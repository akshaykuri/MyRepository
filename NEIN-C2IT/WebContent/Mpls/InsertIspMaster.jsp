<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.Connection2"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Circuit Id Master</title>
</head>
<body>
                       <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String ispname=request.getParameter("ispname");
                      // System.out.println("CircuitId ::: :"+CircuitId);
                      
                       Connection con1 = null,con2 = null,con3 = null;
		      	       Connection2 dbConn = new Connection2();
		      	    
			           con1 = dbConn.getConnection2();
			           con2 = dbConn.getConnection2();
			           con3 = dbConn.getConnection2();
	        
                       int i=0;
                        
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                        
						String query = "select max(id) from isp_master";
						st = con1.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select isp_name from isp_master where isp_name='"+ispname+"'";
 						
						st1 = con2.createStatement();
 						rs1 = st1.executeQuery(query1);
 						if(!rs1.next())
 						     {
 						      int id=0;
 						    
 						      if(rs.next())
 						          {
 							       try
 							          {
 								       id=rs.getInt(1);
 								       if(id==0)
 						 			       id=1;
 								       else   
 									       id++;   
 						            
 						                  prds = con3.prepareStatement("insert into isp_master(id,isp_name) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,ispname);
 				                          i= prds.executeUpdate();
 				                          
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("IspMaster.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " Data__IS__ALLREADY__EXIT ";
 								   response.sendRedirect("IspMaster.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  