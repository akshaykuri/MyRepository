<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>assetTypeMasterBack</title>
</head>
<body>
                       <%
                       System.out.println("----- ------- Asset TRansfer Back --------------");
                       String department=(String) session.getAttribute("department");
					   System.out.println("Depart :"+department);
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String uid=request.getParameter("assetType");
                       String sub = uid.substring(0, 3);
                       String des=request.getParameter("assetDisc");
                       String itnonit=request.getParameter("it");
                       //String itnonit2=request.getParameter("it");
                        int i=0;
                        System.out.println("Asset Name 1:"  +itnonit);
                      // System.out.println("Asset Name 2:"  +itnonit2);
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
						String query = "select max(id) from asset_type";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select item_name from asset_type where item_name='"+uid+"'";
						st1 = con.createStatement();
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
 						            
 								           //new_id =rs.getString(2);
 								           //System.out.println(new_id);
 								       //if(sub.equals(new_id))
 								         //   {
 								    	   // i=0;
 								    	    //msg = " ASSET - \b IS - \b ALLREADY - \b EXIT ";
 						       		       // }
 								        //else
 								          //  {
 						                  prds = con.prepareStatement("insert into asset_type(id,asset_code,item_name,item_desc,it_nonit) values(?,?,?,?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,sub); 
 				                          prds.setString(3,uid);
 				                          prds.setString(4,des);
 				                          prds.setString(5,itnonit);
 				                          i= prds.executeUpdate();
 				                          msg = "ASSET - \b INSERTED - \b SUCCESSFULLY";
 				                         if((department !=null) && (department.equals("OFFICE ADMINISTRATION")))            
 	 									                 {
 	 									                  response.sendRedirect("assetTypeMasterNonIT.jsp?msg=" +msg);
 	 									                 }
 	 								                  else
 	 								                     {  
 				                                          response.sendRedirect("assetTypeMaster.jsp?msg=" +msg);
 	 								                     }
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " ASSET - \b IS - \b ALLREADY - \b EXIT ";
 								 
 								  if((department !=null) && (department.equals("OFFICE ADMINISTRATION")))            
 									{
 									 response.sendRedirect("assetTypeMasterNonIT.jsp?msg=" +msg);
 									}
 								else
 								   {  
 								   response.sendRedirect("assetTypeMaster.jsp?msg=" +msg);
 							       }
 							       }
 						%>
</body>
</html>  