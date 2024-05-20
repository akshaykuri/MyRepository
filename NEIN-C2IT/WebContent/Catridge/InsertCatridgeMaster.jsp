<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.Connection2"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.text.DateFormat" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.ResourceBundle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Catridge Master</title>
</head>
<body>
                       <%
	                       response.setContentType("text/html;charset=UTF-8");
	                       PrintWriter out1 = response.getWriter();
	                       String printername=request.getParameter("printername");
	                       String Catridge=request.getParameter("Catridge");
	                       String cost1=request.getParameter("cost");
	                       float cost = Float.parseFloat(cost1);
	                     
	                       int i=0;
                       
							Connection con = null;
							Connection2 dbConn = new Connection2();
							con = dbConn.getConnection2();
							
	                        Statement st=null,st1=null;
	                        String msg=null;
	                        ResultSet rs=null,rs1=null;
	                        PreparedStatement prds=null;
	                       
							String query = "select max(catridge_id) from catridge_master";
							st = con.createStatement();
	 						rs = st.executeQuery(query);
	 						
	 						String query1 = "select catridge_model from catridge_master where catridge_model='"+Catridge+"'";
	 						
							st1 = con.createStatement();
	 						rs1 = st1.executeQuery(query1);
	 						
 						if(!rs1.next())
 						     {
 						      int id=0;
 						    // System.out.println(id);
 						      if(rs.next())
 						          {
 							       try
 							          {
 								       id=rs.getInt(1);
 								       if(id==0)
 						 			       id=1;
 								       else   
 									       id++;   
 						            
 								           System.out.println(id);
 								       
 						                  prds = con.prepareStatement("insert into catridge_master(catridge_id,catridge_model,cost,printer_name) values(?,?,?,?)");  
 						                  
 				                          prds.setInt(1,id);
 				                          prds.setString(2,Catridge);
 				                          prds.setFloat(3,cost);
 				                          prds.setString(4,printername);
 				                          i= prds.executeUpdate();
 				                          msg = "Data_INSERTED_SUCCESSFULLY";
 				                          response.sendRedirect("CatridgeMasterIns.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = "catridge_Model_Data_IS_ALLREADY_Entered";
 								   response.sendRedirect("CatridgeMasterIns.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  