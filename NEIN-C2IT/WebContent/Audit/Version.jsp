<%@ page import="java.sql.*"%>  
<%@page import="java.util.ResourceBundle"%>
  
   <%
    String name=null;
    Connection conn = null,cn66=null,cn5=null;
    /* String url = "jdbc:mysql://localhost:3306/";
    String dbName = "leavemanagement";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = ""; */
    ResourceBundle dbPropertiesl = ResourceBundle.getBundle("csdb");
    String userNamel = dbPropertiesl.getString("csdb.username");
    String passwordl = dbPropertiesl.getString("csdb.password");
    String urll = dbPropertiesl.getString("csdb.url");
    String driverl = dbPropertiesl.getString("csdb.driverName");
    String dbNamel = dbPropertiesl.getString("csdb.dbName");
	
    String s=request.getParameter("aname");  
    System.out.println("Value of S :"+s);
 
    String buffer="<div id='resultFromAjax4' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);

    if(s==null || s.trim().equals(""))
           {  
           out.print("Please Select Current Version");  
           }
    else
           {  
           try
             {  
        	   Class.forName(driverl).newInstance();
        	      conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
        	      Statement stmt = conn.createStatement(); 
               Statement st66 = conn.createStatement(); 
               String ro=null,ro1=null,desg=null;
               //SELECT DISTINCT u.user_name, u.emp_id, b.branch_name, d.department_name, m3.user_name AS manager_name FROM user u INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id = 1665 ) AND u.employee_status = 'yes' 
               //ResultSet rs = stmt.executeQuery("select u.full_name,r.role_code,b.branch_name,d.department_name from role r inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id inner JOIN department d ON u.department_id=d.department_id LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id  where (u.emp_id='" + s + "'); ");
               ResultSet rs = stmt.executeQuery("SELECT * FROM `version_management` where application_name='"+s+"'");
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString("updated_version")+"'>";
	                  
                      }
               
               
              
             
            
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
          }
    
%>  