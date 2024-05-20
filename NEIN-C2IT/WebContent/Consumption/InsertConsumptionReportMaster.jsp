<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import="CON2.Connection2"%>
<%@page import = "java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Consumption Report Master</title>
</head>
<body>
                       <%
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                       String type=request.getParameter("type");
                       String empno=request.getParameter("empno");
                       String empname=request.getParameter("empname");
                       String location=request.getParameter("location");
                       int branchId=Integer.parseInt(location);
                       String branchNo1=request.getParameter("branchNo");
                       int branchNo=Integer.parseInt(branchNo1);
                       String number=request.getParameter("number");
                       String relationnumber=request.getParameter("relationnumber");
                       String isptype=request.getParameter("isptype");
                       String typename=request.getParameter("typename");
                       String monthlycharges1=request.getParameter("monthlycharges");
                       float monthlycharges=0;
                        if(monthlycharges1.isEmpty()){
                    	   monthlycharges=0;
       				     }
       				   else{
       					  monthlycharges =Float.parseFloat(monthlycharges1);						
       	  		        }
                       
                       String status=request.getParameter("status");
                       
                       int i=0;
                        Connection con = null;
						Connection2 dbConn = new Connection2();
						con = dbConn.getConnection2();
						
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                       
						String query = "select max(id) from consumptionreportmaster";
						st = con.createStatement();
 						rs = st.executeQuery(query);
 						
 						/* String query1 = "select isptype from consumptionreportmaster where isptype='"+isptype+"' "+
 						                "AND typename='"+typename+"'  AND empno='"+empno+"' AND number='"+number+"'"; */
 					    String query1 = "select isptype from consumptionreportmaster where number='"+number+"' ";
 						                
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
 								       
 						                  prds = con.prepareStatement("INSERT INTO `consumptionreportmaster`(`id`, `isptype`, "+
 						                		                      "`typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
 						                		                      "`number`, `relationnumber`,`monthlycharges`, `status`,`type`) values(?,?,?,?,?,?,?,?,?,?,?,?)");   
 				                          prds.setInt(1,id);
 				                          prds.setString(2,isptype);
 				                          prds.setString(3,typename);
 				                          prds.setString(4,empno);
 				                          prds.setString(5,empname);
 				                          prds.setInt(6,branchId);
 				                          prds.setInt(7,branchNo);
 				                          prds.setString(8,number);
 				                          prds.setString(9,relationnumber);
 				                          prds.setFloat(10,monthlycharges);
 				                          prds.setString(11,status);
 				                          prds.setString(12,type);
 				                          
 				                          i= prds.executeUpdate();
 				                          msg = "Data__INSERTED__SUCCESSFULLY";
 				                          response.sendRedirect("ConsumptionReportMaster.jsp?msg=" +msg);
 				                     }catch(SQLException ex)
						              {
						    	      ex.printStackTrace();
							          } 
 							        }
 							       }
 							   else
 							       {
 								   msg = "This__Number__IS__ALLREADY__EXIT";
 								   response.sendRedirect("ConsumptionReportMaster.jsp?msg=" +msg);
 							       }
 						%>
</body>
</html>  