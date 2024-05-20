<%@ page import="java.sql.*"%>
<%@ page import="java.util.ResourceBundle"%>  
  
   <%
    //System.out.println("Here");
    String name=null;
    Connection conn = null;
    /* String url = "jdbc:mysql://localhost:3306/";
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = ""; */
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
    String s=request.getParameter("itnonit");  
    //System.out.println("Value of S :"+s);
    String buffer="<div id='resultFromAjax3' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
          try
             {  
	           Class.forName(driver).newInstance();  
               conn = DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
               Statement stmt1 = conn.createStatement();  
               ResultSet rs = stmt.executeQuery("select * from csdb.formapproval where formtype='GATEPASS' and levelno='1' and branch='90' and itnonit='"+s+"'");
                while(rs.next())
                      {
                	   String sendmail=rs.getString(6)+"("+rs.getString(8)+")-"+rs.getString(10);
            	       buffer = buffer + "<input type='text' id='q1' value='"+rs.getString(5)+"'>";
	                   buffer = buffer + "<input type='text' id='q2' value='"+rs.getString(6)+"'>";
	                   buffer = buffer + "<input type='text' id='q3' value='"+rs.getString(8)+"'>";
	                   buffer = buffer + "<input type='text' id='q4' value='"+rs.getString(10)+"'>";
	                   buffer = buffer + "<input type='text' id='q5' value='"+sendmail+"'>";
	                   }  
                     System.out.println("Value of Buffer :"+buffer);
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