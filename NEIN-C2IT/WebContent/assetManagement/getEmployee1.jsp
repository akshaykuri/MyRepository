<%@ page import="java.sql.*"%>  
  
   <%
    System.out.println("--------------- Get  Employee Details1 ------------");
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "leavemanagement";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
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
	           Class.forName("com.mysql.jdbc.Driver").newInstance();  
               conn = DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
               Statement stmt1 = conn.createStatement();  
               //ResultSet rs = stmt.executeQuery("SELECT p.po_date,p.VendorText,v.vmobile,p.textarea1 FROM po p LEFT OUTER JOIN vendormaster v ON p.VendorText=v.vname WHERE (pordernon='" + s + "');");
               // select r.role_code from role r  inner JOIN user_role ur ON ur.role_id =r.role_id 
               //                         inner JOIN user u ON u.user_id=ur.user_id  
               //                         where u.user_id=1
               //ResultSet rs = stmt.executeQuery("select u.full_name,u.password,b.branch_name,u.reporting_branch_lta,u.mobile_number,u.email from user u LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id where (emp_id='" + s + "'); ");
               //ResultSet rs1 = stmt.executeQuery("select r.role_code from role r  inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id where u.user_id=1");
               // select u.full_name,r.role_code,b.branch_name,u.reporting_branch_lta,u.mobile_number,u.email from  role r
               //inner JOIN user_role ur ON ur.role_id =r.role_id
               //inner JOIN user u ON u.user_id=ur.user_id  
               //LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id where emp_id=1665
               //its working but not getting degignamtion//ResultSet rs = stmt.executeQuery("select u.full_name,u.password,b.branch_name,u.reporting_branch_lta,u.mobile_number,u.email from user u LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id where (emp_id='" + s + "'); "); 
               // ResultSet rs = stmt.executeQuery("select u.full_name,r.role_code,b.branch_name,u.reporting_branch_lta,u.mobile_number,u.email,u.emp_id from  role r inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id  where (u.emp_id='" + s + "'); ");
                ResultSet rs = stmt.executeQuery("select u.full_name,r.role_code,b.branch_name,u.reporting_branch_lta,u.mobile_number,u.email,u.emp_id,d.department_name from  role r inner JOIN user_role ur ON ur.role_id =r.role_id inner JOIN user u ON u.user_id=ur.user_id inner JOIN department d ON u.department_id=d.department_id LEFT OUTER JOIN branchmaster b ON u.branch_id=b.branch_id where (u.emp_id='" + s + "'); ");
                while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(2)+"'>";
	                   buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(3)+"'>";
	                   buffer = buffer + "<input type='text' id='p4' value='"+rs.getString(4)+"'>";
	                   buffer = buffer + "<input type='text' id='p5' value='"+rs.getString(5)+"'>";
	                   buffer = buffer + "<input type='text' id='p6' value='"+rs.getString(6)+"'>";
	                   buffer = buffer + "<input type='text' id='p7' value='"+rs.getString(7)+"'>";
	                   buffer = buffer + "<input type='text' id='p8' value='"+rs.getString(8)+"'>";
	                //   buffer = buffer + "<input type='text' id='p9' value='"+rs.getString(9)+"'>";
	                   }  
                ResultSet rs1 = stmt1.executeQuery("select u.user_name from  user u inner JOIN reporting_officers ro ON u.emp_id=ro.emp_manager_id where (ro.emp_id='" + s + "'); ");
                while(rs1.next())
                      { 
                	   buffer = buffer + "<input type='text' id='p9' value='"+rs1.getString(1)+"'>";
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