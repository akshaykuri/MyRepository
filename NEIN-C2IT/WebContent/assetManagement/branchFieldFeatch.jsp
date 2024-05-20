<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;

<%String uid=request.getParameter("b_name");  
//System.out.println("Value oflengthS :"+uid);
String name=null;
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "";
//ArrayList array=new ArrayList();
    try{ 
    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
        conn = DriverManager.getConnection(url+dbName,userName,password);  
        Statement stmt = conn.createStatement();  
        ResultSet rs = stmt.executeQuery("select * from branch_master_main where (m_b_no='" + uid + "'); ");
        String buffer2 = "";
    while(rs.next())
          {
    	buffer2 = buffer2 + "<input type='text' id='v1' value='"+rs.getString(3)+"'>";
    	buffer2 = buffer2 + "<input type='text' id='v2' value='"+rs.getString(2)+"'>";
    	buffer2 = buffer2 + "<input type='text' id='v3' value='"+rs.getString(4)+"'>";
    	 }  
   // System.out.println(buffer2);
         response.getWriter().println(buffer2);
    } catch(Exception e)
                {   
	            System.out.println(e);
	            } 
                   finally
	                 {
	            	  conn.close();
			         }
	%>