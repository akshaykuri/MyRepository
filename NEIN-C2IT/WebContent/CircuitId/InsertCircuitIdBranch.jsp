<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.Connection2" %>

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
                       String linktype=request.getParameter("linktype");
                       String location=request.getParameter("location");
                       String Lanpool=request.getParameter("Lanpool");
                       String Wanpool=request.getParameter("Wanpool");
                       String Account_Relationship=request.getParameter("Account_Relationship");
                       String Bandwidth=request.getParameter("Bandwidth");
                       String Media=request.getParameter("Media");
                       String ARC=request.getParameter("ARC");
                       String OTC=request.getParameter("OTC");
                       String pono=request.getParameter("ponumber");
                       String podate=request.getParameter("podate");
                  
                       int i=0;
                        Connection con = null;
                        Connection2 dbConn = new Connection2();
                        con = dbConn.getConnection2();
                         
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                         
						String query = "select max(id) from circuitidmaster_details";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						//String query1 = "select * from circuitidmaster_details where circuit_Id='"+circuitid+"' AND branch_id='"+location+"'";
 						String query1 = "select * from circuitidmaster_details where circuit_Id='"+circuitid+"'";
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
 								       
 						                  prds = con.prepareStatement("INSERT INTO circuitidmaster_details(`id`, `circuit_Id`, `linktype_id`, `branch_id`,"+
 						                		  "`lanpool`, `wanpool`, `Acc_relation_no`, `bandwidth`, `media`, `arc`, `otc`,`po_number`,`po_date`) "+
 						                		  "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,circuitid);
 				                          prds.setString(3,linktype);
 				                          prds.setString(4,location);
 				                          prds.setString(5,Lanpool);
 				                          prds.setString(6,Wanpool);
 				                          prds.setString(7,Account_Relationship);
 				                          prds.setString(8,Bandwidth);
 				                          prds.setString(9,Media);
				                          prds.setString(10,ARC);
				                          prds.setString(11,OTC);
				                          prds.setString(12,pono);
				                          prds.setString(13,podate);
				                        
 				                          i= prds.executeUpdate();
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("CircuitMaster.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " Data__IS__ALLREADY__EXIT ";
 								   response.sendRedirect("CircuitMaster.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  