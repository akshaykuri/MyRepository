<%@ page import="java.sql.*"%>  
  <%@page import="java.util.ResourceBundle"%>
   <%
   ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	String driverl = dbPropertiesl.getString("leavemanagement.driverName");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
   
    //System.out.println("Here");
    String name=null;
    Connection conn = null;
   /*  String url = "jdbc:mysql://localhost:3306/";
    String dbName = "leavemanagement";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = ""; */
    String s=request.getParameter("EMP_NO");  
    //System.out.println("Value of S :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
    if(length<=4){
    if(s==null || s.trim().equals(""))
           {  
           out.print("Please enter id");  
           }
    else
           {  
           try
             {  
        	   Class.forName(driverl).newInstance();
        	   conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
               Statement stmt = conn.createStatement();  
               Statement stmt1 = conn.createStatement();  
               ResultSet rs = stmt.executeQuery("select u.full_name,r.role_code,b.branch_name,u.reporting_branch_lta,u.mobile_number,u.email,u.emp_id,d.department_name from  role r inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id inner JOIN department d ON u.department_id=d.department_id LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id where (u.emp_id='" + s + "'); ");
                while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(2)+"'>";
	                  // buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(3)+"'>";
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
          }
    }
%>  