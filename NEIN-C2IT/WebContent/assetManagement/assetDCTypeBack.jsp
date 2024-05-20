<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>assetDCtypeMasterBack</title>
</head>
<body>
                       <%
                       System.out.println("------------- Asset DC Type BAck  -----------------");
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String uid=request.getParameter("dctype");
                     //  System.out.println("DCType :"+uid);
                       int i=0;
                       Connection con = null;
                       String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                        Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select max(id) from datacard_type";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select type from datacard_type where type='"+uid+"'";
 						
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
 						                  prds = con.prepareStatement("insert into datacard_type(id,type) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,uid);
 				                          i= prds.executeUpdate();
 				                          msg = "DATA CARD TYPE - \b INSERTED - \b SUCCESSFULLY";
 				                          response.sendRedirect("assetDCType.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " DATA CARD TYPE - \b IS - \b ALLREADY - \b EXIT ";
 								   response.sendRedirect("assetDCType.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  