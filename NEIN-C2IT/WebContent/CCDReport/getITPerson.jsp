<%@ page import="java.sql.*"%>  
  <%@page import="java.util.ResourceBundle"%>
   <%
    //System.out.println("Here");
    String name=null;
    Connection conn = null,cn666=null,cn66=null;
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
	
	ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	String driverl = dbPropertiesl.getString("leavemanagement.driverName");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
	
    String loc=request.getParameter("loc"); 
    //System.out.println("Value of S loc :"+loc);
    String sesbranch="90";
    System.out.println("Session branch :"+loc); 
    String buffer="<div id='resultFromAjaxdeptAdmin' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
          try
             {  
        	  Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(url+dbName,userName,password); 
              Statement stmt = conn.createStatement();  
             //Statement stmt1 = conn.createStatement();  
             String ldesg="",lrname="",lmail="",lroempid="",lro="",lro1="";
             cn666 = DriverManager.getConnection(url+dbName,userName,password); 
             Statement  stlevel= cn666.createStatement(); 
             ResultSet rslevel =null;
             rslevel = stlevel.executeQuery("Select * from formapproval WHERE branch='"+loc+"' and formtype='NExAS_NEWINS' ");
             if(rslevel.next())
                 {      
        	     lroempid=rslevel.getString(5);
        	     System.out.println("Value oflengthS lroempid:"+lroempid);
        	     Class.forName(driverl).newInstance();
        	     cn66  = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
        	 
                 Statement st777 = cn66.createStatement();  
                 ResultSet rs777 = st777.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,u.email,b.branch_name, d.department_name, m3.user_name AS manager_name FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='"+lroempid+"' ) AND u.employee_status = 'yes' ");
                 if(rs777.next())
                     {      
            	     ldesg=rs777.getString(2);
                     lrname=rs777.getString(1);
                     lmail=rs777.getString(3);
                     }
                 lro=ldesg+","+lrname+","+lmail+","+lroempid+","+"1";
                 lro1=lrname+" ( "+lmail+" )";
                 }
               
               buffer = buffer + "<input type='text' id='approvP' value='"+lro+"'>";
               buffer = buffer + "<input type='text' id='approvP1' value='"+lro1+"'>";
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