<%@ page import="java.sql.*"%>  
 <%@page import="CON2.Connection2"%>
  
   <%
    
     Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
     String id=request.getParameter("relationnumber"); 
    
    int length = String.valueOf(id).length();
    String buffer="<select name=number id=number onchange=sendInfo(this.value)><option value=''>Select</option>";
   
           try
             {  
	          
               Statement stmt = con.createStatement();  
              
               ResultSet rs = stmt.executeQuery("SELECT number ,@a:=@a+1 serial_number FROM `consumptionreportmaster` c ,(SELECT @a:= 0) AS a"+
            		                            " WHERE `relationnumber`='" + id + "' and `status`='Active' ");
                
               while(rs.next())
                      { 
            	       buffer = buffer + "<option  id='p1' value='"+rs.getString("number")+"'>("+rs.getString("serial_number")+") "+rs.getString("number")+"</option>";
            	      }  
               
               buffer=buffer+"</select>";
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