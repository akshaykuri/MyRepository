<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@ page import = "java.util.ResourceBundle" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SoftwareBack</title>
</head>
<body>
                       <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String uid=request.getParameter("booking");
                       String branchid=request.getParameter("branchid");
                       
                       System.out.println("BOOKING TYPE :"+uid);
                       int i=0;
                       Connection con = null;
                      /*  String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password=""; */
                        ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
                        String userName = dbProperties.getString("csdb.username");
                        String password = dbProperties.getString("csdb.password");
                        String url = dbProperties.getString("csdb.url");
                        String driver = dbProperties.getString("csdb.driverName");
                        String dbName = dbProperties.getString("csdb.dbName");

                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                        Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+dbName,userName,password);
						String query = "select max(id) from booking_room_master";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select Booking_For from booking_room_master where Booking_For='"+uid+"'";
 						
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
 						            
 								           //new_id =rs.getString(2);
 								           System.out.println(id);
 								      
 						                 /*  prds = con.prepareStatement("insert into bookinformaster(id,Booking_For) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,uid); */
 				                           prds = con.prepareStatement("insert into booking_room_master(id,Booking_For,branch_id) values(?,?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,uid);
 				                          prds.setString(3,branchid);
 				                          
 				                          i= prds.executeUpdate();
 				                          msg = "BOOKING_TYPE_INSERTED_SUCCESSFULLY";
 				                          response.sendRedirect("BookingMaster.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " BOOKING_TYPE_IS_ALLREADY_EXIT";
 								   response.sendRedirect("BookingMaster.jsp?msg=" +msg);
 							       }
 						%>
 						
 						
</body>
</html>  