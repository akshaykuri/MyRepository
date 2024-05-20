<%@ page import="java.sql.*"%>  
 <%@page import="CON2.Connection2"%>
  
   <%
    
     Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
     String group_name=request.getParameter("group_name"); 

    String buffer="<div class='numbera'><table border='1' width='100%'>";
   
           try
             {  
	          
               Statement stmt = con.createStatement();  
              
               ResultSet rs = stmt.executeQuery("SELECT relationnumber,number,monthlycharges,typename ,isptype  ,@a:=@a+1 serial_number FROM `consumptionreportmaster` c ,(SELECT @a:= 0) AS a"+
                       " WHERE `group_name`='"+group_name+"' and `status`='Active'  ");
                int x=1;
               while(rs.next())
                      {
            	  
            	  buffer = buffer + "<tr><td>"+(x++)+")&nbsp;Relationship Number: </td>";
            	  buffer = buffer + "<td><input type='text' name='relationnumber' id='relationnumber'  value="+rs.getString("relationnumber")+" readonly>  </td>";			
            	 
            	  buffer = buffer + "<td>Number: </td>";
            	  buffer = buffer + "<td><input type='text' name='number' id='number' value="+rs.getString("number")+" readonly> </td>";
            	 
            	  buffer = buffer + "<td>Consumption Type: </td>";
            	  buffer = buffer + "<td><input type='text' name='typename' id='typename'  value="+rs.getString("typename")+" readonly>  </td>";			
            	 
            	  buffer = buffer + "<td> ISP Network: </td>";
            	  buffer = buffer + "<td><input type='text' name='isptypename' id='isptypename'  value="+rs.getString("isptype")+" readonly>  </td>";			
            	  
            	  buffer = buffer + "<td><span style='color:red;'>*</span>Amount: </td>";
            	  buffer = buffer + "<td><input type='text' name='amount' id='amount' class='amt' value="+rs.getString("monthlycharges")+" onkeypress='return isNumberKey1(event)'> </td></tr>";
                      
                      }  
               buffer=buffer+"</table></div>";
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