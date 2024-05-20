<%@ page import="java.sql.*"%>  
 <%@page import="CON2.Connection2"%>
   <%
        
     Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
     String catridge=request.getParameter("catridge"); 
     String id=request.getParameter("id"); 
    
     String buffer="<div id='resultFromAjax2' style='display:none;'>";
   
           try
             {  	           
               Statement stmt = con.createStatement();                   
               ResultSet rs = stmt.executeQuery("SELECT * FROM `catridge_master` WHERE `catridge_model`='" + catridge + "'");
               while(rs.next())
                      { 
            	       
            	       buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(4)+"'>";   
            	       buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(2)+"'>";
            	       buffer = buffer + "<input type='text' id='id1' value='"+id+"'>";
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