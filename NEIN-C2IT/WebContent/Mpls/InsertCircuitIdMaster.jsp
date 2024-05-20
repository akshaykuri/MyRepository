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
                       String CircuitId=request.getParameter("CircuitId");
                       
                       int i=0;
                        Connection con = null;
                        Connection2 dbConn = new Connection2();
                        con = dbConn.getConnection2(); 
                        
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                         
						String query = "select max(c_id) from circuitidmaster";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select circuit_Id from circuitidmaster where circuit_Id='"+CircuitId+"'";
 						
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
 								       //if(sub.equals(new_id))
 								         //   {
 								    	   // i=0;
 								    	    //msg = " ASSET - \b IS - \b ALLREADY - \b EXIT ";
 						       		       // }
 								        //else
 								          //  {
 						                  prds = con.prepareStatement("insert into circuitidmaster(c_id,circuit_Id) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,CircuitId);
 				                          i= prds.executeUpdate();
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("CircuitIdMaster.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = "Data__IS__ALLREADY__EXIT";
 								   response.sendRedirect("CircuitIdMaster.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  