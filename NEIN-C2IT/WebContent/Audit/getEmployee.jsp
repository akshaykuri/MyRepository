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
    ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	String driverl = dbPropertiesl.getString("leavemanagement.driverName");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
	
    String s=request.getParameter("EMP_NO");  
    //System.out.println("Value of S :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax3' style='display:none;'>";
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
               Statement st66 = conn.createStatement(); 
               String ro=null,ro1=null,desg=null;
               //SELECT DISTINCT u.user_name, u.emp_id, b.branch_name, d.department_name, m3.user_name AS manager_name FROM user u INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id = 1665 ) AND u.employee_status = 'yes' 
               //ResultSet rs = stmt.executeQuery("select u.full_name,r.role_code,b.branch_name,d.department_name from role r inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id inner JOIN department d ON u.department_id=d.department_id LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id  where (u.emp_id='" + s + "'); ");
               ResultSet rs = stmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, "+
            		   " m3.user_name AS manager_name,u.email,u.mobile_number, m3.email,m3.emp_id FROM user u "+
            		   " Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id "+
            		   " INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id "+
            		   " INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id "+ 
            		   " INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + s + "' ) AND u.employee_status = 'yes' ");
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(2)+"'>";
	                   buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(3)+"'>";
	                   buffer = buffer + "<input type='text' id='p4' value='"+rs.getString(4)+"'>";
	                   buffer = buffer + "<input type='text' id='p5' value='"+rs.getString(5)+"'>";
	                   buffer = buffer + "<input type='text' id='p6' value='"+rs.getString(6)+"'>";
	                   buffer = buffer + "<input type='text' id='p7' value='"+rs.getString(7)+"'>";
                      }
               
               
               cn5 = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);  
               Statement st5 = cn5.createStatement(); 
               st5 = cn5.createStatement();  
               String RepoOfficerempid=null,RepoOfficer=null,RepoOfficermail=null,RepoOfficer2=null,RepoOfficermail2=null,RepoOfficerempid2=null;
               ResultSet rs5 = st5.executeQuery("SELECT DISTINCT  u.user_name,u.emp_id,b.branch_name,m3.emp_id AS m1id,m3.user_name AS manager_name,m3.email,m6.role_id, m4.user_name AS manager2_name,m4.email,m7.role_id,m4.emp_id AS m2id FROM user u INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN user_role m5 ON m5.user_id = u.user_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user_role m6 ON m3.user_id = m6.user_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id INNER JOIN user_role m7 ON m4.user_id = m7.user_id WHERE ( m1.emp_id ='"+s+"') AND u.employee_status = 'yes'"); 
               while(rs5.next())
                  {
                  RepoOfficerempid=rs5.getString(4);
                  RepoOfficer=rs5.getString(5);
                  RepoOfficermail=rs5.getString(6);
                  RepoOfficer2=rs5.getString(8);
                  RepoOfficermail2=rs5.getString(9);
                  RepoOfficerempid2=rs5.getString(11);
                  // System.out.println("Mail Branch MailingIT :"+RepoOfficer);
                  }
              /* System.out.println("empid :"+s);
              System.out.println("Repo empid :"+RepoOfficerempid);
              System.out.println("Repo emp name :"+RepoOfficer);
              System.out.println("empmail :"+RepoOfficermail);
              System.out.println("Repo empid 2:"+RepoOfficerempid2);
              System.out.println("Repo emp name2 :"+RepoOfficer2);
              System.out.println("empmail 2:"+RepoOfficermail2); */
              //Class.forName("com.mysql.jdbc.Driver").newInstance();
      
              cn66 = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);  
              //Statement st66 = cn66.createStatement(); 
              String rname=null,desg1=null,rname1=null,mail1=null,mail2=null,  ro2=null,roempid1=null,roempid2=null,ro11=null, ro21=null;
              int approverflag1=0,approverflag2=0;
              st66 = cn66.createStatement();  
              ResultSet rs66 = st66.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='"+RepoOfficerempid+"' ) AND u.employee_status = 'yes' ");
              if(rs66.next())
                  {      
                  desg=rs66.getString(2);
                  } 
              Statement st77 = cn66.createStatement();  
              ResultSet rs77 = st77.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='"+RepoOfficerempid2+"' ) AND u.employee_status = 'yes' ");
              if(rs77.next())
                 {      
                 desg1=rs77.getString(2);
                 }
              ro1=desg+","+RepoOfficer+","+RepoOfficermail+","+RepoOfficerempid+","+"0";
             
              ro11=RepoOfficer+"- ("+RepoOfficermail+")";
              /* System.out.println(ro11); */
              //approverflag1=1;
              ro2=desg1+","+RepoOfficer2+","+RepoOfficermail2+","+RepoOfficerempid2+","+"0";
              ro21=RepoOfficer2+"- ("+RepoOfficermail2+")";
              //approverflag2=1;
              
              buffer = buffer + "<input type='text' id='p9' value='"+ro11+"'>";
              buffer = buffer + "<input type='text' id='p8' value='"+ro1+"'>";
              buffer = buffer + "<input type='text' id='p10' value='"+RepoOfficer+"'>";
              buffer = buffer + "<input type='text' id='p11' value='"+desg+"'>";
              buffer = buffer + "<input type='text' id='p12' value='"+RepoOfficermail+"'>";
              buffer = buffer + "<input type='text' id='p13' value='"+RepoOfficerempid+"'>";
              buffer = buffer + "<input type='text' id='p14' value='0'>";
             
            
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