<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.Connection2" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Link Type Master</title>
</head>
<body>
                       <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String Linktype=request.getParameter("Linktype"); 
                       int i=0;int id=0;
                        Connection con = null;
                        
                        Connection2 dbConn = new Connection2();
                        con = dbConn.getConnection2(); 
                        
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                        
						String query = "select max(link_id) from linktype_master";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						/* String query1 = "select linktype from linktype_master where linktype='"+Linktype+"'";
 						
						st1 = con.createStatement();
 						rs1 = st1.executeQuery(query1);
 						if(!rs1.next())
 						     {
 						      int id=0;
 						     System.out.println(id); */
 						      if(rs.next())
 						          {
 							       try
 							          {
 								       id=rs.getInt(1);
 								       if(id==0)
 						 			       id=1;
 								       else   
 									       id++;   						            
 								          			       
 						                  prds = con.prepareStatement("insert into linktype_master(link_id,linktype) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,Linktype);
 				                          i= prds.executeUpdate();
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("LinkTypeMaster.jsp?msg=" +msg);
 				                          
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 						          }
 							   
 						%>
</body>
</html>  