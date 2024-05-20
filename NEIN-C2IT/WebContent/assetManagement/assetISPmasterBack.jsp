<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>assetISPMasterBack</title>
</head>
<body>
                       <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String uid=request.getParameter("isp");
                       System.out.println("ISP :"+uid);
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
						String query = "select max(id) from isp_provider";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select ispname from isp_provider where ispname='"+uid+"'";
 						
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
 						                  prds = con.prepareStatement("insert into isp_provider(id,ispname) values(?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,uid);
 				                          i= prds.executeUpdate();
 				                          msg = "ISP - \b INSERTED - \b SUCCESSFULLY";
 				                          response.sendRedirect("assetISPmaster.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " ISP - \b IS - \b ALLREADY - \b EXIT ";
 								   response.sendRedirect("assetISPmaster.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  