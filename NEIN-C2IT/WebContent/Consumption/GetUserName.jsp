<%@ page import="java.sql.*"%>  
<%@page import="CON2.ConnectionLMS"%>  
   <%
    
    String name=null;
    Connection conn = null;
    ConnectionLMS dbConn = new ConnectionLMS();
    conn = dbConn.getConnectionlms();

    String id=request.getParameter("empid"); 
    
    int length = String.valueOf(id).length();
    String buffer="<div id='resultFromAjax5' style='display:none;'>";
    if(length <= 4){
    if(id==null || id.trim().equals(""))
           {  
           out.print("Please enter id");  
           }
    else
           {  
           try
             {  
	           
               Statement stmt = conn.createStatement();  
              
               ResultSet rs = stmt.executeQuery("SELECT user_name FROM user WHERE (emp_id='" + id + "' AND 	employee_status ='yes');");
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p001' value='"+rs.getString("user_name")+"'>";
	                  // System.out.println("User name ::"+rs.getString("user_name"));
	                   }  
               
               buffer=buffer+"</div>";
               
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  conn.close();
		         }
          }
    }
%>  