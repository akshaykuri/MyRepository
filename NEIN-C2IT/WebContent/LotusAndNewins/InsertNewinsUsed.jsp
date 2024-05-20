<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.Connection2"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Newins Id </title>
</head>
<body>
                   <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String month=request.getParameter("month");
                       
                       String counttal=request.getParameter("count");
                       int count=Integer.parseInt(counttal);
                       
                       int branchNo[] =new int[count+1];
                       int no_ids[] =new int[count+1];
                       String branchNumber=null;
                       String no_id=null;
                    	   
                for(int w=1; w <= count ; w++) {
                	
                       branchNumber=request.getParameter("branchNo"+w);
                       branchNo[w-1]=Integer.parseInt(branchNumber);
                       
                       no_id=request.getParameter("no_ids"+w);
                       no_ids[w-1]=Integer.parseInt(no_id);
                       
                      }
                
                       String empid=request.getParameter("empid");
                      
                       Connection con1 = null,con2 = null,con3 = null;
		      	       Connection2 dbConn = new Connection2();
		      	    
			           con1 = dbConn.getConnection2();
			           con2 = dbConn.getConnection2();
			           con3 = dbConn.getConnection2();
	        
                        int i=0;
                        
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        String new_id = null;
                        
						String query = "select max(id) from newins_used";
						st = con1.createStatement();
 						rs = st.executeQuery(query);
 						
 						String query1 = "select month from newins_used where month='"+month+"' ";
 						
						st1 = con2.createStatement();
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
 					          for(int z=1; z <= count ; z++) {
 									       id++;   
 						            
 						                  prds = con3.prepareStatement(" INSERT INTO `newins_used`(`id`, `branchNo`, `initiator`, `month`, `total`)"+
 						                		                       " VALUES (?,?,?,?,?) ");   
 						                  
 				                          prds.setInt(1,id);
 				                        //  prds.setInt(2,branchId);
 				                          prds.setInt(2,branchNo[z-1]);
 				                          prds.setString(3,empid);
 				                          prds.setString(4,month);
 				                          prds.setInt(5,no_ids[z-1]);
 				                          
 				                          i= prds.executeUpdate();
 					               }      
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("CreateNewins.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = " Data__IS__ALLREADY__Entered__for__this__Month";
 								   response.sendRedirect("CreateNewins.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  