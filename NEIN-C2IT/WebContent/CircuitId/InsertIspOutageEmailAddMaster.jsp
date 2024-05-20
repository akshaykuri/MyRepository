<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@ page import="CON2.Connection2" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Group Master</title>
</head>
<body>
                 <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       
                       String groupId1=request.getParameter("groupId"); 
                       int groupId=Integer.parseInt(groupId1);
                       String norows1=request.getParameter("norows"); 
                       int norows=Integer.parseInt(norows1);
                       
                       int i=0,id=0,i1=0,branchId=0;
                       String msg=null,empName="empName",empEmail="empEmail";
                       
                           Connection con = null; 
						   Connection2 dbConn = new Connection2();
						   con = dbConn.getConnection2();
						   
                        Statement st=null,st1=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                         
                   for(i1=1; i1 <= norows; i1++ ){
                	   
                	   empName=request.getParameter("empName"+i1); 
                	   empEmail=request.getParameter("empEmail"+i1); 
                	    
						String query = "select max(id) from ispoutageemailadd_master";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						 if(rs.next())
 						     {
 						      id=rs.getInt(1);
							    if(id==0)
					 			    id=1;
							     else   
								       id++;   
 						          }
 						 
                            String query1 = "select branchId from ispoutageemailgroup_master where id='"+groupId+"'";
 						
					    	st1 = con.createStatement();
 						    rs1 = st1.executeQuery(query1);
 						    
 						    while(rs1.next()){
 						    	branchId=rs1.getInt(1);
 						    }
 						
 							       try
 							          {
 						                  prds = con.prepareStatement("insert into ispoutageemailadd_master(branchId,groupId,empName,empEmail) values(?,?,?,?)");   
 				                          //prds.setInt(1,id);
 				                          prds.setInt(1,branchId);
 				                          prds.setInt(2,groupId);
 				                          prds.setString(3,empName);
 				                          prds.setString(4,empEmail);
 				                         
 				                          i= prds.executeUpdate();
 				                          
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
                               }    
 				                     if(i != 0){
 				                    	msg = "Data__INSERTED__SUCCESSFULLY";
 				                     }
 				                     else{
 				                    	msg = "Error";
 				                     }
 				                      
			                          response.sendRedirect("ISPOutageEmailAddMaster.jsp?msg="+msg);
 							       
 						%>
</body>
</html>  