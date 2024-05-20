<%@ page import="java.sql.*"%>  
 <%@page import="java.util.ResourceBundle"%> 
   <%
    String name=null;
    Connection conn = null;
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
    String s=request.getParameter("cname");  
    //System.out.println("Value of S :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax3' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
      try
             {  
    	  Class.forName(driver).newInstance();
          conn = DriverManager.getConnection(url+dbName,userName,password); 
               Statement stmt = conn.createStatement();  
               //SELECT DISTINCT u.user_name, u.emp_id, b.branch_name, d.department_name, m3.user_name AS manager_name FROM user u INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id = 1665 ) AND u.employee_status = 'yes' 
               //ResultSet rs = stmt.executeQuery("select u.full_name,r.role_code,b.branch_name,d.department_name from role r inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id inner JOIN department d ON u.department_id=d.department_id LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id  where (u.emp_id='" + s + "'); ");
               ResultSet rs = stmt.executeQuery("SELECT * FROM nexascostmaster where costname='"+s+"'");
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='q1' value='"+rs.getString(3)+"'>";
	                   buffer = buffer + "<input type='text' id='q2' value='"+rs.getString(4)+"'>";
	                   
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