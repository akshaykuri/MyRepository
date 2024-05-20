<%@ page import="java.sql.*"%>  
 <%@page import="CON2.Connection2"%>
  
   <%
    
     Connection con1 = null;
	 Connection2 dbConn1 = new Connection2();
	 con1 = dbConn1.getConnection2();
     String id=request.getParameter("number"); 
    
    String buffer="<div id='resultFromAjax5' style='display:none;'>";
   
           try
             {   
	          
               Statement stmt1 = con1.createStatement();  
              
               ResultSet rs1 = stmt1.executeQuery("SELECT *,b.b_name FROM `consumptionreportmaster` c"+
            		                            " INNER JOIN branch_master b ON b.id=c.branchId "+
            		                            " WHERE `number`='" + id + "' ");
               
               while(rs1.next())
                      { 
            	       buffer = buffer + "<input type='text' id='px1' value='"+rs1.getString("isptype")+"'>";
            	       buffer = buffer + "<input type='text' id='p2' value='"+rs1.getString("typename")+"'>";
            	       buffer = buffer + "<input type='text' id='p3' value='"+rs1.getString("empno")+"'>";
            	       buffer = buffer + "<input type='text' id='p4' value='"+rs1.getString("empname")+"'>";
            	       buffer = buffer + "<input type='text' id='p5' value='"+rs1.getString("branchId")+"'>";
            	       buffer = buffer + "<input type='text' id='p6' value='"+rs1.getString("branchNo")+"'>";
            	       buffer = buffer + "<input type='text' id='p7' value='"+rs1.getString("relationnumber")+"'>";
            	       buffer = buffer + "<input type='text' id='p8' value='"+rs1.getString("monthlycharges")+"'>";
            	       buffer = buffer + "<input type='text' id='p9' value='"+rs1.getString("status")+"'>";
            	       buffer = buffer + "<input type='text' id='p10' value='"+rs1.getString("b_name")+"'>";
            	       buffer = buffer + "<input type='text' id='p11' value='"+rs1.getString("number")+"'>";
            	       buffer = buffer + "<input type='text' id='p12' value='"+rs1.getString("type")+"'>";
            	       
	                   }  
               
                  buffer=buffer+"</div>";
                  response.getWriter().print(buffer);
        
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  con1.close();
		         }
          
%>  