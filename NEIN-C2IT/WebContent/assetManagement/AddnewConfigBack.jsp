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
                       System.out.println("------------- Add New Config Back  -----------------");
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String ast=request.getParameter("aType");
                       //String sub = uid.substring(0, 3);
                       String conf=request.getParameter("configField");
                       String confdis=request.getParameter("configDis");
                       //String itnonit2=request.getParameter("it");
                        int i=0;
                        //System.out.println("Asset Name 1:"  +ast);
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
                        //String new_id = null;
                        Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						//String query = "select max(id),asset_code from asset_type";
						//st = con.createStatement();
 						//rs = st.executeQuery(query);
 						int id=0;
 						
 						String query1 = "select * from assetconfgfield where assettype='"+ast+"' AND configname='"+conf+"'";
						st1 = con.createStatement();
						rs1 = st1.executeQuery(query1);
					    if(rs1.next())
					        {
					    	msg = " ASSET - \b CONFIG - \b IS - \b ALLREADY - \b EXIT ";
	 						response.sendRedirect("AddnewConfig.jsp?msg=" +msg);
	 						
					        }
					    else
					        {
 						    String query = "select max(id) from assetconfgfield";
						    st = con.createStatement();
						    rs = st.executeQuery(query);
						    try
						       {
							   if(rs.next())
	 						       {
	 						 	    id=rs.getInt(1);
 								    //System.out.println(id);
 								    if(id==0)
 						 			     id=1;
 								    else   
 									     id++;   
	 						        }
 						             prds = con.prepareStatement("insert into assetconfgfield(id,assettype,configname,configdisc) values(?,?,?,?)");   
 				        			prds.setInt(1,id);
 				                    prds.setString(2,ast); 
 				                    prds.setString(3,conf);
 				                    prds.setString(4,confdis);
 				                    i= prds.executeUpdate();
 				                   //System.out.println("here");
 				                    msg = " ASSET - \b CONFIG - \b IS - \b INSERTED - \b SUCCESSFUllY ";
 			 						response.sendRedirect("AddnewConfig.jsp?msg=" +msg);
 						     }catch(SQLException ex)
 						             {
 						   	         ex.printStackTrace();
 						             } 
 				                    
					        }
 						   %>
</body>
</html>  