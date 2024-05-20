<%@ page import="java.sql.*"%>  
<%@ page import = "java.util.ResourceBundle" %>
  
   <%
    String name=null;
    Connection conn = null;
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
    String userName = dbProperties.getString("csdb.username");
    String password = dbProperties.getString("csdb.password");
    String url = dbProperties.getString("csdb.url");
    String driver = dbProperties.getString("csdb.driverName");
    String dbName = dbProperties.getString("csdb.dbName");
    String s=request.getParameter("emp_id");  
   // System.out.println("emp idddddd :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax1' style='display:none;'>";
   // System.out.println("Value oflengthS :"+length);
    if(length<=4){
    if(s==null || s.trim().equals(""))
           {  
           out.print("Please enter  employee id");  
           }
    else
           {  
           try
             {  
        	   //System.out.println("in tryyyyyyyyyyy");
        	   
	          Class.forName(driver).newInstance();
              conn= DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
              
               //SELECT p.`pordernon`,p.`po_date`,p.`VendorText`,p.`textarea1`,v.vmobile FROM `po` p LEFT OUTER JOIN vendormaster v ON p.`VendorText` = v.vname
               //WHERE `pordernon`='NEIN/90-502'

              // ResultSet rs = stmt.executeQuery("select * from emp where (EMP_NO='" + s + "'); ");
               
               ResultSet rs = stmt.executeQuery("SELECT u.full_name,u.email,u.branch_id,u.department_id,b.branch_name,d.department_name FROM user u INNER JOIN branchmaster b on b.branch_id=u.branch_id INNER JOIN department d on d.department_id=u.department_id WHERE (u.emp_id='" + s + "');");
               
              // System.out.println("fname----- :"+rs.getString("u.full_name"));
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='b1' value='"+rs.getString("b.branch_name")+"'>" + "<input type='text' id='b2' value='"+rs.getString("d.department_name")+"'>";
	                  
	                   }  
               // System.out.println("Value of Buffer :"+buffer);
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