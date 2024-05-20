<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="CON2.Connection2"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>Update Lotus</title>
</head>

<body>
                   <%
                        response.setContentType("text/html;charset=UTF-8");
                        PrintWriter out1 = response.getWriter();
                                                 
                        String idtype=request.getParameter("idtype"); 
 					    
 					    String month=request.getParameter("month");
                        String no_ids=request.getParameter("no_ids");
                        int total=Integer.parseInt(no_ids);
 					    String ids=request.getParameter("ids");
                        int id=Integer.parseInt(ids);     
                        
                        Connection con1 = null;
		      	        Connection2 dbConn = new Connection2();
			            con1 = dbConn.getConnection2();	        
                        int i1=0;                        
                        Statement st=null;
                        ResultSet rs=null;
                        PreparedStatement prds=null;
                        
                     try{                    	 
                        st=con1.createStatement();
        			    i1=st.executeUpdate(" UPDATE `nein_ids` SET `total`='"+total+"' "+
        						             " WHERE `id`='"+ids+"' and `TypeOfNeinId`='"+idtype+"' ");        			    
        		        }        		 
        		        catch(Exception el)
        			   {
        			     out.println("Update__error"+el.getMessage());
        		       }		
        		       response.sendRedirect("ViewNeinIdsForEdit.jsp?month="+month+"&idtype="+idtype+"&msg="+1);							     
 				%>
</body>
</html>  