<%@ page import="java.sql.*"%>  
 <%@page import="CON2.Connection2"%>
   <%
    
     Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
     String s=request.getParameter("branchid");  
     String buffer="<div id='resultFromAjax1' style='display:none;'>";
   
           try
             {  	           
               Statement stmt = con.createStatement();                    
               ResultSet rs = stmt.executeQuery("SELECT * FROM `branch_master` WHERE `id`='" + s + "'");
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(3)+"'>";          	       
	                   }  
              
               buffer=buffer+"</div>";            
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  con.close();
		         }
               
%>  