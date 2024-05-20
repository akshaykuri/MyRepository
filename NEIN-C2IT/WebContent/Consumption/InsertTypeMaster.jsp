<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import="CON2.Connection2"%>
<%@page import = "java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert ISP Network Type Master</title>
</head>
<body>
                       <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String typemaster=request.getParameter("typemaster");
                      
                       int i=0;
                        Connection con = null;
						Connection2 dbConn = new Connection2();
						con = dbConn.getConnection2();
						
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                       
						String query = "select max(type_id) from type_master";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select type_name from type_master where type_name='"+typemaster+"'";
 						
						st1 = con.createStatement();
 						rs1 = st1.executeQuery(query1);
 						if(!rs1.next())
 						     {
 						      int id=0;
 						     System.out.println(id);
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
 						                  prds = con.prepareStatement("insert into type_master(type_id,type_name) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,typemaster);
 				                          i= prds.executeUpdate();
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("ConsumptionType.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " Data__IS__ALLREADY__EXIT ";
 								   response.sendRedirect("ConsumptionType.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  