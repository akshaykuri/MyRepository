<%@ page import="java.sql.*"%>  
  
   <%
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "nepldb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
    String s=request.getParameter("vname");  
   System.out.println("Value of po no :"+s);
   //int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
          try
             {  
	           Class.forName("com.mysql.jdbc.Driver").newInstance();  
               conn = DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
               ResultSet rs = stmt.executeQuery("SELECT vadd1,vmobile FROM vendormaster WHERE (vname='" + s + "');");
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(2)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(1)+"'>";
	                   
	                   }  
               //  System.out.println("Value of Buffer :"+buffer);
               buffer=buffer+"</div>";
              //System.out.println("Value of Buffer :"+buffer);
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  conn.close();
		         }
%>  