<%@ page import="java.sql.*"%> 
<%@page import="java.util.ResourceBundle"%> 
  
   <%
    String name=null,ro=null,ro1=null,desg=null;
    Connection conn = null;
    ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	String driverl = dbPropertiesl.getString("leavemanagement.driverName");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");

    Connection cn5 = null;
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
	Class.forName(driver).newInstance();
	cn5 = DriverManager.getConnection(url+dbName,userName,password);
	Statement stcsdb = cn5.createStatement();
	
	boolean flag = false;
    String s=request.getParameter("EMP_NO");  
    //System.out.println("Value of S :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
    if(length<=7){
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
               
ResultSet rscsdb = stcsdb.executeQuery("select employee_code from neinapplicationform where Approval_sttatuss in ('Pending') and employee_code='"+s+"'");
while(rscsdb.next()){
	flag=true;
}
out.println("here====>"+flag);

ResultSet rscsdb1 = stcsdb.executeQuery("select emplCode from neinapplicationformmain where emplCode='"+s+"' and (emplreqFor like '%Email ID%' and emplreqFor like '%Domain Account%' and emplreqFor like '%Biometric / Access Card%' and emplreqFor like '%Shared Folder%' and emplreqFor like '%Internet Access / FTP Access%' and emplreqFor like '%NEWINS%' and emplreqFor like '%NExAS%' and emplreqFor like '%GS-NET%' and emplreqFor like '%Internal Application%' and emplreqFor like '%USB Access%' and emplreqFor like '%VPN Access%' and emplreqFor like '%HardDisk / PenDrive%' and emplreqFor like '%Any Other Asset%' and emplreqFor like '%NEx-GLOW%')");
while(rscsdb1.next()){
	flag=true;
}
out.println("here====>"+flag);

if(flag!=true){

ResultSet rs = stmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,m3.email,m3.emp_id FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + s + "' ) AND u.employee_status = 'yes' ");
               while(rs.next())
                      {
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(2)+"'>";
	                   buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(3)+"'>";
	                   buffer = buffer + "<input type='text' id='p4' value='"+rs.getString(4)+"'>";
	                   buffer = buffer + "<input type='text' id='p5' value='"+rs.getString(5)+"'>";
	                   buffer = buffer + "<input type='text' id='p6' value='"+rs.getString(6)+"'>";
	                   buffer = buffer + "<input type='text' id='p7' value='"+rs.getString(7)+"'>";
	                   
					  //System.out.println("Herer :"+rs.getString(6));
	                  // System.out.println("Herer :"+rs.getString(7));
	                   ResultSet rs66 = st66.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, "+
            		           "m3.user_name AS manager_name FROM user u Inner Join user_role ur on ur.user_id=u.user_id "+
            		           "INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id  "+
            		           "INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON "+
            		           "d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id "+
            		           "INNER JOIN user m4 ON m4.user_id = m1.manager2_id "+
            		           "WHERE ( m1.emp_id ='"+rs.getString(7)+"' ) AND u.employee_status = 'yes' ");
               if(rs66.next())
                   {      
                   desg=rs66.getString(2);
                   } 
               
               
               ro=desg+","+rs.getString(5)+","+rs.getString(6)+","+rs.getString(7)+","+"0";
               ro1=rs.getString(5)+"("+rs.getString(6)+")";
               buffer = buffer + "<input type='text' id='p8' value='"+ro+"'>";
               buffer = buffer + "<input type='text' id='p9' value='"+ro1+"'>";
	                   }
}
               //  System.out.println("Value of Buffer :"+buffer);
               buffer=buffer+"</div>";
              // System.out.println("Value of Buffer :"+buffer);
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  conn.close();
            	  cn5.close();
		         }
          }
    }
%>  